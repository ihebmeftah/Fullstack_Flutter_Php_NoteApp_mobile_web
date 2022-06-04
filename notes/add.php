<?php
include "../connect.php ";
include "../function.php ";


header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: OPTIONS,GET,POST,PUT,DELETE");
header("Access-Control-Max-Age: 3600");
$note_title =secureReq('not_title') ;
$notes_content = secureReq('notes_content') ;
$id = secureReq('id') ;	

//****************** */

$sqlinsert = $dbconnect->prepare("INSERT INTO `notestable`(`not_title`, `notes_content`, `notes_users` ) VALUES (  ? , ?, ? )");
$sqlinsert->execute(array($note_title , $notes_content , $id ));
//****************** */

if ($sqlinsert->rowCount() > 0) {
    echo json_encode(array("status" => "successfully"));
} else {
    echo json_encode(array("status" => "Failed"));
}
