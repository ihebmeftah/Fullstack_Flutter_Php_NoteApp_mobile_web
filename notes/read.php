<?php
include "../connect.php ";

header("Access-Control-Allow-Origin: *"); 
$id = $_REQUEST['id'];
//****************** */

$sqlinsert = $dbconnect->prepare("SELECT * FROM notestable WHERE notes_users = ?  ");
$sqlinsert->execute(array($id));

$data = $sqlinsert->fetch(PDO::FETCH_ASSOC);
//****************** */
if ($sqlinsert->rowCount() > 0) {
    echo json_encode(array("status" => "successfully" , "data"=> $data));
} else {
    echo json_encode(array("status" => "Failed"));
}

