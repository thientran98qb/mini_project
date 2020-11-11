<?php
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
// if($controllerName=="adminController" && !isset($_SESSION['islogin'])){
//     require("controllers/adminController.php");

//     $controller=new adminController();
//     if(! method_exists($controller,'login')){
//         error404();
//     }
//     $controller->login();
// }else{
//     require('controllers/'.$controllerName.".php");

//     $controller=new $controllerName();
    
//     if(! method_exists($controller,$moduleName)){
//         error404();
//     }
//     $controller->$moduleName();
// }
require('controllers/'.$controllerName.".php");

    $controller=new $controllerName();
    
    if(! method_exists($controller,$moduleName)){
        error404();
    }
    $controller->$moduleName();
