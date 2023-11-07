   <div class="row-fluid">
       <a href="lecturer.php" class="btn btn-info"><i class="icon-plus-sign icon-large"></i> Add lecturer</a>
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">Edit lecturer</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
								<form method="post">
								<!--
										<label>Photo:</label>
										<div class="control-group">
                                          <div class="controls">
                                               <input class="input-file uniform_on" id="fileInput" type="file" required>
                                          </div>
                                        </div>
									-->	
									<?php
									$query = mysqli_query($connection, "SELECT * from lecturer where lecturer_id = '$get_id' ")or die(mysqli_error($connection));
									$row = mysqli_fetch_array($query);
									?>
										
										  <div class="control-group">
											<label>Department:</label>
                                          <div class="controls">
                                            <select name="department"  class="chzn-select"required>
											<?php
											$query_lecturer = mysqli_query($connection, "SELECT * from lecturer join  department")or die(mysqli_error($connection));
											$row_lecturer = mysqli_fetch_array($query_lecturer);
											
											?>
											
                                             	<option value="<?php echo $row_lecturer['department_id']; ?>">
												<?php echo $row_lecturer['department_name']; ?>
												</option>
											<?php
											$department = mysqli_query($connection, "SELECT * from department order by department_name");
											while($department_row = mysqli_fetch_array($department)){
											
											?>
											<option value="<?php echo $department_row['department_id']; ?>"><?php echo $department_row['department_name']; ?></option>
											<?php } ?>
                                            </select>
                                          </div>
                                        </div>
										
										<div class="control-group">
                                          <div class="controls">
                                            <input class="input focused" value="<?php echo $row['firstname']; ?>" name="firstname" id="focusedInput" type="text" placeholder = "Firstname">
                                          </div>
                                        </div>
										
										<div class="control-group">
                                          <div class="controls">
                                            <input class="input focused" value="<?php echo $row['lastname']; ?>"  name="lastname" id="focusedInput" type="text" placeholder = "Lastname">
                                          </div>
                                        </div>
										
										
									
											<div class="control-group">
                                          <div class="controls">
												<button name="update" class="btn btn-success"><i class="icon-save icon-large"></i></button>

                                          </div>
                                        </div>
                                </form>
								</div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
					
					
				   <?php
                            if (isset($_POST['update'])) {
                       
                                $firstname = $_POST['firstname'];
                                $lastname = $_POST['lastname'];
                                $department_id = $_POST['department'];
								
								
								$query = mysqli_query($connection, "SELECT * from lecturer where firstname = '$firstname' and lastname = '$lastname' ")or die(mysqli_error($connection));
								$count = mysqli_num_rows($query);
								
								if ($count > 1){ ?>
								<script>
								alert('Data Already Exist');
								</script>
								<?php
								}else{
								
								mysqli_query($connection, "UPDATE lecturer set firstname = '$firstname' , lastname = '$lastname' , department_id = '$department_id' where lecturer_id = '$get_id' ")or die(mysqli_error($connection));	
								
								?>
								<script>
							 	window.location = "lecturer.php"; 
								</script>
								<?php   }} ?>
						 
						 