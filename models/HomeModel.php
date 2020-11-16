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
}