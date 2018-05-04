<?php
/**
 * 生成 proto 的lua版本
 * 1     bool
 * 2     int64
 * 3     int32
 * 4     int16
 * 5     byte
 * 6     double
 * 7     string
 * 
 * 复杂类型从id   100开始
 * 带array的数组在原来基础上加1000
 * 而复杂类型的也加1000
 * 
 * 如:1002表示int64数组
 * 
 */
 
$curPwd = getcwd();
$appRoot = dirname($curPwd);
chdir($appRoot);
$protoCommon = "proto/common.proto";
$protoGame = "proto/game.proto";

if (!file_exists($protoCommon)) {
	exit("文件{$protoCommon}不存在\r\n");
}
if (!file_exists($protoGame)) {
	exit("文件{$protoGame}不存在\r\n");
}

$mmMap = "proto/mm_map.xml";
if (!file_exists($mmMap)) {
	exit("文件{$mmMap}不存在\r\n");
}

print "正在处理中......[请勿关闭窗口！]\r\n";

defined('CL') or define('CL', "\n");

$xml = simplexml_load_file($mmMap);
$methodArray = array();
$modules = $xml->module;
foreach ( $modules as $m ) {
	$methods = $m->method;
	foreach ( $methods as $me ) {
		$mm = $me->attributes ();
		$nameM = ( string ) $mm ['name'];
		$idM = intval ( $mm ['id'] );
		$nameMUP = strtoupper ( $nameM );
		$methodArray[$nameMUP] = $idM;
	}
}


$lua = new ProtoNifGenerator($appRoot,$methodArray);
$lua->genLua_p();
$lua->genLua_m();

class ProtoNifGenerator {

    private $baseDir = null;
    private $commonMessages = null;
    private $gameMessages = null;
    private $methods = null;
    private $p_protos = null;
    private $p_proto_type_index = 100;
    private $codeHeader = null;
    
    
    public function __construct($baseDir,$methods)
    {
    	$this->baseDir = $baseDir;
    	$this->methods = $methods;
    	
    	$this->init_message();
    	$this->init_p_protos();
    	
    	$opTime = date('Y-m-d H:i:s');
    	
    	$this->codeHeader  = "-- Author: caochuncheng2002@gmail.com\n";
    	$this->codeHeader .= "-- Created: 2015-09-24\n";
    	$this->codeHeader .= "-- Description: proto lua config\n";
    	$this->codeHeader .= "-- This file is generated by script tool,Do not edit it.\n\n\n";
    	//$this->codeHeader .= "-- Generate Time:".$opTime." \n\n\n";
    	
    	$this->codeHeader .= "-- Data Type Id Description:\n";
    	$this->codeHeader .= "--     1:bool\n";
    	$this->codeHeader .= "--     2:int64\n";
    	$this->codeHeader .= "--     3:int32\n";
    	$this->codeHeader .= "--     4:int16\n";
    	$this->codeHeader .= "--     5:byte\n";
    	$this->codeHeader .= "--     6:double\n";
    	$this->codeHeader .= "--     7:string\n";
    	$this->codeHeader .= "--     自定义结构从100开始标记类型\n";
    	$this->codeHeader .= "--     所有类型的数组结构1000+id\n\n\n";
    	
		error_reporting(E_ERROR);
		if (!file_exists($this->baseDir."/front-end")) {
			mkdir($this->baseDir."/front-end");
		}
		
    }
	
