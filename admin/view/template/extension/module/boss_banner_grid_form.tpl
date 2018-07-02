<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-boss-banner-grid" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-boss-banner-grid" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#tab-general"><?php echo $tab_general; ?></a></li>
            <li><a data-toggle="tab" href="#tab-banner"><?php echo $tab_banner; ?></a></li>
          </ul>
          <div class="tab-content">
            <div id="tab-general" class="tab-pane fade in active">
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
                <label class="col-sm-2 control-label" for="input-per-row"><?php echo $entry_per_row; ?></label>
                <div class="col-sm-10">
                  <select name="per_row" id="input-per-row" class="form-control">
                    <option value="1" <?php echo ($per_row == 1) ? 'selected="selected"' : ''; ?>>1</option>
                    <option value="2" <?php echo ($per_row == 2) ? 'selected="selected"' : ''; ?>>2</option>
                    <option value="3" <?php echo ($per_row == 3) ? 'selected="selected"' : ''; ?>>3</option>
                    <option value="4" <?php echo ($per_row == 4) ? 'selected="selected"' : ''; ?>>4</option>
                    <option value="6" <?php echo ($per_row == 6) ? 'selected="selected"' : ''; ?>>6</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-auto"><?php echo $entry_auto; ?></label>
                <div class="col-sm-2">
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
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-2">
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
            </div>
            <div id="tab-banner" class="tab-pane fade">
              <div class="form-group">
                <div class="col-sm-12">
                  <div class="col-xs-3">
                    <ul id="boss-banner-grid-tab" class="nav nav-tabs tabs-left">
                      <?php $banner_row = 0; ?>
                      <?php foreach($banners as $banner) { ?>
                      <li> <a data-toggle="tab" href="#banner-row-<?php echo $banner_row; ?>">
                        <button class="btn btn-danger" onclick="$(this).parent().remove(); $('#banner-row-<?php echo $banner_row; ?>').remove();" style="padding: 2px 5px;" data-toggle="tooltip" data-original-title="<?php echo $button_remove; ?>"><i class="fa fa-minus-circle"></i></button>
                        <?php echo $entry_banner.' '.$banner_row; ?></a> </li>
                      <?php $banner_row++; ?>
                      <?php } ?>
                    </ul>
                    <a onClick="addBossBannerGrid();" data-toggle="tooltip" class="btn btn-success" style="padding: 2px 5px; margin-left: 15px;" data-original-title="<?php echo $button_add; ?>"><i class="fa fa-plus-circle"></i></a> </div>
                  <div class="col-sm-9">
                    <div id="boss-banner-grid" class="tab-content">
                      <?php $banner_row = 0; ?>
                      <?php foreach($banners as $banner) { ?>
                      <div id="banner-row-<?php echo $banner_row; ?>" class="tab-pane">
                        <div class="col-sm-12">
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-title"><?php echo $entry_title; ?></label>
                            <div class="col-sm-10">
                              <input type="text" name="banners[<?php echo $banner_row; ?>][title]" value="<?php echo $banner['title']; ?>" placeholder="<?php echo $entry_title; ?>" class="form-control" />
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
                            <div class="col-sm-10"> <a href="" id="thumb-image-<?php echo $banner_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $banner['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                              <input type="hidden" name="banners[<?php echo $banner_row; ?>][image]" value="<?php echo $banner['image']; ?>" placeholder="<?php echo $entry_image; ?>" class="form-control" id="input-image-<?php echo $banner_row; ?>"/>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-link"><?php echo $entry_link; ?></label>
                            <div class="col-sm-10">
                              <input type="text" name="banners[<?php echo $banner_row; ?>][link]" value="<?php echo $banner['link']; ?>" placeholder="<?php echo $entry_link; ?>" class="form-control" />
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-caption-effect"><?php echo $entry_effect; ?></label>
                            <div class="col-sm-2">
                              <select name="banners[<?php echo $banner_row; ?>][effect]" id="input-caption-effect" class="form-control">
                                <option value="" <?php echo ($banner['effect'] == '') ? 'selected' : ''; ?>>none</option>
                                <option value="effect-lily" <?php echo ($banner['effect'] == 'effect-lily') ? 'selected' : ''; ?>>Effect Lily</option>
                                <option value="effect-central" <?php echo ($banner['effect'] == 'effect-central') ? 'selected' : ''; ?>>Effect Central</option>
                                <option value="effect-pulse" <?php echo ($banner['effect'] == 'effect-pulse') ? 'selected' : ''; ?>>Effect Pulse</option>
                                <option value="effect-oscar" <?php echo ($banner['effect'] == 'effect-oscar') ? 'selected' : ''; ?>>Effect Oscar</option>
                                <option value="effect-ruby" <?php echo ($banner['effect'] == 'effect-ruby') ? 'selected' : ''; ?>>Effect Ruby</option>
                                <option value="effect-julia" <?php echo ($banner['effect'] == 'effect-julia') ? 'selected' : ''; ?>>Effect Julia</option>
                                <option value="effect-goliath" <?php echo ($banner['effect'] == 'effect-goliath') ? 'selected' : ''; ?>>Effect Goliath</option>
                                <option value="effect-apollo" <?php echo ($banner['effect'] == 'effect-apollo') ? 'selected' : ''; ?>>Effect Apollo</option>
                                <option value="effect-steve" <?php echo ($banner['effect'] == 'effect-steve') ? 'selected' : ''; ?>>Effect Steve</option>
                                <option value="effect-jazz" <?php echo ($banner['effect'] == 'effect-jazz') ? 'selected' : ''; ?>>Effect Jazz</option>
                                <option value="effect-lexi" <?php echo ($banner['effect'] == 'effect-lexi') ? 'selected' : ''; ?>>Effect Lexi</option>
								<option value="effect-duke" <?php echo ($banner['effect'] == 'effect-duke') ? 'selected' : ''; ?>>Effect Duke</option>
                              </select>
                            </div>
                          </div>
                          <ul class="nav nav-tabs language">
                            <?php foreach ($languages as $language) { ?>
                            <?php $language_id = $language['language_id']; ?>
                            <li><a href="#language-<?php echo $banner_row; ?>-<?php echo $language_id; ?>" data-toggle="tab"><img src="<?php echo (version_compare(VERSION, '2.1.0.2', '>')) ? 'language/' . $language['code'] . '/' . $language['code'] . '.png' : 'view/image/flags/' . $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                            <?php } ?>
                          </ul>
                          <div class="tab-content">
                            <?php foreach ($languages as $language) { ?>
                            <?php $language_id = $language['language_id']; ?>
                            <div class="tab-pane" id="language-<?php echo $banner_row; ?>-<?php echo $language_id; ?>">
                              <textarea name="banners[<?php echo $banner_row; ?>][caption][<?php echo $language_id; ?>]" class="form-control summernote" id="input-banner-caption-<?php echo $banner_row; ?>"><?php echo (isset($banner['caption'][$language_id])) ? $banner['caption'][$language_id] : ''; ?></textarea>
                            </div>
                            <?php } ?>
                          </div>
                        </div>
                      </div>
                      <?php $banner_row++; ?>
                      <?php } ?>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$('.language li:first-child a').tab('show');
$('.tabs-left li:first-child a').tab('show');

function summernote() {
	// Override summernotes image manager
	$('.summernote').each(function() {
		var element = this;
		
		$(element).summernote({
			disableDragAndDrop: true,
			height: 150,
			emptyPara: '',
			toolbar: [
				['style', ['style']],
				['font', ['bold', 'underline', 'clear']],
				['fontname', ['fontname']],
				['color', ['color']],
				['para', ['ul', 'ol', 'paragraph']],
				['table', ['table']],
				['insert', ['link', 'image', 'title']],
				['view', ['fullscreen', 'codeview', 'help']]
			],
			buttons: {
    			image: function() {
					var ui = $.summernote.ui;

					// create button
					var button = ui.button({
						contents: '<i class="note-icon-picture" />',
						tooltip: $.summernote.lang[$.summernote.options.lang].image.image,
						click: function () {
							$('#modal-image').remove();
						
							$.ajax({
								url: 'index.php?route=common/filemanager&token=' + getURLVar('token'),
								dataType: 'html',
								beforeSend: function() {
									$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
									$('#button-image').prop('disabled', true);
								},
								complete: function() {
									$('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
									$('#button-image').prop('disabled', false);
								},
								success: function(html) {
									$('body').append('<div id="modal-image" class="modal">' + html + '</div>');
									
									$('#modal-image').modal('show');
									
									$('#modal-image').delegate('a.thumbnail', 'click', function(e) {
										e.preventDefault();
										
										$(element).summernote('insertImage', $(this).attr('href'));
																	
										$('#modal-image').modal('hide');
									});
								}
							});						
						}
					});
				
					return button.render();
				}
  			}
		});
	});
}

summernote();
</script>
<script type="text/javascript">
var banner_row = <?php echo $banner_row; ?>;

function addBossBannerGrid(){
	var html = '';
	
	html += '<div id="banner-row-'+banner_row+'" class="tab-pane">';
	  html += '<div class="col-sm-12">';
		html += '<div class="form-group">';
		  html += '<label class="col-sm-2 control-label" for="input-title"><?php echo $entry_title; ?></label>';
		  html += '<div class="col-sm-10">';
			html += '<input type="text" name="banners['+banner_row+'][title]" value="" placeholder="<?php echo $entry_title; ?>" class="form-control" />';
		  html += '</div>';
		html += '</div>';
		
		html += '<div class="form-group">';
		  html += '<label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>';
		  html += '<div class="col-sm-10">';
			html += '<a href="" id="thumb-image-'+banner_row+'" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>';
			html += '<input type="hidden" name="banners['+banner_row+'][image]" value="" placeholder="<?php echo $entry_image; ?>" class="form-control" id="input-image-'+banner_row+'"/>';
		  html += '</div>';
		html += '</div>';
		
		html += '<div class="form-group">';
		  html += '<label class="col-sm-2 control-label" for="input-link"><?php echo $entry_link; ?></label>';
		  html += '<div class="col-sm-10">';
			html += '<input type="text" name="banners['+banner_row+'][link]" value="" placeholder="<?php echo $entry_link; ?>" class="form-control" />';
		  html += '</div>';
		html += '</div>';
		
		html += '<div class="form-group">';
		  html += '<label class="col-sm-2 control-label" for="input-caption-effect"><?php echo $entry_effect; ?></label>';
		  html += '<div class="col-sm-2">';
			html += '<select name="banners['+banner_row+'][effect]" id="input-caption-effect" class="form-control">';
			  html += '<option value="">none</option>';
			  html += '<option value="effect-lily">Effect Lily</option>';
			  html += '<option value="effect-pulse">Effect Pulse</option>';
			  html += '<option value="effect-oscar">Effect Oscar</option>';
			  html += '<option value="effect-ruby">Effect Ruby</option>';
			  html += '<option value="effect-julia">Effect Julia</option>';
			  html += '<option value="effect-goliath">Effect Goliath</option>';
			  html += '<option value="effect-apollo">Effect Apollo</option>';
			  html += '<option value="effect-steve">Effect Steve</option>';
			  html += '<option value="effect-jazz">Effect Jazz</option>';
			  html += '<option value="effect-lexi">Effect Lexi</option>';
			  html += '<option value="effect-duke">Effect Duke</option>';
			html += '</select>';
		  html += '</div>';
		html += '</div>';
		
		html += '<ul class="nav nav-tabs language">';
		<?php foreach ($languages as $language) { ?>
		  html += '<li><a href="#language-'+banner_row+'-<?php echo $language["language_id"]; ?>" data-toggle="tab"><img src="<?php echo (version_compare(VERSION, '2.1.0.2', '>')) ? 'language/' . $language['code'] . '/' . $language['code'] . '.png' : 'view/image/flags/' . $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language["name"]; ?></a></li>';
		<?php } ?>
		html += '</ul>';
		html += '<div class="tab-content">';
		  <?php foreach ($languages as $language) { ?>
		  html += '<div class="tab-pane" id="language-'+banner_row+'-<?php echo $language["language_id"]; ?>">';
		    html += '<textarea name="banners['+banner_row+'][caption][<?php echo $language["language_id"]; ?>]" class="form-control summernote" id="input-banner-caption-'+banner_row+'"></textarea>';
		  html += '</div>';
		  <?php } ?>
		html += '</div>';
		
	  html += '</div>';
	html += '</div>';
	
	$('#boss-banner-grid').append(html);
	summernote();
	$('.language li:first-child a').tab('show');
	
	html = '';
	html += '<li>';
		html += '<a data-toggle="tab" href="#banner-row-'+banner_row+'">';
		html += '<button class="btn btn-danger" onclick="$(this).parent().remove(); $(\'#banner-row-'+banner_row+'\').remove();" style="padding: 2px 5px;" data-toggle="tooltip" data-original-title="<?php echo $button_remove; ?>"><i class="fa fa-minus-circle"></i></button>';
		html += ' <?php echo $entry_banner; ?> '+banner_row;
		html += '</a>';
	html += '</li>';
	
	$('#boss-banner-grid-tab').append(html);
	$('#boss-banner-grid-tab li:last-child a').tab('show');
	
	banner_row++;
}
</script>
<?php echo $footer; ?>