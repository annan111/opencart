<?php require_once(DIR_SYSTEM . 'library/btform.php'); $btform = new Btform();?>
<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-bestseller" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-boss_procate" class="form-horizontal">
          <div id="moduletab">
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
                <div class="input-group"> <span class="input-group-addon"> <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
                  <input type="text" name="title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($title[$language['language_id']])?$title[$language['language_id']]:''; ?>" placeholder="<?php echo $entry_title; ?>" id="input-title" class="form-control" />
                </div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-category"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_category; ?></span></label>
              <div class="col-sm-10">
                <input type="text" name="_category" value="" placeholder="<?php echo $entry_category; ?>" id="input-category" class="form-control" />
                <div id="category" class="well well-sm" style="height: 150px; overflow: auto;">
                  <?php foreach ($categories as $category) { ?>
                  <div id="category<?php echo $category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $category['name']; ?>
                    <input type="hidden" name="category[]" value="<?php echo $category['category_id']; ?>" />
                  </div>
                  <?php } ?>
                </div>
                <?php if ($error_category) { ?>
                <div class="text-danger"><?php echo $error_category; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-background"><?php echo $entry_background; ?></label>
              <div class="col-sm-10">
                <div class="image"> <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo isset($bg_thumb)?$bg_thumb:$placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                  <input type="hidden" name="bg_image" value="<?php echo isset($bg_image)?$bg_image:''; ?>" id="input-image" />
                </div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>
              <div class="col-sm-10">
                <div class="row">
                  <div class="col-sm-6"><?php echo $btform->textField('image_width',isset($image_width) ? $image_width : '',3,'class="form-control"'); ?>
                    <?php if ($error_width) { ?>
                    <div class="text-danger"><?php echo $error_width; ?></div>
                    <?php } ?>
                  </div>
                  <div class="col-sm-6"><?php echo $btform->textField('image_height',isset($image_height) ? $image_height : '',3,'class="form-control"'); ?>
                    <?php if ($error_height) { ?>
                    <div class="text-danger"><?php echo $error_height; ?></div>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $entry_limit; ?></label>
              <div class="col-sm-10"><?php echo $btform->textField('limit',isset($limit) ? $limit : '',3,'class="form-control"'); ?>
                <?php if (isset($error_per_row)) { ?>
                <span class="error"><?php echo $error_per_row; ?></span>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $entry_column; ?></label>
              <div class="col-sm-10"><?php echo $btform->makeSelectHTML($column_values, 'column', '', isset($column) ? $column : '','class="form-control"'); ?></div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $entry_scrolling; ?></label>
              <div class="col-sm-10">
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $entry_show_slide; ?></label>
                  <div class="col-sm-10"><?php echo $btform->makeSelectHTML($status_values, 'show_slider','',isset($show_slider) ? $show_slider : '','class="form-control"'); ?></div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $entry_num_row; ?></label>
                  <div class="col-sm-10"><?php echo $btform->textField('num_row',isset($num_row) ? $num_row : '',3,'class="form-control"'); ?></div>
                  <?php if (isset($error_num_row)) { ?>
                  <span class="error"><?php echo $error_num_row; ?></span>
                  <?php } ?>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $entry_per_row; ?></label>
                  <div class="col-sm-10"><?php echo $btform->makeSelectHTML($column_values, 'per_row', '', isset($per_row) ? $per_row : '3', 'class="form-control"'); ?></div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $entry_product_layout; ?></label>
              <div class="col-sm-10"><?php echo $btform->makeSelectHTML($product_layout_values, 'product_layout', '', isset($product_layout) ? $product_layout : '','class="form-control"'); ?></div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $entry_position; ?></label>
              <div class="col-sm-10"><?php echo $btform->makeSelectHTML($position_values, 'position', '', isset($position) ? $position : '','class="form-control"'); ?></div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
              <div class="col-sm-10"><?php echo $btform->makeSelectHTML($status_values, 'status', '', isset($status) ? $status : '','class="form-control"'); ?></div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
// Category
$('input[name=\'_category\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'_category\']').val('');

		$('#category' + item['value']).remove();

		$('#category').append('<div id="category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="category[]" value="' + item['value'] + '" /></div>');
	}
});

$('#category').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
</script> 
<?php echo $footer; ?>