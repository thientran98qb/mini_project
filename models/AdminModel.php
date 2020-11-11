<?php
class AdminModel extends Model{
    public function __construct()
    {
        parent::__construct();
    }
    public function checkUser($username,$password){
        $query="SELECT users.user_id FROM users WHERE (user_name=:username) AND (user_pass=:userpass)";
        $stmt=$this->conn->prepare($query);
        $stmt->bindValue(":username",$username);
        $stmt->bindValue(":userpass",$password);
        $stmt->execute();
        if($stmt->rowCount()>0){
            return true;
        }
        return false;
    }
}