<?php
class HomeModel extends Model{
    public function __construct()
    {
        parent::__construct();
    }
    public function addUser(){
        $datas=[
            'name'=>'thientran98',
        ];
        $data=$this->getAll('SELECT * FROM tesst WHERE tesst_id=1');
        return $data;
    }
    public function getProductbyCategory($category_id){
        return $this->getAll("SELECT * FROM products INNER JOIN categories ON products.category_id=categories.category_id WHERE products.category_id=$category_id");
    }
    /* dua ra cateegory lay catgory_id xong getproduct(category_id) */
    public function getCategory(){
        return $this->getAll("SELECT * FROM categories");
    }
    public function getProductbyCategoryPaginate($category_id,$start,$step){
        return $this->getAll("SELECT * FROM products INNER JOIN categories ON products.category_id=categories.category_id WHERE products.category_id=$category_id LIMIT $start,$step");
    }
    public function countProduct($category_id){
        $sql = "SELECT categories.category_name , count(*) as pcount FROM products INNER JOIN categories ON products.category_id=categories.category_id WHERE products.category_id=$category_id";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        return $result;
    }
    public function getProductbyId($product_id){
        return $this->getById("SELECT * FROM products WHERE product_id=$product_id");
    }
}