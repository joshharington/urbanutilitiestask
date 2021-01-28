<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use \App\Http\Controllers\API\MovieController;
use \App\Http\Controllers\API\WatchlistController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => '/movies'], function() {
    Route::get('/upcoming', [MovieController::class, 'getUpcoming'])->name('api.movies.upcoming');
    Route::get('/trending', [MovieController::class, 'getTrending'])->name('api.movies.trending');
    Route::get('/{movieId}', [MovieController::class, 'getMovie'])->name('api.movies.show');
});

Route::group(['middleware' => ['auth:api'], 'prefix' => '/watchlist'], function() {
    Route::get('/', [WatchlistController::class, 'index'])->name('api.watchlist');
    Route::post('/', [WatchlistController::class, 'store'])->name('api.watchlist.store');
    Route::delete('/{movieId}', [WatchlistController::class, 'delete'])->name('api.watchlist.delete');
});
