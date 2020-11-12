<?php
session_start();
 require "./config/config.php";
 //index.php?controller=post&module=show
 require "./core/functions.php";

$autoload=[
    'Controller','Model','Request'
];
foreach($autoload as $value){
    require "./core/".$value.".php";
}

$request=new Request();
$controllerName =$request->controller;
$moduleName=$request->module;
if(! file_exists('controllers/'.$controllerName.".php")){
    error404();
}

require('controllers/'.$controllerName.".php");
$controller=new $controllerName();

if(! method_exists($controller,$moduleName)){
    error404();
}
$controller->$moduleName();
if($controllerName=="adminController" && $moduleName!='login' && $moduleName!='processLogin' && !isset($_SESSION['isLogin'])&& !isset($_COOKIE['login'])){
    header("Location: .?controller=admin&module=login");
}