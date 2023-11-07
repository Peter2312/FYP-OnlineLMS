<?php
include('admin/dbcon.php');
$get_id = $_POST['id'];
mysqli_query($connection, "DELETE from lecturer_class  where  lecturer_class_id = '$get_id' ")or die(mysqli_error($connection));
mysqli_query($connection, "DELETE from lecturer_class_student  where  lecturer_class_id = '$get_id' ")or die(mysqli_error($connection));
mysqli_query($connection, "DELETE from lecturer_class_announcements  where  lecturer_class_id = '$get_id' ")or die(mysqli_error($connection));
mysqli_query($connection, "DELETE from lecturer_notification  where  lecturer_class_id = '$get_id' ")or die(mysqli_error($connection));
mysqli_query($connection, "DELETE from class_subject_overview where  lecturer_class_id = '$get_id' ")or die(mysqli_error($connection));
header('location:dashboard_lecturer.php');
?>