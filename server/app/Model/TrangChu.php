<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class TrangChu extends Model
{
    protected $table = "trang_chus";
    protected $fillable = ['gioithieu'];
    public $timestamps = true;
}
