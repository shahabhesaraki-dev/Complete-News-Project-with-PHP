<?php
namespace App\Controllers;

class CategoryController {

    public function index(){

        global $db;
        $categories=$db->query("SELECT * FROM `categories`",[]);
        view("categories/index",compact("categories"));

    }

    public function create(){

        if (isGet()){
            view("categories/create");
        }else{
            if (isset($_POST["submit"])) {
                $error = false;
                $message = [];
                global $db;

                if (!isset($_POST['title']) || empty($_POST['title'])) {
                    $error = true;
                    $message = ["Title is required!"];
                }

                if ($error == false) {

                    $db->query("INSERT INTO `categories` (`title`,`description`) VALUES (?,?)", [
                        $_POST['title'],
                        $_POST['description']
                    ]);
                    successMsg("Category successfully added");
                    redirect("/categories/index");
                } else {

                    view("/categories/create", compact("message"));

                }
            }

        }

    }

    public function edit($id){
        global $db;

        if (isGet()){
            $categories=$db->query("SELECT * FROM `categories` WHERE `id`=?",[
                $id
            ])->fetch();

            view("categories/edit",compact("categories"));
        }else{
            if (isset($_POST["submit"])) {
                $error = false;
                $message = [];

                if (!isset($_POST['title']) || empty($_POST['title'])) {
                    $error = true;
                    $message = ["Title is required!"];
                }

                if ($error == false) {
                    $timezone  = -5;
                    $db->query("UPDATE `categories` SET `title`=? , `description`=? , `updated_at` = ? where `id`=?", [
                        $_POST['title'],
                        $_POST['description'],
                        gmdate("Y/m/j H:i:s", time() + 3600*($timezone+date("I"))),
                        $id
                    ]);
                    successMsg("Category successfully updated");
                    redirect("/categories/index");
                } else {

                    view("/categories/edit", compact("message"));

                }
            }

        }

    }

    public function delete($id){
        global $db;
        $db->query("DELETE FROM `categories` WHERE `id`=?",[
            $id
        ]);
        successMsg("Category successfully removed");
        redirect("/categories/index");
    }

    public function show($id){

        global $db;

        $get=key($_GET);
        $exp=explode("/",$get);
        $page=$exp[4];

        if(isset($page) && !empty($page) && is_numeric($page) && $page > 0){
            $currentPage = $page;
        }else{
            $currentPage = 1;
        }

        $start = 4*($currentPage-1);

        $news = $db->query("SELECT * FROM `news` WHERE `category_id`=? ORDER BY `id` DESC LIMIT $start,4", [
            $id
        ]);

        $category=$id;

         view("/categories/show", compact("news","currentPage","category"));
    }


}