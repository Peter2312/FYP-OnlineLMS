<?php
include('admin/dbcon.php');
session_start();
$username = $_POST['username'];
$password = $_POST['password'];

// Student login
$query_student = "SELECT * FROM student WHERE username = ? AND password = ?";
$stmt = mysqli_prepare($connection, $query_student);
mysqli_stmt_bind_param($stmt, 'ss', $username, $password);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$num_row = mysqli_num_rows($result);

// Lecturer login
$query_lecturer = "SELECT * FROM lecturer WHERE username = ? AND password = ?";
$stmt_lecturer = mysqli_prepare($connection, $query_lecturer);
mysqli_stmt_bind_param($stmt_lecturer, 'ss', $username, $password);
mysqli_stmt_execute($stmt_lecturer);
$result_lecturer = mysqli_stmt_get_result($stmt_lecturer);
$num_row_lecturer = mysqli_num_rows($result_lecturer);

if ($num_row > 0) {
    $row = mysqli_fetch_array($result);
    $_SESSION['id'] = $row['student_id'];
    echo 'true_student';
} else if ($num_row_lecturer > 0) {
    $row_lecturer = mysqli_fetch_array($result_lecturer);
    $_SESSION['id'] = $row_lecturer['lecturer_id'];
    echo 'true';
} else {
    echo 'false';
}
?>
