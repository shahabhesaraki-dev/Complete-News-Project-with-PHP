<?php
namespace App;

class Router {

    public $routes = [];
    public $addressArray = [];
    public $adminAccessOnly = [
        "edit",
        "delete",
        "create",
        "admin"
    ];
    public $isAdmin=false;


    public function __construct($parameter)
    {
        $address = key($parameter);
        $address = ltrim($address,"/");
        $this->addressArray = explode("/",$address);
        if(isset($_SESSION['IsAdmin'])){
            $this->isAdmin = true;
        }
    }


    public function dispatch(){

        if( empty($this->addressArray[0]) ){
            $this->addressArray = [
                "home",
                "index",
            ];
        }else if( !isset( $this->routes[ $this->addressArray[0] ] ) ){
            view("index");
            die();
        }

        $controllerName = $this->routes[ $this->addressArray[0] ];

        if(isset($this->addressArray[1]) && !empty($this->addressArray[1])){
            $methodName = $this->addressArray[1];
        }else{
            $methodName = "index";
        }

        if( in_array($methodName,$this->adminAccessOnly) || $this->addressArray[0] == 'dashboard'){
            if(!$this->isAdmin){
                view("index");
                die();
            }
        }

        $className = 'App\Controllers\\'.$controllerName;
        if(isset($this->addressArray[2])){
            $id = $this->addressArray[2];
        }else{
            $id=null;
        }
        include($className.".php");
        $obj = new $className();
        $obj->$methodName($id);
    }




}