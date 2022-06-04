<?php
include "../connect.php ";
include "../function.php ";


header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: OPTIONS,GET,POST,PUT,DELETE");
header("Access-Control-Max-Age: 3600");
$id =secureReq('id') ;	

//****************** */

$sqlinsert = $dbconnect->prepare("DELETE FROM notestable where notes_id = ? ");
$sqlinsert->execute(array($id));
//****************** */

if ($sqlinsert->rowCount() > 0) {
    echo json_encode(array("status" => "successfully"));
} else {
    echo json_encode(array("status" => "Failed"));
}
