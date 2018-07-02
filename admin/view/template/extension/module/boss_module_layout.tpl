<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary submit"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-module-layout" class="form-horizontal">
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
		  <textarea name="raw" class="hidden"><?php echo $raw; ?></textarea>
		  <textarea name="publish" class="hidden"><?php echo $publish; ?></textarea>
        </form>
      </div>
    </div>
    <div class="tab-pane">
      <div class="panel panel-default">
        <div class="panel-body">
          <div id="console" class="form-horizontal">
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-num-cols"><?php echo $entry_num_cols; ?></label>
              <div class="col-sm-10">
                <div id="num-cols"></div>
                <select name="num_cols" id="input-num-cols" class="form-control">
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="6">6</option>
                  <option value="12">12</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-col-sm"><?php echo $entry_col_sm; ?></label>
              <div class="col-sm-10">
                <div id="col-sm"></div>
                <input type="text" name="col_sm" id="input-col-sm" value="12" style="width: 20px;" disabled>
                <div id="sm-preview" class="frame-preview"></div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-col-xs"><?php echo $entry_col_xs; ?></label>
              <div class="col-sm-10">
                <div id="col-xs"></div>
                <input type="text" name="col_xs" id="input-col-xs" value="12" style="width: 20px;" disabled>
                <div id="xs-preview" class="frame-preview"></div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-class"><?php echo $entry_class; ?></label>
              <div class="col-sm-10">
                <input type="text" name="class" placeholder="<?php echo $entry_class; ?>" id="input-class" class="form-control">
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-full-width"><?php echo $entry_width; ?></label>
              <div class="col-sm-10">
                <input type="checkbox" name="full_width" checked>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" ></label>
              <div class="col-sm-10"> <a class="btn btn-primary add-frame" onclick="addFrames();"><?php echo $button_add; ?></a> </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="tab-pane">
      <div class="panel panel-default">
        <div class="panel-body">
          <div id="monitor" class="col-sm-12">
            <div class="row base">
			  <?php if ($raw) { ?>
			    <?php echo html_entity_decode($raw); ?>
			  <?php } else { ?>
                <div class="pre-div"></div>
			  <?php } ?>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div id="module-popup" class="stick-popup">
  <div class="popup-content">
    <div class="popup-button"><i class="fa fa-bars fa-lg"></i></div>
    <div class="panel-default extension">
      <?php foreach ($extensions as $extension) { ?>
      <?php if (empty($extension['module'])) { ?>
      <div class="module">
        <div class="title"><?php echo $extension['name']; ?></div>
        <div class="remove"><i class="fa fa-minus-circle"></i></div>
        <div class="shortcode">[<?php echo $extension['code']; ?> /]</div>
      </div>
      <?php } else { ?>
      <?php foreach ($extension['module'] as $module) { ?>
      <div class="module">
        <div class="title"><?php echo $extension['name']; ?> > <?php echo $module['name']; ?></div>
        <div class="remove"><i class="fa fa-minus-circle"></i></div>
        <div class="shortcode">[<?php echo $module['code']; ?> /]</div>
      </div>
      <?php } ?>
      <?php } ?>
      <?php } ?>
    </div>
  </div>
</div>
<script type="text/javascript">
var drag_row = 0;
var node;

$('#col-sm').slider({
	min: 0,
	max: 12,
	range: "min",
	animate: "slow",
	value: 12,
	slide: function( event, ui ) {
		$('#console input[name="col_sm"]').val(ui.value);
	},
	change: function( event, ui ) {
		$('#console input[name="col_sm"]').val(ui.value).trigger('change');
	}
});

$('#col-xs').slider({
	min: 0,
	max: 12,
	range: "min",
	animate: "slow",
	value: 12,
	step: 6,
	slide: function( event, ui ) {
		$('#console input[name="col_xs"]').val(ui.value);
	},
	change: function( event, ui ) {
		$('#console input[name="col_xs"]').val(ui.value).trigger('change');
		if(ui.value < 6) $('#col-xs').slider('value', 6);
	}
});

