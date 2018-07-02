<?php echo $header; ?>

<div class="bt-breadcrumb">
  <div class="container">
    <ul class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"><span itemprop="title"><?php echo $breadcrumb['text']; ?></span></a></li>
      <?php } ?>
    </ul>
  </div>
</div>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1 class="heading-title"><?php echo $heading_title; ?></h1>
      <?php if ($testimonials) { ?>
      <?php foreach ($testimonials as $testimonial) { ?>
      <div class="testimonial-item">
        <div class="testimonial-content">
          <div class="title"><?php echo $testimonial['title']; ?></div>
          <div class="description"> <?php echo $testimonial['description']; ?> </div>
          <div class="arrow col-sm-push-1"></div>
        </div>
        <div class="testimonial-heading col-xs-offset-1">
          <div class="image"> <img src="<?php echo $testimonial['avatar']; ?>" alt="<?php echo $testimonial['name']; ?>" title="<?php echo $testimonial['name']; ?>"/> </div>
          <div class="user">
            <div class="name"><?php echo $testimonial['name']; ?></div>
            <div class="city"><?php echo $testimonial['city']; ?></div>
            <div class="date-added"><?php echo $testimonial['date_added']; ?></div>
          </div>
        </div>
      </div>
      <?php } ?>
      <?php if ( isset($pagination)) { ?>
      <div class="pagination-result">
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $results; ?></div>
          <div class="col-sm-6 text-right"><?php echo $pagination; ?></div>
        </div>
      </div>
      <?php }?>
      <div class="buttons"> <a class="btn btn-primary pull-left" href="<?php echo $write_url;?>" title="<?php echo $write;?>"><?php echo $write;?></a>
        <?php if (isset($showall_url)) { ?>
        <a class="btn btn-default pull-right" href="<?php echo $showall_url;?>" title="<?php echo $showall;?>"><?php echo $showall;?></a>
        <?php }?>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?> </div>
</div>
<?php echo $footer; ?> 