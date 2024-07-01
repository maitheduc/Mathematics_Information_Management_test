<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class HopThu extends Model
{
    protected $table = "hop_thus";
    public $timestamps = true;
    protected $fillable = ['hoten', 'email', 'dienthoai', 'noidung', 'andanh', 'daxem', 'dadoc',];
}
