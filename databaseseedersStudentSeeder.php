<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class StudentSeeder extends Seeder
{
    public function run()
    {
        // Insert student
        DB::table('students')->insert([
            'name' => 'Chidi Okonkwo',
            'admission_no' => 'STU001'
        ]);

        // Insert subjects
        DB::table('subjects')->insert([
            ['name' => 'Mathematics', 'code' => 'MATH101'],
            ['name' => 'English', 'code' => 'ENG101']
        ]);

        // Insert results
        DB::table('results')->insert([
            ['student_id' => 1, 'subject_id' => 1, 'score' => 85],
            ['student_id' => 1, 'subject_id' => 2, 'score' => 72]
        ]);
    }
}