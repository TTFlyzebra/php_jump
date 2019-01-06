<?php
namespace API\Controller;
use Think\Controller;
class DataController extends Controller {
    public function index(){
    	header ( 'Cache-Control:max-age=0' );
    	header ( 'Content-Type:text/html;charset=utf-8 ', true );
    	header ( 'Last-Modified: ' . gmdate ( 'D, d M Y H:i:s', time () ) . ' GMT', true );
    	$url = M('url')->where(array('client'=>'app'))->find();
    	if($url){
    		$data = $url['url'];
    		import("Cls.RSA",APP_PATH);
    		$data = \RSA::privEncrypt($data);
    		echo $data;
    	}else{
    		echo "";
    	}
    }
}