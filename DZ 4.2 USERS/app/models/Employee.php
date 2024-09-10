<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CrewMember extends Model
{
    use HasFactory;

    public $timestamps = false;
    protected $primaryKey = 'crew_member_id';

    protected $fillable = [
        'crew_member_id',
        'first_name',
        'last_name',
        'email',
        'phone_number',
        'hire_date',
        'position',
        'salary',
        'flight_id',
        'manager_id'
    ];
}

