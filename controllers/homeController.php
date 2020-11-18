<?php
class homeController extends Controller{
    public function __construct()
    {
        $this->loadModel('Home');
        $this->loadLib('validation');
        $this->loadLib('cart');
    }
    public function index(){
        $data=$this->HomeModel->getCategory();
        $this->loadView('index',['data'=>$data]);
    }
    public function detailCategory(){
        $category_id=$_GET['category_id'];
        $current_page=(isset($_GET['page'])) ? $_GET['page'] : 1;
        $product_one_page=10;
        $start=($current_page-1)*$product_one_page;
        $count=$this->HomeModel->countProduct($category_id);
        $total_pagee=ceil($count['pcount']/$product_one_page);
        $productByCategory=$this->HomeModel->getProductbyCategoryPaginate($category_id,$start,$product_one_page);
        $this->loadView('detailCategory',['products'=>$productByCategory,'count'=>$count,'page'=>$current_page,'totalpage'=>$total_pagee,'category_id'=>$category_id]);
    }
    public function detailProduct(){
        $product_id=$_GET['product_id'];
        $product=$this->HomeModel->getProductbyId($product_id);
        $this->loadView('detailProduct',['product'=>$product]);
    }
    public function showCart(){
        if(isset($_SESSION['cart'])){
            $cart=$_SESSION['cart']['product'];
            $total=$_SESSION['cart']['total_cart'];
        }else{
            $cart='';
            $total='';
        }
        $this->loadView('cartProduct',['cart'=>$cart,'total'=>$total]);
    }
    public function processCart(){
        $product_id=isset($_GET['product_id']) ? $_GET['product_id'] : '';
        $product=$this->HomeModel->getProductbyId($product_id);
        if($product['product_sale_price']>0){
            $price=$product['product_sale_price'];
        }else{
            $price=$product['product_price'];
        }
        if(isset($_SESSION['cart']['product']) && array_key_exists($product_id,$_SESSION['cart']['product'])){
            $quantity=$_SESSION['cart']['product'][$product_id]['quantity']+((isset($_GET['number'])) ? $_GET['number'] : 1);
        }else{
            $quantity=(isset($_GET['number'])) ? $_GET['number'] : 1;
        }
        $_SESSION['cart']['product'][$product['product_id']]=array(
                'product_id'=>$product['product_id'],
                'product_name'=>$product['product_name'],
                'product_img'=>$product['product_img'],
                'product_price'=>$price,
                'quantity'=>$quantity,
                'total_price_product'=>$price*$quantity
        );
        totalCart();
        if(isset($_SESSION['cart'])){
            $cart=$_SESSION['cart']['product'];
            $total=$_SESSION['cart']['total_cart'];
        }else{
            $cart='';
            $total='';
        }
        $this->loadView('cartProduct',['cart'=>$cart,'total'=>$total]);
    }
    function deleteCart(){
        if(isset($_SESSION['cart'])){
            unset($_SESSION['cart']);
        }
        header("Location: ?module=showCart");
    }
    function deleteCartbyId(){
        $product_id=$_GET['product_id'];
        if(isset($_SESSION['cart']['product'][$product_id])){
            unset($_SESSION['cart']['product'][$product_id]);
            totalCart();
        }
        header("Location: ?module=showCart");
    }
    function changeNumberAjax(){
        $number=$_GET['numberr'];
        $product_id=$_GET['product_id'];
        $product=$this->HomeModel->getProductbyId($product_id);
        if((isset($_SESSION['cart']['product'])) && $product['product_id']==$product_id){
            $_SESSION['cart']['product'][$product['product_id']]['quantity']=$number;
            if($product['product_sale_price']>0){
                $price=$product['product_sale_price'];
            }else{
                $price=$product['product_price'];
            }
            $total_one_product=$price*$number;
            $_SESSION['cart']['product'][$product['product_id']]['total_price_product']=$total_one_product;
            totalCart();
        }
        $total_product=processPrice($total_one_product,"VND");
        $total_order=processPrice($_SESSION['cart']['total_cart']['total'],'VND');
        $sum=$_SESSION['cart']['total_cart']['total_quantity'];
        echo json_encode(['total_product'=>$total_product,'total_order'=>$total_order,'sum'=>$sum]);
    }
    function checkout(){
        if(isset($_SESSION['cart'])){
            $cart=$_SESSION['cart']['product'];
            $total_cart=$_SESSION['cart']['total_cart'];
        }else{
            $cart='';
        }
        $this->loadView('checkout',['cart'=>$cart,'total_cart'=>$total_cart]);
    }
    function processCheckout(){
        global $error,$fullname,$email,$address,$tel,$note;
        if(isset($_POST['checkout'])){
            $error=array();
            if(empty($_POST['fullname'])){
                $error['error_fullname']="Please enter fullname";
            }else{
                $fullname=$_POST['fullname'];
            }
            if(empty($_POST['email'])){
                $error['error_email']="Please enter email";
            }else{
                $email=$_POST['email'];
            }
            if(empty($_POST['address'])){
                $error['error_address']="Please enter address";
            }else{
                $address=$_POST['address'];
            }
            if(empty($_POST['tel'])){
                $error['error_tel']="Please enter tel";
            }else{
                $tel=$_POST['tel'];
            }
            $note=$_POST['note'];
            $payments=$_POST['payment-method'];
            date_default_timezone_set('Asia/Ho_Chi_Minh');
            $date = date('Y-m-d h:i:s', time());
            if(!empty($error)){
                $this->checkout();
            }else{
                $data=[
                    'customer_name'=>$fullname,
                    'customer_email'=>$email,
                    'customer_address'=>$address,
                    'customer_phone'=>$tel
                ];
                $idInsert=$this->HomeModel->addCustomer($data);
                $idCutomer=(int)$idInsert;
                if($idCutomer>0){
                    if($idCutomer>0){
                        if(isset($_SESSION['cart']) && !empty($_SESSION['cart']['product'])){
                            $total_orders=$_SESSION['cart']['total_cart']['total'];
                        }
                        $dataOrderCustomer=[
                            'customer_id'=>$idCutomer,
                            'note'=>$note,
                            'payments'=>$payments,
                            'total_orders'=>$total_orders
                        ];
                        $idOrderCus=$this->HomeModel->addOrderCustomer($dataOrderCustomer);
                        $idOrderCustomer=(int)$idOrderCus;
                        if($idOrderCustomer>0){
                            if(isset($_SESSION['cart']) && !empty($_SESSION['cart']['product'])){
                                $cart=$_SESSION['cart']['product'];
                                foreach ($cart as $key => $value) {
                                    $dataCartoneProduct=[
                                        'product_id'=>$cart[$key]['product_id'],
                                        'quantity'=>$cart[$key]['quantity'],
                                        'total_price'=>$cart[$key]['total_price_product']
                                    ];
                                    $idInsertOrder=$this->HomeModel->addOrderProduct($dataCartoneProduct);
                                    $idOrder=(int)$idInsertOrder;
                                    if($idOrder>0){
                                        $dataOrders=[
                                            'order_id'=>$idOrder,
                                            'id'=>$idOrderCustomer,
                                            'date_order'=>$date
                                        ];
                                        $idAddOrder=$this->HomeModel->addOrder($dataOrders);
                                        $idOrderss=(bool)$idAddOrder;
                                        if($idOrderss==true){
                                            header("Location: .?controller=home&module=thank");
                                            unset($_SESSION['cart']);
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                }
            }
        }
    }
    function thank(){
        $this->loadView('thank',[]);
    }
}
