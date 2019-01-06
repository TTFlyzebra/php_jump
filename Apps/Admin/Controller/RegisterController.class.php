<?php

namespace Admin\Controller;

use Think\Controller;

class RegisterController extends Controller {
	public function index() {
		$this->display ();
	}
	
	public function register(){
		if(!IS_POST) $this->error ("页面不存在！");
		$data = $_POST;		
		$data['loginword']=md5($data['loginword']);//密码MD5加密
		$data['regtime']=time();
		$db = M('user');
		if($userid=$db->add($data)){
			$roledb = M('role_user');
			$roledb->where(array('user_id'=>$userid))->delete();
			if(C('USER_ROLE_ID')){
				$roledb->add(array('role_id'=>C('USER_ROLE_ID'),'user_id'=>$userid));
			}
			$this->success("注册成功，请登陆。",U("/Admin/Login"));
		}else{
			$this->error("注册失败！");
		}
	}
}