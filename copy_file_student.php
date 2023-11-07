<?php
include('admin/dbcon.php');
include('session.php');
if (isset($_POST['delete_user'])){
$id=$_POST['selector'];

$N = count($id);
for($i=0; $i < $N; $i++)
{
	$result = mysqli_query($connection, "SELECT * from files  where file_id = '$id[$i]' ")or die(mysqli_error($connection));
	while($row = mysqli_fetch_array($result)){
	
	$fname = $row['fname'];
	$floc = $row['floc'];
	$fdesc = $row['fdesc'];
	$lecturer_id = $row['lecturer_id'];
	
	
	mysqli_query($connection, "INSERT INTO student_backpack (floc,fdatein,fdesc,student_id,fname) value('$floc',NOW(),'$fdesc','$session_id','$fname')")or die(mysqli_error($connection));
	
	
	}
}
?>
<script>
window.location = 'backpack.php';
</script>
<?php
}
?>