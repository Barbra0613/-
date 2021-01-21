<?php
namespace app\admin\controller;

use think\Controller;
use Firebase\JWT\JWT;
use think\cache\driver\Redis;

class Login extends Controller
{
    /**
     * 登入
     */
    public function index()
    {
        $this->view->engine->layout(false);
        return $this->fetch('login/login');
    }

    public function getToken( $username, $password ){
        $key = config('jwt_key');
        $jwtData = [
            "iss"=>"",  //签发者 可以为空
            "aud"=>"", //面象的用户，可以为空
            "iat" => time(), //签发时间
            "nbf" => time()+100, //在什么时候jwt开始生效  （这里表示生成10秒后才生效）
            "exp" => time()+3600*20, //token 过期时间
            "username" => $username, //记录的user信息
        ];
 
        $jwtToken = JWT::encode($jwtData, $key);
        $this->redis = new \Redis(); // 实例化
        $this->redis->connect('127.0.0.1','6379');
        $this->redis->set($username, $jwtToken );
        return $jwtToken;

    }



    /**
     * 处理登录请求
     */
    public function dologin()
    {
        
        $username = input('post.username');
        $password = input('post.password');
        $captcha = input('captcha');

        if (!$username) {
            $this->error('用户名不能为空');
        }
        if (!$password) {
            $this->error('密码不能为空');
        }
        if (!$captcha) {
            $this->error('验证码不能为空');
        }
        if (!captcha_check($captcha)){
            $this->error('验证码错误');
        }

        $client = model('Client');
        $info = $client->getInfoByUsername($username);

        if (!$info) {
            $this->error('用户名或密码错误');
        }
        $md5_salt = config('md5_salt');
        $md5_password = md5(md5($password).$md5_salt);
        if (md5(md5($password).$md5_salt) != $info['password']) {
            //echo(md5(md5($password).$md5_salt));
            $this->error('用户名或密码错误');
        } else {
            session('user_name', $info['username']);
            session('user_id', $info['id']);
            $token = $this->getToken($username, $md5_password);
            cookie('token',$token,3600*20);
            cookie('username',$token,3600*20);
            
            //记录登录信息
            $client->editInfo($info['id'],$token);
            $this->success('登入成功', 'index/index');
        }
    }

    /**
     * 登出
     */
    public function logout()
    {
        session('user_name', null);
        session('user_id', null);
        $this->view->engine->layout(false);
        $this->success('退出成功', 'login/login');
    }

}
