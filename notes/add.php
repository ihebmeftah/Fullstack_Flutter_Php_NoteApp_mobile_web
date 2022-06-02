<?php
include "../connect.php ";

header("Access-Control-Allow-Origin: *"); 

$note_title = $_REQUEST['not_title'];
$notes_content = $_REQUEST['notes_content'];
$id = $_REQUEST['id'];	

//****************** */

$sqlinsert = $dbconnect->prepare("INSERT INTO `notestable`(`not_title`, `notes_content`, `notes_users` ) VALUES (  ? , ?, ? )");
$sqlinsert->execute(array($note_title , $notes_content , $id ));
//****************** */

if ($sqlinsert->rowCount() > 0) {
    echo json_encode(array("status" => "successfully"));
} else {
    echo json_encode(array("status" => "Failed"));
}

//http://flutterapi.test/notes/add.php?note_title=?&notes_content=?.com&id=?