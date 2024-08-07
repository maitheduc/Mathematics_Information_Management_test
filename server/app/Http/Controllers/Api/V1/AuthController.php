<?php

namespace App\Http\Controllers\Api\V1;

use App\Response\OkResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\V1\StoreChangePasswordRequest;
use App\Http\Requests\V1\StoreForgotPasswordRequest;
use App\Http\Requests\V1\StoreLoginRequest;
use App\Response\Exception\UnauthorizedException;
use App\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class AuthController extends Controller
{

    public function login(StoreLoginRequest $request)
    {
        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return (new UnauthorizedException('Email không tồn tại!'))->sendError();
        }

        if (!Hash::check($request->password, $user->password)) {
            return (new UnauthorizedException('Mật khẩu không chính xác!'))->sendError();
        }

        $response = new OkResponse('Đăng như thanh công!', $user);

        return $response->send();
    }

    public function forgotPassword(StoreForgotPasswordRequest $request)
    {
        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return (new UnauthorizedException('Email không tồn tại!'))->sendError();
        }

        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';

        for ($i = 0; $i < 6; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }

        $password_resets = DB::table('password_resets')->where('email', '=', $request->email)->first();

        if (!$password_resets) {
            $password_resets = DB::table('password_resets')
                ->where('email', '=', $request->email)
                ->update(['token' => $randomString]);
        } else {
            $password_resets = DB::table('password_resets')->insert([
                'email' => $request->email,
                'token' => $randomString
            ]);
        }

        $payload = [
            'tenhienthi' => $user->viewname,
            'maxacthuc' => $randomString,
        ];

        Mail::send('mail.reset_pass', $payload, function ($msg) use ($user) {
            $msg->from('huynhvanthuy97@gmail.com', "Khoa Tin học trường Đại học ĐHQG TPHCM");
            $msg->to($user->email, $user->viewname)
                ->subject('Yêu cầu xác thực tài khoản!');
        });

        return (new OkResponse('Vui lý thúc giữa 5 giời một giữa 15 giời', []))->send();
    }

    public function changePassword(StoreChangePasswordRequest $request)
    {
        $email = $request->email;
        $token = $request->token;
        $password = $request->password;

        $foundPasswordReset = DB::table('password_resets')
            ->where('email', '=', $email)
            ->where('token', '=', $token)
            ->first();

        if (!$foundPasswordReset) {
            return (new UnauthorizedException('Email hoặc token không hợp lệ!'))->sendError();
        }

        $foundUser = User::where('email', $email)->first();

        if (!$foundUser) {
            return (new UnauthorizedException('Email không tồn tại!'))->sendError();
        }

        $foundUser->password = bcrypt($password);

        $foundUser->save();

        return (new OkResponse('Đổi mật khẩu thành công!', []))->send();
    }
}
