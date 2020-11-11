<?php
class Controller{
    protected function loadView($viewName,$data=[],$path=""){
        if($path==""){
            if(!file_exists("views/".$viewName.".php")){
                error404();
            }
            extract($data);
            require "views/".$viewName.".php";
        }else{
            if(!file_exists("views/".$path."/".$viewName.".php")){
                error404();
            }
            extract($data);
            require "views/".$path."/".$viewName.".php";
        }
        
    }
    protected function loadModel($modelName){
        $modelName.="Model";
        if(!file_exists("models/".$modelName.".php")){
            error404();
        }
        require "models/".$modelName.".php";
        $this->$modelName=new $modelName();
    }
}