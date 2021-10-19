<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CollaboratorsUser extends Model
{

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'user_id',
        'user_course',
        'level',
        'email',
        'facebook',
        'fullname',
        'sex',
        'date_of_birth',
        'cmnd',
        'phone',
        'job',
        'course',
        'province',
        'education',
        'target',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array
     */
    protected $hidden = [
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'created_at' => 'datetime',
    ];
}
