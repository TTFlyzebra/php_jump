<?php

namespace Admin\Controller;

use Think\Controller;

class EditHostController extends AuthController {
	public function index() {
		$urlapp = M ( 'url' )->where(array('client'=>'app'))->find();
		$this->url1 = $urlapp['url'];
		$urlpc = M ( 'url' )->where(array('client'=>'pc'))->find();
		$this->url2 = $urlpc['url'];
		$this->display ();
	}
	public function editapp() {
		if (! IS_POST) {
			$this->error ( "页面不存在！" );
		}
		$url = M ( 'url' )->where(array('client'=>$_POST['client']))->find();
		if (!$url) {
			$ret = M ( 'url' )->data ( $_POST )->add ();
		} else {
			$ret = M ( 'url' )->data ( array('id'=>$url['id'],'url'=>$_POST['url'],'client'=>$_POST['client']) )->save ();
		}
		
		if ($ret) {
			$this->success( "修改成功！" );
		} else {
			$this->error ( "修改失败！" );
		}
	}
	
	public function editpc(){
		if (! IS_POST) {
			$this->error ( "页面不存在！" );
		}
		$url = M ( 'url' )->where(array('client'=>$_POST['client']))->find();
		if (!$url) {
			$ret = M ( 'url' )->data ( $_POST )->add ();
		} else {
			$ret = M ( 'url' )->data ( array('id'=>$url['id'],'url'=>$_POST['url'],'client'=>$_POST['client']) )->save ();
		}
		
		if ($ret) {
			$this->success( "修改成功！" );
		} else {
			$this->error ( "修改失败！" );
		}
	}
}