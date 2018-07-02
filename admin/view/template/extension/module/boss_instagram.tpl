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
          <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_status; ?></label>
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
          <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
          <div class="col-sm-10">
            <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control"/>
            <?php if ($error_name) { ?>
            <div class="text-danger"><?php echo $error_name; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-user-id"><?php echo $entry_user_id; ?></label>
          <div class="col-sm-10">
            <input type="text" name="user_id" value="<?php echo $user_id; ?>" placeholder="<?php echo $entry_user_id; ?>" id="input-user-id" class="form-control" required/>
            <?php echo $help_user_id; ?>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-client-id"><?php echo $entry_client_id; ?></label>
          <div class="col-sm-10">
            <input type="text" name="client_id" value="<?php echo $client_id; ?>" placeholder="<?php echo $entry_client_id; ?>" id="input-client-id" class="form-control" required/>
            <?php echo $help_client_id; ?>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-token"><?php echo $entry_token; ?></label>
          <div class="col-sm-10">
            <input type="text" name="token" value="<?php echo $token; ?>" placeholder="<?php echo $entry_token; ?>" id="input-token" class="form-control" required/>
            <?php echo $help_token; ?>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-limit"><span data-toggle="tooltip" title="<?php echo $help_limit; ?>"><?php echo $entry_limit; ?></span></label>
          <div class="col-sm-10">
            <input type="number" name="limit" value="<?php echo $limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control" required/>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><?php echo $entry_title; ?></label>
          <div class="col-sm-10">
            <?php foreach ($languages as $language) { ?>
            <div class="input-group"> <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
              <input class="form-control" size=50 name="title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($title[$language['language_id']]) ? $title[$language['language_id']] : ''; ?>" />
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
<?php echo $footer; ?> 