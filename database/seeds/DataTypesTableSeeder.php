<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DataTypesTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('data_types')->delete();
        
        \DB::table('data_types')->insert(array (
            0 => 
            array (
                'id' => 1,
                'name' => 'users',
                'slug' => 'users',
                'display_name_singular' => 'User',
                'display_name_plural' => 'Users',
                'icon' => 'voyager-person',
                'model_name' => 'TCG\\Voyager\\Models\\User',
                'policy_name' => 'TCG\\Voyager\\Policies\\UserPolicy',
                'controller' => 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController',
                'description' => NULL,
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => '{"order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null,"scope":null}',
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-10-10 01:21:32',
            ),
            1 => 
            array (
                'id' => 2,
                'name' => 'menus',
                'slug' => 'menus',
                'display_name_singular' => 'Menu',
                'display_name_plural' => 'Menus',
                'icon' => 'voyager-list',
                'model_name' => 'TCG\\Voyager\\Models\\Menu',
                'policy_name' => NULL,
                'controller' => '',
                'description' => '',
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => NULL,
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            2 => 
            array (
                'id' => 3,
                'name' => 'roles',
                'slug' => 'roles',
                'display_name_singular' => 'Role',
                'display_name_plural' => 'Roles',
                'icon' => 'voyager-lock',
                'model_name' => 'TCG\\Voyager\\Models\\Role',
                'policy_name' => NULL,
                'controller' => 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController',
                'description' => '',
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => NULL,
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            3 => 
            array (
                'id' => 4,
                'name' => 'points',
                'slug' => 'points',
                'display_name_singular' => 'Point',
                'display_name_plural' => 'Points',
                'icon' => 'voyager-trophy',
                'model_name' => 'App\\Models\\Point',
                'policy_name' => NULL,
                'controller' => 'App\\Http\\Controllers\\PointController',
                'description' => NULL,
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}',
                'created_at' => '2021-09-26 12:50:02',
                'updated_at' => '2021-10-07 15:41:27',
            ),
            4 => 
            array (
                'id' => 9,
                'name' => 'collaborators_users',
                'slug' => 'collaborators-users',
                'display_name_singular' => 'Cộng tác viên',
                'display_name_plural' => 'Cộng tác viên',
                'icon' => 'voyager-people',
                'model_name' => 'App\\Models\\CollaboratorsUser',
                'policy_name' => NULL,
                'controller' => 'App\\Http\\Controllers\\CollaboratorsUserController',
                'description' => NULL,
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}',
                'created_at' => '2021-09-26 12:55:09',
                'updated_at' => '2021-10-19 17:35:36',
            ),
            5 => 
            array (
                'id' => 10,
                'name' => 'coupons',
                'slug' => 'coupons',
                'display_name_singular' => 'Coupon',
                'display_name_plural' => 'Coupons',
                'icon' => NULL,
                'model_name' => 'App\\Models\\Coupon',
                'policy_name' => NULL,
                'controller' => 'App\\Http\\Controllers\\CouponController',
                'description' => NULL,
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}',
                'created_at' => '2021-10-07 07:04:44',
                'updated_at' => '2021-10-07 15:30:03',
            ),
            6 => 
            array (
                'id' => 11,
                'name' => 'pages',
                'slug' => 'pages',
                'display_name_singular' => 'Page',
                'display_name_plural' => 'Pages',
                'icon' => 'voyager-file-text',
                'model_name' => 'Pvtl\\VoyagerPages\\Page',
                'policy_name' => NULL,
                'controller' => '\\Pvtl\\VoyagerPages\\Http\\Controllers\\PageController',
                'description' => '',
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => NULL,
                'created_at' => '2021-10-08 04:37:04',
                'updated_at' => '2021-10-08 04:37:04',
            ),
        ));
        
        
    }
}