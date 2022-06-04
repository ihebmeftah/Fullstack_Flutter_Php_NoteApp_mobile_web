<?php
echo "Index <br>";
include "connect.php";
include "./function.php";


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
