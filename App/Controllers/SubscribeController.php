<?php
namespace App\Controllers;

class SubscribeController {

    public function index(){

        global $db;
        $subscribes=$db->query("SELECT * FROM `subscribes`",[]);
        view("subscribes/index",compact("subscribes"));
    }

    public function create(){

        if (isGet()){
            view("subscribes/create");
        }else{
            if (isset($_POST["submit"])) {
                $error = false;
                $message = [];
                global $db;

                if (!isset($_POST['email']) || empty($_POST['email'])) {
                    $error = true;
                    $message = ["Email is required!"];
                }

                if ($error == false) {

                    $db->query("INSERT INTO `subscribes` (`email`) VALUES (?)", [
                        $_POST['email'],
                    ]);
                    successMsg("Email successfully added");
                    redirect("/subscribes/index");
                } else {

                    view("/subscribes/create", compact("message"));

                }
            }

        }

    }

    public function edit($id){
        global $db;

        if (isGet()){
            $subscribes=$db->query("SELECT * FROM `subscribes` WHERE `id`=?",[
                $id
            ])->fetch();

            view("subscribes/edit",compact("subscribes"));
        }else{
            if (isset($_POST["submit"])) {
                $error = false;
                $message = [];

                if (!isset($_POST['email']) || empty($_POST['email'])) {
                    $error = true;
                    $message = ["Email is required!"];
                }

                if ($error == false) {
                    $timezone  = -5;
                    $db->query("UPDATE `subscribes` SET `email`=? , `updated_at` = ? where `id`=?", [
                        $_POST['email'],
                        gmdate("Y/m/j H:i:s", time() + 3600*($timezone+date("I"))),
                        $id
                    ]);
                    successMsg("email successfully updated");
                    redirect("/subscribes/index");
                } else {

                    view("/subscribes/edit", compact("message"));

                }
            }

        }

    }

    public function delete($id){
        global $db;
        $db->query("DELETE FROM `subscribes` WHERE `id`=?",[
            $id
        ]);
        successMsg("Email successfully removed");
        redirect("/subscribes/index");
    }
}