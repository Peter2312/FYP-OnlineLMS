<?php include('header_dashboard.php'); ?>
<?php include('session.php'); ?>
<?php $get_id = $_GET['id']; ?>
<?php $session_lastname = $_GET['id']; ?>

<body>
    <?php include('navbar_student.php'); ?>
    <div class="container-fluid">
        <div class="row-fluid">
            <?php include('discussion_board_link_student.php'); ?>

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
                        <li><a href="#"><b>DISCUSSION BOARD</b></a></li>
                    </ul>
                    <!-- End Breadcrumb -->

                    <!-- Block for viewing discussion replies -->
                    <div id="block_bg" class="block">
                        <div class="navbar navbar-inner block-header">
                            <div id="" class="muted pull-left"><h4> DISCUSSION BOARD </h4></div>
                        </div>
                        <div class="block-content collapse in">
                            <div class="span12">
                                <?php
                                $query_discussion = mysqli_query($connection, "SELECT * from discussions WHERE lecturer_class_id = '$get_id' ORDER BY date_created DESC") or die(mysqli_error($connection));

                                while ($row = mysqli_fetch_array($query_discussion)) {
                                    $id = $row['discussion_id'];
                                ?>
                                <div class="post" id="del<?php echo $id; ?>">
                                    <?php echo $row['content']; ?>

                                    <hr>

                                    <strong><i class="icon-calendar"></i> <?php echo $row['date_created']; ?></strong>

                                    <div class="pull-right">
                                        <a class="btn btn-link" href="#<?php echo $id; ?>" data-toggle="modal"><i class="icon-chevron-down"></i> </a>
                                    </div>

                                    <!-- Display Discussion Replies -->
                                    <div class="discussion-replies">
                                        <?php
                                        $query_replies = mysqli_query($connection, "SELECT dr.*, s.lastname FROM discussion_replies dr
                                            JOIN student s ON dr.student_id = s.student_id
                                            WHERE dr.discussion_id = '$id' ORDER BY dr.date_replied ASC") or die(mysqli_error($connection));

                                        while ($reply = mysqli_fetch_array($query_replies)) {
                                        ?>
                                        <div class="reply">
                                            <strong><?php echo $reply['lastname']; ?>:</strong> <?php echo $reply['reply_content']; ?>
                                            <hr>
                                            <strong><i class="icon-calendar"></i> <?php echo $reply['date_replied']; ?></strong>
                                        </div>
                                        <?php } ?>

                                    </div>
                                    <!-- End Display Discussion Replies -->

                                    <!-- Form for posting discussion replies -->
                                    <form method="post" class="reply-form">
                                        <textarea name="reply_content" class="reply-content" data-discussion-id="<?php echo $id; ?>"></textarea>
                                        <input type="hidden" name="sender_name" value="<?php echo $session_lastname; ?>">
                                        <br>
                                        <button class="btn btn-info post-reply" data-discussion-id="<?php echo $id; ?>"><i class="icon-check icon-large"></i> Post Reply</button>
                                    </form>
                                    <!-- End Form for posting discussion replies -->
                                </div>
                                <?php include("remove_discussion_modal.php"); ?>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                    <!-- End Block for viewing discussion replies -->
                </div>
            </div>
        </div>

        <?php include('footer.php'); ?>
    </div>
    <?php include('script.php'); ?>
    
    <script>
        $(document).ready(function () {
        // Handle post reply using AJAX
        $('.post-reply').click(function (event) {
            event.preventDefault(); // Prevent the default form submission
            var replyButton = $(this);
            var form = replyButton.closest('form');
            var replyContent = form.find('.reply-content').val();
            var senderName = form.find('input[name="sender_name"]').val();

            var discussionID = replyButton.data('discussion-id');

            $.ajax({
                type: "POST",
                url: "post_reply.php",
                data: {
                    discussion_id: discussionID,
                    reply_content: replyContent,
                    sender_name: senderName
                },
                success: function (data) {
                    // Update the discussion replies container with the new reply and sender's name
                    form.closest('.post').find('.discussion-replies').append(data);

                    // Clear the reply textarea
                    form.find('.reply-content').val('');
                }
            });
        });

        // Toggle discussion replies visibility
        $('.post').click(function () {
            $(this).find('.discussion-replies').toggle();
        });
    });
    </script>
</body>
</html>
