<?php
include "../connect.php ";

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: OPTIONS,GET,POST,PUT,DELETE");
header("Access-Control-Max-Age: 3600");$username = $_REQUEST['username'];
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
