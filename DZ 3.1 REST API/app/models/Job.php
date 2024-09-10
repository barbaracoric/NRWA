<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Position extends Model
{
    use HasFactory;

    public $timestamps = false;
    protected $primaryKey = 'position_id';
    protected $keyType = 'string';

    protected $fillable = [
        'position_id', 
        'position_title', 
        'min_salary', 
        'max_salary'
    ];
}
