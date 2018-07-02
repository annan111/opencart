<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary submit"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="Cancel" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-boss-dynamic-html">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <ul class="nav nav-tabs" id="language">
            <?php foreach ($languages as $language) { ?>
            <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
            <?php } ?>
            <li><a href="#css" data-toggle="tab" class="css-tab"><i class="fa fa-css3"></i> <?php echo $tab_css; ?></a></li>
          </ul>
          <div id="boss-dynamic-html" class="tab-content">
            <style type="text/css"><?php echo html_entity_decode($css); ?></style>
            <?php $flag_button = false; ?>
            <?php foreach ($languages as $language) { ?>
            <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
              <div class="form-group">
                <label for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                <div class="html-builder">
                  <ul class="nav nav-tabs">
                    <li class="active"><a href="#graphic-view<?php echo $language['language_id']; ?>" data-toggle="tab" title="<?php echo $button_preview; ?>" class="graphic-view"><i class="fa fa-eye"></i></a></li>
                    <li><a href="#code-view<?php echo $language['language_id']; ?>" data-toggle="tab" title="<?php echo $button_code; ?>" class="code-view"><i class="fa fa-code"></i></a></li>
                    <li>
                      <?php if($flag_button) { ?>
                      <a class="copy-first-language" data-toggle="tooltip" title="<?php echo $button_paste; ?>"><i class="fa fa-paste"></i></a>
                      <?php } ?>
                    </li>
                  </ul>
                  <div class="tab-content">
                    <div class="tab-pane active" id="graphic-view<?php echo $language['language_id']; ?>">
                      <div class="html-content-preview"><?php echo isset($description[$language['language_id']]) ? html_entity_decode($description[$language['language_id']]) : ''; ?></div>
                    </div>
                    <div class="tab-pane" id="code-view<?php echo $language['language_id']; ?>">
                      <textarea name="description[<?php echo $language['language_id']; ?>]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control html-content"><?php echo isset($description[$language['language_id']]) ? $description[$language['language_id']] : ''; ?></textarea>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <?php $flag_button = true; ?>
            <?php } ?>
            <div class="tab-pane" id="css">
              <textarea name="css" placeholder="<?php echo $entry_css; ?>" id="input-css" class="form-control css-content"><?php echo $css; ?></textarea>
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
          <input type="hidden" name="css_link" value="<?php echo $css_link; ?>" />
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script> 
<script type="text/javascript">
(function($){
	$.fn.bgpicker=function(){
		this.each(function(index, element) {
			var _this = $(this);
			
			$('.element-background', _this).remove();
			
			var node = $('<div/>', {
				class: 'btn btn-info element-background',
				style: 'position: absolute; bottom: 0px; right: 0px; z-index: 998;'
			}).html('<i class="fa fa-image"></i>');
			
			_this.append(node);
			
			node.on( "click", function() {
				$('.popover').popover('destroy', function() {
					$('.popover').remove();
				});
				
				$(node).popover({
					html: true,
					placement: 'top',
					trigger: 'manual',
					content: function() {
						var html = '';
						html += '<div class="form-group">';
							html += '<label style="width: 250px; color: #666;">Background Color</label>';
							html += '<div class="input-group">';
								html += '<span class="input-group-addon"><i class="fa fa-adjust"></i></span>';
								html += '<input type="text" name="background-color" value="' + _this.css('background-color') + '" class="form-control color-picker"/>';
							html += '</div>';
						html += '</div>';
						html += '<div class="form-group">';
							html += '<label style="width: 250px; color: #666;">Background Image</label>';
							html += '<div class="input-group">';
								html += '<span class="input-group-addon"><i class="fa fa-photo"></i></span>';
								html += '<input type="text" name="background-image" value="' + _this.css('background-image').replace(/"/g, "'") + '" class="form-control background-picker" />';
							html += '</div>';
						html += '</div>';
						html += '<div class="button-group">';
							html += '<div class="btn btn-primary background-change">Change</div>';
							html += '<div class="btn btn-default cancel">Cancel</div>';
							html += '<div class="btn btn-warning background-remove">Remove</div>';
						html += '</div>';
						return html;
					}
				});
	
				$(node).popover('show');
				
				var popover = node.next();
				
				$('.color-picker', popover).colorPicker();
				
				$('.background-picker', popover).on( 'click', function(e) {
					var index = this;
					
					$('#modal-image').remove();
					
					$.ajax({
						url: 'index.php?route=common/filemanager&token=' + getURLVar('token'),
						dataType: 'html',
						success: function(html) {
							
							
							$('body').append('<div id="modal-image" class="modal">' + html + '</div>');
				
							$('#modal-image').modal('show');
						}
					});
					
					$(document).delegate('#modal-image .thumbnail', 'click', function(e) {
						e.preventDefault();
						
						var image = $(this).attr('href').replace(/https:/,'').replace(/http:/,'');
						
						$(index).val("url('" + image + "')");
						
						$('#modal-image').modal('hide');
					});
				});
				
				$('.background-remove', popover).on( 'click', function(e) {
					e.preventDefault();
					_this.css({
						'background-image' : '',
						'background-color' : ''
					});
					
					$(node).popover('hide', function() {
						$('.popover').remove();
					});
				});
				
				$('.background-change', popover).on( 'click', function(e) {
					e.preventDefault();
					
					_this.css({
						'background-image' : $('input[name="background-image"]', popover).val(),
						'background-color' : $('input[name="background-color"]', popover).val()
						
					});
					
					$(node).popover('hide', function() {
						$('.popover').remove();
					});
				});
				
				$('.cancel', popover).on( 'click', function(e) {
					e.preventDefault();
					
					$(node).popover('hide', function() {
						$('.popover').remove();
					});
				});
			});
		});
	}
})(jQuery);
</script> 
<script type="text/javascript">
function setEditable(){
	$('*[data-editable="true"]').bind('mousedown.ui-disableSelection selectstart.ui-disableSelection', function(event){
		event.stopImmediatePropagation();
	});
	
	tinymce.remove();
	
	$('*[data-editable="true"]').each(function(index, element) {
		$(this).removeAttr('id');
		
		$(this).tinymce({
			inline: true,
			fontsize_formats: "8px 9px 10px 11px 12px 13px 14px 15px 16px 18px 20px 22px 24px 28px 32px 36px 40px 44px 48px 52px 56px 60px 66px 72px 78px 84px 90px 100px",
			theme: 'modern',
			plugins: [
			  'advlist autolink lists link image charmap hr anchor pagebreak',
			  'searchreplace wordcount visualblocks visualchars code fullscreen',
			  'insertdatetime media nonbreaking contextmenu directionality',
			  'emoticons template paste textcolor colorpicker textpattern imagetools',
			  'table'
			],
			toolbar1: 'formatselect | fontselect | fontsizeselect | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | insertfile undo redo',
			toolbar2: 'bold italic underline strikethrough | superscript subscript | forecolor backcolor | table | pastetext | image media link emoticons',
			image_advtab: true,
			relative_urls: false,
			file_browser_callback_types: 'image',
			file_browser_callback: function(field_name, url, type, win) {
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
							
							var image = $(this).attr('href').replace(/https:/,'').replace(/http:/,'');
							
							win.document.getElementById(field_name).value = image;
														
							$('#modal-image').modal('hide');
						});
					}
				});
			},
			setup: function (editor) {
				editor.on('init', function(args) {
					editor = args.target;
					editor.on('NodeChange', function(e) {
						if (e && e.element.nodeName.toLowerCase() == 'img') {
							tinyMCE.DOM.setAttribs(e.element, {'width': null, 'height': null});
						}
					});
					editor.on('ObjectResized', function(e) {
						if (e) {
							tinyMCE.DOM.setAttribs(e.target, {'width': null, 'height': null});
							tinymce.DOM.setStyle(e.target, 'width', e.width);
							tinymce.DOM.setStyle(e.target, 'height', e.height);
						}
					});
				});
			},
		});
    });
	
	$('*[data-background="true"]').bgpicker();
}

