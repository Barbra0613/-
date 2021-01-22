<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;

class Client extends Common
{

    /**
     * 首页
     */
    public function index()
    {
        return $this->fetch('index');
    }

    public function info()
    {   
        $info = db('client_users')->select();
        $this->assign("lists", $info);
        return $this->fetch('info');
    }

 
    public function client_edit() {
        
        $this->view->engine->layout(false);
        $id = input('id');
        $info = db('client_users')->where('id',$id)->select();
        $this->assign("lists", $info);
        return $this->fetch("client_edit");
        
    }

    public function client_edit_db() {
        
        $id = input('id');
        $username = input('username');
        $password = input('password');
        $client_comment = input('client_comment');

        if ( $password != 'XXXXXXXXX' ){
            $md5_salt = config('md5_salt');
            $md5_password = md5(md5($password).$md5_salt);

            db('client_users')->where('id', $id)->update(['username'=>$username,'password'=>$md5_password,'client_comment'=>$client_comment]);
        }else{
            db('client_users')->where('id', $id)->update(['username'=>$username,'client_comment'=>$client_comment]);
        }
        
        
    }

    public function client_del() {
         
        $id = input('id');
        // echo ($id);
        db('client_users')->where('id', $id)->delete();
        
    }

    public function client_add() {

        $this->view->engine->layout(false);
        return $this->fetch("client_add");
      
    }

    public function client_add_db() {
        
        $username = input('post.username');
        $password = input('post.password');
        $client_comment = input('client_comment');

        $md5_salt = config('md5_salt');
        $md5_password = md5(md5($password).$md5_salt);
              
        $data = ['username' => $username, 'password' => $md5_password, 'client_comment' => $client_comment];
        db('client_users')->insert($data);
        echo("<script>
            parent.layer.closeAll();
            parent.layer.msg('添加成功',{icon:1,time:1000});
            </script>");
        echo ("<script>setTimeout('window.parent.location.reload()', 1);</script>");
        
    }
}
