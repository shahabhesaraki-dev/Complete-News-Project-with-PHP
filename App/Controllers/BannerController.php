<?php
namespace App\Controllers;

class BannerController{

    public function index(){

        global $db;
        $banners=$db->query("SELECT * FROM `banners`");
        $categories=$db->query("Select * FROM `categories`");

        view("/banners/index",compact("banners","categories"));
    }

    public function create(){
        global $db;

        if (isGet()){

            $categories=$db->query("Select * FROM `categories`");

            view("/banners/create",compact("categories"));

        }else{
            if (isset($_POST['submit'])){
                $error=false;

                if (!isset($_POST['title']) || empty($_POST['title'])){
                    $error=true;
                }

                if (!isset($_POST['category_id']) || empty($_POST['category_id'])){
                    $error=true;
                }

                if (!isset($_FILES['image']) || empty($_FILES['image'])) {
                    $error=true;
                }

                if (isset($_FILES['image']) || !empty($_FILES['image'])) {

                    $originalFormat=$_FILES['image']['type'];
                    $exp=explode("/",$originalFormat);
                    $format=end($exp);

                    if ($format != 'jpeg' && $format !=  'jpg' &&  $format !=  'png' && $format != 'gif' ){
                        $error=true;
                    }

                }

                if ($error==false){

                    $originalName = $_FILES['image']['name'];
                    $exp = explode(".", $originalName);
                    $format = end($exp);
                    $imageName = md5(rand(1,1000).time().microtime()).".".$format;
                    move_uploaded_file($_FILES['image']['tmp_name'], ROOT . "/uploads/" . $imageName);

                    $db->query("INSERT INTO `banners` (`title`,`image`,`category_id`) VALUES (?,?,?)",[
                        $_POST['title'],
                        $imageName,
                        $_POST['category_id'],
                    ]);

                    successMsg("Banner successfully added");
                    redirect("/banners/index");
                }else{
                    errorMsg("Image and Title are required. Image format must be (jpeg,png,jpg,gif)");
                    redirect("/banners/create");
                }
            }
        }
    }

    public function edit($id){
        global $db;

        if (isGet()){
            $categories=$db->query("Select * FROM `categories`");
            $banners=$db->query("SELECT * FROM `banners` WHERE `id`=?",[
                $id
            ])->fetch();

            view("/banners/edit",compact("banners","categories"));
        }else{
            if (isset($_POST['submit'])){
                $error=false;

                if (!isset($_POST['title']) || empty($_POST['title'])){
                    $error=true;
                }

                if (!isset($_POST['category_id']) || empty($_POST['category_id'])){
                    $error=true;
                }

                if (isset($_FILES['image']['name']) && !empty($_FILES['image']['name'])) {
                    $originalFormat=$_FILES['image']['type'];
                    $exp=explode("/",$originalFormat);
                    $format=end($exp);

                    if ($format != 'jpeg' && $format !=  'jpg' &&  $format !=  'png' && $format != 'gif' ){
                        $error=true;
                    }
                }

                if ($error==false) {

                    if (isset($_FILES['image']['name']) && !empty($_FILES['image']['name'])) {

                        $result = $db->query("SELECT `image` FROM `banners` WHERE `id`=?", [
                            $id
                        ])->fetch();

                        if (file_exists(ROOT . '/uploads/' . $result['image'])) {
                            unlink(ROOT . '/uploads/' . $result['image']);
                        }

                        $originalName = $_FILES['image']['name'];
                        $exp = explode(".", $originalName);
                        $format = end($exp);
                        $imageName = md5(rand(1, 1000) . time() . microtime()) . "." . $format;
                        move_uploaded_file($_FILES['image']['tmp_name'], ROOT . "/uploads/" . $imageName);

                        $timezone  = -5;
                        $db->query("UPDATE `banners` SET `title`=?,`image`=? ,`category_id`=? ,`updated_at`=? WHERE `id`=?", [
                            $_POST['title'],
                            $imageName,
                            $_POST['category_id'],
                            gmdate("Y/m/j H:i:s", time() + 3600*($timezone+date("I"))),
                            $id

                        ]);

                        successMsg("Banner successfully Updated");
                        redirect("/banners/index");

                    }else{

                        $timezone  = -5;
                        $db->query("UPDATE `banners` SET `title`=? ,`category_id`=? ,`updated_at`=? WHERE `id`=?", [
                            $_POST['title'],
                            $_POST['category_id'],
                            gmdate("Y/m/j H:i:s", time() + 3600*($timezone+date("I"))),
                            $id

                        ]);

                        successMsg("banners successfully Updated");
                        redirect("/banners/index");
                    }
                }else{
                    errorMsg("Banners didn't Update. Title is required. Image format must be (jpeg,png,jpg,gif)");
                    redirect("/banners/index");

                }
            }
        }
    }

    public function delete($id){

        global $db;

        $result=$db->query("SELECT `image` FROM `banners` WHERE `id`=?",[
            $id
        ])->fetch();

        if (file_exists(ROOT."/uploads/".$result['image'])){
            unlink(ROOT."/uploads/".$result['image']);
        }

        $db->query("DELETE FROM `banners` WHERE `id`=?",[
            $id
        ]);
        redirect("/banners/index");
    }

}