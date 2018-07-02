<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-boss-product-showing" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-boss-product-showing" class="form-horizontal">
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
            <label class="col-sm-2 control-label" for="input-product"><span data-toggle="tooltip" title="<?php echo $help_product; ?>"><?php echo $entry_product; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="product_name" value="<?php echo $product_name; ?>" placeholder="<?php echo $entry_product; ?>" id="input-product" class="form-control" />
              <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
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
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-attribute" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
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
            <div class="tab-pane" id="tab-attribute">
              <table id="attribute" class="table table-striped table-bordered table-hover">
                <thead>
                  <tr>
                    <td class="text-left required"><?php echo $entry_title; ?></td>
                    <td class="text-right"><?php echo $entry_image; ?></td>
                    <td class="text-left"><?php echo $entry_sort_order; ?></td>
                    <td></td>
                  </tr>
                </thead>
                <tbody>
                  <?php $attribute_row = 0; ?>
                  <?php foreach ($attributes as $attribute) { ?>
                  <tr id="attribute-row<?php echo $attribute_row; ?>">
                    <td class="text-left" style="width: 70%;">
                      <?php foreach ($languages as $language) { ?>
                      <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                        <input type="text" name="attribute[<?php echo $attribute_row; ?>][attribute_description][<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($attribute['attribute_description'][$language['language_id']]) ? $attribute['attribute_description'][$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" class="form-control" />
                      </div>
                      <?php if (isset($error_attribute[$attribute_row][$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_attribute[$attribute_row][$language['language_id']]; ?></div>
                      <?php } ?>
                      <?php } ?></td>
                    <td class="text-left"><a href="" id="thumb-image<?php echo $attribute_row; ?>" data-toggle="image" class="img-thumbnail"> <img src="<?php echo $attribute['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /> </a> <input type="hidden" name="attribute[<?php echo $attribute_row; ?>][image]" value="<?php echo $attribute['image']; ?>" id="input-image<?php echo $attribute_row; ?>" /></td>
                    <td class="text-left"><input type="text" name="attribute[<?php echo $attribute_row; ?>][sort_order]" value="<?php echo $attribute['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" /></td>
                    <td class="text-right"><button type="button" onclick="$('#attribute-row<?php echo $attribute_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                  </tr>
                  <?php $attribute_row++; ?>
                  <?php } ?>
                </tbody>
                <tfoot>
                  <tr>
                    <td colspan="3"></td>
                    <td class="text-right"><a onclick="addFilterRow();" data-toggle="tooltip" title="<?php echo $button_attribute_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></a></td>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>
        </form>
      </div>
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
var attribute_row = <?php echo $attribute_row; ?>;

function addFilterRow() {
	html  = '<tr id="attribute-row' + attribute_row + '">';	
    html += '  <td class="text-left" style="width: 70%;">';
	<?php foreach ($languages as $language) { ?>
	html += '  <div class="input-group">';
	html += '    <span class="input-group-addon"><img src="language/<?php echo $language["code"]; ?>/<?php echo $language["code"]; ?>.png" title="<?php echo $language["name"]; ?>" /></span><input type="text" name="attribute[' + attribute_row + '][attribute_description][<?php echo $language["language_id"]; ?>][name]" value="" placeholder="<?php echo $entry_title; ?>" class="form-control" />';
    html += '  </div>';
	<?php } ?>
	html += '  </td>';
	html += '  <td class="text-left"><a href="" id="thumb-image'+ attribute_row + '" data-toggle="image" class="img-thumbnail"> <img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /> </a> <input type="hidden" name="attribute['+ attribute_row + '][image]" value="" id="input-image'+ attribute_row + '" /></td>';
	html += '  <td class="text-right"><input type="text" name="attribute[' + attribute_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" /></td>';
	html += '  <td class="text-right"><button type="button" onclick="$(\'#attribute-row' + attribute_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';	
	
	$('#attribute tbody').append(html);
	
	attribute_row++;
}
//--></script> 
  <script type="text/javascript"><!--
$('input[name=\'product_name\']').autocomplete({
	source: function(request, response) {
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
	select: function(item) {
		$('input[name=\'product_name\']').val(item['label']);
		$('input[name=\'product_id\']').val(item['value']);
	}
});
//--></script></div>
<?php echo $footer; ?> 