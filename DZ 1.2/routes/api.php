<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AirportController;
use App\Http\Controllers\FlightController;
use App\Http\Controllers\PassengerController;

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

// Ruta za autentifikaciju korisnika (ako koristite Sanctum)
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Rute za rad s aerodromima
Route::prefix('airports')->group(function () {
    Route::get('/', [AirportController::class, 'index']); // Prikaz svih aerodroma
    Route::post('/', [AirportController::class, 'store']); // Dodavanje novog aerodroma
    Route::get('{id}', [AirportController::class, 'show']); // Prikaz pojedinog aerodroma
    Route::put('{id}', [AirportController::class, 'update']); // Ažuriranje aerodroma
    Route::delete('{id}', [AirportController::class, 'destroy']); // Brisanje aerodroma
});

// Rute za rad s putnicima
Route::prefix('passengers')->group(function () {
    Route::get('/', [PassengerController::class, 'index']); // Prikaz svih putnika
    Route::post('/', [PassengerController::class, 'store']); // Dodavanje novog putnika
    Route::get('{id}', [PassengerController::class, 'show']); // Prikaz pojedinog putnika
    Route::put('{id}', [PassengerController::class, 'update']); // Ažuriranje putnika
    Route::delete('{id}', [PassengerController::class, 'destroy']); // Brisanje putnika
});

// Rute za rad s letovima
Route::prefix('flights')->group(function () {
    Route::get('/', [FlightController::class, 'index']); // Prikaz svih letova
    Route::post('/', [FlightController::class, 'store']); // Dodavanje novog leta
    Route::get('{id}', [FlightController::class, 'show']); // Prikaz pojedinog leta
    Route::put('{id}', [FlightController::class, 'update']); // Ažuriranje leta
    Route::delete('{id}', [FlightController::class, 'destroy']); // Brisanje leta
});
