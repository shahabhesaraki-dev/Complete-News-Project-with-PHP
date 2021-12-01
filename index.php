<?php
session_start();
define('ROOT',dirname(__FILE__));
include("App\Models\DB.php");
global $db;
$db=new \App\Models\DB("localhost","root","","w84php_news");
include('App\functions.php');
getStatistics();
include('routes.php');
include("App\Router.php");
$router=new App\Router($_GET);
$router->routes = $routes;
$router->dispatch();
