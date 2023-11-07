<?php
$connection = mysqli_connect('localhost', 'root', '', 'lms_db', '3308');

if (!$connection) {
    die('Connection failed: ' . mysqli_connect_error());
}

$db_selected = mysqli_select_db($connection, 'lms_db');

if (!$db_selected) {
    die('Database selection failed: ' . mysqli_error($connection));
}
?>