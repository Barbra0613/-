<?php

/**
 * 后台公共文件
 */

namespace app\admin\controller;

use think\Controller;

class Common extends Controller {

    public function __construct(\think\Request $request = null) {

        parent::__construct($request);

        if ( cookie('token') ){ 

            $user_id = session('user_id');
            $token = cookie('token');
            $username = cookie('username');
            
            // $info = db('client_users')->field('token')->where('id', $user_id)->find();
            $this->redis = new \Redis(); // 实例化
            $this->redis->connect('127.0.0.1','6379');
            $info = $this->redis->get($username);
            if ( $token == $info['token']  ){
                return;
            }
        }
        
        
        $this->error('请登陆', 'login/index');
        
    }

}
