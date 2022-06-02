<?php
include "../connect.php ";

header("Access-Control-Allow-Origin: *");

$note_title = $_REQUEST['not_title'];
$notes_content = $_REQUEST['notes_content'];
$noteid = $_REQUEST['id'];

//****************** */

$sqlinsert = $dbconnect->prepare("
UPDATE `notestable` SET `not_title`= ?,`notes_content`= ? WHERE notes_id = ?");
$sqlinsert->execute(array($note_title, $notes_content, $noteid));
//****************** */

if ($sqlinsert->rowCount() > 0) {
    echo json_encode(array("status" => "successfully"));
} else {
    echo json_encode(array("status" => "Failed"));
}
