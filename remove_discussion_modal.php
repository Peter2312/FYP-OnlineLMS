<!-- Modal for Removing Discussion Board Posts -->
<div id="removeDiscussionModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
        <h3 id="myModalLabel">Remove Discussion</h3>
    </div>
    <div class="modal-body">
        <div class="alert alert-danger">
            Are you sure you want to remove this discussion from your class?
        </div>
    </div>
    <div class="modal-footer">
        <form id="removeDiscussionForm" method="post" action="remove_discussion.php">
            <input type="hidden" name="discussion_id" id="discussionIdToRemove" value="">
            <button class="btn" aria-hidden="true"><i class="icon-remove icon-large"></i> Close</button>
            <button id="removeDiscussionBtn" class="btn btn-danger remove"><i class="icon-check icon-large"></i> Yes</button>
        </form>
    </div>
</div>
