<?php
class Request{
    public $controller='homeController';
    public $module='index';
    public function __construct()
    {
        $this->getUrlParams();
    }
    public function get($name){
        return $_GET[$name] ?? null;
    }
    public function post($name){
        return $_POST[$name] ?? null;
    }
    private function getUrlParams(){
        if($this->get('controller') !=null){
            $this->controller=$this->get('controller')."Controller";
        }
        if($this->get('module') !=null){
            $this->module=$this->get('module');
        }
    }
}