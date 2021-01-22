<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;

class Order extends Common
{
    // private $db_con = null;
    /**
     * 首页
     */
    public function index()
    {
        return $this->fetch('index');
    }

    public function info()
    {   
        // $this->view->engine->layout(true);
        // $this->db_con = config('db_config1');
        $info = db('client_order')->select();
    
        $this->assign("lists", $info);
        return $this->fetch('info');
    }

 
    public function order_edit() {
        
        $this->view->engine->layout(false);
        $id = input('id');
        $info = db('client_order')->where('id',$id)->select();
        $this->assign("lists", $info);
        return $this->fetch("order_edit");
        
    }

    public function order_edit_db() {
        
        $id = input('id');
        $user_id = input('user_id');
        $ticket_id = input('ticket_id');
        $price = input('price');
        $status = input('status');
        $time = input('time');
        db('client_order')->where('id', $id)->update(['user_id'=>$user_id,'ticket_id'=>$ticket_id,'price'=>$price,'status'=>$status,'time'=>$time]);

    }

    public function order_del() {
         
        $id = input('id');
        // echo ($id);
        db('client_order')->where('id', $id)->delete();
        
    }

    public function order_add() {

        $this->view->engine->layout(false);
        return $this->fetch("order_add");
      
    }

    public function order_add_db() {
        
        $name = input('post.name');
        $user_id = input('post.user_id');
        $ticket_id = input('post.ticket_id');
        $price = input('post.price');
        $status = input('post.status');
        $time = input('post.time');
              
        $data = ['name' => $name, 'user_id' => $user_id, 'ticket_id' => $ticket_id, 'price' => $price, 'status' => $status, 'time' => $time];
        db('client_order')->insert($data);
        echo("<script>
            parent.layer.closeAll();
            parent.layer.msg('添加成功',{icon:1,time:1000});
            </script>");
        echo ("<script>setTimeout('window.parent.location.reload()', 1);</script>");
        
    }
}
