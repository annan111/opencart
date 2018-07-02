<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-newslettersubscribe" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form id="form-newslettersubscribe" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-featured" class="form-horizontal">
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
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-background"><?php echo $entry_background; ?></label>
          <div class="col-sm-10">
            <div class="image"> <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo isset($bg_thumb)?$bg_thumb:$placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
              <input type="hidden" name="bg_image" value="<?php echo isset($bg_image)?$bg_image:''; ?>" id="input-image" />
            </div>
          </div>
        </div>
        <ul id="general" class="nav nav-tabs">
          <li class="active"><a data-toggle="tab" href="#tab-newsletter"><?php echo $tab_newsletter; ?></a></li>
          <li><a data-toggle="tab" href="#tab-popup"><?php echo $tab_popup; ?></a></li>
          <li><a data-toggle="tab" href="#tab-mail"><?php echo $tab_mail; ?></a></li>
        </ul>
        <div class="tab-content">
          <div id="tab-newsletter" class="tab-pane active">
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $entry_registered; ?></label>
              <div class="col-sm-10">
                <select name="registered" id="input-status" class="form-control">
                  <?php if ($registered) { ?>
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
              <label class="col-sm-2 control-label"><?php echo $entry_unsubscribe; ?></label>
              <div class="col-sm-10">
                <select name="unsubscribe" id="input-status" class="form-control">
                  <?php if ($unsubscribe) { ?>
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
              <label class="col-sm-2 control-label"><?php echo $entry_title; ?></label>
              <div class="col-sm-10">
                <?php foreach ($languages as $language) { ?>
                <div class="input-group"> <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                  <input class="form-control" size=50 name="newsletter[title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($newsletter['title'][$language['language_id']]) ? $newsletter['title'][$language['language_id']] : ''; ?>" />
                </div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $entry_sub_title; ?></label>
              <div class="col-sm-10">
                <?php foreach ($languages as $language) { ?>
                <div class="input-group"> <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                  <input class="form-control" size=50 name="newsletter[sub_title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($newsletter['sub_title'][$language['language_id']]) ? $newsletter['sub_title'][$language['language_id']] : ''; ?>" />
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
          <div id="tab-popup" class="tab-pane">
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $entry_popup; ?></label>
              <div class="col-sm-10">
                <select name="show_popup" id="input-status" class="form-control">
                  <?php if ($show_popup) { ?>
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
              <label class="col-sm-2 control-label" for="input-background-popup"><?php echo $entry_background; ?></label>
              <div class="col-sm-10"> <a href="" id="thumb-background-popup" data-toggle="image" class="img-thumbnail"><img src="<?php echo $bg_thumb_popup; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                <input type="hidden" name="popup[background]" value="<?php echo isset($popup['background']) ? $popup['background'] : ''; ?>" id="input-background-popup" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $entry_title; ?></label>
              <div class="col-sm-10">
                <?php foreach ($languages as $language) { ?>
                <div class="input-group"> <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                  <input class="form-control" size=50 name="popup[title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($popup['title'][$language['language_id']]) ? $popup['title'][$language['language_id']] : ''; ?>" />
                </div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $entry_sub_title; ?></label>
              <div class="col-sm-10">
                <?php foreach ($languages as $language) { ?>
                <div class="input-group"> <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                  <input class="form-control" size=50 name="popup[sub_title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($popup['sub_title'][$language['language_id']]) ? $popup['sub_title'][$language['language_id']] : ''; ?>" />
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
          <div id="tab-mail" class="tab-pane">
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $entry_mail; ?></label>
              <div class="col-sm-10">
                <select name="mail_status" id="input-status" class="form-control">
                  <?php if ($mail_status) { ?>
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
              <label class="col-sm-2 control-label"><?php echo $entry_mail_subscribe; ?></label>
              <div class="col-sm-10">
                <ul class="nav nav-tabs">
                  <?php foreach ($languages as $language) { ?>
                  <li><a href="#mail-subscribe-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" subject="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                  <?php } ?>
                </ul>
                <div class="tab-content">
                  <?php foreach ($languages as $language) { ?>
                  <div class="tab-pane" id="mail-subscribe-<?php echo $language['language_id']; ?>">
                    <label class="control-label"><?php echo $entry_subject; ?></label>
                    <input type="text" name="mail[subscribe][<?php echo $language['language_id']; ?>][subject]" value="<?php echo isset($mail['subscribe'][$language['language_id']]['subject']) ? $mail['subscribe'][$language['language_id']]['subject'] : ''; ?>" placeholder="<?php echo $entry_subject; ?>" id="input-mail-subscribe-subject<?php echo $language['language_id']; ?>" class="form-control" />
                    <label class="control-label"><?php echo $entry_message; ?></label>
                    <textarea name="mail[subscribe][<?php echo $language['language_id']; ?>][message]" placeholder="<?php echo $entry_message; ?>" id="input-mail-subscribe-message<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($mail['subscribe'][$language['language_id']]['message']) ? $mail['subscribe'][$language['language_id']]['message'] : ''; ?></textarea>
                  </div>
                  <?php } ?>
                </div>
                <p>{email}</p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $entry_mail_unsubscribe; ?></label>
              <div class="col-sm-10">
                <ul class="nav nav-tabs">
                  <?php foreach ($languages as $language) { ?>
                  <li><a href="#mail-unsubscribe-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" subject="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                  <?php } ?>
                </ul>
                <div class="tab-content">
                  <?php foreach ($languages as $language) { ?>
                  <div class="tab-pane" id="mail-unsubscribe-<?php echo $language['language_id']; ?>">
                    <label class="control-label"><?php echo $entry_subject; ?></label>
                    <input type="text" name="mail[unsubscribe][<?php echo $language['language_id']; ?>][subject]" value="<?php echo isset($mail['unsubscribe'][$language['language_id']]['subject']) ? $mail['unsubscribe'][$language['language_id']]['subject'] : ''; ?>" placeholder="<?php echo $entry_subject; ?>" id="input-mail-unsubscribe-subject<?php echo $language['language_id']; ?>" class="form-control" />
                    <label class="control-label"><?php echo $entry_message; ?></label>
                    <textarea name="mail[unsubscribe][<?php echo $language['language_id']; ?>][message]" placeholder="<?php echo $entry_message; ?>" id="input-mail-unsubscribe-message<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($mail['unsubscribe'][$language['language_id']]['message']) ? $mail['unsubscribe'][$language['language_id']]['message'] : ''; ?></textarea>
                  </div>
                  <?php } ?>
                </div>
                <p>{email}</p>
              </div>
            </div>
          </div>
        </div>
        <input type="hidden" name="module_id" value="<?php echo isset($module_id) ? $module_id : ''; ?>">
        </form>
      </div>
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