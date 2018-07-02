<div class="bt-tagcloud box style-2">
    <div class="box-heading">
	   <h2><?php echo $heading_title; ?></h2>
    </div>
    <div class="box-content"> 
		<?php if($boss_tagcloud) { ?>
		  <?php echo $boss_tagcloud; ?>
		<?php } else { ?>
		  <?php echo $text_notags; ?>
		<?php } ?>
    </div>
</div>
