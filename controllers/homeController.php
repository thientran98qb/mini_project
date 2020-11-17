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
}