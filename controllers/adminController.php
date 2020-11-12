<?php
class adminController extends Controller{
    function __construct()
    {
        $this->loadLib('validation');
        $this->loadModel('Admin');
    }
    function login(){
        $this->loadView('login',[],'admin');
    }
    function processLogin(){
        global $username,$password,$error;
        if(isset($_POST['submitLogin'])){
            $error=array();
            if(!isset($_POST['username'])){
                $error['error_username']="Username not valid";
            }else{
                if(empty($_POST['username'])){
                    $error['error_username']="Username is empty";
                }else{
                    //check username valid
                    if(!check_username($_POST['username'])){
                        $error['error_username']='Username start UpperCase and [6-31] characters'; 
                    }else{
                        $username=$_POST['username'];
                    }
                }
            }
            if(!isset($_POST['password'])){
                $error['error_password']="Password not valid";
            }else{
                if(empty($_POST['password'])){
                    $error['error_password']="Password is empty";
                }else{
                    //check password 
                    if(!check_password($_POST['password'])){
                        $error['error_password']='Password at least 6 characters and at least 1 letter'; 
                    }else{
                        $password=md5($_POST['password']);
                    }
                }
            }
            if(!empty($error)){
                $this->loadView('login',['error'=>$error],'admin');
            }else{
                $userLogin=$this->AdminModel->checkUser($username,$password);
                if($userLogin>0){
                    if(isset($_POST['remember'])){
                        $fullname_login=$this->AdminModel->getUserLogin($userLogin);
                        setcookie('login',$fullname_login['user_fullname'],time()+60,'/');
                        unset($_SESSION['fullname']);
                    }
                    $fullname_login=$this->AdminModel->getUserLogin($userLogin);
                    $_SESSION['isLogin']=true;
                    $_SESSION['fullname']=$fullname_login['user_fullname'];
                    header("Location: .?controller=admin&module=home");             
                }else{
                    $error['login_error']="Username or Password not match";
                    $this->loadView('login',['error'=>$error],'admin');
                }
            }
        } 
    }
    function logout(){
        unset($_SESSION['isLogin']);
        unset($_SESSION['fullname']);
        header("Location: .?controller=admin&module=login");
    }
    function home(){
        $this->loadView('home',[],'admin');
    }
    function displayproduct(){
        $this->loadView('list_product',[],'admin/products');
    }
    function displaycategory(){
        $category=$this->AdminModel->getAllCategory();
        $this->loadView('list_category',['category'=>$category],'admin/category');
    }
    /*======================Process Manager CRUD================*/
    function addCategroy(){
        $nameCategory=isset($_POST['category_name']) ? $_POST['category_name'] : '';
        $status=isset($_POST['status']) ? 0 : 1;
        $parent_id=isset($_POST['category-root']) ? $_POST['category-root'] :'';
        $data=[
            'category_name'=>$nameCategory,
            'status'=>$status,
            'parent_id'=>$parent_id
        ];
        $row=$this->AdminModel->adddataCategory($data);
        if($row>0){
            echo json_encode(['success'=>'Thanh Cong']);
        }else{
            echo json_encode(['failure'=>'That Bai']);
        }
        
    }
}