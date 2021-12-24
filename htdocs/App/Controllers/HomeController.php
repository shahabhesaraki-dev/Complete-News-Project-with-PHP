<?php
namespace App\Controllers;

class HomeController {

    public function index(){
        global $db;

        if (isGet()){
            global $db;
            $news=$db->query("SELECT * FROM `news` ORDER BY `id` DESC LIMIT 8");
            view("index",compact("news"));

        }else{

            $db->query("INSERT INTO `subscribes` (`email`) VALUES (?)",[
                $_POST['email']
            ]);
            successMsg("Thanks. Your email successfully added");
            redirect("/home");
        }

    }

}
