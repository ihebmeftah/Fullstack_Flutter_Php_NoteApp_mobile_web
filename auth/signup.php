<?php
include "../connect.php ";

header("Access-Control-Allow-Origin: *"); 
$username = $_REQUEST['username'];
$usermail = $_REQUEST['usermail'];
$userpassword = $_REQUEST['userpassword'];
//****************** */

$sqlinsert = $dbconnect->prepare("INSERT INTO `users`(`username`, `usermail`, `userpassword`) VALUES ( ? , ? , ? )");
$sqlinsert->execute(array($username, $usermail, $userpassword));
//****************** */

if ($sqlinsert->rowCount() > 0) {
    echo json_encode(array("status" => "successfully"));
} else {
    echo json_encode(array("status" => "Failed"));
}

//http://flutterapi.test/auth/signup.php?username=?&usermail=?.com&userpassword=?