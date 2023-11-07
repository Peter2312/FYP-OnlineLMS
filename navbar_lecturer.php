<div class="navbar navbar-fixed-top navbar-inverse">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="#">ULTIMATE UNIVERSITY</a>
            <div class="nav-collapse collapse">
                <ul class="nav pull-right">
                    <?php
                    $query = mysqli_query($connection, "SELECT * from lecturer WHERE lecturer_id = '$session_id'") or die(mysqli_error($connection));
                    $row = mysqli_fetch_array($query);

                    if ($row) {
                        echo '<li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="icon-user icon-large"></i>' . $row['firstname'] . ' ' . $row['lastname'] . '
                                    <i class="caret"></i>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="change_password_lecturer.php"><i class="icon-circle"></i> Change Password</a>
                                        <a tabindex="-1" href="#myModal" data-toggle="modal"><i class="icon-picture"></i> Change Avatar</a>
                                        <a tabindex="-1" href="profile_lecturer.php"><i class="icon-user"></i> Profile</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li><a tabindex="-1" href="logout.php"><i class="icon-signout"></i>&nbsp;Logout</a></li>
                                </ul>
                            </li>';
                    }
                    ?>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>
</div>
<?php include('avatar_modal.php'); ?>