	public function genLua_p(){
    	$genFileName = "p_defines";
    	$lua_code  = $this->codeHeader;
    	$lua_code .= "local ".$genFileName."={\n";
    	$message_code_arr = array();
    	foreach ($this->commonMessages as $m) {
    		$message_code_arr[] = $this->gene_lua_code($m);
    	}
    	$lua_code .= implode(",\n\n",$message_code_arr)."\n";
    	$lua_code .= "}\n\n";
		$lua_code .= "return ".$genFileName;
    	$gen_file = $this->baseDir."/front-end/".$genFileName.".lua";
		@unlink($gen_file);
		file_put_contents($gen_file, $lua_code);
		print "生成{$gen_file}成功\r\n";
    }
    public function genLua_m(){
    	$genFileName = "tos_defines";
    	$lua_code  = $this->codeHeader;
    	$lua_code .= "local ".$genFileName."={\n";
    	$message_code_arr = array();
    	foreach ($this->gameMessages as $m) {
    		$className = $m->getName();
    		if("_tos" == substr($className,strlen($className) - 4,4)){
    			$message_code_arr[] = $this->gene_lua_code($m);
    		}
    	}
    	$lua_code .= implode(",\n\n",$message_code_arr)."\n";
    	$lua_code .= "}\n\n";
		$lua_code .= "return ".$genFileName;
    	$gen_file = $this->baseDir."/front-end/".$genFileName.".lua";
		@unlink($gen_file);
		file_put_contents($gen_file, $lua_code);
		print "生成{$gen_file}成功\r\n";
		
		$genFileName = "toc_defines";
		$lua_code  = $this->codeHeader;
    	$lua_code .= "local ".$genFileName."={\n";
		$message_code_arr = array();
		foreach ($this->gameMessages as $m) {
			$className = $m->getName();
			if("_toc" == substr($className,strlen($className) - 4,4)){
				$message_code_arr[] = $this->gene_lua_code($m);
			}
		}
		$lua_code .= implode(",\n\n",$message_code_arr)."\n";
		$lua_code .= "}\n\n";
		$lua_code .= "return ".$genFileName;
		$gen_file = $this->baseDir."/front-end/".$genFileName.".lua";
		@unlink($gen_file);
		file_put_contents($gen_file, $lua_code);
		print "生成{$gen_file}成功\r\n";
    }
    
    private function init_message(){
    	$string = file_get_contents($this->baseDir."/proto/".'common.proto');
    	$contentAll = str_replace('import "common.proto";', '', $string);
    	$contentAll = preg_replace("/(option java_package = )\"(\w+).(\w+)\";/", "", $contentAll);
    	$contentAll = preg_replace("/\/\/(.*)?\\\n/","\n",$contentAll);//去掉注释
    	$pb = new ProtoParse();
    	$this->commonMessages = array();
    	$this->commonMessages = $pb->parse($contentAll);
    	
    	$string = file_get_contents($this->baseDir."/proto/".'game.proto');
    	$contentAll = str_replace('import "common.proto";', '', $string);
    	$contentAll = preg_replace("/(option java_package = )\"(\w+).(\w+)\";/", "", $contentAll);
    	$contentAll = preg_replace("/\/\/(.*)?\\\n/","\n",$contentAll);//去掉注释
    	$this->gameMessages = array();
    	$this->gameMessages = $pb->parse($contentAll);
    }
    
    private function init_p_protos() {
    	$this->p_protos = array();
    	foreach ($this->commonMessages as $m) {
    		$className = $m->getName();
    		if("p_" == substr($className,0,2)){
    			$this->p_protos[$className]=$this->p_proto_type_index;
    			$this->p_proto_type_index = $this->p_proto_type_index + 1;
    		}
    	}
    }
	
	private function gene_lua_code(ProtoMessage $message) {
    	$className = $message->getName();
    	$sid = 0;
    	if("m_" == substr($className,0,2)){
    		$len = strlen($className)-6;
    		$method = strtoupper(substr($className,2,$len));
    		$sid = $this->methods[$method];
    		$code  = "    -- ".$className."\n";
    	}else{
    		$sid = $this->p_protos[$className];
    		$code  = "    -- ".$className." type id=".$sid."\n";
    	}
    	
    	$field_lua = array();
    	$field_src = array();
    	$field_name = array();
    	$fields = $message->getFields();
    	$field_desc = "";
    	foreach($fields as $field) {
    		$name = $field->name;
    		$type = $field->type;
    		$dataType = $field->dataType;
    		$default = $field->default;
    		
    		$luaFieldType = $this->getFieldType($type, $dataType);
    		$field_lua[] = $luaFieldType;
    		$field_lua[] = "\"".$name."\"";
    		$field_src[] = "{".$type.",".$dataType."}";
    		$field_name[] = $name;
    		if ($field->desc != ""){
    			$field_desc .= "    -- ".$name."    ".$field->desc."\n";
    		}
    	}
    	$code .= "    -- Feilds={".implode(",",$field_name)."}\n";
    	$code .= "    -- ".$className."={".implode(",",$field_src)."}\n";
    	//$code .= $field_desc;
    	$code .= "    [".$sid."]={".implode(",",$field_lua)."}";
    	return $code;
	}
	
