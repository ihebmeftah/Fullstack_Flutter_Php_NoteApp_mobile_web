<?php
include "../connect.php ";
include "../function.php ";



$note_title = secureReq('not_title');
$notes_content = secureReq('notes_content');
$id = secureReq('id');

$imgname =  upload('file');


if ($imgname  != 'FAIL') {

    $sqlinsert = $dbconnect->prepare("INSERT INTO `notestable`(`not_title`, `notes_content`, `notes_users` , `notes_img`) VALUES (  ? , ?, ? , ?  )");
    $sqlinsert->execute(array($note_title, $notes_content, $id , $imgname));
    //****************** */

    if ($sqlinsert->rowCount() > 0) {
        echo json_encode(array("status" => "successfully"));
    } else {
        echo json_encode(array("status" => "Failed"));
    }
} else {
    echo json_encode(array("status" => "Failed"));
}
