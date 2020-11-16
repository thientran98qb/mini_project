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
     /*======================Process Category CRUD================*/
    function displaycategory(){
        $category=$this->AdminModel->getAllCategory();
        $this->loadView('list_category',['category'=>$category],'admin/category');
    }
    function addCategroy(){
        $idCategory=$_POST['category_id'];
        $nameCategory=isset($_POST['category_name']) ? $_POST['category_name'] : '';
        $status=isset($_POST['status']) ? 1 : 0;
        $parent_id=isset($_POST['category-root']) ? $_POST['category-root'] :'';
        $data=[
            'category_name'=>$nameCategory,
            'status'=>$status,
            'parent_id'=>$parent_id
        ];
        if($idCategory!=''){
            $this->AdminModel->updateCate($data,$idCategory);
        }else{
            $row=$this->AdminModel->adddataCategory($data);
        }
        echo json_encode(['flag'=>true]); 
    }
    function changeStatusCategory(){
        $idCatee= $_GET['id'];
        $status=$_GET['tt'];
        $this->AdminModel->updateCategoryy($status,$idCatee);
        echo json_encode(['update'=>"Update Status Successfully"]);
    }
    function viewCategoryAjax(){
        $category=$this->AdminModel->getAllCategory();
        echo json_encode(['category'=>$category]);
    }
    function viewDetailCategory(){
        $id=$_GET['id'];
        $row=$this->AdminModel->getDetailCategory($id);
        echo json_encode(['row'=>$row,'id'=>$id]);
    }
    function deleteCategoryy(){
        $id=$_GET['idCate'];
        $flag=$this->AdminModel->deleteCategory($id);
        echo json_encode(['delete'=>$flag]);
    }
    function showProductbyCategory(){
        $cateId=$_GET['category_id'];
        $products=$this->AdminModel->showAllProductCategory($cateId);
        $this->loadView('product_category',['products'=>$products],'admin/category');
    }
    /*========================END Category=============================== */
    /* ====================== Process Product ============================ */
    function displayproduct(){
        $products=$this->AdminModel->showAllProduct();
        $this->loadView('list_product',['products'=>$products],'admin/products');
    }
    function addViewProduct(){
        $category=$this->AdminModel->getAllCategory();
        $this->loadView('add_product',['category'=>$category],'admin/products');
    }
    function processAddProduct(){
        global $error,$alert,$product_name,$product_price,$product_price_sale,$product_desc,$product_content;
        //B1 Validation data
        //B2 Process File 
        //B3 Write Model Process Insert Data
        if(isset($_POST['btn_submit'])){
            $error=array();
            if(empty($_POST['product_name'])){
                $error['product_name']="Product name not empty";
            }else{
                $product_name=$_POST['product_name'];
            }
            if(empty($_POST['product_desc'])){
                $error['product_desc']="Product Desc not empty";
            }else{
                $product_desc=$_POST['product_desc'];
            }
            if(empty($_POST['product_content'])){
                $error['product_content']="Product content not empty";
            }else{
                $product_content=$_POST['product_content'];
            }
            if(empty($_POST['product_price'])){
                $error['product_price']="Product price not empty";
            }else{
                $product_price=$_POST['product_price'];
            }
            if(empty($_POST['product_price_sale'])){
                $error['product_price_sale']="Product price sale not empty";
            }else{
                $product_price_sale=$_POST['product_price_sale'];
            }
            $product_file=processFile('productimg');
            if(!empty($error)){
                $this->loadView('add_product',['error'=>$error],'admin/products');
            }else{
                date_default_timezone_set('Asia/Ho_Chi_Minh');
                $date = date('Y-m-d h:i:s', time());
                $arr=[
                    'product_name'=>$product_name,
                    'product_img'=>$product_file,
                    'product_content'=>$product_content,
                    'product_description'=>$product_desc,
                    'product_date_created'=>$date,
                    'product_price'=>$product_price,
                    'product_status'=>$_POST['product_status'],
                    'product_sale_price'=>$product_price_sale,
                    'category_id'=>$_POST['product_cate']
                ];
                $flag=$this->AdminModel->insertProduct($arr);
                if($flag>0){
                    $alert['success']="Insert Product Successfully";
                    header("Location: .?controller=admin&module=displayproduct");
                }else{
                    $alert['error']="Insert Product Defeat";
                }
            }
        }
    }
    /* ====================== End Product ============================ */
}