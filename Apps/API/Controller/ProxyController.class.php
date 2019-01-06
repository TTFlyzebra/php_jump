<?php
namespace API\Controller;
use Think\Controller;
class ProxyController extends Controller {
    public function index(){
    	header ( 'Cache-Control:max-age=0' );
    	header ( 'Content-Type:text/html;charset=utf-8 ', true );
    	header ( 'Last-Modified: ' . gmdate ( 'D, d M Y H:i:s', time () ) . ' GMT', true );
    	$proxy = M('proxy')->where(array('state'=>1))->select();
    	if($proxy){
    		$data = $proxy[0];
    		unset($data['id']);
    		unset($data['state']);
    		$data = json_encode($data);
    		import("Cls.RSA",APP_PATH);
    		$data = \RSA::privEncrypt($data);
    		echo $data;
    	}else{
    		echo "";
    	}
    }
}