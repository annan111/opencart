<?php
$config = $registry->get('config');

$template_directory = $config->get($config->get('config_theme') . '_directory');
$language_id = $config->get('config_language_id');

$boss_manager = $config->get('boss_manager');
$boss_header = $config->get('boss_header');
$boss_custom = $config->get('boss_custom');

$release = (int)$config->get('customizer_release');
?>
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Poppins:300,400,500,600,700&subset=devanagari,latin-ext" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Kaushan+Script&subset=latin-ext" rel="stylesheet">
<link href="catalog/view/theme/<?php echo $template_directory; ?>/stylesheet/linear-free-fonts.css" rel="stylesheet">
<link href="catalog/view/theme/<?php echo $template_directory; ?>/stylesheet/stylesheet.css" rel="stylesheet">
<?php if (isset($boss_manager['animation'])) { ?>
<script src="catalog/view/javascript/bossthemes/wow/wow.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bossthemes/wow/animate.css" rel="stylesheet" type="text/css" />
<?php } ?>
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<?php if (isset($boss_manager['responsive'])) {  ?>
<link href="catalog/view/theme/<?php echo $template_directory; ?>/stylesheet/responsive.css" rel="stylesheet" type="text/css" />
<?php }else{ ?>
<link href="catalog/view/theme/<?php echo $template_directory; ?>/stylesheet/non-responsive.css" rel="stylesheet" type="text/css" />
<?php } ?>
<?php if ($direction == 'rtl') { ?>
<link href="catalog/view/theme/<?php echo $template_directory; ?>/stylesheet/stylesheet-rtl.css" rel="stylesheet" type="text/css" />
<?php } ?>
<?php if ($release) { ?>
<link href="catalog/view/theme/<?php echo $template_directory; ?>/stylesheet/customizer.css?r=<?php echo $release; ?>" rel="stylesheet" type="text/css" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<script src="catalog/view/javascript/bossthemes/jquery.jgrowl.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/bossthemes/bossthemes.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
<?php if (!empty($boss_custom['css'])) { ?>
<style type="text/css">
<?php echo $boss_custom['css']; ?>
</style>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">
<div id="top"> <?php echo $header_top; ?></div>
<header>
  <div class="container">
    <div class="row">
      <div class="header-content">
        <div class="col-sm-4 hidden-xs">
          <div id="logo">
            <?php if ($logo && isset($boss_header['link']['logo'])) { ?>
            <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
            <?php } else { ?>
            <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
            <?php } ?>
          </div>
        </div>
        <div class="col-sm-8 col-right">
          <?php if (isset($boss_header['link']['account'])) { ?>
          <div class="account pull-right">
            <div class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="lnr lnr-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span><!--<i class="fa fa-caret-down"></i>--></a>
              <ul class="dropdown-menu dropdown-menu-right">
                <?php if ($logged) { ?>
                <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                <?php } else { ?>
                <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                <?php } ?>
              </ul>
            </div>
          </div>
          <?php } ?>
          <div class="pull-right">
            <?php if (isset($boss_header['link']['language'])) echo $currency; ?>
          </div>
          <div class="pull-right">
            <?php if (isset($boss_header['link']['currency'])) echo $language; ?>
          </div>
          <?php if (isset($boss_header['link']['search'])) { ?>
          <?php echo $search; ?>
          <?php } ?>
        </div>
      </div>
    </div>
    <div id="top-links" class="nav hidden-xs pull-right">
      <ul class="list-inline">
        <?php if(isset($boss_header['link']['phone'])){ ?>
        <li><a href="<?php echo $contact; ?>"><i class="fa fa-phone-square" aria-hidden="true"></i> <span><?php echo $telephone; ?></span></a></li>
        <?php } ?>
        <?php if (isset($boss_header['link']['wishlist'])) { ?>
        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="lnr lnr-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>
        <?php } ?>
        <?php if (isset($boss_header['link']['shopping_cart'])) { ?>
        <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="lnr lnr-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a> </li>
        <?php } ?>
        <?php if (isset($boss_header['link']['checkout'])) { ?>
        <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <?php if (isset($boss_header['mega_menu'])) { ?>
  <div class="navbar-header" data-target=".bt-mobile-menu">
    <button type="button" class="btn btn-navbar"></button>
  </div>
  <?php } ?>
</header>
<div class="logo-mobile hidden-lg hidden-md hidden-sm">
  <?php if ($logo && isset($boss_header['link']['logo'])) { ?>
  <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
  <?php } else { ?>
  <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
  <?php } ?>
</div>
<div class="menu-wrap hidden-xs">
  <div class="container-fluid">
    <div class="row">
      <?php if (isset($boss_header['mega_menu'])) { ?>
      <div class="container">
        <div class="row">
        <div class="col-md-11 col-sm-10 col-menu"> <?php echo $header_menu; ?> </div>
        <div class="col-md-1 col-sm-2 col-cart">
          <?php if(isset($boss_header['link']['mini_cart'])){ ?>
          <?php echo $cart; ?>
          <?php } ?>
        </div>
        </div>
      </div>
      <?php } else { ?>
      <?php if ($categories) { ?>
      <div class="container">
        <nav id="menu" class="navbar">
          <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
            <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
          </div>
          <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav">
              <?php foreach ($categories as $category) { ?>
              <?php if ($category['children']) { ?>
              <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
                <div class="dropdown-menu">
                  <div class="dropdown-inner">
                    <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                    <ul class="list-unstyled">
                      <?php foreach ($children as $child) { ?>
                      <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                      <?php } ?>
                    </ul>
                    <?php } ?>
                  </div>
                  <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
              </li>
              <?php } else { ?>
              <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
              <?php } ?>
              <?php } ?>
            </ul>
          </div>
        </nav>
      </div>
      <?php } ?>
      <?php } ?>
    </div>
  </div>
</div>
<?php if (isset($boss_header['mega_menu'])) { ?>
<div class="bt-mobile-menu">
  <div class="menu-mobile"> </div>
</div>
<script type="text/javascript">
var mega_menu = $('.menu-wrap .bt-mega-menu');

if (mega_menu.length) {
	var id = parseFloat(mega_menu.attr('id').replace(/\D/g,''));
	$('.bt-mobile-menu').attr('id', 'bt-mobile-menu' + id).children('.menu-mobile').html(mega_menu.html());
	
	$('.navbar-header').data('target', '#bt-mobile-menu' + id).btMobileMenu();
}
</script>
<?php } ?>
<?php echo $header_bottom; ?>
<?php if (isset($boss_manager['sticky_menu'])) { ?>
<script type="text/javascript">
var menu_height = $('header .mega-menu > ul > li').height();

$(window).scroll(function () {
    var height_header = ($('#top').height() + $('header').height());
	
    if ($(window).scrollTop() > height_header && !$('.menu-wrap').hasClass('menu-stick')) {
        $('.menu-wrap').addClass('menu-stick');
    } else if ($(window).scrollTop() <= height_header && $('.menu-wrap').hasClass('menu-stick')) {
        $('.menu-wrap').removeClass('menu-stick');
    }
});
</script>
<?php } ?>
<?php if (isset($boss_manager['loading'])) { ?>
<div id="bt-loading">
  <div class="bt-loading">
    <div class="sk-fading-circle">
      <div class="sk-circle1 sk-circle"></div>
      <div class="sk-circle2 sk-circle"></div>
      <div class="sk-circle3 sk-circle"></div>
      <div class="sk-circle4 sk-circle"></div>
      <div class="sk-circle5 sk-circle"></div>
      <div class="sk-circle6 sk-circle"></div>
      <div class="sk-circle7 sk-circle"></div>
      <div class="sk-circle8 sk-circle"></div>
      <div class="sk-circle9 sk-circle"></div>
      <div class="sk-circle10 sk-circle"></div>
      <div class="sk-circle11 sk-circle"></div>
      <div class="sk-circle12 sk-circle"></div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
window.onload = function () {
	$(".bt-loading").fadeOut("1500", function () {
		$('#bt-loading').css("display", "none");
	});
};
//--></script>
<?php } ?>
