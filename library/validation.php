<?php
    function put_value($field_name){
        global $$field_name;
        if(!empty($$field_name))
            return $$field_name;
    }
    function put_error($name_error){
        global $error;
        if(isset($error[$name_error])){
            return $error[$name_error];
        }
    }
    function check_username($username){
        if(!preg_match('/^[A-Za-z]{1}[A-Za-z0-9]{5,31}$/', $username)){
            return false;
        }else{
            return true;
        }
    }
    function check_password($pass){
        if(!preg_match('/^[A-Za-z]{1}[A-Za-z0-9]{6,31}$/', $pass)){
            return false;
        }else{
            return true;
        }
    }
    function processFile($filename){
        global $error;
        if(isset($_FILES[$filename])){
            //img : name,type ,tmp_name,size,error,
            $file=$_FILES[$filename];
            $fileName=$file['name'];
            $fileTmpName=$file['tmp_name'];
            $fileSize=$file['size'];
            $fileError=$file['error'];
            if($fileError===0){
                if($fileSize <2100000){
                    $tail=explode(".",$fileName);
                    $tailFile=strtolower(end($tail));
                    $arrTailFile=array('jpg','jpeg','png','gif');
                    if(in_array($tailFile,$arrTailFile)){
                        $pathFileEnd=md5(time().$fileName).".".$tailFile;
                        $newPathFile=getcwd().'/assets/uploads/';
                        $destinaPath=$newPathFile.$pathFileEnd;
                        if(move_uploaded_file($fileTmpName,$destinaPath)){
                            return $pathFileEnd;
                        }
                    }else{
                        $error['file']="tail file not permission";
                    }
                }else{
                    $error['file']="File size very big";
                }
            }else{
                $error['file']="File error";
            }
        }else{
            $error['file']="FIle not found";
        }
    }
    function processPrice($price,$t){
        return number_format($price).$t;
    }
    function pagination($page,$per_one_page){
        $html="<ul class='pagination'>
        <li class='page-item disabled'>
          <a class='page-link' href='#' tabindex='-1'>Previous</a>
        </li>
        <li class='page-item'><a class='page-link' href='#'>1</a></li>
        <li class='page-item active'>
          <a class='page-link' href='#'>2 <span class='sr-only'>(current)</span></a>
        </li>
        <li class='page-item'><a class='page-link' href='#'>3</a></li>
        <li class='page-item'>
          <a class='page-link' href='#'>Next</a>
        </li>
      </ul>";
      return $html;
    }