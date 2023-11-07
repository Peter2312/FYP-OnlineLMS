 <?php
 include('admin/dbcon.php');
 include('session.php');
 
 
                            if (isset($_POST['change'])) {
                               

                                $image = addslashes(file_get_contents($_FILES['image']['tmp_name']));
                                $image_name = addslashes($_FILES['image']['name']);
                                $image_size = getimagesize($_FILES['image']['tmp_name']);

                                move_uploaded_file($_FILES["image"]["tmp_name"], "admin/uploads/" . $_FILES["image"]["name"]);
                                $location = "uploads/" . $_FILES["image"]["name"];
								
								mysqli_query($connection, "UPDATE  lecturer set location = '$location' WHERE lecturer_id  = '$session_id' ")or die(mysqli_error($connection));
								
								?>
 
								<script>
								window.location = "dashboard_lecturer.php";  
								</script>

                       <?php     }  ?>