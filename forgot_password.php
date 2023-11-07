<!DOCTYPE html>
<html>
<head>
    <title>FORGOT PASSWORD</title>
</head>
<body>
    <h2>Forgot Password</h2>
    <form action="forgot_password.php" method="post">
        <label for="email">Enter your email:</label>
        <input type="email" name="email" required>
        <button type="submit" name="reset_password">Reset Password</button>
    </form>
</body>
</html>

<?php
include("admin/dbcon.php");
require 'vendor/autoload.php'; // Include the Composer autoloader
require 'config.php'; // Include the configuration file


use PHPMailer\PHPMailer\PHPMailer;

$mail = new PHPMailer();


// Email Configuration
$mail->isSMTP(); // Set mailer to use SMTP
$mail->Host = SMTP_HOST; // Specify the SMTP server
$mail->Port = SMTP_PORT; // Specify the SMTP port
$mail->SMTPSecure = SMTP_SECURE; // Enable encryption, 'ssl' also accepted
$mail->SMTPAuth = SMTP_AUTH; // Enable SMTP authentication
$mail->Username = SMTP_USERNAME; // Gmail email address
$mail->Password = SMTP_PASSWORD; // Gmail password

// Create a dynamic "From" address
$noReplyEmail = NO_REPLY_EMAIL; // Replace with domain
$mail->setFrom($noReplyEmail, 'No Reply');

if (isset($_POST['reset_password'])) {
    $email = $_POST['email'];
    $temporary_password = bin2hex(random_bytes(8));
    $hashed_password = password_hash($temporary_password, PASSWORD_DEFAULT);

    // Database connection 
    $host = 'localhost';
    $user = 'root';
    $password = '';
    $db = 'lms_db';
    $port = 3308;

    $connection = mysqli_connect($host, $user, $password, $db, $port);

    if (!$connection) {
        die("Connection failed: " . mysqli_connect_error());
    }

    // Check if the email exists in the student table
    $query = "SELECT email FROM student WHERE email = '$email'";
    $result = mysqli_query($connection, $query);

    if (mysqli_num_rows($result) == 1) {
        $update_query = "UPDATE student SET password = '$hashed_password' WHERE email = '$email'";

        if (mysqli_query($connection, $update_query)) {
            sendEmail($email, $temporary_password);
            echo "A temporary password has been sent to your email. Please check your inbox and spam folder.";
        } else {
            echo "Password reset failed for students. Please try again later.";
        }
    }

    // Check if the email exists in the lecturer table
    $query = "SELECT email FROM lecturer WHERE email = '$email'";
    $result = mysqli_query($connection, $query);

    if (mysqli_num_rows($result) == 1) {
        $update_query = "UPDATE lecturer SET password = '$hashed_password' WHERE email = '$email'";

        if (mysqli_query($connection, $update_query)) {
            sendEmail($email, $temporary_password);
            echo "A temporary password has been sent to your email. Please check your inbox and spam folder.";
        } else {
            echo "Password reset failed for lecturers. Please try again later.";
        }
    }

    // Close the database connection
    mysqli_close($connection);
}

function sendEmail($to, $temporary_password) {
   
    // Create a new PHPMailer instance
    $mail = new PHPMailer();

    // Email Configuration
    $mail->isSMTP(); // Set mailer to use SMTP
    $mail->Host = SMTP_HOST; // Specify the SMTP server
    $mail->Port = SMTP_PORT; // Specify the SMTP port
    $mail->SMTPSecure = SMTP_SECURE; // Enable encryption, 'ssl' also accepted
    $mail->SMTPAuth = SMTP_AUTH; // Enable SMTP authentication
    $mail->Username = SMTP_USERNAME; // Gmail email address
    $mail->Password = SMTP_PASSWORD; // Gmail password

    // Create a dynamic "From" address
    $noReplyEmail = NO_REPLY_EMAIL; // Replace with domain
    $mail->setFrom($noReplyEmail, 'No Reply');

    // Recipient
    $mail->addAddress($to);

    // Email content
    $mail->isHTML(true);
    $mail->Subject = 'Password Reset';
    $mail->Body = 'Your temporary password is: ' . $temporary_password;

    // Send the email
    if ($mail->send()) {
        //Display success message
    } else {
        echo 'Error sending the password reset email: ' . $mail->ErrorInfo;
    }
}
