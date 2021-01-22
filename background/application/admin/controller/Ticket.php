<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;

class Ticket extends Common
{
    // private $db_con = null;
    /**
     * 首页
     */
    public function index() {

        return $this->fetch('index');

    }

    public function program() {   

        $info = db('program')->select();
        $this->assign("lists", $info);
        return $this->fetch('program');

    }

    public function info() {   

        $info = db('ticket')->alias('t')->join('program p', 't.show_id = p.show_id', 'LEFT')->select();
        $this->assign("lists", $info);
        return $this->fetch('info');

    }

 
    public function ticket_edit() {
        
        $this->view->engine->layout(false);
        $id = input('id');
        $info = db('ticket')->alias('t')->join('program p', 't.show_id = p.show_id', 'LEFT')->where('id',$id)->select();
        $this->assign("lists", $info);
        return $this->fetch("ticket_edit");
        
    }

    public function ticket_edit_db() {
        
        $id = input('id');
        $place = input('place');
        $price = input('price');
        $tic_num = input('tic_num');
        $re_num = input('re_num');
        
        db('ticket')->where('id', $id)->update(['site_place'=>$place,'price'=>$price,'tic_num'=>$tic_num,'re_num'=>$re_num]);
        
    }

    public function ticket_del() {
         
        $id = input('id');
        echo ($id);
        db('ticket')->where('id', $id)->delete();
        
    }

    public function ticket_add() {

        $this->view->engine->layout(false);
        return $this->fetch("ticket_add");
      
    }

    public function ticket_add_db() {
        
        $show_id = input('post.show_id');
        $site_place = input('post.place');
        $price = input('post.price');
        $tic_num = input('post.tic_num');
        $re_num = input('post.re_num');
              
        $data = ['show_id' => $show_id, 'site_place' => $site_place, 'price' => $price, 'tic_num' => $tic_num, 're_num' => $re_num];
        db('ticket')->insert($data);
        echo("<script>
            parent.layer.closeAll();
            parent.layer.msg('添加成功',{icon:1,time:1000});
            </script>");
        echo ("<script>setTimeout('window.parent.location.reload()', 1);</script>");
        
    }

    public function program_edit() {
        
        $this->view->engine->layout(false);
        $show_id = input('show_id');
        $info = db('program')->where('show_id',$show_id)->select();
        $this->assign("lists", $info);
        return $this->fetch("program_edit");
        
    }

    public function program_edit_db() {
        
        $show_id = input('show_id');
        $name = input('name');
        $place = input('place');
        $start_time = input('start_time');
        $pro_comment = input('pro_comment');
        
        db('program')->where('show_id', $show_id)->update(['name'=>$name,'place'=>$place,'start_time'=>$start_time,'pro_comment'=>$pro_comment]);
        
    }

    public function program_del() {
         
        $show_id = input('show_id');
        // echo ($show_id);
        db('program')->where('show_id', $show_id)->delete();
        
    }

    public function program_add() {

        $this->view->engine->layout(false);
        return $this->fetch("program_add");
      
    }

    public function program_add_db() {
        
        $name = input('post.name');
        $place = input('post.place');
        $start_time = input('post.start_time');
        $pro_comment = input('post.pro_comment');
      
              
        $data = ['name' => $name, 'place' => $place, 'start_time' => $start_time, 'pro_comment' => $pro_comment];
        db('program')->insert($data);
        echo("<script>
            parent.layer.closeAll();
            parent.layer.msg('添加成功',{icon:1,time:1000});
            </script>");
        echo ("<script>setTimeout('window.parent.location.reload()', 1);</script>");
        
    }
    
 
}
