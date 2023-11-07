<?php include('header_dashboard.php'); ?>
<?php include('session.php'); ?>
    <body>
		<?php include('navbar_lecturer.php'); ?>
        <div class="container-fluid">
            <div class="row-fluid">
				<?php include('lecturer_notification_sidebar.php'); ?>
                <div class="span9" id="content">
                     <div class="row-fluid">
					    <!-- breadcrumb -->
					     <ul class="breadcrumb">
						<?php
						$school_year_query = mysqli_query($connection,"SELECT * from school_year order by school_year DESC")or die(mysqli_error($connection));
						$school_year_query_row = mysqli_fetch_array($school_year_query);
						$school_year = $school_year_query_row['school_year'];
						?>
							<li><a href="#"><b>My Class</b></a><span class="divider">/</span></li>
							<li><a href="#">School Year: <?php echo $school_year_query_row['school_year']; ?></a><span class="divider">/</span></li>
							<li><a href="#"><b>Notification</b></a></li>
						</ul>
						 <!-- end breadcrumb -->
                        <!-- block -->
                        <div id="block_bg" class="block">
                            <div class="navbar navbar-inner block-header">
                                <div id="" class="muted pull-left"></div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">

							<div class="pull-right">
							Check All <input type="checkbox"  name="selectAll" id="checkAll" />
								<script>
								$("#checkAll").click(function () {
									$('input:checkbox').not(this).prop('checked', this.checked);
								});
								</script>					
							</div>

  					<form id="domainTable" action="read_lecturer.php" method="post">
						<?php  if($not_read == '0'){
								}else{  ?>
									<button id="delete"  class="btn btn-info" name="read"><i class="icon-check"></i> Read</button>
						
								<?php  }  ?>
				
					<?php $query = mysqli_query($connection,"select * from lecturer_notification
					LEFT JOIN lecturer_class on lecturer_class.lecturer_class_id = lecturer_notification.lecturer_class_id
					LEFT JOIN student on student.student_id = lecturer_notification.student_id
					LEFT JOIN assignment on assignment.assignment_id = lecturer_notification.assignment_id 
					LEFT JOIN class on lecturer_class.class_id = class.class_id
					LEFT JOIN subject on lecturer_class.subject_id = subject.subject_id
					where lecturer_class.lecturer_id = '$session_id'  order by  lecturer_notification.date_of_notification DESC
					")or die(mysqli_error($connection));
					$count = mysqli_num_rows($query);
					while($row = mysqli_fetch_array($query)){
					$assignment_id = $row['assignment_id'];
					$get_id = $row['lecturer_class_id'];
					$id = $row['lecturer_notification_id'];
					
					
					$query_yes_read = mysqli_query($connection,"SELECT * from notification_read_lecturer where notification_id = '$id' and lecturer_id = '$session_id'")or die(mysqli_error($connection));
					$read_row = mysqli_fetch_array($query_yes_read);
					
					$yes = $read_row['student_read']; 
				
					?>
									<div class="post"  id="del<?php echo $id; ?>">
										<?php  if ($yes == 'yes'){
										}else{ 
										?>
										  

										<input id=""  name="selector[]" type="checkbox" value="<?php echo $id; ?>">	
										<?php  } ?>	
											<strong><?php echo $row['firstname']." ".$row['lastname'];  ?></strong>
											<?php echo $row['notification']; ?> In <b><?php echo $row['fname']; ?></b>
											<a href="<?php echo $row['link']; ?><?php echo '?id='.$get_id; ?>&<?php echo 'post_id='.$assignment_id; ?>">
											<?php echo $row['class_name']; ?> 
											<?php echo $row['subject_code']; ?> 
									 
											</a>
										<hr>
										<div class="pull-right">
										<i class="icon-calendar"></i>&nbsp;<?php echo $row['date_of_notification']; ?> 
										</div>
											
									
											
											</div>
					<?php
					}
					?>

					
					</form>
						
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