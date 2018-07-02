<div class="bt-blog-tag-cloud box style-2">
  <div class="box-heading block-title">
    <h2><?php echo $heading_title; ?></h2>
  </div>
  <div class="box-content">
    <?php if($blogtagcloud) { ?>
    <?php echo $blogtagcloud; ?>
    <?php } else { ?>
    <?php echo $text_notags; ?>
    <?php } ?>
  </div>
</div>
