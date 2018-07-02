<div class="bt-banner-grid">
  <?php if ($auto) { ?>
  <div id="bt-banner-grid<?php echo $module; ?>" class="row autogrid">
    <?php foreach($banners as $banner) { ?>
    <div class="col-sm-<?php echo (12/$per_row); ?>">
      <div class="banner-layout">
        <div class="effect <?php echo $banner['effect']; ?> "> <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>">
          <div class="img-caption">
            <div> <?php echo $banner['caption']; ?> </div>
            <a href="<?php echo ($banner['link']) ? $banner['link'] : 'javascript:void(0)'; ?>" title="<?php echo $banner['title']; ?>"><?php echo $banner['title']; ?></a> </div>
        </div>
        <?php if ($banner['title']) { ?>
        <div class="banner-title">
          <h2><?php echo $banner['title']; ?></h2>
        </div>
        <?php } ?>
      </div>
    </div>
    <?php } ?>
  </div>
  <?php } else { ?>
  <div id="bt-banner-grid<?php echo $module; ?>">
    <?php foreach (array_chunk($banners, $per_row) as $banners) { ?>
    <div class="row">
      <?php foreach($banners as $banner) { ?>
      <div class="col-sm-<?php echo (12/$per_row); ?>">
        <div class="banner-layout">
          <div class="effect <?php echo $banner['effect']; ?> "> <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>">
            <div class="img-caption">
              <div> <?php echo $banner['caption']; ?> </div>
              <a href="<?php echo ($banner['link']) ? $banner['link'] : 'javascript:void(0)'; ?>" title="<?php echo $banner['title']; ?>"><?php echo $banner['title']; ?></a> </div>
          </div>
          <?php if ($banner['title']) { ?>
          <div class="banner-title">
            <h2><?php echo $banner['title']; ?></h2>
          </div>
          <?php } ?>
        </div>
      </div>
      <?php } ?>
    </div>
    <?php } ?>
  </div>
  <?php } ?>
</div>
<?php if ($auto) { ?>
<script type="text/javascript">
$(window).load(function(){
	$('#bt-banner-grid<?php echo $module; ?>').masonry({
		itemSelector: '#bt-banner-grid<?php echo $module; ?> .col-sm-<?php echo (12/$per_row); ?>',
		columnWidth: '#bt-banner-grid<?php echo $module; ?> .col-sm-<?php echo (12/$per_row); ?>',
		percentPosition: true
	}).masonry('reloadItems');
});
</script>
<?php } ?>
