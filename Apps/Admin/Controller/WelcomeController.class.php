<?php

namespace Admin\Controller;

use Think\Controller;

class WelcomeController extends AuthController {
	public function index() {
		$images=M("welcome")->select();
		$this->images=$images;
		$this->imgnum=sizeof($images);
		$this->display ();
	}
	public function add() {
		$upload = new \Think\Upload (); // 实例化上传类
		$upload->maxSize = 3145728; // 设置附件上传大小
		$upload->exts = array (	'jpg','png' ); // 设置附件上传类型
		$upload->rootPath = './Uploads/';
		$upload->savePath = '/welcome/images/'; // 设置附件上传目录
		
	// 上传单个文件     
		$info   =   $upload->uploadOne($_FILES['proimg1']);    
		if(!$info) {// 上传错误提示错误信息        
			$this->error($upload->getError());    
		}else{// 上传成功 获取上传文件信息       
			$imageurl = '/Uploads'.$info['savepath'].$info['savename'];
			if(!M("welcome")->add(array('imageurl'=>$imageurl))){
				$this->error("添加图像文件失败！");
			}else{
				import("Fly.MyImage",".");
				\MyImage::thumb(".".$imageurl, 480, 800);
				$this->redirect("/Admin/Welcome");
			}
		}
	}
	
	public function del(){
		if(!IS_POST) $this->error("页面不存在！");
		$id=I('post.id','','htmlspecialchars');
		if(M("welcome")->where(array('id'=>$id))->delete()){
			$this->redirect("/Admin/Welcome");
		}else{
			$this->error("删除图像失败！");
		}
	}
}