$('textarea.html-content').each(function(index, element) {
	var parent = $(this).parents('.html-builder');
	var preview = $('.html-content-preview', parent);
	var graphic = $('.graphic-view', parent);
	var code = $('.code-view', parent);
	
	$(this).ace({
		theme: 'twilight',
		lang: 'html',
		width: '100%',
		height: '768px',
		wrap: true
	});
	
	var decorator = $(this).data('ace');
	var editor = decorator.editor.ace;
	
	editor.getSession().on('change', function(){
		preview.html(editor.getSession().getValue());
	});
	
	graphic.on('click', function() {
		setEditable();
	});
	
	code.on('click', function() {
		$('*[data-editable="true"]', preview).each(function(e) {
			$(this).tinymce().remove();
        });
		
		$('.element-background', preview).remove();
		
		editor.getSession().setValue(preview.html());
	});
});
$('textarea.css-content').each(function(index, element) {
	$(this).ace({
		theme: 'twilight',
		lang: 'css',
		width: '100%',
		height: '768px',
		wrap: true
	});
	
	var decorator = $(this).data('ace');
	var editor = decorator.editor.ace;
	
	editor.getSession().on('change', function(){
		$('#boss-dynamic-html style').html(editor.getSession().getValue());
	});
});
$('#form-boss-dynamic-html').on('click', '.copy-first-language', function () {
	var parent = $(this).parents('.html-builder');
	var index = $('.html-content-preview', parent);
	var first = $('.html-content-preview', '.html-builder:eq(0)');
	
	tinymce.remove();
	
	$('.popover').popover('destroy', function() {
		$('.popover').remove();
	});
	
	$('.element-background', index).remove();
	
	index.html(first.html());
	
	parent.find('.graphic-view').trigger('click');
	
	setEditable();
});

$(document).on('click', 'button.submit', function () {
	tinymce.remove();
	
	$('.popover').popover('destroy', function() {
		$('.popover').remove();
	});
	
	$('.element-background').remove();
	
	$('*[data-editable="true"], *[data-editable="true"] *').each(function(index, element) {
        $(this).removeAttr('spellcheck caption data-mce-src data-mce-href data-mce-style').css({
			'position': '',
			'visibility': ''
		});
    });
	
	$('*[id^="mce"]').removeAttr('id').css({
		'position': '',
		'visibility': ''
	});
	
	$('input[name^="mce"]').remove();
	
	$('textarea.html-content').each(function(index, element) {
		var html = $(this).parents('.html-builder').find('.html-content-preview').html();
		
		$(this).val(html);
	});
	
	$('#form-boss-dynamic-html').submit();
});

setEditable();
</script> 
<?php echo $footer; ?>