<?php
namespace App\Controllers;

class SignUpController{

    public function index()
    {

        if (isGet()) {
            view("auth/signUp");

        } else {


            global $db;

            $password = $_POST["password"];

            $uppercase = preg_match('@[A-Z]@', $password);
            $lowercase = preg_match('@[a-z]@', $password);
            $number = preg_match('@[0-9]@', $password);
            $specialChars = preg_match('@[^\w]@', $password);

            if (!$uppercase || !$lowercase || !$number || !$specialChars || strlen($password) < 7) {
                errorMsg("Password should be at least 7 characters in length.<br> Password should include at least one upper case letter.<br> Password should contain at least one digit.<br> Password should contain at least one special character.<br>");
                redirect("/signUp");
            } else {

                $db->query("INSERT INTO `users` (`firstName`,`lastName`,`email`,`password`) VALUES (?,?,?,?)", [
                    $_POST['firstName'],
                    $_POST['lastName'],
                    $_POST['email'],
                    $password,
                ]);

                successMsg("Congratulation! Your account has been created");
                redirect("/login");
            }
        }
    }

}

