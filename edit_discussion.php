<?php include('header_dashboard.php'); ?>
<?php include('session.php'); ?>
<?php $get_id = $_GET['id']; ?>
<?php $get_id1 = isset($_POST['id']) ? $_POST['id'] : null; ?>

<body>
    <?php include('navbar_lecturer.php'); ?>
    <div class="container-fluid">
        <div class="row-fluid">
            <?php include('discussion_board_link_lecturer.php'); ?>
            <div class="span9" id="content">
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

                    <!-- Block for editing discussions -->
                    <div id="block_bg" class="block">
                        <div class="navbar navbar-inner block-header">
                            <div id="" class="muted pull-left"></div>
                        </div>
                        <div class="block-content collapse in">
                            <div class="span12">
                                <a href="discussion_board_lecturer.php<?php echo '?id=' . $get_id; ?>"><i class="icon-arrow-left icon-large"></i> Back</a>
                                <br>
                                <br>
                                <form method="post">
                                    <?php
                                    if (!empty($get_id1)) {
                                        $query_discussion = mysqli_query($connection, "SELECT * from discussions
                                            WHERE lecturer_id = '$session_id' AND discussion_id = '$get_id1' AND lecturer_class_id = '$get_id'") or die(mysqli_error($connection));
                                        $row = mysqli_fetch_array($query_discussion);
                                        $id = $row['discussion_id'];
                                    ?>
                                        <input type="hidden" name="id" value="<?php echo $id; ?>">
                                        <textarea name="content" id="ckeditor_full"><?php echo htmlspecialchars($row['content']); ?></textarea>
                                        <br>
                                        <button name="edit" class="btn btn-info"><i class="icon-check icon-large"></i> Save Changes</button>
                                    <?php
                                    } else {
                                        echo "Invalid discussion ID.";
                                    }
                                    ?>
                                </form>
                            </div>
                            <?php
                            if (isset($_POST['edit'])) {
                                $content = isset($_POST['content']) ? $_POST['content'] : null;
                                $id = isset($_POST['id']) ? $_POST['id'] : null;

                                if (!empty($content) && !empty($id)) {
                                    mysqli_query($connection, "UPDATE discussions SET content = '$content' WHERE discussion_id = '$id'") or die(mysqli_error($connection));
                                ?>
                                    <script>
                                        window.location = 'discussion_board_lecturer.php<?php echo '?id=' . $get_id; ?>';
                                    </script>
                            <?php
                                } else {
                                    echo "";
                                }
                            }
                            ?>
                        </div>
                    </div>
                    <!-- End Block for editing discussions -->
                </div>
            </div>
        </div>
        <?php include('footer.php'); ?>
    </div>
    <?php include('script.php'); ?>
</body>
</html>

