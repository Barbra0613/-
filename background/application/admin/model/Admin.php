<?php


namespace app\admin\model;

use think\Db;

class Admin extends \think\Model {

    public $status = array(1 => '无效', 2 => '有效');

    /**
     * 登录时调用
     * @param String $username 用户名
     * @return Array
     */
    public function getInfoByUsername($username) {
        $res = db('admin_users')->field('id,username,password,status')
            ->where(array('username' => $username,'status' => 1))
            ->find();
        // echo (json_encode($res));
        // if ($res) {
        //     $res = $res->data;
        // }

        return $res;
    }

    /**
     *
     * @param int $userid 用户ID
     * @return Array
     */
    public function getUserGroups($uid) {

        $res = db('admin_group_access')->field('group_id')->where('id', $uid)->select();

        $userGroups = '';
        if ($res) {
            foreach ($res as $k => $v) {
                $userGroups .= $v['group_id'] . ',';
            }
            return trim($userGroups, ',');
        } else {
            return false;
        }
    }

    /**
     * 登陆更新
     * @param int $id id
     * @param array $data 更新的数据
     */
    public function editInfo( $id, $token, $data = array()) {
        $data['login_time'] = date('Y-m-d H:i:s');
        $data['login_ip'] = ip2long(request()->ip());
        $data['token'] = $token;
        // echo (json_encode($data));
        // allowField,过滤数组中的非数据表字段数据
        $res = db('admin_users')->where('id',$id)->update($data, ['id' => $id]);
        return $res;
    }

}
