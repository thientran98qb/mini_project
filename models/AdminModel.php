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
        return $this->getById("SELECT * FROM products INNER JOIN categories ON products.category_id=categories.category_id WHERE products.product_id=$product_id");
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
}