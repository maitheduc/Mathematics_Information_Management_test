<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class ThongBao extends Model
{
    protected $table = "thong_baos";
    public $timestamps = true;

    protected $fillable = [
        'tieude',
        'noidung',
        'ghichu',
        'ngaybatdau',
        'ngayhethan',
    ];
}
