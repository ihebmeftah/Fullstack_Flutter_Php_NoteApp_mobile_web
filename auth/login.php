<?php
include "../connect.php ";
include "../function.php ";

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: OPTIONS,GET,POST,PUT,DELETE");
header("Access-Control-Max-Age: 3600");
$usermail = secureReq('usermail') ;
$userpassword = secureReq('userpassword') ;
//****************** */

$sqlinsert = $dbconnect->prepare("SELECT * FROM users WHERE usermail = ? AND userpassword = ? ");
$sqlinsert->execute(array($usermail, $userpassword));

$data = $sqlinsert->fetch(PDO::FETCH_ASSOC);
//****************** */
if ($sqlinsert->rowCount() > 0) {
    echo json_encode(array("status" => "successfully" , "data"=> $data));
} else {
    echo json_encode(array("status" => "Failed"));
}
