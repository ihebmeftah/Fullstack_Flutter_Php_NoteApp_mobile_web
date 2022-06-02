<?php
include "../connect.php ";

header("Access-Control-Allow-Origin: *"); 
$usermail = $_REQUEST['usermail'];
$userpassword = $_REQUEST['userpassword'];
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
