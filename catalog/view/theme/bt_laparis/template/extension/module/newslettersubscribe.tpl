<div id="boss-newslette-<?php echo $module; ?>">
  <?php if ($sidebar) { ?>
  <div class="bt-newsletter box style-2 sidebar cover-bg" <?php if ($bg_image) { ?> style="background-image: url('<?php echo  $bg_image; ?>');" <?php } ?>>
    <div class="box-heading">
      <h2> <?php echo $title; ?></h2>
    </div>
    <div class="box-content">
      <div class="sub-title"><?php echo $sub_title; ?></div>
      <form id="subscribe-<?php echo $module; ?>">
        <div class="boss-newsletter">
          <input class="form-control input-new" size="50" type="text" placeholder="<?php echo $text_email; ?>" name="subscribe_email" id="subscribe_email" />
        </div>
        <div class="boss-newslette-result"></div>
        <div class="buttons">
          <a class="btn btn-default" onclick="email_subscribe(this);"><?php echo $text_subscribe; ?></a>
          <?php if($unsubscribe) { ?>
          <a class="btn btn-default" onclick="email_unsubscribe(this);"><span><?php echo $entry_unbutton; ?></span></a>
          <?php } ?>
        </div>
        <input type="hidden" name="module_id" value="<?php echo $module_id; ?>" />
        <input type="hidden" name="subscribe_name" />
      </form>
    </div>
  </div>
  <?php } else { ?>
  <div class="bt-newsletter content parallax-bg" <?php if ($bg_image) { ?> style="background-image: url('<?php echo  $bg_image; ?>');" <?php } ?>>
    <div class="container">
      <div class="row">
        <div class="col-sm-6">
          <div class="title text-center">
            <h2><?php echo $title; ?></h2>
            <p><?php echo $sub_title; ?></p>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="newsletter-content">
            <div id="frm_subscribe">
              <form id="subscribe-<?php echo $module; ?>">
                <div class="input-group boss-newsletter">
                  <input class="form-control input-new" size="50" type="text" placeholder="<?php echo $text_email; ?>" name="subscribe_email" id="subscribe_email" />
                  <span class="input-group-addon"> <a class="" onclick="email_subscribe(this);"><?php echo $text_subscribe; ?></a></span> </div>
                <div class="boss-newslette-result"></div>
                <?php if($unsubscribe) { ?>
                <div class="buttons text-center"> <a class="btn btn-default" onclick="email_unsubscribe(this);"><span><?php echo $entry_unbutton; ?></span></a> </div>
                <?php } ?>
                <input type="hidden" name="module_id" value="<?php echo $module_id; ?>" />
                <input type="hidden" name="subscribe_name" />
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
function email_subscribe(index){
	$.ajax({
		type: 'post',
		url: 'index.php?route=extension/module/newslettersubscribe/subscribe',
		dataType: 'json',
		data: $(index).parents('form').serialize(),
		success: function (json) {
			if (json['success']) {
				$(index).parents('form').find('.boss-newslette-result').html(json['success']);
			} else {
				$(index).parents('form').find('.boss-newslette-result').html(json['error']);
			}
		}
	}); 
}
function email_unsubscribe(index){
	$.ajax({
		type: 'post',
		url: 'index.php?route=extension/module/newslettersubscribe/unsubscribe',
		dataType: 'json',
		data: $(index).parents('form').serialize(),
		success: function (json) {
			if (json['success']) {
				$(index).parents('form').find('.boss-newslette-result').html(json['success']);
			} else {
				$(index).parents('form').find('.boss-newslette-result').html(json['error']);
			}
		}
	}); 
}

$('.boss-newsletter input[name="subscribe_email"]').on('keyup', function(e) {
	if (e.keyCode == 13) {
		$(this).parent().find('a').trigger('click');
	}
});

$('#subscribe-<?php echo $module; ?>').on('submit', function(e) {
	e.preventDefault();
	email_subscribe();
});
//--></script>
<?php if ($show_popup) { ?>
<script type="text/javascript">
$(window).load(function() {
	$('#boss-newslette-popup<?php echo $module; ?>').modal('show');
});

function validate () {
	if ($('input[name="subscribe_checkbox"]').is(':checked')) { 
		document.cookie="b_newsletter_popup=disable"; 
	} else { 
		document.cookie="b_newsletter_popup=enable;";
	}
}
</script>
<div id="boss-newslette-popup<?php echo $module; ?>" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="bt-newsletter-popup parallax-bg v-padding-70" <?php if ($popup['background']) { ?> style="background-image: url('<?php echo  $popup['background']; ?>');" <?php } ?>>
        <div class="bt-container">
          <div class="title text-center">
            <h2><?php echo $popup['title']; ?></h2>
            <p><?php echo $popup['sub_title']; ?></p>
          </div>
          <div class="newsletter-content">
            <div id="frm_subscribe">
              <form>
                <div class="col-sm-8 col-sm-offset-2">
                  <div class="input-group boss-newsletter">
                    <input class="form-control input-new" size="50" type="text" placeholder="<?php echo $text_email; ?>" name="subscribe_email" id="subscribe_email" />
                    <span class="input-group-addon"> <a class="btn btn-primary" onclick="email_subscribe(this);"><i class="fa fa-paper-plane"></i></a></span> </div>
                  <label class="checkbox">
                    <input type="checkbox" value="1" name="subscribe_checkbox" id="subscribe_checkbox" onclick="validate()" />
                    <?php echo $text_not_show; ?> </label>
                  <div class="boss-newslette-result"></div>
                  <?php if($unsubscribe) { ?>
                  <div class="buttons text-center"> <a class="btn btn-default" onclick="email_unsubscribe(this);"><span><?php echo $entry_unbutton; ?></span></a> </div>
                  <?php } ?>
                </div>
                <input type="hidden" name="module_id" value="<?php echo $module_id; ?>" />
                <input type="hidden" name="subscribe_name" />
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<?php } ?>
