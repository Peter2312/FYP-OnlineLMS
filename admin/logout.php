<?php
include('dbcon.php');
include('session.php');
mysqli_query($connection, "UPDATE user_log set logout_Date = NOW() where user_id = '$session_id' ")or die(mysqli_error($connection));

 session_destroy();
header('location:index.php'); 
?>