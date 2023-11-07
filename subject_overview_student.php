<?php include('header_dashboard.php'); ?>
<?php include('session.php'); ?>
<?php $get_id = $_GET['id']; ?>
<body>
    <?php include('navbar_student.php'); ?>
    <div class="container-fluid">
        <div class="row-fluid">
            <?php include('subject_overview_link_student.php'); ?>
            <div class="span9" id="content">
                <div class="row-fluid">
                    <!-- breadcrumb -->

                    <?php $class_query = mysqli_query($connection, "SELECT * from lecturer_class
                    LEFT JOIN class ON class.class_id = lecturer_class.class_id
                    LEFT JOIN subject ON subject.subject_id = lecturer_class.subject_id
                    where lecturer_class_id = '$get_id'")or die(mysqli_error($connection));
                    $class_row = mysqli_fetch_array($class_query);
                    ?>

                    <ul class="breadcrumb">
                        <li><a href="#"><?php echo $class_row['class_name']; ?></a> <span class="divider">/</span></li>
                        <li><a href="#"><?php echo $class_row['subject_code']; ?></a> <span class="divider">/</span></li>
                        <li><a href="#"><b>Subject Overview</b></a></li>
                    </ul>
                    <!-- end breadcrumb -->

                    <!-- block -->
                    <div id="block_bg" class="block">
                        <div class="navbar navbar-inner block-header">
                            <div id="" class="muted pull-left"></div>
                        </div>
                        <div class="block-content collapse in">
                            <div class="span12">
                                <?php
                                $query = mysqli_query($connection, "SELECT * from lecturer_class
                                LEFT JOIN class ON class.class_id = lecturer_class.class_id
                                LEFT JOIN subject ON subject.subject_id = lecturer_class.subject_id
                                LEFT JOIN lecturer ON lecturer.lecturer_id = lecturer_class.lecturer_id
                                where lecturer_class_id = '$get_id'")or die(mysqli_error($connection));
                                $row = mysqli_fetch_array($query);
                                $id = $row['lecturer_class_id'];
                                ?>

                                Instructor: <strong><?php echo $row['firstname']; ?> <?php echo $row['lastname']; ?></strong>
                                <br>
                                <img id="avatar" class="img-polaroid" src="admin/<?php echo $row['location']; ?>" width>
                                <p><a href=""><i class="icon-search"></i> view info</a></p>
                                <hr>
                                <?php
                                $query = mysqli_query($connection, "SELECT * from lecturer_class
                                LEFT JOIN class_subject_overview ON class_subject_overview.lecturer_class_id = lecturer_class.lecturer_class_id
                                where class_subject_overview.lecturer_class_id = '$get_id'")or die(mysqli_error($connection));
                                $row_subject = mysqli_fetch_array($query);
                                if ($row_subject) {
                                    // Access array elements here
                                    echo $row_subject['content'];
                                } else {
                                    // Handle the case when there's no data in $row_subject
                                    echo "No content available.";
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                    <!-- /block -->
                </div>
            </div>
        </div>
        <?php include('footer.php'); ?>
    </div>
    <?php include('script.php'); ?>
</body>
</html>
