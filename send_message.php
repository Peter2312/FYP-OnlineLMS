<?php
include('admin/dbcon.php');
include('session.php');
$lecturer_id = $_POST['lecturer_id'];
$my_message = $_POST['my_message'];


$query = mysqli_query($conn,"SELECT * from lecturer where lecturer_id = '$lecturer_id'")or die(mysqli_error($connection));
$row = mysqli_fetch_array($query);
$name = $row['firstname']." ".$row['lastname'];

$query1 = mysqli_query($conn,"SELECT * from lecturer where lecturer_id = '$session_id'")or die(mysqli_error($connection));
$row1 = mysqli_fetch_array($query1);
$name1 = $row1['firstname']." ".$row1['lastname'];


mysqli_query($conn,"INSERT into message (reciever_id,content,date_sended,sender_id,reciever_name,sender_name) values('$lecturer_id','$my_message',NOW(),'$session_id','$name','$name1')")or die(mysqli_error($connection));
mysqli_query($conn,"INSERT into message_sent (reciever_id,content,date_sended,sender_id,reciever_name,sender_name) values('$lecturer_id','$my_message',NOW(),'$session_id','$name','$name1')")or die(mysqli_error($connection));
?>