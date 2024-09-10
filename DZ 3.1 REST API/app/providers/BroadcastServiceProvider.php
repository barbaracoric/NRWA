<?php

use Illuminate\Support\Facades\Broadcast;
use App\Models\User;

Broadcast::channel('flight.{flightId}', function (User $user, $flightId) {
    // Provjera može li korisnik pristupiti ovom kanalu
    return true; // ili neka logika koja provjerava korisnikove privilegije
});

Broadcast::channel('passenger.{passengerId}', function (User $user, $passengerId) {
    // Provjera može li korisnik pristupiti ovom kanalu
    return true; // ili neka logika koja provjerava korisnikove privilegije
});
