<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
<div class="page-header">
  <div class="container-fluid">
    <div class="pull-right">
      <button type="submit" form="form-boss_category" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
      <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
    <h1><?php echo $heading_title; ?></h1>
    <ul class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
</div>
<div class="container-fluid">
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title">
      <i class="fa fa-pencil"></i> <?php echo $heading_title; ?> </div>
    <div class="panel-body">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-boss-carousel" class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
          <div class="col-sm-10">
            <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
            <?php if ($error_name) { ?>
            <div class="text-danger"><?php echo $error_name; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-title"><?php echo $entry_title; ?></label>
          <div class="col-sm-10">
            <?php foreach ($languages as $language) { ?>
            <div class="input-group"> <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
              <input name="title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($title[$language['language_id']]) ? $title[$language['language_id']] : ''; ?>" class="form-control" />
            </div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><?php echo $entry_banner; ?></label>
          <div class="col-sm-10">
            <select name="banner_id" class="form-control">
              <?php foreach ($banners as $banner) { ?>
              <?php if (isset($banner_id) && $banner['banner_id'] == $banner_id) { ?>
              <option value="<?php echo $banner['banner_id']; ?>" selected="selected"><?php echo $banner['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $banner['banner_id']; ?>"><?php echo $banner['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><?php echo $entry_limit; ?></label>
          <div class="col-sm-10">
            <input type="text" name="limit" value="<?php echo isset($limit)?$limit:''; ?>" class="form-control" />
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><?php echo $entry_num_row; ?></label>
          <div class="col-sm-10">
            <input type="text" name="num_row" value="<?php echo isset($num_row)?$num_row:''; ?>" class="form-control" />
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><?php echo $entry_img_row; ?></label>
          <div class="col-sm-10">
            <input type="text" name="img_row" value="<?php echo isset($img_row)?$img_row:''; ?>" class="form-control" />
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><?php echo $entry_image_width; ?></label>
          <div class="col-sm-10">
            <input type="text" name="image_width" value="<?php echo isset($image_width)?$image_width:''; ?>" class="form-control" />
            <?php if ($error_width) { ?>
            <div class="text-danger"><?php echo $error_width; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><?php echo $entry_image_height; ?></label>
          <div class="col-sm-10">
            <input type="text" name="image_height" value="<?php echo isset($image_height)?$image_height:''; ?>" class="form-control" />
            <?php if ($error_height) { ?>
            <div class="text-danger"><?php echo $error_height; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-center"><?php echo $entry_center; ?></label>
          <div class="col-sm-10">
            <select name="center" id="input-center" class="form-control">
              <?php if ($center) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-style"><?php echo $entry_style; ?></label>
          <div class="col-sm-10">
            <select name="style" id="input-style" class="form-control">
              <option value="normal" <?php echo ($style == 'normal') ? 'selected="selected"' : ''; ?>><?php echo $text_normal; ?></option>
              <option value="flip" <?php echo ($style == 'flip') ? 'selected="selected"' : ''; ?>><?php echo $text_flip; ?></option>
              <option value="vertical" <?php echo ($style == 'vertical') ? 'selected="selected"' : ''; ?>><?php echo $text_vertical; ?></option>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-auto"><?php echo $entry_auto; ?></label>
          <div class="col-sm-10">
            <select name="auto" id="input-auto" class="form-control">
              <?php if ($auto) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-time"><?php echo $entry_time; ?></label>
          <div class="col-sm-10">
            <select name="time" id="input-time" class="form-control">
              <option value="1" <?php echo ($time == '1') ? 'selected="selected"' : ''; ?>>1</option>
              <option value="2" <?php echo ($time == '2') ? 'selected="selected"' : ''; ?>>2</option>
			  <option value="3" <?php echo ($time == '3') ? 'selected="selected"' : ''; ?>>3</option>
			  <option value="4" <?php echo ($time == '4') ? 'selected="selected"' : ''; ?>>4</option>
			  <option value="5" <?php echo ($time == '5') ? 'selected="selected"' : ''; ?>>5</option>
			  <option value="7" <?php echo ($time == '7') ? 'selected="selected"' : ''; ?>>7</option>
			  <option value="10" <?php echo ($time == '10') ? 'selected="selected"' : ''; ?>>10</option>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-navigation"><?php echo $entry_navigation; ?></label>
          <div class="col-sm-10">
            <select name="navigation" id="input-navigation" class="form-control">
              <?php if ($navigation) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-pagination"><?php echo $entry_pagination; ?></label>
          <div class="col-sm-10">
            <select name="pagination" id="input-pagination" class="form-control">
              <?php if ($pagination) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-layout-width"><?php echo $entry_layout_width; ?></label>
          <div class="col-sm-10">
            <select name="layout_width" id="input-layout-width" class="form-control">
              <option value="full-width" <?php echo ($layout_width == 'full-width') ? 'selected="selected"' : ''; ?>><?php echo $text_full_width; ?></option>
              <option value="fix-1170" <?php echo ($layout_width == 'fix-1170') ? 'selected="selected"' : ''; ?>><?php echo $text_fix_1170; ?></option>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-opacity"><?php echo $entry_opacity; ?></label>
          <div class="col-sm-10">
            <select name="opacity" id="input-opacity" class="form-control">
              <?php if ($opacity) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
          <div class="col-sm-10">
            <select name="status" id="input-status" class="form-control">
              <?php if ($status) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#input-auto').on('change', function() {
	if ($(this).val() == '1') {
		$('#input-time').parents('.form-group').show();
	} else {
		$('#input-time').parents('.form-group').hide();
	}
});
$('#input-auto').change();
//--></script> 
<?php echo $footer; ?>