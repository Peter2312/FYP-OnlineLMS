<?php
include('dbcon.php');
// Get the current school year
$school_year_query = mysqli_query($connection, "SELECT * FROM school_year ORDER BY school_year DESC") or die(mysqli_error($connection));
$school_year_query_row = mysqli_fetch_array($school_year_query);
$school_year = $school_year_query_row['school_year'];

// Calculate the total number of notifications for the student in the current school year
$query_total_notifications = mysqli_query($connection, "SELECT * FROM lecturer_class_student
    LEFT JOIN lecturer_class ON lecturer_class.lecturer_class_id = lecturer_class_student.lecturer_class_id 
    LEFT JOIN notification ON notification.lecturer_class_id = lecturer_class.lecturer_class_id
    WHERE lecturer_class_student.student_id = '$session_id' AND lecturer_class.school_year = '$school_year'
") or die(mysqli_error($connection));
$total_notifications = mysqli_num_rows($query_total_notifications);

// Calculate the number of notifications marked as read by the student
$query_read_notifications = mysqli_query($connection, "SELECT * FROM notification_read
    WHERE student_id = '$session_id'") or die(mysqli_error($connection));
$read_notifications = mysqli_num_rows($query_read_notifications);

// Calculate the number of unread notifications
$not_read = $total_notifications - $read_notifications;

// Ensure $not_read is not negative
if ($not_read < 0) {
    $not_read = 0; // Set to 0 if it's negative
}
?>