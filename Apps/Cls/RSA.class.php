<?php
class RSA{	
private static $PRIVATE_KEY = '-----BEGIN RSA PRIVATE KEY-----
MIICXQIBAAKBgQC3//sR2tXw0wrC2DySx8vNGlqt3Y7ldU9+LBLI6e1KS5lfc5jl
TGF7KBTSkCHBM3ouEHWqp1ZJ85iJe59aF5gIB2klBd6h4wrbbHA2XE1sq21ykja/
Gqx7/IRia3zQfxGv/qEkyGOx+XALVoOlZqDwh76o2n1vP1D+tD3amHsK7QIDAQAB
AoGBAKH14bMitESqD4PYwODWmy7rrrvyFPEnJJTECLjvKB7IkrVxVDkp1XiJnGKH
2h5syHQ5qslPSGYJ1M/XkDnGINwaLVHVD3BoKKgKg1bZn7ao5pXT+herqxaVwWs6
ga63yVSIC8jcODxiuvxJnUMQRLaqoF6aUb/2VWc2T5MDmxLhAkEA3pwGpvXgLiWL
3h7QLYZLrLrbFRuRN4CYl4UYaAKokkAvZly04Glle8ycgOc2DzL4eiL4l/+x/gaq
deJU/cHLRQJBANOZY0mEoVkwhU4bScSdnfM6usQowYBEwHYYh/OTv1a3SqcCE1f+
qbAclCqeNiHajCcDmgYJ53LfIgyv0wCS54kCQAXaPkaHclRkQlAdqUV5IWYyJ25f
oiq+Y8SgCCs73qixrU1YpJy9yKA/meG9smsl4Oh9IOIGI+zUygh9YdSmEq0CQQC2
4G3IP2G3lNDRdZIm5NZ7PfnmyRabxk/UgVUWdk47IwTZHFkdhxKfC8QepUhBsAHL
QjifGXY4eJKUBm3FpDGJAkAFwUxYssiJjvrHwnHFbg0rFkvvY63OSmnRxiL4X6EY
yI9lblCsyfpl25l7l5zmJrAHn45zAiOoBrWqpM5edu7c
-----END RSA PRIVATE KEY-----';  

private static $PUBLIC_KEY = '-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC3//sR2tXw0wrC2DySx8vNGlqt
3Y7ldU9+LBLI6e1KS5lfc5jlTGF7KBTSkCHBM3ouEHWqp1ZJ85iJe59aF5gIB2kl
Bd6h4wrbbHA2XE1sq21ykja/Gqx7/IRia3zQfxGv/qEkyGOx+XALVoOlZqDwh76o
2n1vP1D+tD3amHsK7QIDAQAB
-----END PUBLIC KEY-----';
    /** 
    *返回对应的私钥 
    */  
    private static function getPrivateKey(){  
      
        $privKey = self::$PRIVATE_KEY;  
           
        return openssl_pkey_get_private($privKey);        
    }  
   
    /** 
     * 私钥加密 
     */  
    public static function privEncrypt($data)  
    {  
        if(!is_string($data)){  
                return null;  
        }             
        return openssl_private_encrypt($data,$encrypted,self::getPrivateKey())? base64_encode($encrypted) : null;  
    }  
      
      
    /** 
     * 私钥解密 
     */  
    public static function privDecrypt($encrypted)  
    {  
        if(!is_string($encrypted)){  
                return null;  
        }  
        return (openssl_private_decrypt(base64_decode($encrypted), $decrypted, self::getPrivateKey()))? $decrypted : null;  
    }  
    
    /**
     * 返回对应的公钥
     * @return resource
     */
    private static function getPublicKey(){
    
    	$publicKey = self::$PUBLIC_KEY;
    	 
    	return openssl_pkey_get_public($publicKey);
    }
    

    /**
     * 公钥加密
     */
    public static function publicEncrypt($data)
    {
    	if(!is_string($data)){
    		return null;
    	}
    	return openssl_public_encrypt($data,$encrypted,self::getPublicKey())? base64_encode($encrypted) : null;
    }
    
    
    /**
     * 公钥解密
     */
    public static function publicDecrypt($encrypted)
    {
    	if(!is_string($encrypted)){
    		return null;
    	}
    	return (openssl_public_decrypt(base64_decode($encrypted), $decrypted, self::getPublicKey()))? $decrypted : null;
    }
}