<?php

define('mb', 1048576);

function secureReq($reqname)
{
    return htmlspecialchars(strip_tags($_REQUEST[$reqname]));
}

function checkAuthenticate()
{
    if (isset($_SERVER['PHP_AUTH_USER'])  && isset($_SERVER['PHP_AUTH_PW'])) {
        if ($_SERVER['PHP_AUTH_USER'] != "wael" ||  $_SERVER['PHP_AUTH_PW'] != "wael12345"){
            header('WWW-Authenticate: Basic realm="My Realm"');
            header('HTTP/1.0 401 Unauthorized');
            echo 'Page Not Found';
            exit;
        }
    } else {
        exit;
    }
}

function upload($fileup)
{
    global $msgerror;
    $imgname = rand(1000,10000).$_FILES[$fileup]['name']; // img name 
    $imgtmp = $_FILES[$fileup]['tmp_name'];
    $imgsize = $_FILES[$fileup]['size'];
    $extension = array('jpg', 'jpeg', 'png', 'gif');
    $strtoarray = explode('.', $imgname);
    $ext = strtolower(end($strtoarray));

    if (!empty($imgname) && !in_array($ext, $extension)) {
        $msgerror[] = 'may be extension error';
    }
    //*** */
    if ($imgsize > 2 * mb) {
        $msgerror[] = 'may be size error';
    }
    //*** */

    if (empty($msgerror)) {
        echo 'uploading file in path';
        move_uploaded_file($imgtmp, "../upload/" . $imgname);
    
        return $imgname; 
    } else {
        echo 'FAIL';
        
    }
}

function deletefile($path , $name){
    if(file_exists($path ."/" .$name)){
unlink($path ."/" .$name);
    }
}