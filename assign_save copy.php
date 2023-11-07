<?php
include("dbcon.php");
include('session.php');
//Include database connection details
require("opener_db.php");
/* $errmsg_arr = array();
//Validation error flag
$errflag = false; */

$id_class=$_POST['id_class'];
$name=$_POST['name'];
$filedesc=$_POST['desc'];
$get_id  = $_GET['id'];
$assignment_id  = $_POST['id'];
$input_name = basename($_FILES['uploaded_file']['name']);
echo $input_name ;
 
//Function to sanitize values received from the form. Prevents SQL injection
/* function clean($str) {
    $str = @trim($str);
    if (get_magic_quotes_gpc()) {
        $str = stripslashes($str);
    }
    return mysqli_real_escape_string($str);
}

 */

if ($input_name == ""){

			$name_notification  = 'Add Assignment file name'." ".'<b>'.$name.'</b>';
	   
                mysqli_query($connection, "INSERT INTO student_assignment (student_assignment_id,fdesc,floc,assignment_fdatein,fname,assignment_id,student_id) VALUES (0,'$filedesc','$newname',NOW(),'$name','$assignment_id','$session_id')");
				 mysqli_query($connection, "INSERT INTO notification (lecturer_class_id,notification,date_of_notification,link) value('$get_id','$name_notification',NOW(),'assignment_student.php')")or die(mysqli_error($connection));               
?>            
			<script>
				window.location = 'assignment.php<?php echo '?id='.$get_id;  ?>';
			</script>
<?php
}else{

//upload random name/number
	$rd2 = mt_rand(1000, 9999) . "_File";
    $filename = basename($_FILES['uploaded_file']['name']);
    $ext = substr($filename, strrpos($filename, '.') + 1);
   
/*  	if ($filename == ""){
	  $newname = "";
	  $rd2 = ""
   } */ 
   $newname = "admin/uploads/" . $rd2 . "_" . $filename;
   
		$name_notification  = 'Add Assignment file name'." ".'<b>'.$name.'</b>';
        //Check if the file with the same name is already exists on the server

            //Attempt to move the uploaded file to it's new place
            (move_uploaded_file($_FILES['uploaded_file']['tmp_name'], $newname));
                //successful upload
                // echo "It's done! The file has been saved as: ".$newname;		   
                $qry2 = "INSERT INTO student_assignment (student_assignment_id,fdesc,floc,assignment_fdatein,fname,assignment_id,student_id) VALUES (0,'$filedesc','$newname',NOW(),'$name','$assignment_id','$session_id')";
				$query = mysqli_query($connection, "INSERT INTO notification (lecturer_class_id,notification,date_of_notification,link) value('$get_id','$name_notification',NOW(),'assignment_student.php')")or die(mysqli_error($connection));               
			   //$result = @mysqli_query($qry);
                $result2 = $connector->query($qry2);
                if ($result2) {
                    $errmsg_arr[] = 'record was saved in the database and the file was uploaded';
                    $errflag = true;
                    if ($errflag) {
                        $_SESSION['ERRMSG_ARR'] = $errmsg_arr;
                        session_write_close();
                        ?>

                     <script>
window.location = 'assignment.php<?php echo '?id='.$get_id;  ?>';
					</script>
                        <?php

                        exit();
                    }
                }
}
				?>