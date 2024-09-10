<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use App\Models\Flight;
use App\Models\Passenger;
use App\Policies\FlightPolicy;
use App\Policies\PassengerPolicy;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The model to policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
        Flight::class => FlightPolicy::class,
        Passenger::class => PassengerPolicy::class,
    ];

    /**
     * Register any authentication / authorization services.
     */
    public function boot(): void
    {
        $this->registerPolicies();

        // Definiši dodatna pravila autorizacije ako je potrebno
        Gate::define('view-flight', [FlightPolicy::class, 'view']);
        Gate::define('manage-passenger', [PassengerPolicy::class, 'manage']);
    }
}
