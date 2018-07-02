<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>

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
  <div class="row"><?php echo $column_left; ?><?php echo $column_right; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1 class="heading-title"><?php echo $heading_title; ?></h1>
      <p><strong><?php echo $text_conditions ?></strong></p>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="testimonial">
        <div class="row">
          <div class="col-sm-6">
            <div class="form-group required">
              <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <span class="error"><?php echo $error_name; ?></span>
              <?php } ?>
            </div>
            <div class="form-group required">
              <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
              <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              <?php if ($error_email) { ?>
              <span class="error"><?php echo $error_email; ?></span>
              <?php } ?>
            </div>
            <div class="form-group">
              <label class="control-label" for="input-city"><?php echo $entry_city; ?></label>
              <input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
            </div>
          </div>
          <div class="col-sm-6">
            <div class="form-group required">
              <label class="control-label" for="input-title"><?php echo $entry_title; ?></label>
              <input type="text" name="title" value="<?php echo $title; ?>" placeholder="<?php echo $entry_title; ?>" id="input-title" class="form-control" />
              <?php if ($error_title) { ?>
              <span class="error"><?php echo $error_title; ?></span>
              <?php } ?>
            </div>
            <div class="form-group required">
              <label class="control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
              <textarea name="description" rows="6" placeholder="<?php echo $entry_enquiry; ?>" id="input-enquiry" class="form-control"><?php echo $description; ?></textarea>
              <?php if ($error_enquiry) { ?>
              <span class="error"><?php echo $error_enquiry; ?></span>
              <?php } ?>
            </div>
          </div>
          <div class="col-sm-12">
            <div class="form-group">
              <label class="control-label"><?php echo $entry_rating; ?></label>
              &nbsp; <span><?php echo $entry_bad; ?></span>&nbsp;
              <input type="radio" name="rating" value="1" style="margin: 0;" <?php if ( $rating == 1 ) echo 'checked="checked"';?> />
              &nbsp;
              <input type="radio" name="rating" value="2" style="margin: 0;" <?php if ( $rating == 2 ) echo 'checked="checked"';?> />
              &nbsp;
              <input type="radio" name="rating" value="3" style="margin: 0;" <?php if ( $rating == 3 ) echo 'checked="checked"';?> />
              &nbsp;
              <input type="radio" name="rating" value="4" style="margin: 0;" <?php if ( $rating == 4 ) echo 'checked="checked"';?> />
              &nbsp;
              <input type="radio" name="rating" value="5" style="margin: 0;" <?php if ( $rating == 5 ) echo 'checked="checked"';?> />
              &nbsp; <span><?php echo $entry_good; ?></span> </div>
          </div>
          <?php if ($captcha) { ?>
          <div class="form-group"> <?php echo $captcha; ?> </div>
          <?php } ?>
        </div>
        <div class="buttons">
          <button onclick="$('#testimonial').submit();" class="btn btn-primary pull-left"><span><?php echo $button_send; ?></span></button>
          <a href="<?php echo $showall_url;?>" class="btn btn-default pull-right"><span><?php echo $show_all; ?></span></a> </div>
      </form>
      <?php echo $content_bottom; ?> </div>
  </div>
</div>
<?php echo $footer; ?>