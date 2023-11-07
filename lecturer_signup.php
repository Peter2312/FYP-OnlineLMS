<?php
include('admin/dbcon.php');
session_start();
$username = $_POST['username'];
$password = $_POST['password'];
$firstname = $_POST['firstname'];
$lastname = $_POST['lastname'];
$department_id = $_POST['department_id'];

$query = mysqli_query($connection, "SELECT * from lecturer WHERE firstname='$firstname' and lastname='$lastname' and department_id = '$department_id'")or die(mysqli_error($connection));
$row = mysqli_fetch_array($query);
$id = $row['lecturer_id'];

$count = mysqli_num_rows($query);
if ($count > 0){
	// User already exists, update their information
    $row = mysqli_fetch_array($query);
    $id = $row['lecturer_id'];
    mysqli_query($connection, "UPDATE lecturer SET username='$username', password='$password', lecturer_status='Registered' WHERE lecturer_id='$id'")or die(mysqli_error($connection));
    $_SESSION['id'] = $id;
    echo 'true';
}else{
	// User does not exist, insert a new record
    mysqli_query($connection, "INSERT INTO lecturer (username, password, firstname, lastname, department_id, lecturer_status) VALUES ('$username', '$password', '$firstname', '$lastname', '$department_id', 'Registered')")or die(mysqli_error($connection));
    $id = mysqli_insert_id($connection);
    $_SESSION['id'] = $id;
    echo 'true';
}
?>