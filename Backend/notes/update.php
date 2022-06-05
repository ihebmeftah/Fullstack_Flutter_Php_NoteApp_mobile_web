<?php
include "../connect.php ";



$note_title = secureReq('not_title');
$notes_content =secureReq('notes_content');
$noteid =secureReq('id') ;

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
