<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Gate extends Model
{
    use HasFactory;

    public $timestamps = false;
    protected $primaryKey = 'gate_id';

    protected $fillable = [
        'gate_number',
        'terminal',
        'location',
        'country_id'
    ];
}