$('#console input[name="full_width"]').bootstrapSwitch({
	onText: '<?php echo $text_full_width; ?>',
	offText: '<?php echo $text_1170_px; ?>',
	handleWidth: '150',
	labelWidth: '10',
	onColor: 'primary',
	offColor: 'primary',
	indeterminate: true,
	onSwitchChange: function(event, state) {
		if(state){
			$('#console input[name="full_width"]').val('100%');
		}else{
			$('#console input[name="full_width"]').val('1170px');
		}
	}
});

$(function(){
	setSortable();
	setResizable();
	setResizable();
});

$(document).delegate('#console select[name="num_cols"]', 'change click',function (event) {
	var num_cols = parseInt($(this).val());
	$('#col-sm').slider('value', (12/num_cols));
	
	slipCols();
});

$(document).delegate('#console input[name="col_sm"], input[name="col_xs"]', 'change click',function (event) {
	slipCols();
});

$(document).delegate('.frame-down', 'click',function () {
	parent = $(this).parent().parent();
	swap = parent.next();
	parent.before(swap.detach());
});

$(document).delegate('.frame-up', 'click',function () {
	parent = $(this).parent().parent();
	swap = parent.prev();
	parent.after(swap.detach());
});

$(document).delegate('.frame-remove', 'click',function () {
	$(this).parent().parent().remove();
});

$(document).delegate('.module > .remove', 'click',function () {
	$(this).parent().remove();
});

$(document).delegate('button.submit', 'click', function () {
	$('#monitor .base, #monitor .frame').sortable('destroy').removeAttr('style');
	$('#monitor .frame-resize').resizable('destroy').removeAttr('style');
	
	$('textarea[name="raw"]').val($('#monitor > .base').html());
	
	$('#monitor .frame-resize').removeClass('frame-resize').removeAttr('style');
	
	$('#monitor .module-frame').removeClass('module-frame').removeAttr('style');
	
	$('#monitor .container .frame').removeClass('frame');
	
	$('#monitor .frame-header, #monitor .pre-div').remove();
	
	$('#monitor .shortcode').each(function(index, element) {
        var parent = $(this).parent();
		var shortcode = $(this).html();
		
		parent.replaceWith(shortcode);
    });
	
	$('textarea[name="publish"]').val($('#monitor > .base').html());
	
	$('#form-module-layout').submit();
});

setTimeout(function(){if($('#column-left').hasClass('active')) $('#button-menu').trigger('click');}, 500);

function round(number) {
	Array.prototype.min = function() {
		return Math.min.apply(null, this);
	};
	
	var step = [8.33, 16.66, 25, 33.33, 41.66, 50, 58.33, 66.66, 75, 83.33, 91.66, 100];
	var ref = [];
	
	for(i in step) ref[i] = Math.abs(step[i]-number);
	var min = Math.min.apply(null, ref);
	for(i in ref) if(ref[i] == min) return step[i];
}

function slipCols(){
	var num_cols = parseInt($('#console select[name="num_cols"]').val());
	var col_sm = parseInt($('#console input[name="col_sm"]').val());
	var col_xs = parseInt($('#console input[name="col_xs"]').val());
	
	if(col_sm < 1) col_sm = 1;
	if(col_sm > 12) col_sm = 12;
	
	if(col_xs < 6) col_xs = 6;
	if(col_xs > 12) col_xs = 12;
	
	var html = '';
	
	for( var i = 0; i < num_cols; i++) {
		html += '<div class="col-sm-'+col_sm+'"></div>';
	}
	
	$('#sm-preview').html(html);
	
	var html = '';
	
	for( var i = 0; i < num_cols; i++) {
		html += '<div class="col-sm-'+col_xs+'"></div>';
	}
	
	$('#xs-preview').html(html);
}

