<?php
namespace App\Controllers;

class ContactController {

    public function index(){

        global $db;
        if (isGet()){
            $contact=$db->query("SELECT * FROM `contact`",[])->fetch();

            view("contact/index",compact("contact"));
        }else{
            $db->query("INSERT INTO `messages` (`message`,`name`,`email`) VALUES (?,?,?)",[
                $_POST['message'],
                $_POST['name'],
                $_POST['email'],
            ]);
            successMsg("Thanks. Your message has been sent");
            redirect("/contact/index");
        }
    }

    public function list(){

        global $db;
        $contact=$db->query("SELECT * FROM `contact`",[])->fetch();

        view("contact/list",compact("contact"));
    }

    public function edit($id){
        global $db;

        if (isGet()){
            $contact=$db->query("SELECT * FROM `contact` WHERE `id`=?",[
                $id
            ])->fetch();

            view("contact/edit",compact("contact"));
        }else{
            if (isset($_POST["submit"])) {
                $error = false;

                if (!isset($_POST['address']) || empty($_POST['address'])) {
                    $error = true;
                }
                if (!isset($_POST['postal_code']) || empty($_POST['postal_code'])) {
                    $error = true;
                }
                if (!isset($_POST['number']) || empty($_POST['number'])) {
                    $error = true;
                }
                if (!isset($_POST['days']) || empty($_POST['days'])) {
                    $error = true;
                }
                if (!isset($_POST['email']) || empty($_POST['email'])) {
                    $error = true;
                }
                if (!isset($_POST['description']) || empty($_POST['description'])) {
                    $error = true;
                }

                if ($error == false) {
                    $timezone  = -5;
                    $db->query("UPDATE `contact` SET `address`=? , `postal_code`=? , `number`=? , `days`=? , `email`=? , `description`=? , `updated_at` = ? where `id`=?", [
                        $_POST['address'],
                        $_POST['postal_code'],
                        $_POST['number'],
                        $_POST['days'],
                        $_POST['email'],
                        $_POST['description'],
                        gmdate("Y/m/j H:i:s", time() + 3600*($timezone+date("I"))),
                        $id
                    ]);
                    successMsg("Contact successfully updated");
                    redirect("/contact/list");
                } else {
                    errorMsg("All the gaps should be filled");
                    redirect("/contact/edit/$id");

                }
            }

        }
    }
}
