   <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">Add lecturer</div>
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
										
										  <div class="control-group">
											<label>Department:</label>
                                          <div class="controls">
                                            <select name="department"  class="" required>
                                             	<option></option>
											<?php
											$query = mysqli_query($connection, "SELECT * from department order by department_name");
											while($row = mysqli_fetch_array($query)){
											
											?>
											<option value="<?php echo $row['department_id']; ?>"><?php echo $row['department_name']; ?></option>
											<?php } ?>
                                            </select>
                                          </div>
                                        </div>
										
										<div class="control-group">
                                          <div class="controls">
                                            <input class="input focused" name="firstname" id="focusedInput" type="text" placeholder = "Firstname">
                                          </div>
                                        </div>
										
										<div class="control-group">
                                          <div class="controls">
                                            <input class="input focused" name="lastname" id="focusedInput" type="text" placeholder = "Lastname">
                                          </div>
                                        </div>
										
										
									
											<div class="control-group">
                                          <div class="controls">
												<button name="save" class="btn btn-info"><i class="icon-plus-sign icon-large"></i></button>

                                          </div>
                                        </div>
                                </form>
								</div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
					
					
					    <?php
                            if (isset($_POST['save'])) {
                           
                                $firstname = $_POST['firstname'];
                                $lastname = $_POST['lastname'];
                                $department_id = $_POST['department'];
								
								
								$query = mysqli_query($connection, "SELECT * from lecturer where firstname = '$firstname' and lastname = '$lastname' ")or die(mysqli_error($connection));
								$count = mysqli_num_rows($query);
								
								if ($count > 0){ ?>
								<script>
								alert('Data Already Exist');
								</script>
								<?php
								}else{

                                mysqli_query($connection, "INSERT INTO lecturer (firstname,lastname,location,department_id)
								values ('$firstname','$lastname','uploads/NO-IMAGE-AVAILABLE.jpg','$department_id')         
								") or die(mysqli_error($connection)); ?>
								<script>
							 	window.location = "lecturer.php"; 
								</script>
								<?php   }} ?>
						 
						 