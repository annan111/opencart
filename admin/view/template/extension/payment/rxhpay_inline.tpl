<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-rxhpay-inline" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> Edit RxhPayinline</h3>
      </div>
      <div class="panel-body">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-rxhpay-inline" class="form-horizontal">
          <div class="form-group">
            	<label class="col-sm-2 control-label" for="input-merchantid"><?php echo $entry_merchantid; ?></label>
            	<div class="col-sm-10">
					<input type="text" name="rxhpay_inline_merchant" value="<?php echo $rxhpay_inline_merchant; ?>" placeholder="<?php echo $entry_merchantid; ?>" id="input-merchantid" class="form-control" />
					<?php if ($error_merchant) { ?>
					<span class="error"><?php echo $error_merchant; ?></span>
					<?php } ?>
            	</div>
          </div>
          <div class="form-group">
            	<label class="col-sm-2 control-label" for="input-md5key"><?php echo $entry_md5key; ?></label>
            	<div class="col-sm-10">
					<input type="text" name="rxhpay_inline_md5key" value="<?php echo $rxhpay_inline_md5key; ?>" placeholder="<?php echo $entry_md5key; ?>" id="input-md5key" class="form-control" />
					<?php if ($error_md5key) { ?>
					<span class="error"><?php echo $error_md5key; ?></span>
					<?php } ?>
            	</div>
          </div>
          <div class="form-group">
            	<label class="col-sm-2 control-label" for="input-transaction_url"><?php echo $entry_transaction_url; ?></label>
            	<div class="col-sm-10">
					<input type="text" name="rxhpay_inline_transaction_url" value="<?php echo $rxhpay_inline_transaction_url; ?>" placeholder="<?php echo $entry_transaction_url; ?>" id="input-transaction_url" class="form-control" />
					<?php if ($error_transaction_url) { ?>
					<span class="error"><?php echo $error_transaction_url; ?></span>
					<?php } ?>
            	</div>
          </div>
          <div class="form-group">
            	<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            	<div class="col-sm-10">
					<select name="rxhpay_inline_status" id="input-status" class="form-control" />
						<?php if ($rxhpay_inline_status) { ?>
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
            	<label class="col-sm-2 control-label" for="input-geo_zone"><?php echo $entry_geo_zone; ?></label>
            	<div class="col-sm-10">
					<select name="rxhpay_inline_geo_zone_id" id="input-geo_zone" class="form-control" />
						<option value="0"><?php echo $text_all_zones; ?></option>
						<?php foreach ($geo_zones as $geo_zone) { ?>
						<?php if ($geo_zone['geo_zone_id'] == $rxhpay_inline_geo_zone_id) { ?>
						<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
						<?php } ?>
						<?php } ?>
			    	</select>
            	</div>
          </div>
          <div class="form-group">
            	<label class="col-sm-2 control-label" for="input-sort_order"><?php echo $entry_sort_order; ?></label>
            	<div class="col-sm-10">
					<input type="text" name="rxhpay_inline_sort_order" value="<?php echo $rxhpay_inline_sort_order; ?>" length="1" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort_order" class="form-control" />
					<?php if ($error_sort_order) { ?>
					<span class="error"><?php echo $error_sort_order; ?></span>
					<?php } ?>
            	</div>
          </div>
          <div class="form-group">
            	<label class="col-sm-2 control-label" for="input-opencart_version"><?php echo $entry_opencart_version; ?></label>
            	<div class="col-sm-10">
					<select name="rxhpay_inline_opencart_version" id="input-opencart_version" class="form-control" />
						<?php foreach ($versions as $version) { ?>
						<?php if ($version == $rxhpay_inline_opencart_version) { ?>
						<option value="<?php echo $version; ?>" selected="selected"><?php echo $version; ?></option>
						<?php } else { ?>
						<option value="<?php echo $version; ?>"><?php echo $version; ?></option>
						<?php } ?>
						<?php } ?>
			    	</select>
            	</div>
          </div>
		</form>
	</div>
</div>
<?php echo $footer; ?>