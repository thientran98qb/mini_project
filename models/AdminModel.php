<?php
class AdminModel extends Model{
    public function __construct()
    {
        parent::__construct();
    }
    public function checkUser($username,$password){
        $query="SELECT users.user_id FROM users WHERE user_name=:username AND user_pass=:userpass AND role_id=1";
        $stmt=$this->conn->prepare($query);
        $stmt->bindValue(":username",$username);
        $stmt->bindValue(":userpass",$password);
        $stmt->execute();
        if($stmt->rowCount()>0){
            $row=$stmt->fetch(PDO::FETCH_ASSOC);
            return $row['user_id'];
        }
        return -1;
    }
    public function getUserLogin($user_id){
        $query="SELECT users.user_fullname FROM users WHERE user_id=:userid";
        $stmt=$this->conn->prepare($query);
        $stmt->bindValue(":userid",$user_id);
        $stmt->execute();
        if($stmt->rowCount()>0){
            $row=$stmt->fetch(PDO::FETCH_ASSOC);
        }else{
            $row=[];
        }
        return $row;
    }
    public function getAllCategory(){
        return $this->getAll("SELECT * FROM categories");
    }
    public function adddataCategory($data){
        return $this->add($data,'categories');
    }
    public function updateCategoryy($status,$id){
        $query="UPDATE categories SET status=:statuss WHERE category_id=:id";
        $stmt=$this->conn->prepare($query);
        $stmt->bindValue(":statuss", $status, PDO::PARAM_STR);
        $stmt->bindValue(":id", $id, PDO::PARAM_STR);
        $stmt->execute();
    }
    public function getDetailCategory($id){
        return $this->getById("SELECT * FROM categories WHERE category_id=$id");
    }
    public function deleteCategory($id){
        return $this->delete('categories','category_id',$id);
    }
    public function updateCate($data,$id){
        $this->update($data,'categories','category_id',$id);
    }
    public function showAllProductCategory($cate_id){
        return $this->getAll("SELECT * FROM products INNER JOIN categories ON products.category_id=categories.category_id WHERE products.category_id=$cate_id");
    }
    /* Process Products */
    public function showAllProduct($start,$step){
        return $this->getAll("SELECT * FROM products INNER JOIN categories ON products.category_id=categories.category_id ORDER BY products.product_id DESC LIMIT $start,$step");
    }
    public function insertProduct($data){
        return $this->add($data,'products');
    }
    public function detailProductt($product_id){
        return $this->getById("SELECT * FROM products INNER JOIN categories ON products.category_id=categories.category_id  WHERE products.product_id=$product_id");
    }
    public function deleteProductById($product_id){
        return $this->delete('products','product_id',$product_id);
    }
    public function updateProduct($data,$id){
        $this->update($data,'products','product_id',$id);
    }
    public function countProduct(){
        return $this->getCount("products");
    }
    //process dashboard
    public function getCustomer($start,$step){
        return $this->getAll("SELECT * FROM customers INNER JOIN order_customer ON customers.customer_id=order_customer.customer_id INNER JOIN orderss ON order_customer.id=orderss.id INNER JOIN payments ON payments.payment_id=order_customer.payment_id LIMIT $start,$step");
    }
    public function totalgetCustomer(){
        $stmt=$this->conn->prepare("SELECT * FROM customers INNER JOIN order_customer ON customers.customer_id=order_customer.customer_id INNER JOIN payments ON payments.payment_id=order_customer.payment_id");
        $stmt->execute();
        if($stmt->rowCount() >0 ){
            $count=$stmt->rowCount();
        }else{
            $count=0;
        }
        return $count;
    }
    public function getCustomerbyId($order_id){
        return $this->getById("SELECT order_product.order_id,order_customer.status,order_customer.id,customers.customer_id,customers.customer_name,customers.customer_email,customers.customer_address,order_product.product_id,orderss.date_order,order_customer.total_orders FROM `customers` INNER JOIN order_customer ON customers.customer_id=order_customer.customer_id INNER JOIN orderss ON orderss.id=order_customer.id INNER JOIN order_product ON order_product.order_id=orderss.order_id WHERE orderss.id=$order_id
        ");
    }
    public function getProductbyId($order_id){
        return $this->getAll("SELECT order_product.product_id,order_product.order_id FROM `customers` INNER JOIN order_customer ON customers.customer_id=order_customer.customer_id INNER JOIN orderss ON orderss.id=order_customer.id INNER JOIN order_product ON order_product.order_id=orderss.order_id WHERE orderss.id=$order_id
        ");
    }
    public function getProductbyOrder_id($product_id,$order_id){
        return $this->getById("SELECT * FROM products INNER JOIN order_product ON products.product_id=order_product.product_id WHERE order_product.product_id=$product_id AND order_product.order_id=$order_id");
    }
    public function updateStatus($data,$id){
        $this->update($data,'order_customer','customer_id',$id);
    }
    public function countOrder($status){
        return $this->getById("SELECT COUNT(order_customer.status) as countStatus FROM `order_customer` WHERE order_customer.status=$status");
    }
    public function calVuene(){
        return $this->getById("SELECT SUM(order_customer.total_orders) as venue FROM `order_customer` WHERE order_customer.status=1");
    }
    public function deleteOrderr($id,$customer_id){
        $order= $this->delete('orderss','id',$id);
        if($order==true){
            $order_product=$this->delete('order_product','id',$id);
            if($order_product==true){
                $order_customer=$this->delete('order_customer','id',$id);
                if($order_customer==true){
                    return $this->delete('customers','customer_id',$customer_id);
                }
            }
        }
    }
}