<?php
include('admin/dbcon.php'); 
include('session.php'); 

if (isset($_POST['discussion_id']) && isset($_POST['reply_content']) && isset($_POST['sender_name'])) {
    $discussionID = $_POST['discussion_id'];
    $replyContent = $_POST['reply_content'];
    $senderName = $_POST['sender_name'];

    $insertReplyQuery = mysqli_query($connection, "INSERT INTO discussion_replies (discussion_id, student_id, lecturer_id, reply_content, date_replied)
        VALUES ('$discussionID', '$session_id', '$session_id', '$replyContent', NOW())") or die(mysqli_error($connection));

    if ($insertReplyQuery) {
        // Query was successful, return the HTML for the newly posted reply with sender's name
        $replyHTML = '<div class="reply">';
        $replyHTML .= '<strong>' . $senderName . ':</strong> ' . $replyContent . '<hr>';
        $replyHTML .= '<strong><i class="icon-calendar"></i> ' . date('Y-m-d H:i:s') . '</strong>';
        $replyHTML .= '</div>';

        echo $replyHTML;
    }
}
?>