<?php

use App\Http\Controllers\api\AuthController;
use App\Http\Controllers\api\PlanController;
use Laravel\Fortify\Http\Controllers\AuthenticatedSessionController;
use Laravel\Fortify\Http\Controllers\RegisteredUserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

/*Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});*/


Route::middleware('guest:sanctum')->group(function(){

    //in case of mobile app or any api (not spa in same domain as web app) we use token based authentification
    Route::post('/loginWithToken',[AuthController::class,'login']);

    
    //in case of SPA in same domain or frontEnd of our application we use fortify (copied from fortify routes) : session based auth

    $limiter = config('fortify.limiters.login');
   
    Route::post('/spaLogin', [AuthenticatedSessionController::class, 'store'])
        ->middleware(array_filter([
            'guest:'.config('fortify.guard'),
            $limiter ? 'throttle:'.$limiter : null,
        ]));

    //token register 
   
    Route::post('/registerWithToken',[AuthController::class,'register'] );

    //fortify register (will login user with session based when registred success) 
    Route::post('/spaRegister', [RegisteredUserController::class, 'store']);
    
});

Route::middleware('auth:sanctum')->group(function(){
    Route::get('/user', function (Request $request) {
    return $request->user();
});
    Route::apiResource('plans',PlanController::class);
    //in case of mobile app or any api (not spa in same domain as web app) we use token based authentification
    Route::post('/logoutWithToken',[AuthController::class,'logoutCurrentInstance']);

     //in case of SPA in same domain or frontEnd of our application we use fortify (copied from fortify routes) : session based logout
    Route::post('/spaLogout', [AuthenticatedSessionController::class, 'destroy'])
    ->name('logout');
    Route::post('test',function(){
        return "ok";
    });
});