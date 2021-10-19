<?php

namespace App\Http\Controllers;

use App\Exports\TestExport;
use App\Models\CollaboratorsUser;
use App\Models\Point;
use App\User;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Http\Controllers\VoyagerBaseController;

class CollaboratorsUserController extends VoyagerBaseController
{
    protected $mainView = "/admin/collaborators-users";

    public function create(Request $request)
    {
        return redirect($this->mainView);
    }

    public function store(Request $request)
    {
        $rules = [
//            'user_course' => 'required|unique:collaborators_users|regex:/^[a-zA-Z0-9]+$/',
            'email' => 'required|email|min:6|max:50|unique:collaborators_users',
            'name' => 'unique:collaborators_users|required|regex:/^[a-zA-Z0-9]+$/',
            'date_of_birth' => 'required',
            'phone' => 'required|min:10',
            'province' => 'required|max:250',
            'facebook' => 'required',
            'job' => 'required',
            'cmnd' => 'required',
            'fullname' => 'required',
            ];

        $customMessages = [
//            'required' => 'Tài khoản không được để trống',
//            'unique' => "Tài khooản đã tồn tại",
//            'regex' => "Tài khooản Không hợp lệ"
            'email.email' => __('Phải là định dạng email'),
            'email.required' => __('Email không được để trống'),
            'email.unique' => __('Email đã tồn tại'),
            'name.required' => __('Tài khoản không được để trống'),
            'name.regex' => __('Tài khoản gồm các ký tự 0-9/a-z'),
            'fullname.required' => __('Tài khoản không được để trống'),
            'date_of_birth.required' => __('Ngày sinh không được để trống'),
            'phone.required' => __('Số điện thoại không được để trống'),
            'facebook.required' => __('Facebook không được để trống'),
            'job.required' => __('Nghề nghiệp không được để trống'),
            'cmnd.required' => __('CMND/Căn cước công dân không được để trống   '),
        ];
        $this->validate($request, $rules, $customMessages);

        CollaboratorsUser::create([
            'user_id' => Auth::user()->id,
            'user_course' => $request->get('name'),
            'level' => 0,
            'email' => $request->get('email'),
            'facebook' => $request->get('facebook'),
            'fullname' => $request->get('fullname'),
            'sex' => $request->get('sex'),
            'date_of_birth' => $request->get('date_of_birth'),
            'cmnd' => $request->get('cmnd'),
            'phone' => $request->get('phone'),
            'job' => $request->get('job'),
            'course' => $request->get('course'),
            'province' => $request->get('province'),
            'education' => $request->get('education'),
            'target' => $request->get('edu_target'),
        ]);
        return redirect()->back();
    }


    public function edit(Request $request, $id)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);
            $query = $model->query();

            // Use withTrashed() if model uses SoftDeletes and if toggle is selected
            if ($model && in_array(SoftDeletes::class, class_uses_recursive($model))) {
                $query = $query->withTrashed();
            }
            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope' . ucfirst($dataType->scope))) {
                $query = $query->{$dataType->scope}();
            }
            $dataTypeContent = call_user_func([$query, 'findOrFail'], $id);
        } else {
            // If Model doest exist, get data from table name
            $dataTypeContent = DB::table($dataType->name)->where('id', $id)->first();
        }
        if ($dataTypeContent->level > 1) return redirect($this->mainView);
        foreach ($dataType->editRows as $key => $row) {
            $dataType->editRows[$key]['col_width'] = isset($row->details->width) ? $row->details->width : 100;
        }

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'edit');

        // Check permission
        $this->authorize('edit', $dataTypeContent);

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'edit', $isModelTranslatable);

        $view = 'voyager::bread.edit-add';

        if (view()->exists("voyager::$slug.edit-add")) {
            $view = "voyager::$slug.edit-add";
        }
        $points = Point::query()->get();
        $user = User::query()->where("id", $dataTypeContent->user_id)->get();
        if(count($user) == 0){
            return redirect()->back();
        }
        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable', 'points', 'user'));
    }

    public function updateCtv(Request $request)
    {
        $collaborators = $request->input("collaborators");
        $point = $request->input("point");
        $type = $request->input("type");
        $level = $type == "Du học sinh" ? 2 : 3;
        $ctv = CollaboratorsUser::query()->where('id', $collaborators)
            ->update(['level' => $level]);
        if ($ctv) {
            $collUser = CollaboratorsUser::query()->where('id', $collaborators)->get()->first();
            $user = User::query()->where("id", $collUser->user_id)->get()->first();
                User::query()->where('id', $user->id)
                    ->update(['point' => $user->point + $point]);
            }

        return redirect()->route('voyager.collaborators-users.index');
    }

    public function verificationAccount(Request $request)
    {
        $id = $request->id;

        $collaboratorsUser = CollaboratorsUser::query()->where("id", $id)->get()->first();
        if ($collaboratorsUser->level > 0) {
            return redirect()->route('voyager.collaborators-users.index');
        }
        $user = User::query()->where("id", $collaboratorsUser->user_id)->get()->first();
        if (!$user){
            return redirect()->back();
        }
        $view = 'vendor.voyager.collaborators-users.verification';
        return view($view, compact('collaboratorsUser', 'user'));
    }

    public function storeVerificationAccount(Request $request)
    {
        $id = $request->input('collaborators');
        $ctv = CollaboratorsUser::query()->where('id', $id)
            ->update(['level' => 1]);
        if ($ctv) {
            $collUser = CollaboratorsUser::query()->where('id', $id)->get()->first();
            $user = User::query()->where("id", $collUser->user_id)->get()->first();
            User::query()->where('id', $user->id)
                ->update(['point' => $user->point + setting('admin.point_register')]);
        }
        return redirect()->route('voyager.collaborators-users.index');
    }

    public function export (){
        return Excel::download(new TestExport, now().'_Cong_tac_vien.xlsx');

    }
}
