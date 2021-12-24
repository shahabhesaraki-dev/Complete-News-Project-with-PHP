<?php
namespace App\Controllers;

class UserController {

    public function index(){

        global $db;
        $users=$db->query("SELECT * FROM `users`",[]);
        view("users/index",compact("users"));
    }

    public function create(){
        if (isGet()){

            view("users/create");
        }else {

            global $db;

            $password = $_POST["password"];

            $uppercase = preg_match('@[A-Z]@', $password);
            $lowercase = preg_match('@[a-z]@', $password);
            $number = preg_match('@[0-9]@', $password);
            $specialChars = preg_match('@[^\w]@', $password);

            if (!$uppercase || !$lowercase || !$number || !$specialChars || strlen($password) < 7) {
                errorMsg("Password should be at least 7 characters in length.<br> Password should include at least one upper case letter.<br> Password should contain at least one digit.<br> Password should contain at least one special character.<br>");
                redirect("/users/create");
            } else {

                $db->query("INSERT INTO `users` (`firstName`,`lastName`,`email`,`password`) VALUES (?,?,?,?)", [
                    $_POST['firstName'],
                    $_POST['lastName'],
                    $_POST['email'],
                    $password,
                ]);

                successMsg("User has been successfully added");
                redirect("/users/index");
            }

        }
    }

    public function delete($id){

        global $db;
        $db->query("DELETE FROM `users` WHERE `id`=?",[
            $id
        ]);
        redirect("/users/index");
    }

    public function admin(){
        if (isGet()){

            view("users/admin");
        }else {

            global $db;

            $password = $_POST["password"];

            $uppercase = preg_match('@[A-Z]@', $password);
            $lowercase = preg_match('@[a-z]@', $password);
            $number = preg_match('@[0-9]@', $password);
            $specialChars = preg_match('@[^\w]@', $password);

            if (!$uppercase || !$lowercase || !$number || !$specialChars || strlen($password) < 7) {
                errorMsg("Password should be at least 7 characters in length.<br> Password should include at least one upper case letter.<br> Password should contain at least one digit.<br> Password should contain at least one special character.<br>");
                redirect("/users/admin");
            } else {

                $db->query("INSERT INTO `users` (`firstName`,`lastName`,`email`,`password`,`admin`) VALUES (?,?,?,?,?)", [
                    $_POST['firstName'],
                    $_POST['lastName'],
                    $_POST['email'],
                    $password,
                    1
                ]);

                successMsg("Admin has been successfully added");
                redirect("/users/index");
            }

        }
    }
}