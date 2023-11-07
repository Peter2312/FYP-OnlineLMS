<?php
include('admin/dbcon.php');
include('session.php');

if (isset($_POST['delete_user'])) {
    $id = $_POST['selector'];
    $class_id = $_POST['lecturer_class_id'];
    $get_id = $_POST['get_id'];

    if (is_array($id)) {
        foreach ($id as $file_id) {
            $result = mysqli_query($connection, "SELECT * from files where file_id = '$file_id'") or die(mysqli_error($connection));

            while ($row = mysqli_fetch_array($result)) {
                $fname = $row['fname'];
                $floc = $row['floc'];
                $fdesc = $row['fdesc'];
                $uploaded_by = $row['uploaded_by'];

                mysqli_query($connection, "INSERT INTO files (floc, fdatein, fdesc, class_id, fname, uploaded_by) values ('$floc', NOW(), '$fdesc', '$class_id', '$fname', '$uploaded_by')") or die(mysqli_error($connection));
            }
        }
    }

    header("Location: downloadable.php?id=$get_id");
    exit;
}

if (isset($_POST['copy'])) {
    $id = $_POST['selector'];

    if (is_array($id)) {
        foreach ($id as $file_id) {
            $result = mysqli_query($connection, "SELECT * from files where file_id = '$file_id'") or die(mysqli_error($connection));

            while ($row = mysqli_fetch_array($result)) {
                $fname = $row['fname'];
                $floc = $row['floc'];
                $fdesc = $row['fdesc'];

                mysqli_query($connection, "INSERT INTO lecturer_backpack (floc, fdatein, fdesc, lecturer_id, fname) values ('$floc', NOW(), '$fdesc', '$session_id', '$fname')") or die(mysqli_error($connection));
            }
        }
    }

    header("Location: lecturer_backpack.php");
    exit;
}

if (isset($_POST['share'])) {
    $id = $_POST['selector'];
    $lecturer_id = $_POST['lecturer_id1'];

    if (is_array($id)) {
        foreach ($id as $file_id) {
            $result = mysqli_query($connection, "SELECT * from files where file_id = '$file_id'") or die(mysqli_error($connection));

            while ($row = mysqli_fetch_array($result)) {
                $fname = $row['fname'];
                $floc = $row['floc'];
                $fdesc = $row['fdesc'];

                mysqli_query($connection, "INSERT INTO lecturer_shared (floc, fdatein, fdesc, lecturer_id, fname, shared_lecturer_id) values ('$floc', NOW(), '$fdesc', '$session_id', '$fname', '$lecturer_id')") or die(mysqli_error($connection));
            }
        }
    }

    header("Location: lecturer_share.php");
    exit;
}
?>
