<?php
namespace API\Controller;
use Think\Controller\RestController;
class ADController extends RestController {
	protected $allowMethod    = array('get','post','put','delete'); // REST允许的请求类型列表
	protected $allowType      = array('json'); // REST允许请求的资源类型列表
	public function index() {
		header ( 'Cache-Control:max-age=0' );
		header ( 'Content-Type:text/html;charset=utf-8 ', true );
		header ( 'Last-Modified: ' . gmdate ( 'D, d M Y H:i:s', time () ) . ' GMT', true );
		switch ($this->_method) {
			case 'get' : // get请求处理代码
				$data = M('admanager')->field('id',true)->select();
				for($i=0;$i<count($data);$i++){
					import ( "Cls.RSA", APP_PATH );
					if($data[$i]['imgurl']){
						$data[$i]['imgurl']= \RSA::privEncrypt ( $data[$i]['imgurl'] );
					}
					if($data[$i]['appurl']){
						$data[$i]['appurl']= \RSA::privEncrypt ( $data[$i]['appurl'] );
					}
				}
				$data = json_encode($data);
				if ($data) {
					echo $data;
				}
				break;
			case 'put' : // put请求处理代码
				break;
			case 'post' : // post请求处理代码
				break;
			case 'delete' : // delete请求处理代码
				break;
		}
	}
}