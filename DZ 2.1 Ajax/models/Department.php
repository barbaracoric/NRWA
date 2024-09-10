<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    use HasFactory;

    public $timestamps = false;
    protected $primaryKey = 'flight_id';

    protected $fillable = [
        'flight_number',
        'departure_time',
        'arrival_time',
        'destination'
    ];
}
