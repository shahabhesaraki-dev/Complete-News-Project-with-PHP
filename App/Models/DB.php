<?php
namespace App\Models;

class DB {

    public $pdo;

    public function __construct($host,$username,$password,$db_name)
    {
        $this->pdo = new \PDO("mysql:host=$host;charset=utf8;dbname=$db_name;","$username","$password");
    }


    public function query($sqlCommand,$variableArray=[]){
        $sqlObject = $this->pdo->prepare($sqlCommand);
        $sqlObject->execute($variableArray);
        return $sqlObject;
    }


}