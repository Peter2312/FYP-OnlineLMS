<div class="span3" id="sidebar">
    <img id="avatar" src="admin/<?php echo $row['location']; ?>" class="img-polaroid">
    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
        <li class=""><a href="dashboard_lecturer.php"><i class="icon-chevron-right"></i><i class="icon-chevron-left"></i>&nbsp;Back</a></li>
        <li class=""><a href="my_students.php<?php echo '?id=' . $get_id; ?>"><i class="icon-chevron-right"></i><i class="icon-group"></i>&nbsp;My Students</a></li>
        <li class=""><a href="subject_overview.php<?php echo '?id=' . $get_id; ?>"><i class="icon-chevron-right"></i><i class="icon-file"></i>&nbsp;Subject Overview</a></li>
        <li class=""><a href="downloadable.php<?php echo '?id=' . $get_id; ?>"><i class="icon-chevron-right"></i><i class="icon-download"></i>&nbsp;Downloadable Materials</a></li>
        <li class=""><a href="assignment.php<?php echo '?id=' . $get_id; ?>"><i class="icon-chevron-right"></i><i class="icon-book"></i>&nbsp;Assignments</a></li>
        <li class=""><a href="announcements.php<?php echo '?id=' . $get_id; ?>"><i class="icon-chevron-right"></i><i class="icon-info-sign"></i>&nbsp;Announcements</a></li>
        <li class=""><a href="class_calendar.php<?php echo '?id=' . $get_id; ?>"><i class="icon-chevron-right"></i><i class="icon-calendar"></i>&nbsp;Class Calendar</a></li>
        <li class=""><a href="class_quiz.php<?php echo '?id=' . $get_id; ?>"><i class="icon-chevron-right"></i><i class="icon-list"></i>&nbsp;Quiz</a></li>
        <li class="active"><a href="discussion_board_lecturer.php><i class="icon-chevron-right"></i><i class="icon-comments"></i>&nbsp;Discussion Board</a></li>
        <li class=""><a href="view_progress.php<?php echo '?id=' . $get_id; ?>"><i class="icon-chevron-right"></i><i class="icon-bar-chart"></i>&nbsp;Student Progress</a></li>
    </ul>
    <?php include('search_other_class.php'); ?>
</div>
