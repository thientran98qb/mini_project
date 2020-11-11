<?php
class adminController extends Controller{
    function login(){
        $this->loadView('login',[],'admin');
    }
    function processLogin(){

        $error=array();
        if(!isset($_POST['username'])){
            $error['error_username']="Username not valid";
        }else{
            if(empty($_POST['username'])){
                $error['error_username']="Username is empty";
            }else{
                $username=$_POST['username'];
            }
        }
        if(!isset($_POST['password'])){
            $error['error_password']="Password not valid";
        }else{
            if(empty($_POST['password'])){
                $error['error_password']="Password is empty";
            }else{
                $password=$_POST['password'];
            }
        }
        if(!empty($error)){
            $this->loadView('login',['error'=>$error],'admin');
        }
    }
    function home(){
        $this->loadView('home',[],'admin');
    }
    function displayproduct(){
        $this->loadView('list_product',[],'admin');
    }
}