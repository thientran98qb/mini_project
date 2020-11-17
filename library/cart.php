<?php
function totalCart(){
    if(isset($_SESSION['cart'])){
        $_SESSION['cart']['total_cart']['total_quantity']=0;
        $_SESSION['cart']['total_cart']['total']=0;
        foreach ($_SESSION['cart']['product'] as  $values) {
            $_SESSION['cart']['total_cart']['total_quantity']=$_SESSION['cart']['total_cart']['total_quantity'] + $values['quantity'];
            $_SESSION['cart']['total_cart']['total']=$_SESSION['cart']['total_cart']['total'] + $values['total_price_product'];
        }
    }    
}