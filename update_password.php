 <?php
 include('dbcon.php');
 include('session.php');
 $new_password  = $_POST['new_password'];
 mysqli_query($connection, "UPDATE lecturer set password = '$new_password' where lecturer_id = '$session_id'")or die(mysqli_error($connection));
 ?>