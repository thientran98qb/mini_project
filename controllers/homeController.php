<?php
class homeController extends Controller{

    public function index(){
        $this->loadView('index',['thien'=>'deptrai']);
        // $this->loadModel('Home');
        // $tesst=$this->HomeModel->addUser();
        // print_r($tesst);
    }
}