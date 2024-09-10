<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class CheckFlightsAndPassengers extends Command
{
    protected $signature = 'airport:checkFlightsAndPassengers';
    protected $description = 'Provjerava status letova i broji putnike na aerodromu.';

    public function handle(): void
    {
        $flights = $this->checkFlights();
        $passengers = $this->checkPassengers();

        $this->info("Status letova: {$flights}");
        $this->info("Broj putnika: {$passengers}");
    }

    private function checkFlights(): string
    {
        return 'Svi letovi su na vrijeme.';
    }

    private function checkPassengers(): int
    {
        return rand(100, 500);
    }
}

<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    protected function schedule(Schedule $schedule): void
    {
        $schedule->command('airport:checkFlightsAndPassengers')->everyThirtyMinutes();
    }

    protected function commands(): void
    {
        $this->load(__DIR__.'/Commands');
        require base_path('routes/console.php');
    }
}