<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;

class Authority extends Common
{

    /**
     * 首页
     */
    public function index()
    {
        return $this->fetch('index');
    }

    public function member()
    {   
        $info = db('admin_users')->alias('a')->join('admin_group_access ags', 'a.id = ags.id', 'LEFT')->join('admin_group ag', 'ag.group_id = ags.group_id', 'LEFT')->select();
        $this->assign("lists", $info);
        return $this->fetch('member');
    }

 
    public function authority_edit() {
        
        $this->view->engine->layout(false);
        $id = input('id');
        $info = db('admin_users')->alias('a')->join('admin_group_access ags', 'a.id = ags.id', 'LEFT')->join('admin_group ag', 'ag.group_id = ags.group_id', 'LEFT')->where('a.id', $id)->select();
        $this->assign("lists", $info);
        return $this->fetch("authority_edit");
        
    }

    public function authority_edit_db() {
        
        $id = input('id');
        $username = input('username');
        $password = input('password');
        $role = input('role');
        if ( $password != 'xxxxxxxx' ){
            $md5_salt = config('md5_salt');
            $md5_password = md5(md5($password).$md5_salt);
            db('admin_users')->where('id', $id)->update(['username'=>$username,'password'=>$md5_password]);
            db('admin_group_access')->where('id', $id)->update(['group_id'=>$role]);
        }else{
            db('admin_users')->where('id', $id)->update(['username'=>$username]);
            db('admin_group_access')->where('id', $id)->update(['group_id'=>$role]);
        }
        
    }

    public function authority_del() {
         
        $id = input('id');
        // echo ($id);
        db('admin_users')->where('id', $id)->delete();
        db('admin_group_access')->where('id', $id)->delete();
        
    }

    public function authority_add() {

        $this->view->engine->layout(false);
        return $this->fetch("authority_add");
      
    }

    public function authority_add_db() {
        
        $username = input('post.username');
        $password = input('post.password');
        $role = input('post.contrller');

        // echo ($role);

        $md5_salt = config('md5_salt');
        $md5_password = md5(md5($password).$md5_salt);
              
        $data = ['username' => $username, 'password' => $password, 'status' => 1];
        db('admin_users')->insert($data);
        
        $user = db('admin_users')->where('username',$username)->find();
        $id = $user['id'];

        db('admin_group_access')->insert(['id' => $id, 'group_id' => $role ]);
        echo("<script>
            parent.layer.closeAll();
            parent.layer.msg('添加成功',{icon:1,time:1000});
            </script>");
        echo ("<script>setTimeout('window.parent.location.reload()', 1);</script>");
        
    }
}
