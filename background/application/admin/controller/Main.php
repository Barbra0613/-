<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;

class Main extends Controller
{

    private $db_con = null;
    /**
     * 首页
     */
    public function index(){
    
        $num_tic = db('ticket')->sum('tic_num');
        $this->assign("num_tic", $num_tic);
        $re_tic = db('ticket')->sum('re_num');
        $this->assign("re_tic", $re_tic);
        $order = db('client_order')->count();
        $this->assign("order", $order);
        $log = db('client_log')->count();
        $this->assign("log", $log);
        return $this->fetch('main/index');
    }
}