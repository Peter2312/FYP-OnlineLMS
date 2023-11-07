<?php
include('dbcon.php');
$session_id = $_POST['session_id'];
$subject_id = $_POST['subject_id'];
$class_id = $_POST['class_id'];
$school_year = $_POST['school_year'];
$query = mysqli_query($connection, "SELECT * from lecturer_class where subject_id = '$subject_id' and class_id = '$class_id' and lecturer_id = '$session_id' and school_year = '$school_year' ")or die(mysqli_error($connection));
$count = mysqli_num_rows($query);
if ($count > 0){ 
echo "true";
}else{

mysqli_query($connection, "INSERT INTO lecturer_class (lecturer_id,subject_id,class_id,thumbnails,school_year) values('$session_id','$subject_id','$class_id','admin/uploads/thumbnails.jpg','$school_year')")or die(mysqli_error($connection));

$lecturer_class = mysqli_query($connection, "SELECT * from lecturer_class order by lecturer_class_id DESC")or die(mysqli_error($connection));
$lecturer_row = mysqli_fetch_array($lecturer_class);
$lecturer_id = $lecturer_row['lecturer_class_id'];


$insert_query = mysqli_query($connection, "SELECT * from student where class_id = '$class_id'")or die(mysqli_error($connection));
while($row = mysqli_fetch_array($insert_query)){
$id = $row['student_id'];
mysqli_query($connection, "INSERT INTO lecturer_class_student (lecturer_id,student_id,lecturer_class_id) value('$session_id','$id','$lecturer_id')")or die(mysqli_error($connection));
echo "yes";
}
}
?>