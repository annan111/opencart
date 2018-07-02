<?php echo $header; ?>
<?php 
$config = $registry->get('config');

$language_id = $config->get('config_language_id');

$text_save_off = $config->get($config->get('config_theme') . '_text_save_off');
$text_save_off = (isset($text_save_off[$language_id])) ? $text_save_off[$language_id] : '';
$template_directory = $config->get($config->get('config_theme') . '_directory');
?>
<?php if ($products) { ?>
<script src="catalog/view/javascript/bossthemes/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bossthemes/owl-carousel/owl.carousel.min.css" type="text/css" rel="stylesheet" media="screen" />
<link href="catalog/view/theme/<?php echo $template_directory; ?>/stylesheet/bossthemes/owl.carousel.css" type="text/css" rel="stylesheet" media="screen" />
<?php } ?>
<div class="bt-breadcrumb">
  <div class="container">
    <ul class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"><span itemprop="title"><?php echo $breadcrumb['text']; ?></span></a></li>
      <?php } ?>
    </ul>
  </div>
</div>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div id="article-detail">
        <div class="content">
          <div class="article-image"><img src="<?php echo $thumb; ?>" alt="<?php echo $name;?>" title="<?php echo $name;?>"/></div>
          <div class="article-info">
            <div class="post-date">
              <div class="day"><?php echo $day; ?></div>
              <div class="month-year">
                <p><?php echo $month; ?> <?php echo $year; ?></p>
              </div>
            </div>
            <h1><?php echo $heading_title; ?></h1>
          </div>
        </div>
        <div class="article-content">
          <p><?php echo $title;?></p>
          <?php echo $content;?> </div>
        <div class="row">
          <div class="col-sm-6">
            <?php if ($tags && !empty($tags)) { ?>
            <div class="tags"><span><?php echo $text_tags; ?> </span>
              <ul>
                <?php for ($i = 0; $i < count($tags); $i++) { ?>
                <?php if ($i < (count($tags) - 1)) { ?>
                <li class="item"><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a></li>
                <?php } else { ?>
                <li class="item"><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a></li>
                <?php } ?>
                <?php } ?>
              </ul>
            </div>
            <?php } ?>
          </div>
          <div class="col-sm-6 text-right">
            <div class="sharing"> 
              <!-- AddThis Button BEGIN -->
              <div class="addthis_toolbox addthis_default_style addthis_20x20_style" data-addthis-title="<?php echo $name;?>" data-addthis-description="<?php echo utf8_substr(strip_tags(html_entity_decode($content, ENT_QUOTES, 'UTF-8')), 0, 150) . '..'; ?>" data-addthis-media="<?php echo $thumb; ?>"><a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a> <a class="addthis_button_google_plusone_share"></a><a class="addthis_button_pinterest_share"></a><a class="addthis_button_email"></a><a class="addthis_button_compact"></a><a class="addthis_counter addthis_bubble_style"></a></div>
              <script type="text/javascript">
				$(".sharing").find('[data-addthis-title]').each(function(index){
					$(this).attr("addthis:title",$(this).attr("data-addthis-title"));
					$(this).removeAttr('data-addthis-title');
					
					$(this).attr("addthis:description",$(this).attr("data-addthis-description"));
					$(this).removeAttr('data-addthis-description');
					
					$(this).attr("addthis:media",$(this).attr("data-addthis-media"));
					$(this).removeAttr('data-addthis-media');
				});
				</script> 
              <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js"></script> 
              <!-- AddThis Button END --> 
            </div>
          </div>
        </div>
        <div class="article-button">
          <?php if(isset($pre_href)&& $pre_href != '') { ?>
          <a class="btn btn-default" href="<?php echo $pre_href; ?>"><i class="fa fa-angle-left"></i></a>
          <?php } ?>
          <?php if(isset($next_href)&& $next_href != '') { ?>
          <a class="btn btn-default" href="<?php echo $next_href; ?>"><i class="fa fa-angle-right"></i></a>
          <?php } ?>
        </div>
      </div>
      <?php if ($comment_status==1||$allow_comment==1) { ?>
      <div id="blog-review">
        <div class="nav-heading">
          <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#article-comments"><?php echo $view_comment; ?></a></li>
            <li><a data-toggle="tab" href="#comment-box"><?php echo $text_comment; ?></a></li>
            <?php if (!empty($boss_facecomments) && $boss_facecomments['status']) { ?>
            <li><a data-toggle="tab" href="#facebook-comment">Facebook Comment</a></li>
            <?php } ?>
          </ul>
        </div>
        <div class="tab-content">
          <div id="article-comments" class="tab-pane fade in active"></div>
          <div id="comment-box" class="tab-pane fade">
            <div class="row v-margin-20">
              <div class="col-sm-6">
                <?php if(!$login){?>
                <div class="field">
                  <label class="" for="username"><?php echo $text_username; ?><em>*</em></label>
                  <div class="input-box">
                    <input type="text" class="form-control required-entry" value="" title="Name" id="username" name="username">
                  </div>
                </div>
                <div class="field">
                  <label class="" for="email-blog"><?php echo $text_email; ?><em>*</em></label>
                  <div class="input-box">
                    <input type="text" class="form-control required-entry validate-email" value="" title="Email" id="email-blog" name="email_blog">
                  </div>
                </div>
                <?php } else{?>
                <input type="hidden" class="form-control required-entry" value="<?php echo $username; ?>" title="Name" id="username" name="username">
                <input type="hidden" class="form-control required-entry validate-email" value="<?php echo $email; ?>" title="Email" id="email-blog" name="email_blog">
                <?php } ?>
              </div>
              <div class="col-sm-6">
                <div class="input-box-comment">
                  <label class="tt_input" for="comment"><?php echo $entry_comment; ?><em>*</em></label>
                  <textarea rows="2" cols="10" class="required-entry form-control" style="height: 107px" title="Comment" id="comment" name="comment_content"></textarea>
                </div>
              </div>
            </div>
            <?php if ($site_key) { ?>
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                <?php if ($error_captcha) { ?>
                <div class="text-danger"><?php echo $error_captcha; ?></div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <div class="text-center v-margin-20"> <a id="button-comment" class="btn btn-default"><?php echo $button_submit; ?></a> </div>
          </div>
        </div>
      </div>
      <?php } ?>
      <?php if (!empty($boss_facecomments) && $boss_facecomments['status']) { ?>
      <div id="facebook-comment" class="bt-facecomments">
        <div class="row">
          <div class="col-sm-12">
            <div class="fb-comments" data-href="<?php echo $url_f; ?>" data-colorscheme="<?php echo $boss_facecomments['color_scheme']; ?>" data-numposts="<?php echo $boss_facecomments['num_posts']; ?>" data-order-by="<?php echo $boss_facecomments['order_by']; ?>" ></div>
          </div>
        </div>
        <div id="fb-root"></div>
      </div>
      <?php } ?>
      <?php if ($column_left && $column_right) { ?>
      <?php $per_row = 2; ?>
      <?php } elseif ($column_left || $column_right) { ?>
      <?php $per_row = 3; ?>
      <?php } else { ?>
      <?php $per_row = 4; ?>
      <?php } ?>
      <?php if ($articles) { ?>
      <div class="box-title">
        <h2><?php echo $text_article_related; ?> (<?php echo count($articles); ?>)</h2>
      </div>
      <div class="box-content">
        <div id="article-related" class="owl-carousel-2 owl-theme-2 nav-top-right nav-visible">
          <?php foreach ($articles as $article) { ?>
          <div class="article-layout article-related">
            <div class="article-thumb">
              <div class="article-image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" title="<?php echo $article['name']; ?>" class="img-responsive" /></a></div>
              <div class="article-info">
                <div class="post-date">
                  <div class="day"><?php echo $article['day']; ?></div>
                  <div class="month-year">
                    <p><?php echo $article['month']; ?></p>
                    <p><?php echo $article['year']; ?></p>
                  </div>
                </div>
                <div class="article-name"> <a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a> </div>
                <a href="<?php echo $article['href']; ?>" class="view-more"><?php echo $button_read_more; ?></a> </div>
            </div>
          </div>
          <?php } ?>
        </div>
      </div>
      <?php } ?>
      <?php if ($products) { ?>
      <div class="box-title">
        <h2><?php echo $text_product_related; ?> (<?php echo count($products); ?>)</h2>
      </div>
      <div class="box-content">
        <div id="product-related" class="owl-carousel-2 owl-theme-2 nav-middle nav-visible">
          <?php foreach ($products as $product) { ?>
          <div class="product-layout product-related">
            <div class="product-thumb">
              <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                <div class="button-group">
                  <button type="button" onclick="btadd.cart('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="lnr lnr-cart"></i> <span><?php echo $button_cart; ?></span></button>
                  <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="btadd.wishlist('<?php echo $product['product_id']; ?>');"><i class="lnr lnr-heart"></i></button>
                  <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="btadd.compare('<?php echo $product['product_id']; ?>');"><i class="lnr lnr-sync"></i></button>
                </div>
              </div>
              <div class="caption">
                <h4 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                <p class="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                  <?php } ?>
                  <?php if ($product['tax']) { ?>
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                  <?php } ?>
                </p>
                <?php if ($product['rating']) { ?>
                <div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <?php if ($product['special']) { ?>
              <div class="save-off"><?php echo $text_save_off; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
        </div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?> </div>
</div>
<?php if ($products) { ?>
<script type="text/javascript">
$(function() {
	if ($('html').attr('dir') == 'rtl') {
		var rtl = true;
	} else {
		var rtl = false;
	}
	
	var elm = $('#product-related');
	var loop = (elm.children().length > <?php echo $per_row; ?>) ? true : false;
	
	elm.owlCarousel2({
		items: <?php echo $per_row; ?>,
		loop: loop,
		nav: true,
		navText: ['<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMjIuNDU3MjA3NCAxLjAwNzQ2MTQ3bC0yMSAyMC4wMjQ4MjE0MyAyMC45NDc5Mzk3IDE5Ljk3NTE3ODYiIHN0cm9rZT0iIzJEMkQyRCIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjwvc3ZnPg==" />', '<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMS40NTY3OSAxLjAwNzQ2MTQ3bDIxIDIwLjAyNDgyMTQzTDEuNTA4ODUgNDEuMDA3NDYxNSIgc3Ryb2tlPSIjMkQyRDJEIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PC9zdmc+" />'],
		dots: false,
		margin: 20,
		rtl: rtl,
		responsive:{
			992: {
				items: <?php echo $per_row; ?>
			},
			768: {
				items: <?php echo round($per_row/2); ?>
			},
			560: {
				items: <?php echo round($per_row/2); ?>
			},
			0: {
				items: 1
			}
		}	
	});
});
</script>
<?php } ?>
<?php if ($articles) { ?>
<script type="text/javascript">
$(function() {
	if ($('html').attr('dir') == 'rtl') {
		var rtl = true;
	} else {
		var rtl = false;
	}
	
	var elm = $('#article-related');
	var loop = (elm.children().length > <?php echo $per_row; ?>) ? true : false;
	
	elm.owlCarousel2({
		items: <?php echo $per_row; ?>,
		loop: loop,
		nav: true,
		navText: ['<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMjIuNDU3MjA3NCAxLjAwNzQ2MTQ3bC0yMSAyMC4wMjQ4MjE0MyAyMC45NDc5Mzk3IDE5Ljk3NTE3ODYiIHN0cm9rZT0iIzJEMkQyRCIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjwvc3ZnPg==" />', '<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMS40NTY3OSAxLjAwNzQ2MTQ3bDIxIDIwLjAyNDgyMTQzTDEuNTA4ODUgNDEuMDA3NDYxNSIgc3Ryb2tlPSIjMkQyRDJEIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PC9zdmc+" />'],
		dots: false,
		margin: 20,
		rtl: rtl,
		responsive:{
			992: {
				items: <?php echo $per_row; ?>
			},
			768: {
				items: <?php echo round($per_row/2); ?>
			},
			560: {
				items: <?php echo round($per_row/2); ?>
			},
			0: {
				items: 1
			}
		}
	});
});
</script>
<?php } ?>
<?php if (!empty($boss_facecomments) && $boss_facecomments['status']) { ?>
<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3&appId=<?php echo $boss_facecomments['app_id']; ?>";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>
<?php } ?>
<script type="text/javascript"><!--
$('#article-comments').load('index.php?route=bossblog/article/comment&blog_article_id=<?php echo $blog_article_id; ?>');
$('#button-comment').bind('click', function() { 
	$.ajax({
		url: 'index.php?route=bossblog/article/write&blog_article_id=<?php echo $blog_article_id; ?>&need_approval=<?php echo $need_approval; ?>&approval_status=<?php echo $approval_status; ?>',
		type: 'post',
		dataType: 'json',
		data: 'username=' + encodeURIComponent($('input[name=\'username\']').val()) + '&comment_content=' + encodeURIComponent($('textarea[name=\'comment_content\']').val()) + '&email=' + encodeURIComponent($('input[name=\'email_blog\']').val()) + '&g-recaptcha-response=' + encodeURIComponent($('textarea[name=\'g-recaptcha-response\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-comment').attr('disabled', true);
			$('#new').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() { 
			$('#button-comment').attr('disabled', false);
			$('#captcha').attr('src', 'index.php?route=tool/captcha#'+new Date().getTime());
			$('.attention').remove();
			$('input[name=\'captcha\']').val('');
		},		
		success: function(json) { 
			if (json['error']) {
				$('#new').after('<div class="warning">' + json['error'] + '</div>');
			}
			
			if (json['success']) {
				$('#new').after('<div class="success">' + json['success'] + '</div>');
				$('#article-comments').load('index.php?route=bossblog/article/comment&blog_article_id=<?php echo $blog_article_id; ?>');				
				$('input[name=\'username\']').val('');
				$('textarea[name=\'comment_content\']').val('');
				$('input[name=\'email_blog\']').val('');
                $('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<?php echo $footer; ?>