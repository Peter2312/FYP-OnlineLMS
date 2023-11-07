<?php
include('dbcon.php');
if (isset($_POST['delete_lecturer'])){
$id=$_POST['selector'];
$N = count($id);
for($i=0; $i < $N; $i++)
{
	$result = mysqli_query($connection, "DELETE FROM lecturer where lecturer_id='$id[$i]'");
}
header("location: lecturer.php");
}
?>