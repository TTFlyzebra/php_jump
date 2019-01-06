<?php
namespace API\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
    	$url = M('url')->select();
    	if($url){
    		$data = $url[0]['url'];
    		import("Cls.RSA",APP_PATH);
    		$data = \RSA::privEncrypt($data);
// 			$data = base64_encode($data);
    		echo $data;
    	}else{
    		echo "";
    	}
    }
}