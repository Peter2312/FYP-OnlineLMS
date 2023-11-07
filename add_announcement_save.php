<?php
include('admin/dbcon.php');
include('session.php');
	$content = $_POST['content'];		
	$id=$_POST['selector'];
		$N = count($id);
		for($i=0; $i < $N; $i++)
		{			
			mysqli_query($connection, "INSERT INTO lecturer_class_announcements (lecturer_class_id,lecturer_id,content,date) values('$id[$i]','$session_id','$content',NOW())")or die(mysqli_error($connection));
			mysqli_query($connection, "INSERT INTO notification (lecturer_class_id,notification,date_of_notification,link) value('$id[$i]','Add Annoucements',NOW(),'announcements_student.php')")or die(mysqli_error($connection));
		}
?>


