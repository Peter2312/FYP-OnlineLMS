<?php include('header_dashboard.php'); ?>
<?php include('session.php'); ?>
<?php $get_id = $_GET['id']; ?>

<body>
    <?php include('navbar_lecturer.php'); ?>
    <div class="container-fluid">
        <div class="row-fluid">
            <?php include('progress_link_lecturer.php'); ?>
            <?php 
            //Calculate average assignment grade
            $assignment_query = mysqli_query($connection, "SELECT AVG(COALESCE(grade, 0)) as avg_grade FROM student_assignment
                                WHERE student_id IN (SELECT student_id FROM lecturer_class_student WHERE lecturer_class_id = '$get_id')");
            
            $assignment_row = mysqli_fetch_assoc($assignment_query);
            $average_assignment_grade = $assignment_row['avg_grade'];

            // Calculate average practice quiz score
            $quiz_query = mysqli_query($connection, "SELECT AVG(COALESCE(grade, 0)) as avg_score FROM student_class_quiz
                            WHERE student_id IN (SELECT student_id FROM lecturer_class_student WHERE lecturer_class_id = '$get_id')");
            
            $quiz_row = mysqli_fetch_assoc($quiz_query);
            $average_quiz_score = $quiz_row['avg_score'];
            ?>

            <div class="span4" id="content">
                <div class="row-fluid">
                    <!-- breadcrumb -->
                    <?php
                    $class_query = mysqli_query($connection, "SELECT * from lecturer_class
                        LEFT JOIN class ON class.class_id = lecturer_class.class_id
                        LEFT JOIN subject ON subject.subject_id = lecturer_class.subject_id
                        where lecturer_class_id = '$get_id'") or die(mysqli_error($connection));
                    $class_row = mysqli_fetch_array($class_query);
                    $class_id = $class_row['class_id'];
                    $school_year = $class_row['school_year'];
                    ?>

                    <ul class="breadcrumb">
                        <li><a href="#"><?php echo $class_row['class_name']; ?></a> <span class="divider">/</span></li>
                        <li><a href="#"><?php echo $class_row['subject_code']; ?></a> <span class="divider">/</span></li>
                        <li><a href="#">School Year: <?php echo $class_row['school_year']; ?></a> <span class="divider">/</span></li>
                        <li><a href="#"><b>Progress</b></a></li>
                    </ul>
                    <!-- end breadcrumb -->

                    <!-- Display average assignment grade here -->
                    <p><strong>Average Assignment Grade: <?php echo number_format($average_assignment_grade, 2); ?><strong></p>

                    <!-- block for Assignment Grade Progress -->
                    <div id="block_bg" class="block">
                        <div class="navbar navbar-inner block-header">
                            <div id="" class="muted pull-left"><h4> Assignment Grade Progress and Performance</h4></div>
                        </div>
                        <div class="block-content collapse in">
                            <div class="span12">
                                <table cellpadding="0" cellspacing="0" border="0" class="table" id="">
                                    <thead>
                                        <tr>
                                            <th>Date Upload</th>
                                            <th>Assignment</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Grade</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $query = mysqli_query($connection, "SELECT sa.*, a.fname, s.firstname, s.lastname
                                            FROM student_assignment sa
                                            LEFT JOIN assignment a ON sa.assignment_id = a.assignment_id
                                            LEFT JOIN lecturer_class_student lcs ON sa.student_id = lcs.student_id
                                            LEFT JOIN student s ON sa.student_id = s.student_id
                                            WHERE lcs.lecturer_class_id = '$get_id'
                                            ORDER BY sa.assignment_fdatein DESC") or die(mysqli_error($connection));

                                        while ($row = mysqli_fetch_array($query)) {
                                        ?>
                                        <tr>
                                            <td><?php echo $row['assignment_fdatein']; ?></td>
                                            <td><?php echo $row['fname']; ?></td>
                                            <td><?php echo $row['firstname']; ?></td>
                                            <td><?php echo $row['lastname']; ?></td>
                                            <td>
                                                <span class="badge badge-success"><?php echo $row['grade']; ?></span>
                                            </td>
                                        </tr>
                                        <?php } ?>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--block for Assignment Grade Progress -->
                </div>
            </div>

            <div class="span5" id="content">
                <div class="row-fluid">
                    <!-- Display average practice quiz score here -->
                    <p><strong>Average Practice Quiz Score: <?php echo number_format($average_quiz_score, 2); ?><strong></p>

                    <!-- block for Practice Quiz Progress -->
                    <div id="block_bg" class="block">
                        <div class="navbar navbar-inner block-header">
                            <div id="" class="muted pull-left"><h4> Practice Quiz Progress and Performance</h4></div>
                        </div>
                        <div class="block-content collapse in">
                            <div class="span12">
                                <table cellpadding="0" cellspacing="0" border 0" class="table" id="">
                                    <thead>
                                        <tr>
                                            <th>Quiz Title</th>
                                            <th>Description</th>
                                            <th>Quiz Time (In Minutes)</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Grade</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                            $query = mysqli_query($connection, "SELECT cq.*, q.quiz_title, q.quiz_description, cq.quiz_time, scq.grade, s.firstname, s.lastname
                                                FROM class_quiz cq
                                                LEFT JOIN quiz q ON cq.quiz_id = q.quiz_id
                                                LEFT JOIN student_class_quiz scq ON cq.class_quiz_id = scq.class_quiz_id
                                                LEFT JOIN lecturer_class_student lcs ON cq.lecturer_class_id = lcs.lecturer_class_id
                                                LEFT JOIN student s ON scq.student_id = s.student_id
                                                WHERE lcs.lecturer_class_id = '$get_id'
                                                ORDER BY cq.class_quiz_id DESC") or die(mysqli_error($connection));

                                            while ($row = mysqli_fetch_array($query)) {
                                            ?>
                                            <tr>
                                                <td><?php echo $row['quiz_title']; ?></td>
                                                <td><?php echo $row['quiz_description']; ?></td>
                                                <td><?php echo $row['quiz_time'] / 60; ?></td>
                                                <td><?php echo $row['firstname']; ?></td>
                                                <td><?php echo $row['lastname']; ?></td>
                                                <?php if ($row['grade'] === null) { ?>
                                                    <td></td>
                                                <?php } else { ?>
                                            <td>
                                                <span class="badge badge-success"><?php echo $row['grade']; ?></span>
                                            </td>
                                        <?php } ?>
                                    </tr>
                                    <?php } ?>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- /block for Practice Quiz Progress -->
                </div>
            </div>
        </div>
    </div>
    <?php /* include('downloadable_sidebar.php') */ ?>
    <?php include('footer.php'); ?>
</body>
</html>