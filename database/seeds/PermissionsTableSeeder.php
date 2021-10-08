<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class PermissionsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('permissions')->delete();
        
        \DB::table('permissions')->insert(array (
            0 => 
            array (
                'id' => 1,
                'key' => 'browse_admin',
                'table_name' => NULL,
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            1 => 
            array (
                'id' => 2,
                'key' => 'browse_bread',
                'table_name' => NULL,
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            2 => 
            array (
                'id' => 3,
                'key' => 'browse_database',
                'table_name' => NULL,
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            3 => 
            array (
                'id' => 4,
                'key' => 'browse_media',
                'table_name' => NULL,
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            4 => 
            array (
                'id' => 5,
                'key' => 'browse_compass',
                'table_name' => NULL,
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            5 => 
            array (
                'id' => 6,
                'key' => 'browse_menus',
                'table_name' => 'menus',
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            6 => 
            array (
                'id' => 7,
                'key' => 'read_menus',
                'table_name' => 'menus',
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            7 => 
            array (
                'id' => 8,
                'key' => 'edit_menus',
                'table_name' => 'menus',
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            8 => 
            array (
                'id' => 9,
                'key' => 'add_menus',
                'table_name' => 'menus',
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            9 => 
            array (
                'id' => 10,
                'key' => 'delete_menus',
                'table_name' => 'menus',
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            10 => 
            array (
                'id' => 11,
                'key' => 'browse_roles',
                'table_name' => 'roles',
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            11 => 
            array (
                'id' => 12,
                'key' => 'read_roles',
                'table_name' => 'roles',
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            12 => 
            array (
                'id' => 13,
                'key' => 'edit_roles',
                'table_name' => 'roles',
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            13 => 
            array (
                'id' => 14,
                'key' => 'add_roles',
                'table_name' => 'roles',
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            14 => 
            array (
                'id' => 15,
                'key' => 'delete_roles',
                'table_name' => 'roles',
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            15 => 
            array (
                'id' => 16,
                'key' => 'browse_users',
                'table_name' => 'users',
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            16 => 
            array (
                'id' => 17,
                'key' => 'read_users',
                'table_name' => 'users',
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            17 => 
            array (
                'id' => 18,
                'key' => 'edit_users',
                'table_name' => 'users',
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            18 => 
            array (
                'id' => 19,
                'key' => 'add_users',
                'table_name' => 'users',
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            19 => 
            array (
                'id' => 20,
                'key' => 'delete_users',
                'table_name' => 'users',
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            20 => 
            array (
                'id' => 21,
                'key' => 'browse_settings',
                'table_name' => 'settings',
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            21 => 
            array (
                'id' => 22,
                'key' => 'read_settings',
                'table_name' => 'settings',
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            22 => 
            array (
                'id' => 23,
                'key' => 'edit_settings',
                'table_name' => 'settings',
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            23 => 
            array (
                'id' => 24,
                'key' => 'add_settings',
                'table_name' => 'settings',
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            24 => 
            array (
                'id' => 25,
                'key' => 'delete_settings',
                'table_name' => 'settings',
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
            ),
            25 => 
            array (
                'id' => 26,
                'key' => 'browse_points',
                'table_name' => 'points',
                'created_at' => '2021-09-26 12:50:02',
                'updated_at' => '2021-09-26 12:50:02',
            ),
            26 => 
            array (
                'id' => 27,
                'key' => 'read_points',
                'table_name' => 'points',
                'created_at' => '2021-09-26 12:50:02',
                'updated_at' => '2021-09-26 12:50:02',
            ),
            27 => 
            array (
                'id' => 28,
                'key' => 'edit_points',
                'table_name' => 'points',
                'created_at' => '2021-09-26 12:50:02',
                'updated_at' => '2021-09-26 12:50:02',
            ),
            28 => 
            array (
                'id' => 29,
                'key' => 'add_points',
                'table_name' => 'points',
                'created_at' => '2021-09-26 12:50:02',
                'updated_at' => '2021-09-26 12:50:02',
            ),
            29 => 
            array (
                'id' => 30,
                'key' => 'delete_points',
                'table_name' => 'points',
                'created_at' => '2021-09-26 12:50:02',
                'updated_at' => '2021-09-26 12:50:02',
            ),
            30 => 
            array (
                'id' => 31,
                'key' => 'browse_collaborators_users',
                'table_name' => 'collaborators_users',
                'created_at' => '2021-09-26 12:55:09',
                'updated_at' => '2021-09-26 12:55:09',
            ),
            31 => 
            array (
                'id' => 32,
                'key' => 'read_collaborators_users',
                'table_name' => 'collaborators_users',
                'created_at' => '2021-09-26 12:55:09',
                'updated_at' => '2021-09-26 12:55:09',
            ),
            32 => 
            array (
                'id' => 33,
                'key' => 'edit_collaborators_users',
                'table_name' => 'collaborators_users',
                'created_at' => '2021-09-26 12:55:09',
                'updated_at' => '2021-09-26 12:55:09',
            ),
            33 => 
            array (
                'id' => 34,
                'key' => 'add_collaborators_users',
                'table_name' => 'collaborators_users',
                'created_at' => '2021-09-26 12:55:09',
                'updated_at' => '2021-09-26 12:55:09',
            ),
            34 => 
            array (
                'id' => 35,
                'key' => 'delete_collaborators_users',
                'table_name' => 'collaborators_users',
                'created_at' => '2021-09-26 12:55:09',
                'updated_at' => '2021-09-26 12:55:09',
            ),
            35 => 
            array (
                'id' => 36,
                'key' => 'browse_coupons',
                'table_name' => 'coupons',
                'created_at' => '2021-10-07 07:04:44',
                'updated_at' => '2021-10-07 07:04:44',
            ),
            36 => 
            array (
                'id' => 37,
                'key' => 'read_coupons',
                'table_name' => 'coupons',
                'created_at' => '2021-10-07 07:04:44',
                'updated_at' => '2021-10-07 07:04:44',
            ),
            37 => 
            array (
                'id' => 38,
                'key' => 'edit_coupons',
                'table_name' => 'coupons',
                'created_at' => '2021-10-07 07:04:44',
                'updated_at' => '2021-10-07 07:04:44',
            ),
            38 => 
            array (
                'id' => 39,
                'key' => 'add_coupons',
                'table_name' => 'coupons',
                'created_at' => '2021-10-07 07:04:44',
                'updated_at' => '2021-10-07 07:04:44',
            ),
            39 => 
            array (
                'id' => 40,
                'key' => 'delete_coupons',
                'table_name' => 'coupons',
                'created_at' => '2021-10-07 07:04:44',
                'updated_at' => '2021-10-07 07:04:44',
            ),
        ));
        
        
    }
}