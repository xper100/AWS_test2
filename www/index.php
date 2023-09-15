<?php

echo '칭찬해 칭호받은 에반이올시다 제우스 팬서 콥 짱';


$db_host = "host=evan.ca4xmd0qmadn.ap-northeast-2.rds.amazonaws.com"
$db_port = "port=5432";
$db_user = "user=postgres";
$db_password = "password=dpqks12345";
$db_name = "dbname=evan";

$connection_info = "$db_host $db_port $db_user $db_password $db_name";
$conn = pg_connect($connection_info);

$query = "select * from evan;";
$result = pg_query($conn, $query);

$db_result = "";
while ($row = pg_fetch_assoc($result)) (
    $db_result = $row['evan'];
)


echo " ".$db_result;
