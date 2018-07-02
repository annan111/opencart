<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a> </div>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-boss_filterproduct" class="form-horizontal">
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
              <div class="form-group">
                <div class="col-sm-11">
                  <input name="title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($title[$language['language_id']]) ? $title[$language['language_id']] : ''; ?>" class="form-control" />
                </div>
                <div class="col-sm-1"> <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </div>
              </div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
            <div class="col-sm-2">
              <div class="input-group">
                <input type="text" name="icon" data-placement="bottomRight" class="form-control icp icp-auto" value="<?php echo $icon; ?>" />
                <span class="input-group-addon"></span> </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-position"><?php echo $entry_position; ?></label>
            <div class="col-sm-10">
              <select name="position" id="input-position" class="form-control">
                <?php foreach ($positions as $value => $name) { ?>
                <option value="<?php echo $value; ?>" <?php echo ($value == $position) ? 'selected' : ''; ?>><?php echo $name; ?></option>
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
          <div class="row">
            <div class="col-sm-12">
              <ul class="nav nav-tabs" id="module_content">
                <li class="active"><a href="#moduletab" data-toggle="tab"><?php echo $tab_tabs; ?></a></li>
                <li><a href="#modulesetting" data-toggle="tab"><?php echo $tab_setting; ?></a></li>
              </ul>
              <div class="tab-content">
                <div id="moduletab" class="tab-pane active">
                  <table id="tableMoldue" class="table">
                    <thead>
                      <tr>
                        <td class="left"><?php echo $column_number; ?></td>
                        <td class="left"><?php echo $column_title; ?></td>
                        <td class="left"><?php echo $column_icon; ?></td>
                        <td class="left"><?php echo $column_get_product; ?></td>
                        <td></td>
                      </tr>
                    </thead>
                    <?php $tab_row = 0;?>
                    <?php foreach($tabs as $tab) {?>
                    <tbody id="moduletab-row<?php echo $tab_row;?>">
                      <tr>
                        <td class="left"><?php $column_number;?>
                          <b>#<?php echo $tab_row + 1; ?></b></td>
                        <td class="left"><table class="table">
                            <?php foreach ($languages as $language) { ?>
                            <tr>
                              <td><input name="tabs[<?php echo $tab_row;?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($tab['title'][$language['language_id']]) ? $tab['title'][$language['language_id']] : ''; ?>" class="form-control" /></td>
                              <td><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /><br /></td>
                            </tr>
                            <?php } ?>
                          </table></td>
                        <td class="text-left"><a href="" id="thumb-icon<?php echo $tab_row;?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo isset($tab['thumb'])?$tab['thumb']:$placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                          <input type="hidden" name="tabs[<?php echo $tab_row;?>][icon]" value="<?php echo $tab['icon']; ?>" id="input-icon<?php echo $tab_row; ?>" class="form-control"/></td>
                        <td class="left"><select name="tabs[<?php echo $tab_row;?>][type_product]" onchange="showCategories(this,<?php echo $tab_row; ?>)" class="form-control">
                            <?php foreach($filter_types as $key_type=>$text){ ?>
                            <option value="<?php echo $key_type;?>" <?php if($tab['type_product'] == $key_type) echo "selected=selected";?>><?php echo $text;?></option>
                            <?php } ?>
                          </select>
                          <?php if ($tab['type_product']  == 'featured') { ?>
                          <div id="bt_featured<?php echo $tab_row;?>">
                            <input type="text" name="tabs[<?php echo $tab_row;?>][filter_type_featured]" value="" placeholder="<?php echo $entry_product; ?>" id="input-product-featured" class="form-control" />
                            <div id="product-featured-<?php echo $tab_row; ?>" class="well well-sm" style="height: 150px; overflow: auto;">
                              <?php foreach ($products as $product) { ?>
                              <div id="product-featured-<?php echo $tab_row; ?><?php echo $product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product['name']; ?>
                                <input type="hidden" name="tabs[<?php echo $tab_row;?>][product_featured][]" value="<?php echo $product['product_id']; ?>" />
                              </div>
                              <?php } ?>
                            </div>
                          </div>
                          <?php } ?>
                          <?php if ($tab['type_product'] == 'category') { ?>
                          <?php if (isset($error_category[$tab_row])) { ?>
                          <div class="text-danger"><?php echo $error_category[$tab_row]; ?></div>
                          <?php } ?>
                          <div class="well well-sm" style="height: 150px; overflow: auto;" id="scrollbox<?php echo $tab_row; ?>">
                            <?php foreach ($categories as $category) { ?>
                            <div class="">
                              <?php if (isset($tab['filter_type_category']) && $category['category_id'] == $tab['filter_type_category']) { ?>
                              <input type="radio" name="tabs[<?php echo $tab_row;?>][filter_type_category]" value="<?php echo $category['category_id']; ?>" checked="checked" />
                              <?php echo $category['name']; ?>
                              <?php } else { ?>
                              <input type="radio" name="tabs[<?php echo $tab_row;?>][filter_type_category]" value="<?php echo $category['category_id']; ?>" />
                              <?php echo $category['name']; ?>
                              <?php } ?>
                            </div>
                            <?php } ?>
                          </div>
                          <?php } ?></td>
                        <td class="text-right"><button type="button" onclick="$('#moduletab-row<?php echo $tab_row;?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                      </tr>
                    </tbody>
                    <?php $tab_row++;?>
                    <?php }?>
                    <tfoot>
                      <tr>
                        <td colspan="4"></td>
                        <td class="text-left"><button type="button" onclick="addTab(this,<?php echo $tab_row;?>);" data-toggle="tooltip" title="<?php echo $button_add_tab; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                      </tr>
                    </tfoot>
                  </table>
                </div>
                <div id="modulesetting" class="tab-pane">
                  <table class="table">
                    <tr>
                      <td><?php echo $entry_image; ?></td>
                      <td class="left"><input type="text" name="config[image_width]" value="<?php echo (isset($config['image_width']) ? $config['image_width'] : '') ?>" size="3" class="form-control" />
                        <input type="text" name="config[image_height]" value="<?php echo (isset($config['image_height']) ? $config['image_height'] : '') ?>" size="3" class="form-control" />
                        <?php if ($error_image_width) { ?>
                        <div class="text-danger"><?php echo $error_image_width; ?></div>
                        <?php } ?>
                        <?php if ($error_image_height) { ?>
                        <div class="text-danger"><?php echo $error_image_height; ?></div>
                        <?php } ?></td>
                    </tr>
                    <tr>
                      <td><?php echo $entry_column; ?></td>
                      <td class="left">
					  <select name="config[column]" class="form-control">
					    <option value="1" <?php echo (isset($config['column']) && $config['column'] == '1') ? 'selected="selected"' : ''; ?>>1</option>
						<option value="2" <?php echo (isset($config['column']) && $config['column'] == '2') ? 'selected="selected"' : ''; ?>>2</option>
						<option value="3" <?php echo (isset($config['column']) && $config['column'] == '3') ? 'selected="selected"' : ''; ?>>3</option>
						<option value="4" <?php echo (isset($config['column']) && $config['column'] == '4') ? 'selected="selected"' : ''; ?>>4</option>
						<option value="6" <?php echo (isset($config['column']) && $config['column'] == '6') ? 'selected="selected"' : ''; ?>>6</option>
						<option value="12" <?php echo (isset($config['column']) && $config['column'] == '12') ? 'selected="selected"' : ''; ?>>12</option>
					  </select>
                      </td>
                    </tr>
                    <tr>
                      <td><?php echo $entry_limit; ?></td>
                      <td class="left"><input type="text" name="config[limit]" value="<?php echo (isset($config['limit']) ? $config['limit'] : '') ?>" size="3" class="form-control" />
                        <?php if ($error_limit) { ?>
                        <div class="text-danger"><?php echo $error_limit; ?></div>
                        <?php } ?></td>
                    </tr>
                    <tr>
                      <td><?php echo $entry_scroll; ?></td>
                      <td class="left"><table class="table">
                          <tr>
                            <td><?php echo $entry_slide; ?></td>
                            <td><select name="config[scrolling_panel]" class="form-control">
                                <option value="1" <?php if(isset($config['scrolling_panel']) && $config['scrolling_panel'] == 1) echo "selected=selected"?>><?php echo $text_enabled; ?></option>
                                <option value="0" <?php if(isset($config['scrolling_panel']) && $config['scrolling_panel'] == 0) echo "selected=selected"?>><?php echo $text_disabled; ?></option>
                              </select></td>
                          </tr>
                          <tr>
                            <td><?php echo $entry_numrow; ?></td>
                            <td><input type="text" name="config[numrow]" class="form-control" value="<?php echo (isset($config['numrow']) ? $config['numrow'] : '') ?>" size="3" />
                              <?php if ($error_numrow) { ?>
                              <div class="text-danger"><?php echo $error_numrow; ?></div>
                              <?php } ?></td>
                          </tr>
                          <tr>
                            <td><?php echo $entry_perrow; ?></td>
                            <td><input type="text" name="config[perrow]" class="form-control" value="<?php echo (isset($config['perrow']) ? $config['perrow'] : '') ?>" size="3" />
                              <?php if ($error_perrow) { ?>
                              <div class="text-danger"><?php echo $error_perrow; ?></div>
                              <?php } ?></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>
                      <td><?php echo $entry_tab; ?></td>
                      <td class="left"><select name="config[use_tab]" class="form-control">
                          <option value="1" <?php if(isset($config['use_tab']) && $config['use_tab'] == 1) echo "selected=selected";?>><?php echo $text_enabled; ?></option>
                          <option value="0" <?php if(isset($config['use_tab']) && $config['use_tab'] == 0) echo "selected=selected";?>><?php echo $text_disabled; ?></option>
                        </select></td>
                    </tr>
                    <tr>
                      <td><?php echo $entry_scrolling_tab; ?></td>
                      <td class="left"><table class="table">
                          <tr>
                            <td><?php echo $entry_slide_tab; ?></td>
                            <td><select name="config[scrolling_tab]" class="form-control">
                                <option value="0" <?php if(isset($config['scrolling_tab']) && $config['scrolling_tab'] == 0) echo "selected=selected"?>><?php echo $text_disabled; ?></option>
                                <option value="1" <?php if(isset($config['scrolling_tab']) && $config['scrolling_tab'] == 1) echo "selected=selected"?>><?php echo $text_enabled; ?></option>
                              </select></td>
                          </tr>
                          <tr>
                            <td><?php echo $entry_num_tab; ?></td>
                            <td><input type="number" name="config[num_tab]" class="form-control" value="<?php echo (isset($config['num_tab']) ? $config['num_tab'] : '') ?>" size="3" /></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>
                      <td><?php echo $entry_prolarge; ?></td>
                      <td><table class="table">
                          <tr>
                            <td><?php echo $entry_show_prolarge; ?></td>
                            <td><select name="config[product_large]" class="form-control">
                                <option value="0" <?php if(isset($config['product_large']) && $config['product_large'] == 0) echo "selected=selected"?>><?php echo $text_disabled; ?></option>
                                <option value="1" <?php if(isset($config['product_large']) && $config['product_large'] == 1) echo "selected=selected"?>><?php echo $text_enabled; ?></option>
                              </select></td>
                          </tr>
                          <tr>
                            <td><?php echo $entry_add_img_large; ?></td>
                            <td><input type="number" name="config[add_img_width]" class="form-control" value="<?php echo (isset($config['add_img_width']) ? $config['add_img_width'] : '') ?>" size="3" />
                              <input type="number" name="config[add_img_height]" class="form-control" value="<?php echo (isset($config['add_img_height']) ? $config['add_img_height'] : '') ?>" size="3" /></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>
                      <td><?php echo $entry_class_css; ?></td>
                      <td class="left"><select name="config[class_css]" class="form-control">
                          <?php foreach($class_csss as $key_type => $text){ ?>
                          <option value="<?php echo $key_type;?>" <?php if(isset($config['class_css']) && $config['class_css'] == $key_type) echo "selected=selected";?>><?php echo $text;?></option>
                          <?php } ?>
                        </select></td>
                    </tr>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
//var tab_row = <?php echo $tab_row; ?>;;
// add menu
$('input[name="icon"]').iconpicker();

function addTab(btnAddTab,tab_row) {
	html  = '<tbody id="moduletab-row'+tab_row+'">';
	html += '<tr>';
	html += '<td class="left"><b>#' + (tab_row+1) + '</b></td><td class="left">';
	html += '<table class="table">';
	<?php foreach ($languages as $language) { ?>
	html += '<tr><td>';
	html += '<input type="input" name="tabs[' + tab_row + '][title][<?php echo $language['language_id'];?>]" class="form-control"/></td>';
	html += '<td><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></td></tr>';
	<?php }?>
html += '</table>';
	html += '</td>';
	html += '  <td class="text-left"><a href="" id="thumb-icon'+ tab_row +'" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="tabs['+tab_row+'][icon]" value="" id="input-icon'+tab_row+'" class="form-control"/></td>';
	html += '<td class="left">';
	html += '<select name="tabs[' + tab_row + '][type_product]" onchange="showCategories(this,' + tab_row + ')" class="form-control">';
	<?php foreach($filter_types as $key=>$text){ ?>
	html += '<option value="<?php echo $key;?>"><?php echo $text;?></option>';
	<?php } ?>
html += '</select></td>';

	html += '<td class="text-right"><button type="button" onclick="$(\'#moduletab-row' + tab_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr></tbody>';
	$('#tableMoldue tfoot').before(html);
	$(btnAddTab).replaceWith('<button type="button" onclick="addTab(this, '+ (tab_row + 1)+ ');" data-toggle="tooltip" title="<?php echo $button_add_tab; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button>');

}
//--></script> 
<script type="text/javascript"><!--
function showCategories(select, row) {
	if (select.options[select.selectedIndex].value == 'category') {
		$('#bt_featured'+row).slideUp("normal", function() { $(this).remove(); } );
		divclass = 'odd';
		html  = '<div class="well well-sm" style="height: 150px; overflow: auto;" id="scrollbox' + row + '">';
	<?php foreach ($categories as $category) { ?>
			divclass = divclass == 'even' ? 'odd' : 'even';
			html += '<div class="' + divclass + '">';
			html += '<input type="radio" name="tabs[' + row + '][filter_type_category]" value="<?php echo $category['category_id']; ?>" />';
			html += '<?php echo addslashes($category['name']); ?>'
			html += '</div>';
		<?php } ?>
		html += '</div>';

		$(select).after(html);
	}else if (select.options[select.selectedIndex].value == 'featured') {
		$('#scrollbox' + row).slideUp("normal", function() { $(this).remove(); } );

		html = '<div id="bt_featured'+row+'"><input type="text" name="tabs[' + row + '][filter_type_featured]" value="" placeholder="<?php echo $entry_product; ?>" id="input-product-featured-'+row+'" class="form-control" />';
		html += ' <div id="product-featured-'+row+'" class="well well-sm" style="height: 150px; overflow: auto;">';
		html += '</div></div>';

		nhtml = html.replace(/bt_row_replace/gi);
		$(select).after(nhtml);
		autoslectfeatured(row);
	}else {
		$('#bt_featured'+row).slideUp("normal", function() { $(this).remove(); } );
		$('#scrollbox' + row).slideUp("normal", function() { $(this).remove(); } );
	}
}
//--></script> 
<script type="text/javascript"><!--
$('#module_content li:first-child a').tab('show');
function autoslectfeatured(key){
	$('input[name=\'tabs[' + key + '][filter_type_featured]\']').autocomplete({
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
			$('input[name=\'tabs[' + key + '][filter_type_featured]\']').val('');

			$('#product-featured-'+key + item['value']).remove();

			$('#product-featured-'+key).append('<div id="product-featured-'+key + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="tabs[' + key + '][product_featured][]" value="' + item['value'] + '" /></div>');
		}
	});

	$('#product-featured-'+key).delegate('.fa-minus-circle', 'click', function() {
		$(this).parent().remove();
	});

};
<?php if(isset($tabs)) {?>
<?php $tab_key = 0;?>
<?php foreach($tabs as $tab) {?>
	<?php if($tab['type_product'] == 'featured'){ ?>
			autoslectfeatured('<?php echo $tab_key; ?>');
		<?php } ?>
	<?php $tab_key++; } ?>
<?php } ?>
//--></script> 
<?php echo $footer; ?>