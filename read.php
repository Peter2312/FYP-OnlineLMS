<?php
include('admin/dbcon.php');
include('session.php');

if (isset($_POST['read'])) {
    if (isset($_POST['selector']) && is_array($_POST['selector'])) {
        $id = $_POST['selector'];
        $N = count($id);
        for ($i = 0; $i < $N; $i++) {
            mysqli_query($connection, "INSERT INTO notification_read (student_id, student_read, notification_id) VALUES ('$session_id', 'yes', '{$id[$i]}')") or die(mysqli_error($connection));
        }
        ?>
        <script>
            window.location = 'student_notification.php';
        </script>
    <?php
    } else {
        echo "No checkboxes were selected.";
    }
}

?>