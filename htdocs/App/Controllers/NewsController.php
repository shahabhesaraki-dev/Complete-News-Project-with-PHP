<?php
namespace App\Controllers;

class NewsController {

    public function index($id){
        global $db;

        if(isset($id) && !empty($id) && is_numeric($id) && $id > 0){
            $currentPage = $id;
        }else{
            $currentPage = 1;
        }

        $start = 4*($currentPage-1);

        $news=$db->query("SELECT * FROM `news` ORDER BY `id` DESC LIMIT $start,4");
        $categories=$db->query("Select * FROM `categories`");

        view("/news/index",compact("news","categories","currentPage"));
    }

    public function list(){
        global $db;

        $news=$db->query("SELECT * FROM `news`");
        $categories=$db->query("Select * FROM `categories`");

        view("/news/list",compact("news","categories"));
    }

    public function create(){
        global $db;

        if (isGet()){

            $categories=$db->query("Select * FROM `categories`");

            view("/news/create",compact("categories"));
        }else{
            if (isset($_POST['submit'])){
                $error=false;
                $message=[];

                if (!isset($_POST['title']) || empty($_POST['title'])){
                    $error=true;
                    $message=["Title is required"];
                }
                if (!isset($_POST['summary']) || empty($_POST['summary'])){
                    $error=true;
                    $message=["Summary is required"];
                }
                if (!isset($_POST['content']) || empty($_POST['content'])){
                    $error=true;
                    $message=["Content is required"];
                }
                if (!isset($_FILES['image']) || empty($_FILES['image'])) {
                    $error=true;
                    $message=["Image is required"];
                }

                if (isset($_FILES['image']) || !empty($_FILES['image'])) {

                    $originalFormat=$_FILES['image']['type'];
                    $exp=explode("/",$originalFormat);
                    $format=end($exp);

                    if ($format != 'jpeg' && $format !=  'jpg' &&  $format !=  'png' && $format != 'gif' ){
                        $error=true;
                        $message=["Image format must be (jpeg,png,jpg,gif)"];
                    }

                }

                if (!isset($_POST['category_id']) || empty($_POST['category_id'])){
                    $error=true;
                    $message=["Category is required"];
                }

                if ($error==false){

                        $originalName = $_FILES['image']['name'];
                        $exp = explode(".", $originalName);
                        $format = end($exp);
                        $imageName = md5(rand(1,1000).time().microtime()).".".$format;
                        move_uploaded_file($_FILES['image']['tmp_name'], ROOT . "/uploads/" . $imageName);

                    $db->query("INSERT INTO `news` (`title`,`summary`,`content`,`image`,`category_id`) VALUES (?,?,?,?,?)",[
                        $_POST['title'],
                        $_POST['summary'],
                        $_POST['content'],
                        $imageName,
                        $_POST['category_id'],
                    ]);

                    successMsg("news successfully added");
                    redirect("/news/list");
                }else{
                        errorMsg("News didn't create");
                        redirect("/news/create");
                }
            }
        }
    }

    public function edit($id){
        global $db;

        if (isGet()){

            $categories=$db->query("Select * FROM `categories`");
            $news=$db->query("SELECT * FROM `news` WHERE `id`=?",[
                $id
            ])->fetch();

            view("/news/edit",compact("categories","news"));
        }else{
            if (isset($_POST['submit'])){
                $error=false;
                $message=[];

                if (!isset($_POST['title']) || empty($_POST['title'])){
                    $error=true;
                    $message=["Title is required"];
                }
                if (!isset($_POST['summary']) || empty($_POST['summary'])){
                    $error=true;
                    $message=["Summary is required"];
                }
                if (!isset($_POST['content']) || empty($_POST['content'])){
                    $error=true;
                    $message=["Content is required"];
                }

                if (!isset($_POST['category_id']) || empty($_POST['category_id'])){
                    $error=true;
                    $message=["Category is required"];
                }


                if (isset($_FILES['image']['name']) && !empty($_FILES['image']['name'])) {
                    $originalFormat=$_FILES['image']['type'];
                    $exp=explode("/",$originalFormat);
                    $format=end($exp);

                    if ($format != 'jpeg' && $format !=  'jpg' &&  $format !=  'png' && $format != 'gif' ){
                        $error=true;
                        $message=["Image format must be (jpeg,png,jpg,gif)"];
                    }
                }

                if ($error==false) {

                    if (isset($_FILES['image']['name']) && !empty($_FILES['image']['name'])) {

                        $result = $db->query("SELECT `image` FROM `news` WHERE `id`=?", [
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
                        $db->query("UPDATE `news` SET `title`=?,`summary`=? ,`content`=? ,`image`=? ,`category_id`=?,`updated_at`=? WHERE `id`=?", [
                            $_POST['title'],
                            $_POST['summary'],
                            $_POST['content'],
                            $imageName,
                            $_POST['category_id'],
                            gmdate("Y/m/j H:i:s", time() + 3600*($timezone+date("I"))),
                            $id

                        ]);

                        successMsg("news successfully Updated");
                        redirect("/news/list");

                    }else{

                        $timezone  = -5;
                        $db->query("UPDATE `news` SET `title`=?,`summary`=? ,`content`=? , `category_id`=?,`updated_at`=? WHERE `id`=?", [
                            $_POST['title'],
                            $_POST['summary'],
                            $_POST['content'],
                            $_POST['category_id'],
                            gmdate("Y/m/j H:i:s", time() + 3600*($timezone+date("I"))),
                            $id

                        ]);

                        successMsg("news successfully Updated");
                        redirect("/news/list");
                    }
            }else{
                    errorMsg("News didn't Update");
                    redirect("/news/list");

                }
            }
        }
    }

    public function delete($id){

        global $db;

        $result=$db->query("SELECT `image` FROM `news` WHERE `id`=?",[
            $id
        ])->fetch();

        if (file_exists(ROOT."/uploads/".$result['image'])){
            unlink(ROOT."/uploads/".$result['image']);
        }

        $db->query("DELETE FROM `news` WHERE `id`=?",[
           $id
        ]);
        redirect("/news/index");
    }

    public function show($id){
        global $db;
        $news=$db->query("SELECT * FROM `news` WHERE `id`=?",[
            $id
        ])->fetch();

        $db->query("UPDATE `news` set `views`=? WHERE `id`=?",[
            $news['views']+1,
            $id
        ]);

        $comments=$db->query("SELECT * FROM `comments` WHERE `news_id`=? AND `adminAccept`=?",[
            $id,
            1
        ]);

        view("/news/show",compact("news","comments"));

        if (!isGet()){
            global $db;
            $db->query("INSERT INTO `comments` (`name`,`email`,`message`,`news_id`) VALUES (?,?,?,?)",[
                $_POST['name'],
                $_POST['email'],
                $_POST['message'],
                $id
            ]);
            successMsg("Thanks. Your message has been successfully sent");
            redirect("news/show/$id");
        }
    }

}