function addFrames(){
	var num_cols = parseInt($('#console select[name="num_cols"]').val());
	var col_sm = parseInt($('#console input[name="col_sm"]').val());
	var col_xs = parseInt($('#console input[name="col_xs"]').val());
	var width = $('#console input[name="full_width"]').val();
	var _class = $('#console input[name="class"]').val();
	
	if(col_sm < 1) col_sm = 1;
	if(col_sm > 12) col_sm = 12;
	
	if(col_xs < 6) col_xs = 6;
	if(col_xs > 12) col_xs = 12;
	
	if(width == '1170px'){
		var page_container = 'container';
	}else{
		var page_container = 'container-fluid';
	}
	
	var html = '';

	html += '<div class="module-frame ' + _class + ' ' + page_container + '">';
		html += '<div class="frame-header"><div class="frame-title">' + _class + '</div><div class="frame-down"><i class="fa fa-long-arrow-down"></i></div><div class="frame-up"><i class="fa fa-long-arrow-up"></i></div><div class="frame-remove"><i class="fa fa-trash"></i></div></div>';
		html += '<div class="row">';
			for(var i = 0; i < num_cols; i++){
				html += '<div class="col-sm-'+col_sm+' col-xs-'+col_xs+' frame-resize"><div class="frame"><div class="pre-div"></div></div></div>';
			}
		html += '</div>';
	html += '</div>';
	
	$('#monitor > .base').append(html);
	
	drag_row++;
	
	setSortable();
	setResizable();
}

function setSortable(){
	$('.base').sortable({
		cursor: 'move',
		placeholder: 'placeholder',
		forcePlaceholderSize: true,
		opacity: 0.4
	});
	
	$('.frame').sortable({
		connectWith: '.frame',
		cursor: 'move',
		placeholder: 'placeholder',
		forcePlaceholderSize: true,
		opacity: 0.4,
		stop: function(event, ui){
			
		}
	});
	
	$('.extension').sortable({
		helper: 'clone',
		connectWith: '.frame',
		cursor: 'move',
		placeholder: 'placeholder',
		forcePlaceholderSize: true,
		opacity: 0.4,
		star: function(event, ui){
			
		},
		stop: function(event, ui){
			var idx = $('.frame').children().index($(ui.item[0]));
			var elm = $(ui.item[0]).clone(true);
			$('.frame').children(':eq('+idx+')').after(elm);
			
			$(this).sortable('cancel');
			drag_row++;
		}
	})
	.disableSelection();
}

function setResizable(){
    var sib_total_width;
	var old_sm_col;
	var next_cell_old_sm_col;
	
    $('.frame-resize').resizable({
        handles: 'e',
		autoHide: false,
        start: function(event, ui){
			var container = ui.originalElement.parent();
            sib_total_width = ui.originalSize.width + ui.originalElement.next().outerWidth();
			old_sm_col = 'col-sm-'+(12*ui.originalElement.outerWidth() / container.innerWidth()).toFixed(0);
			next_cell_old_sm_col = 'col-sm-'+(12*ui.originalElement.next().outerWidth() / container.innerWidth()).toFixed(0);
			ui.originalElement.resizable('option', 'maxWidth', (sib_total_width-80));
        },
        stop: function(event, ui){
			var container = ui.originalElement.parent(); 
            var cell_percent_width = (100 * ui.originalElement.outerWidth()/ container.innerWidth()).toFixed(2);
			var cell_percent_width_round = round(cell_percent_width);
			var balance = cell_percent_width_round-cell_percent_width;
			
			ui.originalElement.css('width', cell_percent_width_round + '%');
			
			var col_sm = 'col-sm-'+(12*ui.originalElement.outerWidth() / container.innerWidth()).toFixed(0);
			
			ui.originalElement.removeClass(old_sm_col).addClass(col_sm).removeAttr('style'); 
			
            var next_cell = ui.originalElement.next();
			var next_percent_width= round((100 * next_cell.outerWidth()/container.innerWidth()).toFixed(2)-balance);
			
            next_cell.css('width', next_percent_width + '%');
			
			var next_cell_sm_col = 'col-sm-'+(12*next_cell.outerWidth() / container.innerWidth()).toFixed(0);
			
			next_cell.removeClass(next_cell_old_sm_col).addClass(next_cell_sm_col).removeAttr('style'); 
        },
        resize: function(event, ui){ 
			ui.originalElement.next().width(sib_total_width - ui.size.width); 
        }
    });
	
	$(".frame-resize:last-child").resizable('disable');
}
</script> 
<?php echo $footer; ?> 