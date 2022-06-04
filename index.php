<?php
echo "Index <br>";
include "connect.php";

define('mb', 1048576);
function upload($fileup)
{
    global $msgerror;
    $imgname = $_FILES[$fileup]['name']; // img name 
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

        move_uploaded_file($imgtmp, "upload/" . $imgname);
    } else {
        echo '<pre>';
        print_r($msgerror);
        echo '</pre>';
    }

}

upload('file');
/*
$requet = $dbconnect->prepare("SELECT * FROM Users  "); // SQL STATEMENT USE 'prepare()' METHODE
$requet->execute();// EXECUTE SQL STATEMENT USE 'execute()' METHODE
$showUser = $requet->fetchAll(PDO::FETCH_ASSOC); // CAN USE FETCH FETCHALL FOR SHOWING DATA FROM DB
$Verif = $requet->rowCount();
echo"Nombre of result of statement $Verif" ;
//print_r($showUser);

/*
FETCH : first one
FETCHColumn : column only
FETCHAll : all 
*/

//CONVERT DATA TO JSON 
/*
echo"<pre>";
echo json_encode($showUser);
echo"</pre>";*/
//INSERT DATA 
/*
$reqAdd = $dbconnect->prepare("INSERT INTO `users`(`Name`, `Email`) VALUES ('flen ben foulen','flen@gmail.com') "); // SQL STATEMENT USE 'prepare()' METHODE
$reqAdd->execute();// EXECUTE SQL STATEMENT USE 'execute()' METHODE
if ($reqAdd->rowCount()>0 ){
    echo"Done";

}else {
    echo"fail";
    
}


//UPDATE AJDATA 
$reqAdd = $dbconnect->prepare("DELETE FROM `users` WHERE id = 4 "); // SQL STATEMENT USE 'prepare()' METHODE
$reqAdd->execute();// EXECUTE SQL STATEMENT USE 'execute()' METHODE
echo json_encode($showUser);
*/
