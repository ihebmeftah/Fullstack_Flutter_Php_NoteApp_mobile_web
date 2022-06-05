<?php
include "../connect.php ";
include "../function.php ";



$id =secureReq('id') ;	
$image =secureReq('image') ;	


//****************** */

$sqlinsert = $dbconnect->prepare("DELETE FROM notestable where notes_id = ? ");
$sqlinsert->execute(array($id));
//****************** */

if ($sqlinsert->rowCount() > 0) {
    deletefile("../upload" , $image);

    echo json_encode(array("status" => "successfully"));
} else {
    echo json_encode(array("status" => "Failed"));
}
