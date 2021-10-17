<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class MenuItemsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('menu_items')->delete();
        
        \DB::table('menu_items')->insert(array (
            0 => 
            array (
                'id' => 1,
                'menu_id' => 1,
                'title' => 'Dashboard',
                'url' => '',
                'target' => '_self',
                'icon_class' => 'voyager-boat',
                'color' => NULL,
                'parent_id' => NULL,
                'order' => 1,
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
                'route' => 'voyager.dashboard',
                'parameters' => NULL,
            ),
            1 => 
            array (
                'id' => 2,
                'menu_id' => 1,
                'title' => 'Media',
                'url' => '',
                'target' => '_self',
                'icon_class' => 'voyager-images',
                'color' => NULL,
                'parent_id' => NULL,
                'order' => 8,
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-10-17 15:33:29',
                'route' => 'voyager.media.index',
                'parameters' => NULL,
            ),
            2 => 
            array (
                'id' => 3,
                'menu_id' => 1,
                'title' => 'Users',
                'url' => '',
                'target' => '_self',
                'icon_class' => 'voyager-person',
                'color' => NULL,
                'parent_id' => NULL,
                'order' => 3,
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
                'route' => 'voyager.users.index',
                'parameters' => NULL,
            ),
            3 => 
            array (
                'id' => 4,
                'menu_id' => 1,
                'title' => 'Roles',
                'url' => '',
                'target' => '_self',
                'icon_class' => 'voyager-lock',
                'color' => NULL,
                'parent_id' => NULL,
                'order' => 2,
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:35:50',
                'route' => 'voyager.roles.index',
                'parameters' => NULL,
            ),
            4 => 
            array (
                'id' => 5,
                'menu_id' => 1,
                'title' => 'Tools',
                'url' => '',
                'target' => '_self',
                'icon_class' => 'voyager-tools',
                'color' => NULL,
                'parent_id' => NULL,
                'order' => 10,
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-10-17 15:33:29',
                'route' => NULL,
                'parameters' => NULL,
            ),
            5 => 
            array (
                'id' => 6,
                'menu_id' => 1,
                'title' => 'Menu Builder',
                'url' => '',
                'target' => '_self',
                'icon_class' => 'voyager-list',
                'color' => NULL,
                'parent_id' => 5,
                'order' => 1,
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:56:46',
                'route' => 'voyager.menus.index',
                'parameters' => NULL,
            ),
            6 => 
            array (
                'id' => 7,
                'menu_id' => 1,
                'title' => 'Database',
                'url' => '',
                'target' => '_self',
                'icon_class' => 'voyager-data',
                'color' => NULL,
                'parent_id' => 5,
                'order' => 2,
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:56:46',
                'route' => 'voyager.database.index',
                'parameters' => NULL,
            ),
            7 => 
            array (
                'id' => 8,
                'menu_id' => 1,
                'title' => 'Compass',
                'url' => '',
                'target' => '_self',
                'icon_class' => 'voyager-compass',
                'color' => NULL,
                'parent_id' => 5,
                'order' => 3,
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:56:46',
                'route' => 'voyager.compass.index',
                'parameters' => NULL,
            ),
            8 => 
            array (
                'id' => 9,
                'menu_id' => 1,
                'title' => 'BREAD',
                'url' => '',
                'target' => '_self',
                'icon_class' => 'voyager-bread',
                'color' => NULL,
                'parent_id' => 5,
                'order' => 4,
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-09-26 12:56:46',
                'route' => 'voyager.bread.index',
                'parameters' => NULL,
            ),
            9 => 
            array (
                'id' => 10,
                'menu_id' => 1,
                'title' => 'Settings',
                'url' => '',
                'target' => '_self',
                'icon_class' => 'voyager-settings',
                'color' => NULL,
                'parent_id' => NULL,
                'order' => 11,
                'created_at' => '2021-09-26 12:35:50',
                'updated_at' => '2021-10-17 15:33:29',
                'route' => 'voyager.settings.index',
                'parameters' => NULL,
            ),
            10 => 
            array (
                'id' => 11,
                'menu_id' => 1,
                'title' => 'Points',
                'url' => '',
                'target' => '_self',
                'icon_class' => 'voyager-trophy',
                'color' => NULL,
                'parent_id' => NULL,
                'order' => 4,
                'created_at' => '2021-09-26 12:50:03',
                'updated_at' => '2021-09-26 12:56:46',
                'route' => 'voyager.points.index',
                'parameters' => NULL,
            ),
            11 => 
            array (
                'id' => 12,
                'menu_id' => 1,
                'title' => 'Cộng tác viên',
                'url' => '',
                'target' => '_self',
                'icon_class' => 'voyager-people',
                'color' => '#000000',
                'parent_id' => NULL,
                'order' => 6,
                'created_at' => '2021-09-26 12:55:09',
                'updated_at' => '2021-10-07 14:46:25',
                'route' => 'voyager.collaborators-users.index',
                'parameters' => 'null',
            ),
            12 => 
            array (
                'id' => 13,
                'menu_id' => 1,
                'title' => 'Coupons',
                'url' => '',
                'target' => '_self',
                'icon_class' => 'voyager-trophy',
                'color' => '#000000',
                'parent_id' => NULL,
                'order' => 5,
                'created_at' => '2021-10-07 07:04:44',
                'updated_at' => '2021-10-07 14:46:25',
                'route' => 'voyager.coupons.index',
                'parameters' => 'null',
            ),
            13 => 
            array (
                'id' => 14,
                'menu_id' => 1,
                'title' => 'Pages',
                'url' => '',
                'target' => '_self',
                'icon_class' => 'voyager-file-text',
                'color' => NULL,
                'parent_id' => NULL,
                'order' => 9,
                'created_at' => '2021-10-08 04:37:05',
                'updated_at' => '2021-10-17 15:33:29',
                'route' => 'voyager.pages.index',
                'parameters' => NULL,
            ),
            14 => 
            array (
                'id' => 15,
                'menu_id' => 1,
                'title' => 'Yêu cầu nâng cấp',
                'url' => 'admin/nang_cap',
                'target' => '_self',
                'icon_class' => 'voyager-list',
                'color' => '#000000',
                'parent_id' => NULL,
                'order' => 7,
                'created_at' => '2021-10-17 15:28:34',
                'updated_at' => '2021-10-17 15:33:29',
                'route' => NULL,
                'parameters' => '',
            ),
        ));
        
        
    }
}