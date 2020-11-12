<?php
    function put_value($field_name){
        global $$field_name;
        if(!empty($$field_name))
            return $$field_name;
    }
    function put_error($name_error){
        global $error;
        if(isset($error[$name_error])){
            return $error[$name_error];
        }
    }
    function check_username($username){
        if(!preg_match('/^[A-Za-z]{1}[A-Za-z0-9]{5,31}$/', $username)){
            return false;
        }else{
            return true;
        }
    }
    function check_password($pass){
        if(!preg_match('/^[A-Za-z]{1}[A-Za-z0-9]{6,31}$/', $pass)){
            return false;
        }else{
            return true;
        }
    }
