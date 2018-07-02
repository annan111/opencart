<?php if (!$rend_child) { ?>
<div class="box bt-category">
  <div id="submenu">
    <div class="box-heading">
      <h2><?php echo $heading_title; ?></h2>
    </div>
    <div class="box-content">
      <ul id="bt-category-<?php echo $module; ?>" class="box-category">
        <?php foreach ($categories as $category) { ?>
        <li<?php echo ($category['category_id'] == $category_id) ? ' class="expand"' : ''; ?>>
          <?php if ($category['category_id'] == $category_id) { ?>
          <a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>
          <?php } else { ?>
          <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
          <?php } ?>
          <?php echo $_this->rendChildrenCategories($category, 1); ?>
        </li>
        <?php } ?>
      </ul>
    </div>
  </div>
</div>
<script type="text/javascript">
$(function() {
	$('#bt-category-<?php echo $module; ?>').cutomAccordion({
		classExpand: 'expand',
		classArrow: 'hidden',
		menuClose: false,
		autoClose: true,
		saveState: false,
		disableLink: false,		
		autoExpand: true
	});
});
</script>
<?php } else { ?>
  <?php if ($category['children']) { ?>
  <ul class="item_child">
	<?php foreach ($category['children'] as $child) { ?>
	<li<?php echo ($child['category_id'] == $child_id) ? ' class="expand"' : ''; ?>>
      <span class="plus-minus"></span>
	  <?php if ($child['category_id'] == $child_id) { ?>
	  <a href="<?php echo $child['href']; ?>" class="active"><?php echo $child['name']; ?></a>
	  <?php } else { ?>
	  <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
	  <?php } ?>
      <?php echo $_this->rendChildrenCategories($child, $level); ?>
	</li>
	<?php } ?>
  </ul>
  <?php } ?>
<?php } ?>