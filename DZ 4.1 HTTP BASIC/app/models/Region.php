<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Terminal extends Model
{
    use HasFactory;

    public $timestamps = false;
    protected $primaryKey = 'terminal_id';

    protected $fillable = [
        'terminal_id', 
        'terminal_name'
    ];
}
