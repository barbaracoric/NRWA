<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Passenger extends Model
{
    use HasFactory;

    public $timestamps = false;
    protected $primaryKey = 'passenger_id';
    protected $keyType = 'string';

    protected $fillable = [
        'passenger_id',
        'passenger_name',
        'flight_id',
        'seat_number'
    ];
}