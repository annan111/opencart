<div class="box block bt-blog-category">
  <div class="box-heading block-title">
    <h2><?php echo $heading_title; ?></h2>
  </div>
  <div class="box-content">
      <?php if($categories){?>
      <ul class="box-category" id="bt-blog-category-<?php echo $module; ?>">
        <?php foreach ($categories as $category) { ?>
        <?php $icon=0; ?>
        <li class="" >
          <?php if ($category['blog_category_id'] == $blog_category_id) { ?>
          <a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?> <span><?php echo $category['total']; ?></span></a>
          <?php if ($category['children']) { echo '<span class="plus"></span>' ;}?>
          <?php } else { ?>
          <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?> <span><?php echo $category['total']; ?></span></a>
          <?php if ($category['children']) { echo '<span class="plus"></span>';} ?>
          <?php } ?>
          <?php if ($category['children']) { ?>
          <ul class="item_child">
            <?php foreach ($category['children'] as $child) { ?>
            <?php if ($child['blog_category_id'] == $child_id) { ?>
            <li class="active"><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?> <span><?php echo $child['total']; ?></span></a></li>
            <?php } else { ?>
            <li><a href="<?php echo $child['href']; ?>"> <?php echo $child['name']; ?> <span><?php echo $child['total']; ?></span></a></li>
            <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
      </ul>
      <?php } else {?>
      <?php echo 'There are no Category.'; ?>
      <?php } ?>
  </div>
</div>
<script type="text/javascript">
$(function() {
	$('#bt-blog-category-<?php echo $module; ?>').cutomAccordion({
		classExpand : 'opencate',
		menuClose: false,
		autoClose: true,
		saveState: false,
		disableLink: false,		
		autoExpand: true
	});
});
</script>