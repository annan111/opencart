<?php require_once(DIR_SYSTEM . 'library/btform.php');?>
<?php 
$btform = new Btform();
?>
<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-boss_featured" class="form-horizontal">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
        </div>
        <div class="panel-body">
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>
            <div class="col-sm-10"><?php echo $btform->textField('name',isset($name) ? $name : '',3,'class="form-control"'); ?></div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
            <div class="col-sm-10"><?php echo $btform->makeSelectHTML($status_values, 'status', '', isset($status) ? $status : '','class="form-control"'); ?></div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $text_get_product; ?></label>
            <div class="col-sm-10"><?php echo $btform->makeSelectHTML($filter_types, 'type_product',"",isset($type_product)?$type_product:'', 'class="form-control"'); ?>
              <div id="bt_featured">
                <input type="text" name="featured" value="" placeholder="<?php echo $entry_product; ?>" id="input-product-featured" class="form-control" />
                <div id="product-featured" class="well well-sm" style="height: 150px; overflow: auto;">
                  <?php foreach ($products as $product) { ?>
                  <div id="product-featured<?php echo $product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product['name']; ?>
                    <input type="hidden" name="product_featured[]" value="<?php echo $product['product_id']; ?>" />
                  </div>
                  <?php } ?>
                </div>
              </div>
              <div id="bt_category">
                <input type="text" name="category" value="<?php echo $category_name; ?>" placeholder="<?php echo $entry_category; ?>" id="input-category" class="form-control" />
                <input type="hidden" name="category_id" value="<?php echo $category_id; ?>" />
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>
            <div class="col-sm-5"><?php echo $btform->textField('image_width',isset($image_width) ? $image_width : '',3,'class="form-control"'); ?>
              <?php if ($error_width) { ?>
              <div class="text-danger"><?php echo $error_width; ?></div>
              <?php } ?>
            </div>
            <div class="col-sm-5"><?php echo $btform->textField('image_height',isset($image_height) ? $image_height : '',3,'class="form-control"'); ?>
              <?php if ($error_height) { ?>
              <div class="text-danger"><?php echo $error_height; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_limit; ?></label>
            <div class="col-sm-10"><?php echo $btform->textField('limit',isset($limit) ? $limit : '',3,'class="form-control"'); ?></div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_column; ?></label>
            <div class="col-sm-10"><?php echo $btform->makeSelectHTML($column_values, 'column', '', isset($column) ? $column : '','class="form-control"'); ?></div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_scroll; ?></label>
            <div class="col-sm-10">
              <div class="form-group">
                <label class="col-sm-2 control-label">Show Slider</label>
                <div class="col-sm-8"><?php echo $btform->makeSelectHTML($status_values, 'show_slider','',isset($show_slider) ? $show_slider : '','class="form-control"'); ?></div>
              </div>
              <div class="form-group">
                <div class="col-sm-6">
                  <label class="col-sm-4 control-label"><?php echo $entry_row; ?></label>
                  <div class="col-sm-8"><?php echo $btform->textField('num_row',isset($num_row) ? $num_row : '',9,'class="form-control"'); ?></div>
                </div>
                <div class="col-sm-6">
                  <label class="col-sm-4 control-label"><?php echo $entry_properrow; ?></label>
                  <div class="col-sm-8"><?php echo $btform->textField('per_row',isset($per_row) ? $per_row : '',10,'class="form-control"'); ?></div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_pagination; ?></label>
                <div class="col-sm-10"><?php echo $btform->makeSelectHTML($status_values, 'pagination', '', isset($pagination) ? $pagination : '', 'class="form-control"'); ?></div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_center; ?></label>
                <div class="col-sm-10"><?php echo $btform->makeSelectHTML($status_values, 'center', '', isset($center) ? $center : '', 'class="form-control"'); ?></div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_prolarge; ?></label>
            <div class="col-sm-10">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_show_prolarge; ?>: </label>
                <div class="col-sm-10"><?php echo $btform->makeSelectHTML($status_values, 'show_pro_large', '', isset($show_pro_large) ? $show_pro_large : true, 'class="form-control"'); ?></div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_get_prolarge; ?>:&nbsp;&nbsp;</label>
                <div class="col-sm-10">
                  <input type="text" name="product_name" value="<?php echo $product_name; ?>" placeholder="<?php echo $entry_product; ?>" id="input-product" class="form-control" />
                  <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_img_large; ?>&nbsp;&nbsp; </label>
                <div class="col-sm-5"><?php echo $btform->textField('img_width', isset($img_width) ? $img_width : '380', 3, 'class="form-control"'); ?></div>
                <div class="col-sm-5"><?php echo $btform->textField('img_height', isset($img_height) ? $img_height : '380', 3, 'class="form-control"'); ?></div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_add_img_large; ?>&nbsp;&nbsp; </label>
                <div class="col-sm-5"><?php echo $btform->textField('add_img_width', isset($add_img_width) ? $add_img_width : '100' , 3, 'class="form-control"'); ?></div>
                <div class="col-sm-5"><?php echo $btform->textField('add_img_height', isset($add_img_height) ? $add_img_height : '100' , 3, 'class="form-control"'); ?></div>
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
            <label class="col-sm-2 control-label"><?php echo $entry_title; ?></label>
            <div class="col-sm-10">
              <?php foreach ($languages as $language) { ?>
              <div class="input-group"> <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                <input type="text" name="title[<?php echo $language['language_id']; ?>]" value="<?php echo (isset($title[$language['language_id']])) ? $title[$language['language_id']] : ''; ?>" class="form-control">
              </div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_description; ?></label>
            <div class="col-sm-10">
              <ul class="nav nav-tabs">
                <?php foreach ($languages as $language) { ?>
                <li><a href="#input-description-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" subject="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                <?php } ?>
              </ul>
              <div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="input-description-<?php echo $language['language_id']; ?>">
                  <textarea name="description[<?php echo $language['language_id']; ?>]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($description[$language['language_id']]) ? $description[$language['language_id']] : ''; ?></textarea>
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_banner_left; ?></h3>
        </div>
        <div class="panel-body">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner-left"><?php echo $entry_banner_left; ?></label>
            <div class="col-sm-10"> <a href="" id="thumb-image-banner-left" data-toggle="image" class="img-thumbnail"><img src="<?php echo $banner_left['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
              <input type="hidden" name="banner_left[image]" value="<?php echo $banner_left['image']; ?>" placeholder="<?php echo $entry_banner_left; ?>" id="input-banner-left" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner-left-link"><?php echo $entry_banner_left_link; ?></label>
            <div class="col-sm-10">
              <input type="text" name="banner_left[link]" value="<?php echo $banner_left['link']; ?>" placeholder="<?php echo $entry_banner_left_link; ?>" id="input-banner-left-link" class="form-control" />
            </div>
          </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_banner_right; ?></h3>
        </div>
        <div class="panel-body">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner-right"><?php echo $entry_banner_right; ?></label>
            <div class="col-sm-10"> <a href="" id="thumb-image-banner-right" data-toggle="image" class="img-thumbnail"><img src="<?php echo $banner_right['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
              <input type="hidden" name="banner_right[image]" value="<?php echo $banner_right['image']; ?>" placeholder="<?php echo $entry_banner_right; ?>" id="input-banner-right" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner-right-link"><?php echo $entry_banner_right_link; ?></label>
            <div class="col-sm-10">
              <input type="text" name="banner_right[link]" value="<?php echo $banner_right['link']; ?>" placeholder="<?php echo $entry_banner_right_link; ?>" id="input-banner-right-link" class="form-control" />
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>
</div>
<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/summernote/opencart.js"></script> 
<script type="text/javascript">
$('#content .nav-tabs li:first-child a').each(function(index, element) {
    $(this).tab('show');
});
</script> 
<script type="text/javascript"><!--
$('select[name="type_product"]').on('change', function() {
	if ($(this).val() == 'category') {
		$('#bt_featured').css('display', 'none');
		$('#bt_category').css('display', '');
	}else if ($(this).val() == 'featured') {
		$('#bt_featured').css('display', '');
		$('#bt_category').css('display', 'none');
	}else {
		$('#bt_featured').css('display', 'none');
		$('#bt_category').css('display', 'none');
	}
});

$('select[name="type_product"]').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$('input[name=\'featured\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'product-featured\']').val('');

		$('#product-featured' + item['value']).remove();

		$('#product-featured').append('<div id="product-featured' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_featured[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-featured').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

// Category
$('input[name=\'category\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					category_id: 0,
					name: '<?php echo $text_none; ?>'
				});

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
		$('input[name=\'category\']').val(item['label']);
		$('input[name=\'category_id\']').val(item['value']);
	}
});

// Related
$('input[name=\'product_name\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					product_id: 0,
					name: '<?php echo $text_none; ?>'
				});

				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'product_name\']').val(item['label']);
		$('input[name=\'product_id\']').val(item['value']);
	}
});
//--></script> 
<?php echo $footer; ?> 