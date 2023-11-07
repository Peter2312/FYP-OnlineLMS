<?php include('header_dashboard.php'); ?>
<?php include('session.php'); ?>
    <body>
		<?php include('navbar_lecturer.php'); ?>
        <div class="container-fluid">
            <div class="row-fluid">
				<?php include('lecturer_sidebar.php'); ?>
                <div class="span6" id="content">
                     <div class="row-fluid">
					    <!-- breadcrumb -->
				
									
					     <ul class="breadcrumb">
						<?php
						$school_year_query = mysqli_query($connection, "SELECT * from school_year order by school_year DESC")or die(mysqli_error($connection));
						$school_year_query_row = mysqli_fetch_array($school_year_query);
						$school_year = $school_year_query_row['school_year'];
						?>
							<li><a href="#">lecturers</a><span class="divider">/</span></li>
							<li><a href="#"><b>Profile</b></a></li>
						</ul>
						 <!-- end breadcrumb -->
					 
                        <!-- block -->
                        <div id="block_bg" class="block">
                            <div class="navbar navbar-inner block-header">
                                <div id="" class="muted pull-left"></div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
										<div class="alert alert-info"><i class="icon-info-sign"></i> About Me</div>
								<?php $query= mysqli_query($connection, "SELECT * from lecturer WHERE lecturer_id = '$session_id'")or die(mysqli_error($connection));
								$row = mysqli_fetch_array($query);
						?>
  									<?php echo $row['about']; ?>
						
                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>


                </div>
				<?php include('lecturer_right_sidebar.php') ?>
            </div>
		<?php include('footer.php'); ?>
        </div>
		<?php include('script.php'); ?>
    </body>
</html>