<?php
class Model{
    public $conn;
    protected function __construct()
    {
        global $database;
        $dns="mysql:host=".$database['mysql:host'].";dbname=" . $database['dbname'];
        $username=$database['username'];
        $password=$database['password'];
        try {
            $this->conn=new PDO($dns,$username,$password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
            // echo "connect success";
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }
    //function insert database 
    protected function add($data,$table){
        $values='';
        $filed='';
        foreach ($data as $key => $value) {
            $filed.=','.$key;
            $values.=','.":{$key}";
        }
        $newFiled=substr($filed,1);
        $newValue=substr($values,1);
        $query="INSERT INTO {$table}($newFiled) VALUES ($newValue)";
        $stmt=$this->conn->prepare($query);
        try {
            $this->conn->beginTransaction();
            $stmt->execute($data);
            $lastInsertId=$this->conn->lastInsertId();
            $this->conn->commit();
            if(!empty($lastInsertId)){
                return $lastInsertId;
            }else{
                return true;
            }
        } catch (PDOException $e) {
            echo $e->getMessage();
            $this->conn->rollBack();
        }
    }
    protected function update($data,$table,$id_table,$id){
        $values='';
        foreach ($data as $key => $value) {
            $values.=','.$key.'='.':'.$key;
        }
        $newValue=substr($values,1);
        $query="UPDATE $table SET $newValue WHERE $id_table=:id";
        // echo $query;
        $stmt=$this->conn->prepare($query);
        try {
            $this->conn->beginTransaction();
            $data['id']=$id;
            $stmt->execute($data);
            $this->conn->commit();
        } catch (PDOException $e) {
            echo $e->getMessage();
            $this->conn->rollBack();
        }
    }
    protected function getAll($query){
        $stmt=$this->conn->prepare($query);
        $stmt->execute();
        if($stmt->rowCount() >0 ){
            $result=$stmt->fetchAll(PDO::FETCH_ASSOC);
        }else{
            $result=[];
        }
        return $result;
    }
    protected function getById($query){
        $stmt=$this->conn->prepare($query);
        $stmt->execute();
        if($stmt->rowCount() >0 ){
            $result=$stmt->fetch(PDO::FETCH_ASSOC);
        }else{
            $result=[];
        }
        return $result;
    }
    protected function delete($table,$id_table,$id){
        $query="DELETE FROM $table WHERE $id_table=:id";
        $stmt=$this->conn->prepare($query);
        try {
            $stmt->execute([':id' => $id]);
            if ($stmt->rowCount() > 0) {
                return true;
            }
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
            return false;
        }
    }
    public function getCount($table)
    {
        $sql = "SELECT count(*) as pcount FROM $table";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        return $result['pcount'];
    }
}