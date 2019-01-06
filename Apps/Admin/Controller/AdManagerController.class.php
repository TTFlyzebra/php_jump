<?php
namespace Admin\Controller;
use Think\Controller;
class AdManagerController extends AuthController {
    public function index(){
    	$this->admanager = M('admanager')->select();
    	$this->display();
    }
    
    public function add(){
	    if(!IS_POST) $this->error ("页面不存在！");
		$product = $_POST;
		$upload = new \Think\Upload (); // 实例化上传类
		$upload->maxSize = 100*1024*1024; // 设置附件上传大小
		$upload->exts = array (	'jpg','png','apk','ipa'); // 设置附件上传类型
		$upload->rootPath = './Uploads/';
		$upload->savePath = '/App/'; // 设置附件上传目录
			                                 
		// 接受上传的图像文件
		$info = $upload->upload ();		
		if (! $info) { // 上传错误提示错误信息
			$this->error ("上传图像文件失败！");
		} else {
			//更新product_imgurl(产品图像)表
			$data = array();
			foreach ( $info as $file ) {
				$fileurl = '/Uploads'.$file ['savepath'] . $file ['savename'];
				import ( "Cls.RSA", APP_PATH );
				if($file['ext']=='jpg'||$file['ext']=='png'){
					$data['imgurl'] = $fileurl;
				}else{
					$data['appurl'] = $fileurl;
				}
			}	
			if(M('admanager')->data($data)->add()){
				$this->success("添加广告成功");
			}else{
				$this->error("添加广告失败！");
			}
			
		}
		
    }
    public function del() {
    	if (! IS_POST)	$this->error ( "页面不存在！" );
    	M ( 'admanager' )->where (array('id'=>$_POST['id']))->delete ();
    }
}