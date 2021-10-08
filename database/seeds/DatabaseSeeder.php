<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        DB::statement('SET FOREIGN_KEY_CHECKS=0');
        $this->call([
            Database\Seeders\DataTypesTableSeeder::class,
            Database\Seeders\DataRowsTableSeeder::class,
            Database\Seeders\MenusTableSeeder::class,
            Database\Seeders\MenuItemsTableSeeder::class,
            Database\Seeders\RolesTableSeeder::class,
            Database\Seeders\PermissionsTableSeeder::class,
            Database\Seeders\PermissionRoleTableSeeder::class,
            Database\Seeders\SettingsTableSeeder::class,
//            Database\Seeders\PagesTableSeeder::class,
        ]);
        DB::statement('SET FOREIGN_KEY_CHECKS=1');
    }
}
