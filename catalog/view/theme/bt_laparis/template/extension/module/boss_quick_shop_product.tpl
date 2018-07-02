<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" title="<?php echo $text_hover_remove; ?>" data-dismiss="modal" aria-hidden="true">&times;</button>
    </div>
    <div class="modal-body">
      <div id="notification"></div>
      <div id="content">
        <div class="product-info-qs product-info">
          <div class="row">
            <div class="col-md-6 col-xs-12">
              <?php if ($thumb || $images) { ?>
              <div class="product-thumb" id="product-quickshop-thumb">
                <?php if ($popup) { ?>
                <div class="image-item"><img src="<?php echo $popup; ?>" class="product-image" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"/></div>
                <?php } ?>
                <?php foreach ($images as $image) { ?>
                <div class="image-item"><img src="<?php echo $image['popup']; ?>" class="product-image" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></div>
                <?php } ?>
              </div>
              <div class="image-additional" id="product-quickshop-nav">
                <?php if ($thumb) { ?>
                <div class="image-item"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt = "<?php echo $heading_title; ?>"/></div>
                <?php } ?>
                <?php foreach ($images as $image) { ?>
                <div class="image-item"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></div>
                <?php } ?>
              </div>
              <?php } ?>
            </div>
            <div class="col-md-6 col-xs-12">
              <div class="product-name">
                <h2><?php echo $heading_title; ?></h2>
              </div>
              <div class="description"> <?php echo $description; ?> </div>
              <?php if ($price) { ?>
              <div class="price-box">
                <div class="price">
                  <?php if (!$special) { ?>
                  <span><?php echo $price; ?></span>
                  <?php } else { ?>
                  <span class="price-old"><?php echo $price; ?></span> <span class="price-new"><?php echo $special; ?></span>
                  <?php } ?>
                </div>
              </div>
              <?php } ?>
              <div class="button-group button-list">
                <button class="btn btn-default btn-cart" type="button" onclick="btadd.cart('<?php echo $product_id; ?>');"><i class="lnr lnr-cart"></i> <?php echo $button_cart; ?></button>
                <button class="btn btn-default btn-wishlist" type="button" title="<?php echo $button_wishlist; ?>" onclick="btadd.wishlist('<?php echo $product_id; ?>');"><i class="lnr lnr-heart"></i></button>
                <button class="btn btn-default btn-compare" type="button" title="<?php echo $button_compare; ?>" onclick="btadd.compare('<?php echo $product_id; ?>');"><i class="lnr lnr-sync"></i></button>
              </div>
              <a href="<?php echo $product_href; ?>" class="btn btn-primary"><?php echo $button_viewdetail; ?></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$(function() {
	if ($('html').attr('dir') == 'rtl') {
		var rtl = true;
	} else {
		var rtl = false;
	}
	
	$('#product-quickshop-nav').slick({
		slidesToShow: 4,
		slidesToScroll: 1,
		asNavFor: '#product-quickshop-thumb',
		arrows: false,
		focusOnSelect: true,
		vertical: false,
		centerPadding: 0,
		variableWidth: true,
		rtl: rtl,
		responsive:[
			{
				breakpoint: 767,
				settings: {
					infinite: false,
					slidesToShow: 1,
					vertical:false,
					variableWidth: true
				}
			}
		]
	});
	
	$('#product-quickshop-thumb').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		asNavFor: '#product-quickshop-nav',
		prevArrow: '<div class="slick-prev"><img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMjIuNDU3MjA3NCAxLjAwNzQ2MTQ3bC0yMSAyMC4wMjQ4MjE0MyAyMC45NDc5Mzk3IDE5Ljk3NTE3ODYiIHN0cm9rZT0iIzJEMkQyRCIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjwvc3ZnPg==" /></div>',
		nextArrow: '<div class="slick-next"><img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMS40NTY3OSAxLjAwNzQ2MTQ3bDIxIDIwLjAyNDgyMTQzTDEuNTA4ODUgNDEuMDA3NDYxNSIgc3Ryb2tlPSIjMkQyRDJEIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PC9zdmc+" /></div>',
		rtl: rtl,
		fade: true,
		responsive:[
			{
				breakpoint: 767,
				settings: {
					infinite: false
				}
			}
		]
	});
	
	$('#product-quickshop-thumb .image-item').zoom();
	
	$(window).resize();
});

$('.product-info-qs select[name="profile_id"], .product-info-qs input[name="quantity-qs"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('.product-info-qs input[name="product_id"], .product-info-qs input[name="quantity-qs"], .product-info-qs select[name="profile_id"]'),
		dataType: 'json',
		beforeSend: function() {
			$('.product-info-qs #profile-description').html('');
		},
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();

			if (json['success']) {
				$('.product-info-qs #profile-description').html(json['success']);
			}
		}
	});
});
//--></script> 