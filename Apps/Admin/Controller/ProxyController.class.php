<?php

namespace Admin\Controller;

use Think\Controller;

class ProxyController extends AuthController {
	public function index() {
		$proxy = M ( 'proxy' )->select ();
		$this->proxy = $proxy [0];
		$this->display ();
	}
	public function edit() {
		if (! IS_POST) {
			$this->error ( "页面不存在！" );
		}
		$proxy = M ( 'proxy' )->select ();
		if (!$proxy) {
			$ret = M ( 'proxy' )->data ( $_POST )->add ();
		} else {
			$ret = M ( 'proxy' )->data ( array('id'=>$proxy[0]['id'],'proxy'=>$_POST['proxy'],'port'=>$_POST['port'],'state'=>$_POST['state']) )->save ();
		}
		if ($ret) {
			$this->success( "修改成功！" );
		} else {
			$this->error ( "修改失败！" );
		}
	}
	
	public function del(){
		
	}
}