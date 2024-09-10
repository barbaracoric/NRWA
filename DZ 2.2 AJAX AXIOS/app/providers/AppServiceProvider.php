<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Services\FlightService;
use App\Services\PassengerService;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        // Registracija servisa za letove
        $this->app->singleton(FlightService::class, function ($app) {
            return new FlightService();
        });

        // Registracija servisa za putnike
        $this->app->singleton(PassengerService::class, function ($app) {
            return new PassengerService();
        });
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // Možeš dodati dodatne inicijalizacije ili konfiguracije ovdje
    }
}
