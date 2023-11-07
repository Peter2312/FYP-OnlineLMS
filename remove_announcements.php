<?php include('admin/dbcon.php'); ?>
<?php
$id = $_POST['id'];
mysqli_query($connection, "DELETE from lecturer_class_announcements where lecturer_class_announcements_id = '$id'")or die(mysqli_error($connection));
mysqli_query($connection, "DELETE from lecturer_class_announcements where lecturer_class_announcements_id = '$id'")or die(mysqli_error($connection));
?>

