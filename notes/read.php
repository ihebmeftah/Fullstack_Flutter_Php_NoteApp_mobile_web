<?php
include "../connect.php ";
include "../function.php ";



$id = secureReq('id') ;
//****************** */

$sqlinsert = $dbconnect->prepare("SELECT * FROM notestable WHERE notes_users = ?  ");
$sqlinsert->execute(array($id));

$data = $sqlinsert->fetchAll(PDO::FETCH_ASSOC);
//****************** */
if ($sqlinsert->rowCount() > 0) {
    echo json_encode(array("status" => "successfully" , "data"=> $data));
} else {
    echo json_encode(array("status" => "Failed"));
}

