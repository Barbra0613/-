<?php


namespace app\admin\model;

use think\Db;

class Client extends \think\Model {


    /**
     * 登录时调用
     * @param String $username 用户名
     * @return Array
     */
    public function getInfoByUsername($username) {
        $res = db('client_users')->field('id,username,password')
            ->where(array('username' => $username))
            ->find();
        // echo (json_encode($res));
        // if ($res) {
        //     $res = $res->data;
        // }

        return $res;
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
        $res = db('client_users')->where('id',$id)->update($data, ['id' => $id]);
        return $res;
    }

}
