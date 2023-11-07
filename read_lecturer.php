<?php
include('admin/dbcon.php');
include('session.php');
if (isset($_POST['read'])){
$id=$_POST['selector'];
$N = count($id);
for($i=0; $i < $N; $i++)
{
	mysqli_query($connection, "INSERT INTO notification_read_lecturer (lecturer_id,student_read,notification_id) values('$session_id','yes','$id[$i]')")or die(mysqli_error($connection));	
}
?>
<script>
window.location = 'notification_lecturer.php';
</script>
<?php
}
?>