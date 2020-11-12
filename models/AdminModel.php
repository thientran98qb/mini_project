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
}