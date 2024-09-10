<?php


Route::get('index.php', function () {
    IndexController::CreateView('IndexView');
});

// Routes for Passengers
Route::get('passengers', [PassengerController::class, 'index']);
Route::get('passengers_create', [PassengerController::class, 'create']);
Route::get('passengers_edit', [PassengerController::class, 'edit']);

Route::post('passengers', [PassengerController::class, 'store']);

Route::put('passengers_update', [PassengerController::class, 'update']);

Route::delete('passengers_delete', [PassengerController::class, 'delete']);

// Routes for Flights
Route::get('flights', [FlightController::class, 'index']);
Route::get('flights_create', [FlightController::class, 'create']);
Route::get('flights_edit', [FlightController::class, 'edit']);

Route::post('flights', [FlightController::class, 'store']);

Route::put('flights_update', [FlightController::class, 'update']);

Route::delete('flights_delete', [FlightController::class, 'delete']);

Route::get('airports', [AirportController::class, 'index']);
Route::get('airports_create', [AirportController::class, 'create']);
Route::get('airports_edit', [AirportController::class, 'edit']);

Route::post('airports', [AirportController::class, 'store']);

Route::put('airports_update', [AirportController::class, 'update']);

Route::delete('airports_delete', [AirportController::class, 'delete']);