<?php

namespace app\admin\model;

use think\Model;

class Menu extends Model {
    /**
     * 我的菜单
     * @param type $display
     * @return array
     */
    public function getMyMenu($display = null) {
        $where = array();
        $user_id = session('user_id');
        $group_id = session('group_id');
        if ($user_id != 1) {
            $res = db('admin_group')
                ->field('rules')
                ->where('group_id','in', $group_id)
                ->select();
            if (!$res) {
                return false;
            }
            $tmp = '';
            foreach ($res as $k => $v) {
                $tmp .=$v['rules'] . ',';
            }

            $menu_ids = trim($tmp, ',');
            $where['id'] = ['in', $menu_ids];
        }


        if ($display) {
            $where['display'] = $display;
        }

        $res = db('admin_menu')->where($where)->order('list_order asc')->select();
        // echo (json_encode($res));

        return $res;
    }

}