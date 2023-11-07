<?php
    $school_year_query = mysqli_query($connection, "SELECT * from school_year order by school_year DESC")or die(mysqli_error($connection));
    $school_year_query_row = mysqli_fetch_array($school_year_query);
    $school_year = $school_year_query_row['school_year'];
    ?>

    <?php $query_yes = mysqli_query($connection, "SELECT * from lecturer_notification
    LEFT JOIN notification_read_lecturer on lecturer_notification.lecturer_notification_id =  notification_read_lecturer.notification_id
    where lecturer_id = '$session_id' 
    ")or die(mysqli_error($connection));
    $count_no = mysqli_num_rows($query_yes);
    ?>
    <?php $query = mysqli_query($connection, "SELECT * from lecturer_notification
    LEFT JOIN lecturer_class on lecturer_class.lecturer_class_id = lecturer_notification.lecturer_class_id
    LEFT JOIN student on student.student_id = lecturer_notification.student_id
    LEFT JOIN assignment on assignment.assignment_id = lecturer_notification.assignment_id 
    LEFT JOIN class on lecturer_class.class_id = class.class_id
    LEFT JOIN subject on lecturer_class.subject_id = subject.subject_id
    where lecturer_class.lecturer_id = '$session_id' 
    ")or die(mysqli_error($connection));
    $count = mysqli_num_rows($query);
    ?>
    
    <?php $not_read = $count -  $count_no; ?>