<?php
function view($name,$array=[]){

    include('App\Views\\'.$name.".php");

}

function isUserLoggedIn(){

    if (isset($_SESSION['user_id'])){
        return true;
    }
    return false;
}

function isGet(){

    return $_SERVER["REQUEST_METHOD"]== "GET";
}

function redirect($url){
    header("location:$url");
    die();
}

function errorMsg($message,$type='error'){
    $_SESSION['error']="<div class='$type' style='color: red; font-weight: bold'>$message</div>";
}

function successMsg($message,$type='success'){
    $_SESSION['success']="<div class='$type' style='color: green; font-weight: bold'>$message</div>";
}

function showMsg(){
    if (isset($_SESSION['error'])){
        echo $_SESSION['error'];
        unset($_SESSION['error']);

    }elseif (isset($_SESSION['success'])){
        echo $_SESSION['success'];
        unset($_SESSION['success']);
    }
}

function getCategories(){
    global $db;
    $categories=$db->query("SELECT * FROM `categories`",[]);
    return $categories;

}

function latestNews(){
    global $db;
    $lastnews=$db->query("SELECT * FROM `news` ORDER BY `id` DESC LIMIT 4",[]);
    return $lastnews;
}

function topPosts(){
    global $db;
    $topPoSt=$db->query("SELECT * FROM `news` ORDER BY `views` DESC LIMIT 3",[]);
    return $topPoSt;
}

function newsByCat($id){
    global $db;

    $news=$db->query("SELECT * FROM `news` WHERE `category_id`=? ORDER BY `id` DESC LIMIT 4",[
        $id
    ]);
    return $news;
}

function relatedPosts($id){
    global $db;

    $currentNews=$db->query('SELECT * FROM `news` WHERE `id`=?',[
        $id
    ])->fetch();

    $relatedPost=$db->query("SELECT * FROM `news` WHERE `category_id`=? AND `id`!= ? ORDER BY RAND() LIMIT 3",[
        $currentNews['category_id'],
        $id
    ]);

    return $relatedPost;
}

function catLatestNews(){
    global $db;
    $catLastnews=$db->query("SELECT * FROM `news` ORDER BY `id` DESC LIMIT 3",[]);
    return $catLastnews;
}

function get_client_ip() {
    $ipaddress = '';
    if (isset($_SERVER['HTTP_CLIENT_IP']))
        $ipaddress = $_SERVER['HTTP_CLIENT_IP'];
    else if(isset($_SERVER['HTTP_X_FORWARDED_FOR']))
        $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
    else if(isset($_SERVER['HTTP_X_FORWARDED']))
        $ipaddress = $_SERVER['HTTP_X_FORWARDED'];
    else if(isset($_SERVER['HTTP_FORWARDED_FOR']))
        $ipaddress = $_SERVER['HTTP_FORWARDED_FOR'];
    else if(isset($_SERVER['HTTP_FORWARDED']))
        $ipaddress = $_SERVER['HTTP_FORWARDED'];
    else if(isset($_SERVER['REMOTE_ADDR']))
        $ipaddress = $_SERVER['REMOTE_ADDR'];
    else
        $ipaddress = 'UNKNOWN';
    return $ipaddress;
}

function getStatistics(){
    $ip=get_client_ip();
    $actual_link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
    global $db;
    $return=$db->query("INSERT INTO `statistics` (`ip`,`uri`) VALUES (?,?)",[
        $ip,
        $actual_link
    ]);
    return $return;
}

function catRand(){
    global $db;
    $banners=$db->query("SELECT * FROM `banners`");

    return $banners;
}

function pagination(){
    global $db;
    $pagination=$db->query("SELECT COUNT(*) as number FROM `news`")->fetch();

    return $pagination;
}
