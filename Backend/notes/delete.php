<?php
include "../connect.php ";



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
