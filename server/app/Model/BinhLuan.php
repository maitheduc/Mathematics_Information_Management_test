<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class BinhLuan extends Model
{
    protected $table = "binh_luans";

    public $timestamps = true;

    protected $fillable = ['noidung', 'id_user', 'id_tintuc', 'is_hidden_cmt'];

    public function tintuc()
    {
        return $this->belongsTo('App\Model\TinTuc', 'id_tintuc', 'id');
    }

    public function user()
    {
        return $this->belongsTo('App\User', 'id_user', 'id');
    }

    public function chitietbinhluan()
    {
        return $this->hasMany('App\Model\ChiTietBinhLuan', 'id_binhluan', 'id');
    }
}
