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
  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
    </div>
    <div class="panel-body">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-featured" class="form-horizontal">
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
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_title; ?></label>
          <div class="col-sm-10">
            <?php foreach ($languages as $language) { ?>
            <div class="row">
              <div class="col-sm-11">
                <input class="form-control" name="title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($title[$language['language_id']]) ? $title[$language['language_id']] : ''; ?>" />
              </div>
              <div class="col-sm-1"> <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </div>
            </div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group">
          <table id="menucategory" class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-left"><?php echo $entry_title; ?></td>
                <td class="text-left"><?php echo $entry_icon; ?></td>
                <td class="text-left"><?php echo $entry_category; ?></td>
                <td class="text-left"><?php echo $entry_sub_category; ?></td>
                <td class="text-left"><?php echo $entry_sub_category_width; ?></td>
                <td class="text-left"><?php echo $entry_column; ?></td>
                <td class="text-left"><?php echo $entry_background; ?></td>
                <td class="text-left"><?php echo $entry_sort_order; ?></td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <?php $row = 0; ?>
              <?php foreach($menus as $menu){ ?>
              <tr id="menu-row<?php echo $row; ?>">
                <td class="text-left"><?php foreach ($languages as $language) { ?>
                  <div class="input-group"> <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                    <input name="boss_menucategory_config[<?php echo $row; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($menu['title'][$language['language_id']]) ? $menu['title'][$language['language_id']] : ''; ?>" class="form-control" />
                  </div>
                  <?php } ?></td>
                <td class="text-left"><a href="" id="thumb-image<?php echo $row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo isset($menu['thumbicon'])?$menu['thumbicon']:$placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                  <input type="hidden" name="boss_menucategory_config[<?php echo $row; ?>][icon]" value="<?php echo $menu['icon']; ?>" id="input-image<?php echo $row; ?>" /></td>
                <td class="text-left"><select name="boss_menucategory_config[<?php echo $row; ?>][category_id]" class="form-control">
                    <?php foreach ($categories as $category) { ?>
                    <?php if ($category['category_id'] == $menu['category_id']) { ?>
                    <option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select></td>
                <td class="text-left"><select name="boss_menucategory_config[<?php echo $row; ?>][sub_category]" class="form-control">
                    <?php if ($menu['sub_category']) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select></td>
                <td class="text-left"><input type="number" name="boss_menucategory_config[<?php echo $row; ?>][sub_width]" value="<?php echo $menu['sub_width']; ?>" class="form-control" /></td>
                <td class="text-left">
                  <select name="boss_menucategory_config[<?php echo $row; ?>][column]" class="form-control">
                    <option value="1" <?php echo ($menu['column'] == 1) ? 'selected="selected"' : ''; ?>>1</option>
                    <option value="2" <?php echo ($menu['column'] == 2) ? 'selected="selected"' : ''; ?>>2</option>
                    <option value="3" <?php echo ($menu['column'] == 3) ? 'selected="selected"' : ''; ?>>3</option>
                    <option value="4" <?php echo ($menu['column'] == 4) ? 'selected="selected"' : ''; ?>>4</option>
                    <option value="6" <?php echo ($menu['column'] == 6) ? 'selected="selected"' : ''; ?>>6</option>
                  </select>
                </td>
                <td class="text-left"><a href="" id="thumb-bgimage<?php echo $row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo isset($menu['thumbbgimage'])?$menu['thumbbgimage']:$placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                  <input type="hidden" name="boss_menucategory_config[<?php echo $row; ?>][bgimage]" value="<?php echo $menu['bgimage']; ?>" id="input-bgimage<?php echo $row; ?>" /></td>
                <td class="text-left"><input type="number" name="boss_menucategory_config[<?php echo $row; ?>][sort_order]" value="<?php echo $menu['sort_order']; ?>" class="form-control" /></td>
                <td class="text-right"><button type="button" onclick="$('#menu-row<?php echo $row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
              </tr>
              <?php $row++; ?>
              <?php } ?>
            </tbody>
            <tfoot>
              <tr>
                <td colspan="8"></td>
                <td class="text-right"><button type="button" onclick="addMenu();" data-toggle="tooltip" title="<?php echo $button_add_menu; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
              </tr>
            </tfoot>
          </table>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
	var row  = <?php echo $row; ?>;
	
	function addMenu() {
		html  = '<tr id="menu-row' + row + '">';
		html += '	<td class="text-left">';
		<?php foreach ($languages as $language) { ?>
		html += '		<div class="input-group">';
		html += '			<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
		html += '			<input name="boss_menucategory_config[' + row + '][title][<?php echo $language['language_id']; ?>]" value="<?php echo $entry_title; ?>" class="form-control" />';
		html += '		</div>';
		<?php } ?>
		html += '	</td>';

		html += '	<td class="text-left"><a href="" id="thumb-image' + row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="boss_menucategory_config['+ row +'][icon]" value="" id="input-image' + row + '" /></td>';

		html += '	<td class="text-left"><select name="boss_menucategory_config[' + row + '][category_id]" class="form-control">';
		<?php foreach ($categories as $category) { ?>
		html += '		<option value="<?php echo $category['category_id']; ?>"><?php echo addslashes($category['name']); ?></option>';
		<?php } ?>
		html += '	</select></td>';
		html += '	<td class="text-left"><select name="boss_menucategory_config[' + row + '][sub_category]" class="form-control">';
		html += '		<option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
		html += '		<option value="0"><?php echo $text_disabled; ?></option>';
		html += '	</select></td>';
		html += '	<td class="text-left"><input type="text" name="boss_menucategory_config[' + row + '][sub_width]" value="240" class="form-control" /></td>';
		html += '	<td class="text-left">';
		html += '		<select name="boss_menucategory_config[' + row + '][column]" class="form-control">';
		html += '			<option value="1">1</option>';
		html += '			<option value="2">2</option>';
		html += '			<option value="3">3</option>';
		html += '			<option value="4">4</option>';
		html += '			<option value="6">6</option>';
		html += '		</select>';
		html += '	</td>';
		html += '	<td class="text-left"><a href="" id="thumb-bgimage' + row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="boss_menucategory_config['+ row +'][bgimage]" value="" id="input-bgimage' + row + '" /></td>';

		html += '	<td class="text-left"><input type="number" name="boss_menucategory_config[' + row + '][sort_order]" value="0" class="form-control" /></td>';
		html += '	<td class="text-right"><button type="button" onclick="$(\'#menu-row' + row	+ '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
		html += '</tr>';

		$('#menucategory tbody').append(html);
		
		row++;
	};
	//--></script> 
<?php echo $footer; ?>