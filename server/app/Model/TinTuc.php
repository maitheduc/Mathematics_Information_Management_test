<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class TinTuc extends Model
{
    protected $table = "tin_tucs";
    public $timestamps = true;
    protected $fillable = ['tieude', 'mota', 'hinhdaidien', 'noidung', 'noibat', 'luotxem', 'id_loaitin', 'id_user', 'is_hidden_cmt'];

    public function loaitin()
    {
        return $this->belongsTo('App\Model\LoaiTin', 'id_loaitin', 'id');
    }

    public function user()
    {
        return $this->belongsTo('App\User', 'id_user', 'id');
    }

    public function binhluan()
    {
        return $this->hasMany('App\Model\BinhLuan', 'id_tintuc', 'id');
    }
}
