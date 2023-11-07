<?php
include('session.php');
include('dbcon.php');
if (isset($_POST['read'])) {
    $id = isset($_POST['selector']) && is_array($_POST['selector']) ? $_POST['selector'] : array();

    if (!empty($id)) {
        $N = count($id);
        for ($i = 0; $i < $N; $i++) {
            $result = mysqli_query($connection, "UPDATE message set message_status = 'read' where message_id = '$id[$i]'");
        }
        header("location: student_message.php");
    }
}
?>

<?php
if (isset($_POST['reply'])){
$sender_id = $_POST['sender_id'];
$sender_name = $_POST['name_of_sender'];
$my_name = $_POST['my_name'];
$my_message = $_POST['my_message'];

mysqli_query($connection, "INSERT INTO message (reciever_id,content,date_sended,sender_id,reciever_name,sender_name) values('$sender_id','$my_message',NOW(),'$session_id','$sender_name','$my_name')")or die(mysqli_error($connection));
mysqli_query($connection, "INSERT INTO message_sent (reciever_id,content,date_sended,sender_id,reciever_name,sender_name) values('$sender_id','$my_message',NOW(),'$session_id','$sender_name','$my_name')")or die(mysqli_error($connection));
?>
<script>
alert('Message Sent');
window.location ="student_message.php";
</script>
<?php

}
?>
