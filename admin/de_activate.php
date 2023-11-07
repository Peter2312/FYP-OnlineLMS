<?php
include('dbcon.php');
$get_id = $_GET['id'];
mysqli_query($connection, "UPDATE lecturer set lecturer_stat = 'Deactivated' where lecturer_id = '$get_id'");
header('location:lecturer.php');
?>