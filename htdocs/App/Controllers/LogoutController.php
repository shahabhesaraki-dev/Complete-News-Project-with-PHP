<?php
namespace App\Controllers;

class LogoutController {

    public function index(){
        unset($_SESSION['userLogin']);
        unset($_SESSION['IsAdmin']);
        redirect("/home");

    }
}
