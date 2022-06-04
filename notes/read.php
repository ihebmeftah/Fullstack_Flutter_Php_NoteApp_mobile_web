<?php
include "../connect.php ";

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: OPTIONS,GET,POST,PUT,DELETE");
header("Access-Control-Max-Age: 3600");

$id = $_REQUEST['id'];
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

