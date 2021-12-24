<?php
namespace App\Controllers;

class LoginController {

    public function index(){

        if (isGet()){
            view('auth/login');
        }else{

            global $db;
            $password=md5($_POST['password']);
            $sqlObject=$db->query("SELECT * FROM `users` WHERE `email`=? AND `password`=?",[
                $_POST['email'],
                $password

            ]);

            $result=$sqlObject->fetch();

            if (!$result){
                errorMsg("Login Attempt Failed");
                redirect("/login");
            }else{
               $_SESSION['userLogin']= true;
               $_SESSION['userData']=$result;

               if ($result['admin']==1){

                   $_SESSION['IsAdmin']= true;
                   redirect("dashboard");

               }else{

                   redirect("index");
               }
            }

        }
    }
}