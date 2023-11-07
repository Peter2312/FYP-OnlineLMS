<?php include('admin/dbcon.php'); ?>
<?php
$id = $_POST['id'];
mysqli_query($connection, "DELETE from discussions where discussion_id = '$id'")or die(mysqli_error($connection));
?>