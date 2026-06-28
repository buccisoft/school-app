<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});
use App\Http\Controllers\StudentController;

Route::get('/student/{id}', [StudentController::class, 'show']);