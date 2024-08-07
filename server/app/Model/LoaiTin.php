<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class LoaiTin extends Model
{
    protected $table = "loai_tins";

    protected $fillable = ['tenloaitin', 'id_theloai', 'parent_id', 'level', 'link'];

    public $timestamps = true;

    public function theloai()
    {
        return $this->belongsTo('App\Model\TheLoai', 'id_theloai', 'id');
    }

    public function tintuc()
    {
        return $this->hasMany('App\Model\TinTuc', 'id_loaitin', 'id');
    }
}
