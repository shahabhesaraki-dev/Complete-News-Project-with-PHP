<?php
namespace App\Controllers;

class MessageController{

    public function index(){
        global $db;
        $messages=$db->query("SELECT * FROM `messages`");
        view("messages",compact("messages"));
    }

    public function delete($id){

        global $db;
        $db->query("DELETE FROM `messages` WHERE `id`=?",[
            $id
        ]);

        successMsg("Message has been removed");
        redirect("/messages");

    }
}
