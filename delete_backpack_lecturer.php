<?php
include('dbcon.php');

if (isset($_POST['backup_delete'])) {
    if (isset($_POST['selector']) && is_array($_POST['selector'])) {
        $ids = $_POST['selector'];
        foreach ($ids as $id) {
            // Sanitize the ID to prevent SQL injection
            $id = mysqli_real_escape_string($connection, $id);

            // Perform the deletion
            $result = mysqli_query($connection, "DELETE FROM lecturer_backpack WHERE file_id = '$id'");
        }

        // Redirect or perform any other actions after deletion
        header("location: lecturer_backpack.php");
    } else {
        // No items selected for deletion, handle accordingly
        // For example, show an error message or redirect back to the previous page
        echo "No items selected for deletion.";
    }
}
?>
