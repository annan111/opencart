<?php if ($comments) { ?>
<div id="allcomments">
  <?php foreach($comments as $comment){?>
  <div class="comment-item">
    <div class="comment-header"> 
      <!--<div class="comment-by"><?php echo $text_comment_by;?></div>-->
      <div class="comment-author">
        <div class="comment-name"><?php echo $comment['author'];?></div>
        <div class="comment-time"><?php echo $comment['date_added'];?></div>
      </div>
    </div>
    <div class="comment-body"> <?php echo $comment['text'];?>
    </div>
  </div>
  <?php } ?>
</div>
<?php } else { ?>
<div class="allcomments"><p><?php echo $text_no_comments; ?></p></div>
<?php } ?>
<script type="text/javascript"><!--
$('#article-comments .pagination a').on('click', function() {
	$('#article-comments').fadeOut('slow');
		
	$('#article-comments').load(this.href);
	
	$('#article-comments').fadeIn('slow');
	
	return false;
});	
</script> 