	private function getFieldType($type,$dataType){
		if( $type=="repeated" ){
			if( $dataType =="bool" ){
				return 1001;
			}else if( $dataType =="int64" ){
				return 1002;
			}else if( $dataType =="int32" ){
				return 1003;
			}else if( $dataType =="int16" ){
				return 1004;
			}else if( $dataType =="byte" ){
				return 1005;
			}else if( $dataType =="double" ){
				return 1006;
			}else if( $dataType =="string" ){
				return 1007;
			}else{//自定义类型
				if (array_key_exists($dataType, $this->p_protos)) {
					return 1000 + $this->p_protos[$dataType];
				}
				return 0;
			}
		}else{
			if( $dataType =="bool" ){
				return 1;
			}else if( $dataType =="int64" ){
				return 2;
			}else if( $dataType =="int32" ){
				return 3;
			}else if( $dataType =="int16" ){
				return 4;
			}else if( $dataType =="byte" ){
				return 5;
			}else if( $dataType =="double" ){
				return 6;
			}else if( $dataType =="string" ){
				return 7;
			}else{//自定义类型
				if (array_key_exists($dataType, $this->p_protos)) {
					return $this->p_protos[$dataType];
				}
				return 0;
			}
		}
	}
}


class ProtoParse {
    private $messages = array();
    
    public function parse($contentAll) {
        //匹配所有的message
        if (preg_match_all("/message[ \t]+[\w]+[ \t\n]*{[ \t\n]+[^}]*}/i", $contentAll, $matches) > 0) {
            // 现在 matches数组的每个元素都是一个message
            foreach($matches[0] as $messageDesc) {
                $message = $this->_parse_message($messageDesc);
                $this->_push($message);
            }
            return $this->messages;
		} else {
			var_dump($matches);
		    throw new Exception ("proto定义文件格式出错:1");
		}
    }
    
    private function _push(ProtoMessage $message) {
        $this->messages[$message->getName()] = $message;
    }
    
    private function _parse_message($messageDesc) {
        if (preg_match("/message[ \t]+([\w]+)[ \t\n]?{([ \t\n]+[^}]*)}/i", $messageDesc, $messageDetail) > 0) {
            $messageName = $messageDetail[1];
            $messageBody = $messageDetail[2];
            $fields = explode("\n", $messageBody);
            $pm = new ProtoMessage($messageName);
            foreach($fields as $field) {
                if (trim($field) == '') {
                    continue;
                }
//                 $flag = false;
//                 $tmparray = explode("optional",$field);
//                 if(count($tmparray)>1){
//                 	$flag = true;
//                 }else{
//                 	$tmparray = explode("required",$field);
//                 	if(count($tmparray)>1){
//                 		$flag = true;
//                 	}else{
//                 		$tmparray = explode("repeated",$field);
//                 		if (count($tmparray)>1) {
//                 			$flag = true;
//                 		}else{
//                 			$flag = false;
//                 		}
//                 	}
//                 }
//                 if (!$flag){
//                 	continue;
//                 }
                //顺序匹配出  : 字段类型    数据类型  字段名称  字段唯一标示数字 默认值   
                $p = "/[ \t]*(required|optional|repeated)[ \t]+(\w+)[ \t]+(\w+)[ \t]*=[ \t]*([0-9]+)[ \t]*(\[default[ \t]*=[ \t]*([^\[\]]+)\])?;/";
                //$p = "/[ \t]*(required|optional|repeated)[ \t]+(\w+)[ \t]+(\w+)[ \t]*=[ \t]*([0-9]+)[ \t]*(\[default[ \t]*=[ \t]*([^\[\]]+)\])?;[ \t]*(\/\/.*)?/";
                if (preg_match($p, $field, $f) > 0) {
                    $fieldObj = new ProtoField;
                    $fieldObj->type = $f[1];
                    $fieldObj->dataType = $f[2];
                    $fieldObj->name = strtolower($f[3]);
                    $fieldObj->unique = $f[4];
                    $fieldObj->default = isset($f[6]) ? ($f[6]) : NULL;
                    $fieldObj->desc = isset($f[7]) ? ($f[7]) : NULL;
                    $fieldObj->desc = trim(str_replace("//","",$fieldObj->desc));
                    $pm->push($fieldObj);
                } else {
                    throw new Exception("proto定义文件格式出错:3 ->".$field);
                }
            }
            return $pm;
        }
        throw new Exception("proto定义文件格式出错:2");
    }
}

class ProtoMessage {
    private $fields = array();
    
    private $name;
    
    public function __construct($name) {
        $this->name = $name;
    }
    
    public function getName() {
        return $this->name;
    }
    
    public function setName($name) {
        $this->name = $name;
    }
    
    public function push(ProtoField $field) {
        array_push($this->fields, $field);
    }
    
    public function getFields() {
        return $this->fields;
    }
}

class ProtoField {
    public $type;
    public $dataType;
    public $name;
    public $unique;
    public $default;
    public $desc;
}