<?php
include "../connect.php ";
include "../function.php ";


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
