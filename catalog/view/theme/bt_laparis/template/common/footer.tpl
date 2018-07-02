<?php
$config = $registry->get('config') ;
$url = $registry->get('url');

$language_id = $config->get('config_language_id');

$boss_manager = $config->get('boss_manager');
$boss_footer = $config->get('boss_footer');
$boss_social = $config->get('boss_social');
$boss_payment = $config->get('boss_payment');
$boss_custom = $config->get('boss_custom');

$home = $url->link('common/home');
$logo = (is_file(constant('DIR_IMAGE') . $config->get('config_logo'))) ? 'image/' . $config->get('config_logo') : '';
$name = $config->get('config_name');
?>
<?php echo $footer_top; ?>

<footer>
  <div class="container">
    <?php if ($footer_first) { ?>
    <?php echo $footer_first; ?>
    <?php } ?>
    <div class="content">
      <div class="row">
        <div class="col-sm-7">
          <div class="row">
            <?php if(isset($boss_footer['about_us']['status'])){ ?>
            <div class="col-sm-4">
              <div class="footer-about">
                <?php if (isset($boss_footer['about_us']['title'][$language_id])) { ?>
                <h3><?php echo $boss_footer['about_us']['title'][$language_id]; ?></h3>
                <?php } ?>
                <?php if(isset($boss_footer['about_us']['image'])){ ?>
                <a href="<?php echo $boss_footer['about_us']['link']; ?>"><img src="image/<?php echo $boss_footer['about_us']['image']; ?>" alt="<?php echo $name; ?>"/></a>
                <?php } ?>
                <?php echo html_entity_decode($boss_footer['about_us']['content'][$language_id], ENT_QUOTES, 'UTF-8'); ?> </div>
            </div>
            <?php } ?>
            <?php if ($informations && isset($boss_footer['link']['information'])) { ?>
            <div class="col-sm-4 information">
              <h3><?php echo $text_information; ?></h3>
              <ul class="list-unstyled">
                <?php foreach ($informations as $information) { ?>
                <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                <?php } ?>
              </ul>
            </div>
            <?php } ?>
            <div class="col-sm-4 service">
              <h3><?php echo $text_service; ?></h3>
              <ul class="list-unstyled">
                <?php if(isset($boss_footer['link']['contact_us'])){ ?>
                <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                <?php } ?>
                <?php if(isset($boss_footer['link']['return'])){ ?>
                <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                <?php } ?>
                <?php if(isset($boss_footer['link']['account'])){ ?>
                <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                <?php } ?>
                <?php if(isset($boss_footer['link']['newsletter'])){ ?>
                <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                <?php } ?>
                <?php if(isset($boss_footer['link']['order'])){ ?>
                <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                <?php } ?>
                <?php if(isset($boss_footer['link']['wishlist'])){ ?>
                <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                <?php } ?>
              </ul>
            </div>
            <div class="col-sm-4 extras">
              <h3><?php echo $text_extra; ?></h3>
              <ul class="list-unstyled">
                <?php if(isset($boss_footer['link']['brands'])){ ?>
                <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                <?php } ?>
                <?php if(isset($boss_footer['link']['gift_vouchers'])){ ?>
                <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                <?php } ?>
                <?php if(isset($boss_footer['link']['affiliates'])){ ?>
                <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
                <?php } ?>
                <?php if(isset($boss_footer['link']['specials'])){ ?>
                <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
                <?php } ?>
                <?php if(isset($boss_footer['link']['site_map'])){ ?>
                <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                <?php } ?>
              </ul>
            </div>
          </div>
        </div>
        <div class="col-sm-5">
          <div class="row">
            <?php if (isset($boss_footer['social']['status'])) { ?>
              <div class="col-sm-6 social">
			    <?php if (isset($boss_footer['social']['title'][$language_id])) { ?>
                <h3><?php echo $boss_footer['social']['title'][$language_id]; ?></h3>
				<?php } ?>
                <ul class="list-unstyled">
                  <?php if ($boss_social) { ?>
                    <?php foreach ($boss_social as $social) { ?>
                      <li>
                        <a class="social-link" href="<?php echo $social['link']; ?>" title="<?php echo (isset($social['name'][$language_id])) ? $social['name'][$language_id] : ''; ?>">
                          <?php if ($social['image']) { ?>
                            <img src="image/<?php echo $social['image']; ?>" alt="<?php echo (isset($social['name'][$language_id])) ? $social['name'][$language_id] : ''; ?>"/>
                          <?php } ?>
                          <?php if ($social['icon']) { ?>
                            <i class="fa <?php echo $social['icon']; ?>"></i>
                          <?php } ?>
                          <?php echo (isset($social['name'][$language_id])) ? $social['name'][$language_id] : ''; ?>
                        </a>
                      </li>
                    <?php } ?>
                  <?php } ?>
                </ul>
              </div>
            <?php } ?>
            <?php if (isset($boss_footer['payment']['status'])) { ?>
              <div class="col-sm-6 payment">
			    <?php if (isset($boss_footer['payment']['title'][$language_id])) { ?>
                <h3><?php echo $boss_footer['payment']['title'][$language_id]; ?></h3>
				<?php } ?>
                <ul class="list-unstyled">
                  <?php if ($boss_payment) { ?>
                    <?php foreach ($boss_payment as $payment) { ?>
                      <li>
                        <a class="payment-link" href="<?php echo $payment['link']; ?>" title="<?php echo (isset($payment['name'][$language_id])) ? $payment['name'][$language_id] : ''; ?>">
                          <?php if ($payment['image']) { ?>
                            <img src="image/<?php echo $payment['image']; ?>" alt="<?php echo (isset($payment['name'][$language_id])) ? $payment['name'][$language_id] : ''; ?>"/>
                          <?php } ?>
                          <?php if ($payment['icon']) { ?>
                            <i class="fa <?php echo $payment['icon']; ?>"></i>
                          <?php } ?>
                        </a>
                      </li>
                    <?php } ?>
                  <?php } ?>
                </ul>
              </div>
            <?php } ?>
          </div>
        </div>
        <?php if ($footer_second) { ?>
        <div class="col-sm-12"> <?php echo $footer_second; ?> </div>
        <?php } ?>
        <?php if(isset($boss_footer['embed']['status'])){ ?>
        <div class="col-sm-3">
          <h3><?php echo (isset($boss_footer['embed']['title'][$language_id])) ? $boss_footer['embed']['title'][$language_id] : ''; ?></h3>
          <div class="footer-embed"><?php echo (isset($boss_footer['embed']['content'][$language_id])) ? html_entity_decode($boss_footer['embed']['content'][$language_id]) : ''; ?></div>
        </div>
        <?php } ?>
      </div>
    </div>
  </div>
  <div class="footer-bottom">
    <div class="container">
      <div class="logo"> <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a> </div>
      <?php if (isset($boss_footer['powered']['status'])) { ?>
      <div class="powered text-right"> <?php echo (isset($boss_footer['powered']['content'][$language_id])) ? html_entity_decode($boss_footer['powered']['content'][$language_id])  :  $powered; ?> </div>
      <?php } ?>
    </div>
  </div>
</footer>
<?php if (isset($boss_manager['animation'])) { ?>
<script type="text/javascript">
	$(function() {
	  var wow = new WOW({animateClass: 'animated'});
	  wow.init();
	});
</script>
<?php } ?>
<?php if(isset($boss_manager['button_to_top'])){ ?>
<div id="back-top" class="back-top" title="Back To Top"><span></span></div>
<script type="text/javascript">
        $(function(){
			$(window).scroll(function(){
				if($(this).scrollTop()>600){
				  $('#back-top').fadeIn();
				}
				else{
				  $('#back-top').fadeOut();
				}
			});
			$("#back-top").click(function (e) {
				e.preventDefault();
				$('body,html').animate({scrollTop : 0},800,'swing');
			});
        });
</script>
<?php } ?>
<script type="text/javascript">
$(function(){
	$('.product-thumb .button-group button:first-child').onresize(function(elm) {
		if (elm.width() < 140) {
			$('span', elm).addClass('hidden');
		} else {
			$('span', elm).removeClass('hidden');
		}
	}).trigger('onresize');
});
</script>
<?php if (!empty($boss_custom['javascript'])) { ?>
<script type="text/javascript">
<?php echo $boss_custom['javascript']; ?>
</script>
<?php } ?>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//--> 

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>