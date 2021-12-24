<?php
namespace App\Controllers;

class CommentsController {

    public function index(){

        global $db;
        $comments=$db->query("SELECT * FROM `comments`",[]);
        view("comments/index",compact("comments"));

    }

    public function edit($id){
        global $db;

        if (isGet()){
            $comments=$db->query("SELECT * FROM `comments` WHERE `id`=?",[
                $id
            ])->fetch();

            view("comments/edit",compact("comments"));
        }else{
            if (isset($_POST["submit"])) {
                $error = false;
                $message = [];

                if (!isset($_POST['name']) || empty($_POST['name'])) {
                    $error = true;
                    $message = ["Name is required!"];
                }
                if (!isset($_POST['message']) || empty($_POST['message'])) {
                    $error = true;
                    $message = ["Message is required!"];
                }

                if ($error == false) {
                    if (isset($_POST['answer'])){
                        $timezone  = -5;
                        $db->query("UPDATE `comments` SET `name`=? , `message`=? , `answer`=? , `adminAccept`=? , `updated_at` = ? where `id`=?", [
                            $_POST['name'],
                            $_POST['message'],
                            $_POST['answer'],
                            $_POST['adminAccept'],
                            gmdate("Y/m/j H:i:s", time() + 3600*($timezone+date("I"))),
                            $id
                        ]);
                        successMsg("Comment successfully updated");
                        redirect("/comments/index");
                    }else{
                        $timezone  = -5;
                        $db->query("UPDATE `comments` SET `name`=? , `message`=? , `adminAccept`=? , `updated_at` = ? where `id`=?", [
                            $_POST['name'],
                            $_POST['message'],
                            $_POST['adminAccept'],
                            gmdate("Y/m/j H:i:s", time() + 3600*($timezone+date("I"))),
                            $id
                        ]);
                        successMsg("Comment successfully updated");
                        redirect("/comments/index");
                    }
                } else {
                    errorMsg("Attempt failed (Name and Message are required)");
                    redirect("/comments/edit/$id");

                }
            }

        }

    }

    public function delete($id){

        global $db;
        $db->query("DELETE FROM `comments` WHERE `id`=?",[
            $id
        ]);
        successMsg("Comment successfully removed");
        redirect("/comments/index");
    }
}
