<?php
namespace app\admin\controller;

use think\Controller;

class Log extends Common
{
    /**
     * 登入
     */
    public function index()
    {
        return $this->fetch('index');
    }

    public function client()
    {   
        $info = db('client_log')->select();
        $this->assign("lists", $info);
        return $this->fetch('client');
    }

    public function admin()
    {   
        $info = db('admin_log')->select();
        $this->assign("lists", $info);
        return $this->fetch('admin');
    }
}
