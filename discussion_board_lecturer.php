<?php include('header_dashboard.php'); ?>
<?php include('session.php'); ?>
<?php $get_id = $_GET['id']; ?>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- Bootstrap JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<body>
    <?php include('navbar_lecturer.php'); ?>
    <div class="container-fluid">
        <div class="row-fluid">
            <?php include('discussion_board_link_lecturer.php'); ?>

            <!-- Main content area -->
            <div class="span5" id="content">
                <div class="row-fluid">
                    <!-- Breadcrumb -->
                    <?php
                    $class_query = mysqli_query($connection, "SELECT * from lecturer_class
                        LEFT JOIN class ON class.class_id = lecturer_class.class_id
                        LEFT JOIN subject ON subject.subject_id = lecturer_class.subject_id
                        WHERE lecturer_class_id = '$get_id'") or die(mysqli_error($connection));
                    $class_row = mysqli_fetch_array($class_query);
                    ?>

                    <ul class="breadcrumb">
                        <li><a href="#"><?php echo $class_row['class_name']; ?></a> <span class="divider">/</span></li>
                        <li><a href="#"><?php echo $class_row['subject_code']; ?></a> <span class="divider">/</span></li>
                        <li><a href="#"><b>Discussion Board</b></a></li>
                    </ul>
                    <!-- End Breadcrumb -->

                    <!-- Block for posting discussions -->
                    <div id="block_bg" class="block">
                        <div class="navbar navbar-inner block-header">
                            <div id="" class="muted pull-left"></div>
                        </div>
                        <div class="block-content collapse in">
                            <div class="span12">
                                <form method="post">
                                    <textarea name="content" id="ckeditor_full"></textarea>
                                    <br>
                                    <button name="post" class="btn btn-info"><i class="icon-check icon-large"></i> Post</button>
                                </form>
                            </div>

                            <?php
                            if (isset($_POST['post'])) {
                                $content = $_POST['content'];
                                mysqli_query($connection, "INSERT INTO discussions (lecturer_class_id, lecturer_id, student_id, content, date_created)
                                    VALUES ('$get_id', '$session_id', '', '$content', NOW())") or die(mysqli_error($connection));
                                mysqli_query($connection, "INSERT INTO notification (lecturer_class_id, notification, date_of_notification, link)
                                    VALUES ('$get_id', 'New Discussion Board Created', NOW(), 'discussion_board_student.php')") or die(mysqli_error($connection));
                                ?>
                                <script>
                                    window.location = 'discussion_board_lecturer.php<?php echo '?id=' . $get_id; ?>';
                                </script>
                                <?php
                            }
                            ?>
                        </div>
                    </div>
                    <!-- End Block for posting discussions -->

                    <!-- Block for viewing discussion threads and replies -->
                    <div id="block_bg" class="block">
                        <div class="navbar navbar-inner block-header">
                            <div id="" class="muted pull-left"></div>
                        </div>
                        <div class="block-content collapse in">
                            <div class="span12">
                                <?php
                                $query_discussion = mysqli_query($connection, "SELECT * from discussions
                                    WHERE lecturer_class_id = '$get_id' ORDER BY date_created DESC") or die(mysqli_error($connection));

                                while ($row = mysqli_fetch_array($query_discussion)) {
                                    $id = $row['discussion_id'];
                                ?>
                                <div class="post" id="del<?php echo $id; ?>">
                                    <?php echo $row['content']; ?>

                                    <hr>

                                    <strong><i class="icon-calendar"></i> <?php echo $row['date_created']; ?></strong>

                                    <div class="pull-right">
                                        <a class="btn btn-link remove" id="<?php echo $id; ?>" href="#removeDiscussionModal" data-toggle="modal"><i class="icon-remove"></i> Remove Discussion</a>
                                    </div>

                                    <div class="pull-right">
                                        <form method="post" action="edit_discussion.php<?php echo '?id=' . $get_id; ?>">
                                            <input type="hidden" name="id" value="<?php echo $id; ?>">
                                            <button class="btn btn-link" name="edit"><i class="icon-pencil"></i> Edit Discussion</button>
                                        </form>
                                    </div>

                                   <!-- Form for posting discussion replies (both students and lecturers) -->
                                    <form method="post">
                                        <textarea name="reply_content" id="ckeditor_reply_<?php echo $id; ?>"></textarea>
                                        <input type="hidden" name="discussion_id" value="<?php echo $id; ?>"> <!-- Add hidden input for discussion_id -->
                                        <br>
                                        <button name="post_reply" class="btn btn-info"><i class="icon-check icon-large"></i> Post Reply</button>
                                    </form>

                                    <?php
                                    if (isset($_POST['post_reply'])) {
                                        $reply_content = $_POST['reply_content'];
                                        $discussion_id = $_POST['discussion_id']; // Retrieve the discussion ID from the form

                                        $user_id = (isset($_SESSION['student_id']) ? $_SESSION['student_id'] : (isset($_SESSION['lecturer_id']) ? $_SESSION['lecturer_id'] : '')); // Get the user's ID
                                        $user_type = (isset($_SESSION['student_id']) ? 'student' : (isset($_SESSION['lecturer_id']) ? 'lecturer' : '')); // Determine the user type

                                        // Insert the reply into the discussion_replies table with the correct discussion ID
                                        mysqli_query($connection, "INSERT INTO discussion_replies (discussion_id, student_id, lecturer_id, reply_content, date_replied)
                                            VALUES ('$discussion_id', " . ($user_type === 'student' ? $user_id : "''") . ", " . ($user_type === 'lecturer' ? $user_id : "''") . ", '$reply_content', NOW())") or die(mysqli_error($connection));
                                    }
                                    ?>

                                    <!-- Display student and lecturer replies for this discussion -->
                                    <?php
                                    $query_replies = mysqli_query($connection, "SELECT dr.*, s.lastname AS student_lastname, l.lastname AS lecturer_lastname FROM discussion_replies dr
                                        LEFT JOIN student s ON dr.student_id = s.student_id
                                        LEFT JOIN lecturer l ON dr.lecturer_id = l.lecturer_id
                                        WHERE dr.discussion_id = '$id' ORDER BY dr.date_replied ASC") or die(mysqli_error($connection));

                                    while ($reply = mysqli_fetch_array($query_replies)) {
                                    ?>
                                    <div class="discussion-reply">
                                        <?php
                                        if (!empty($reply['student_id'])) {
                                            // Display student reply
                                            echo '<strong>' . $reply['student_lastname'] . ' (Student):</strong> ' . $reply['reply_content'];
                                        } else {
                                            // Display lecturer reply
                                            echo '<strong>' . $reply['lecturer_lastname'] . ' (Lecturer):</strong> ' . $reply['reply_content'];
                                        }
                                        ?>
                                        <hr>
                                        <strong><i class="icon-calendar"></i> <?php echo $reply['date_replied']; ?></strong>
                                    </div>
                                    <?php } ?>
                                    <!-- End student and lecturer replies -->

                                </div>
                                <?php include("remove_discussion_modal.php"); ?>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                    <!-- End Block for viewing discussion threads and replies -->
                </div>
                <script type="text/javascript">
        $(document).ready(function () {
            $('.remove').click(function () {
                var id = $(this).attr("id");
                $.ajax({
                    type: "POST",
                    url: "remove_discussion.php",
                    data: ({id: id}),
                    cache: false,
                    success: function (html) {
                        $("#del" + id).fadeOut('slow', function () {
                            $(this).remove();
                        });
                        $('#removeDiscussionModal').modal('hide');
                        $.jGrowl("Discussion Board Successfully Deleted", {header: 'Discussion Board Deleted'});
                    }
                });

                return false;
            });
        });
    </script>
            </div>
        </div>

        <?php include('footer.php'); ?>
    </div>
    <?php include('script.php'); ?>

</body>
</html>
