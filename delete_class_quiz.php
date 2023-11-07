<?php
include('dbcon.php');

if (isset($_POST['backup_delete']) && isset($_POST['selector'])) {
    $get_id = $_GET['id'];
    $id = $_POST['selector'];
    $N = count($id);

    for ($i = 0; $i < $N; $i++) {
        $result = mysqli_query($connection, "DELETE FROM class_quiz where class_quiz_id='$id[$i]'") or die(mysqli_error($connection));
    }
    
    // Redirect to the appropriate location after deletion
    echo "<script>window.location = 'class_quiz.php?id=$get_id';</script>";
}
?>
