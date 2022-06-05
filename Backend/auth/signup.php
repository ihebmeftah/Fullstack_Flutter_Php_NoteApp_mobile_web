<?php
include "../connect.php ";



$username = secureReq('username');
$usermail = secureReq("usermail");
$userpassword = secureReq("userpassword");
//****************** */

$sqlinsert = $dbconnect->prepare("INSERT INTO `users`(`username`, `usermail`, `userpassword`) VALUES ( ? , ? , ? )");
$sqlinsert->execute(array($username, $usermail, $userpassword));
//****************** */

if ($sqlinsert->rowCount() > 0) {
    echo json_encode(array("status" => "successfully"));
} else {
    echo json_encode(array("status" => "Failed"));
}
