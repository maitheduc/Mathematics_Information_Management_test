<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class ChiTietBinhLuan extends Model
{
    protected $table = "chi_tiet_binh_luans";
    public $timestamps = true;
    protected $fillable = ['noidung', 'id_binhluan', 'id_user', 'is_hidden_cmt'];

    public function binhluan()
    {
        return $this->belongsTo('App\Model\BinhLuan', 'id_binhluan', 'id');
    }

    public function user()
    {
        return $this->belongsTo('App\User', 'id_user', 'id');
    }

    // Create scope http://laravel.com/docs/5.0/eloquent#query-scopes
    public function scopeLatest($query)
    {
        return $query->orderBy('created_at', 'asc');
    }
}
