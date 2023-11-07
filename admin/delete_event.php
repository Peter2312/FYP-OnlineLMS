<?php
include('dbcon.php');
$get_id = $_GET['id'];
mysqli_query($connection, "DELETE from event where event_id = '$get_id'")or die(mysqli_error($connection));
?>
<script>
window.location = 'calendar_of_events.php';
</script>