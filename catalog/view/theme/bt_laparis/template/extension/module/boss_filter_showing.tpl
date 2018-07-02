<div class="bt-filter-showing box style-1">
  <?php if ($heading_title || $description) { ?>
  <div class="box-heading">
    <?php if ($heading_title) { ?>
    <h2><?php echo $heading_title; ?></h2>
    <?php } ?>
    <?php if ($description) { ?>
    <div class="box-description"><?php echo $description; ?></div>
    <?php } ?>
  </div>
  <?php } ?>
  <div class="box-content">
    <div class="row">
      <?php foreach ($filters as $filter) { ?>
      <div class="col-lg-<?php echo (12/$column); ?> col-md-<?php echo (12/$column); ?> col-sm-<?php echo 12/(round($column/2)); ?> col-xs-12">
        <div class="filter-item">
          <div class="image"><a href="<?php echo $filter['href']; ?>" title="<?php echo $filter['name']; ?>">
            <?php if ($filter['image']) { ?>
            <img src="<?php echo $filter['image']; ?>" alt="<?php echo $filter['title']; ?>" />
            <?php } ?>
            </a></div>
          <div class="caption">
          	<div class="title"><a href="<?php echo $filter['href']; ?>" title="<?php echo $filter['name']; ?>"><?php echo $filter['title']; ?></a></div>
            <div class="name"><a href="<?php echo $filter['href']; ?>" title="<?php echo $filter['name']; ?>"><?php echo $filter['name']; ?></a></div>
          </div>
        </div>
      </div>
      <?php } ?>
    </div>
  </div>
</div>
