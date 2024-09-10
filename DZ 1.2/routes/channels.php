<?php

use Illuminate\Support\Facades\Broadcast;

/*
|--------------------------------------------------------------------------
| Broadcast Channels
|--------------------------------------------------------------------------
|
| Here you may register all of the event broadcasting channels that your
| application supports. The given channel authorization callbacks are
| used to check if an authenticated user can listen to the channel.
|
*/

// Kanal za korisnika
Broadcast::channel('App.Models.User.{id}', function ($user, $id) {
    return (int) $user->id === (int) $id;
});

// Kanal za letove
Broadcast::channel('flights.{flightId}', function ($user, $flightId) {
    // Provjerava ako je korisnik povezan s letom na neki način
    // Na primjer, provjera ako je korisnik rezervirao let ili je zaposlenik aerodroma
    return $user->flights->contains($flightId) || $user->isAirportStaff();
});

// Kanal za putnike
Broadcast::channel('passengers.{passengerId}', function ($user, $passengerId) {
    // Provjerava ako je korisnik povezan s putnikom na neki način
    // Na primjer, provjera ako je korisnik menadžer putnika ili administrator
    return $user->passengers->contains($passengerId) || $user->isAdministrator();
});

// Kanal za aerodrome
Broadcast::channel('airports.{airportId}', function ($user, $airportId) {
    // Provjerava ako je korisnik povezan s aerodromom na neki način
    // Na primjer, provjera ako je korisnik zaposlenik aerodroma ili administrator
    return $user->airports->contains($airportId) || $user->isAdministrator();
});
