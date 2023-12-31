<?php include('header_dashboard.php'); ?>
<?php include('session.php'); ?>
<?php $get_id = $_GET['id']; ?>

<body>
    <?php include('navbar_student.php'); ?>
    <div class="container-fluid">
        <div class="row-fluid">
            <?php include('progress_link_student.php'); ?>
            <?php 
            $assignment_query = mysqli_query($connection, "SELECT AVG(grade) as avg_grade FROM student_assignment WHERE student_id = '$session_id'");
            $assignment_row = mysqli_fetch_assoc($assignment_query);
            $average_assignment_grade = $assignment_row['avg_grade'];

            // Calculate average practice quiz score
            $quiz_query = mysqli_query($connection, "SELECT AVG(grade) as avg_score FROM student_class_quiz WHERE student_id = '$session_id'");
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

                    <!-- Display average assignment grade -->
                    <p><strong>Average Assignment Grade: <?php echo number_format($average_assignment_grade, 2); ?></strong></p>

                    <!-- block -->
                    <div id="block_bg" class="block">
                        <div class="navbar navbar-inner block-header">
                            <div id="" class="muted pull-left"><h4> Assignment Grade Progress</h4></div>
                        </div>
                        <div class="block-content collapse in">
                            <div class="span12">
                                <table cellpadding="0" cellspacing="0" border="0" class="table" id="">
                                    <thead>
                                        <tr>
                                            <th>Date Upload</th>
                                            <th>Assignment</th>
                                            <th>Grade</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $query = mysqli_query($connection, "SELECT * FROM student_assignment
                                                LEFT JOIN student on student.student_id  = student_assignment.student_id
                                                RIGHT JOIN assignment on student_assignment.assignment_id  = assignment.assignment_id
                                                WHERE student_assignment.student_id = '$session_id'
                                                order by fdatein DESC") or die(mysqli_error($connection));
                                        while ($row = mysqli_fetch_array($query)) {
                                            $id  = $row['student_assignment_id'];
                                            $student_id = $row['student_id'];
                                        ?>
                                            <tr>
                                                <td><?php echo $row['fdatein']; ?></td>
                                                <td><?php  echo $row['fname']; ?></td>
                                                <?php if ($session_id == $student_id) { ?>
                                                    <td>
                                                        <span class="badge badge-success"><?php echo $row['grade']; ?></span>
                                                    </td>
                                                <?php } else { ?>
                                                    <td></td>
                                                <?php } ?>
                                            </tr>
                                        <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- /block -->
                </div>
            </div>

            <div class="span5" id="content">
                <div class="row-fluid">
                    <!-- breadcrumb -->
                    <ul class="breadcrumb">
                        <li><a href="#"><b>..</b></a></li>
                    </ul>
                    <!-- end breadcrumb -->

                    <!-- Display average practice quiz score here -->
                    <p><strong>Average Practice Quiz Score: <?php echo number_format($average_quiz_score, 2); ?></strong></p>

                    <!-- block -->
                    <div id="block_bg" class="block">
                        <div class="navbar navbar-inner block-header">
                            <div id="" class="muted pull-left"><h4> Practice Quiz Progress</h4></div>
                        </div>
                        <div class="block-content collapse in">
                            <div class="span12">
                                <table cellpadding="0" cellspacing="0" border="0" class="table" id="">
                                    <thead>
                                        <tr>
                                            <th>Quiz Title</th>
                                            <th>Description</th>
                                            <th>Quiz Time (In Minutes)</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $query = mysqli_query($connection, "SELECT * FROM class_quiz
                                                LEFT JOIN quiz on class_quiz.quiz_id = quiz.quiz_id
                                                where lecturer_class_id = '$get_id' order by class_quiz_id DESC ") or die(mysqli_error($connection));
                                        while ($row = mysqli_fetch_array($query)) {
                                            $id  = $row['class_quiz_id'];
                                            $quiz_id  = $row['quiz_id'];
                                            $quiz_time  = $row['quiz_time'];
                                            $query1 = mysqli_query($connection, "SELECT * from student_class_quiz where class_quiz_id = '$id' and student_id = '$session_id'") or die(mysqli_error($connection));
                                            $row1 = mysqli_fetch_array($query1);
                                            $grade = $row1['grade'];
                                        ?>
                                            <?php if ($grade == "") { } else { ?>
                                                <tr>
                                                    <td><?php echo $row['quiz_title']; ?></td>
                                                    <td><?php  echo $row['quiz_description']; ?></td>
                                                    <td><?php  echo $row['quiz_time'] / 60; ?></td>
                                                    <td width="200">
                                                        <b>Already Taken Score <?php echo $grade; ?></b>
                                                    </td>
                                                    <script type="text/javascript">
                                                        $(document).ready(function () {
                                                            $('#<?php echo $id; ?>Take This Quiz').tooltip('show');
                                                            $('#<?php echo $id; ?>Take This Quiz').tooltip('hide');
                                                        });
                                                    </script>
                                                </tr>
                                            <?php } ?>
                                        <?php } ?>
                                    </tbody>
                                </table>
                                <div id="block_bg" class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div id="" class="muted pull-left"><h4>Assignment and Quiz Performance</h4></div>
                                </div>
                                <div class="block-content collapse in">
                                    <div class="span12">
                                        <p>Average Assignment Grade: <?php echo number_format($average_assignment_grade, 2); ?></p>
                                        <p>Average Practice Quiz Score: <?php echo number_format($average_quiz_score, 2); ?></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /block -->
                </div>
            </div>
        </div>
        <?php /* include('downloadable_sidebar.php') */ ?>
    </div>
    <?php include('footer.php'); ?>
</body>
</html>