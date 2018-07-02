<?php if(!empty($product_data['mainproduct']) || !empty($product_data['products'])){ ?>

<div class="bt-featured-pro box <?php echo ($sidebar) ? 'sidebar style-2' : 'style-1'; ?>" >
  <div class="container-fluid">
    <div class="row">
      <?php if ($heading_title || $description) { ?>
      <div class="box-heading title">
        <?php if ($heading_title) { ?>
        <h2><?php echo $heading_title; ?></h2>
        <?php } ?>
        <?php if ($description) { ?>
        <div class="box-description"> <?php echo $description; ?> </div>
        <?php } ?>
      </div>
      <?php } ?>
      <div class="box-content">
        <?php if ($banner_left && $banner_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else if ($banner_left || $banner_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = ''; ?>
        <?php } ?>
        <div class="<?php echo ($banner_left || $banner_right) ? 'row' : ''; ?>">
          <?php if ($banner_left) { ?>
          <div class="col-sm-3 hidden-xs banner-left">
            <div class="image"><a href="<?php echo $banner_left['link']; ?>" title="<?php echo $heading_title; ?>"><img src="image/<?php echo $banner_left['image']; ?>" class="img-responsive" alt="<?php echo $heading_title; ?>" /></a></div>
          </div>
          <?php } ?>
          <div class="<?php echo $class; ?>">
            <?php if ($product_data['mainproduct'] && !$sidebar) { ?>
            <div class="row">
              <?php $product = $product_data['mainproduct'];?>
              <div class="product-layout <?php echo $product_layout; ?> col-sm-6">
                <div class="product-thumb">
                  <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                    <?php if (!$sidebar) { ?>
                    <div class="button-group">
                      <button type="button" onclick="btadd.cart('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="lnr lnr-cart"></i> <span><?php echo $button_cart; ?></span></button>
                      <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="btadd.wishlist('<?php echo $product['product_id']; ?>');"><i class="lnr lnr-heart"></i></button>
                      <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="btadd.compare('<?php echo $product['product_id']; ?>');"><i class="lnr lnr-sync"></i></button>
                    </div>
                    <?php } ?>
                  </div>
                  <div class="caption">
                    <h4 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                    <?php if ($product['price']) { ?>
                    <p class="price">
                      <?php if (!$product['special']) { ?>
                      <?php echo $product['price']; ?>
                      <?php } else { ?>
                      <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                      <?php } ?>
                    </p>
                    <?php } ?>
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
              <div class="col-sm-6">
                <div class="row">
                  <?php foreach ($product_data['products'] as $product) { ?>
                  <div class="product-layout <?php echo $product_layout; ?> col-lg-<?php echo (12/$column); ?> col-md-<?php echo (12/$column); ?> col-sm-<?php echo 12/(round($column/2)); ?> col-xs-12">
                    <div class="product-thumb">
                      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                        <?php if (!$sidebar && (int)$column < 3) { ?>
                        <div class="button-group">
                          <button type="button" onclick="btadd.cart('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="lnr lnr-cart"></i> <span><?php echo $button_cart; ?></span></button>
                          <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="btadd.wishlist('<?php echo $product['product_id']; ?>');"><i class="lnr lnr-heart"></i></button>
                          <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="btadd.compare('<?php echo $product['product_id']; ?>');"><i class="lnr lnr-sync"></i></button>
                        </div>
                        <?php } ?>
                      </div>
                      <div class="caption">
                        <h4 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                        <?php if ($product['price']) { ?>
                        <p class="price">
                          <?php if (!$product['special']) { ?>
                          <?php echo $product['price']; ?>
                          <?php } else { ?>
                          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                          <?php } ?>
                        </p>
                        <?php } ?>
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
            </div>
            <?php } else if ($show_slider) { ?>
            <div id="boss_featured_<?php echo $module; ?>" class="box-product <?php echo ($js == 'owl') ? 'owl-carousel-2 owl-theme-2 nav-middle' : ''; ?> <?php echo $mode; ?>">
              <?php foreach (array_chunk($product_data['products'], $num_row) as $products){ ?>
              <div class="bt-item">
                <?php foreach ($products as $product) { ?>
                <div class="product-layout <?php echo $product_layout; ?>">
                  <div class="product-thumb">
                    <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                      <?php if (!$sidebar || $product_layout != 'product-list') { ?>
                      <div class="button-group">
                        <button type="button" onclick="btadd.cart('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="lnr lnr-cart"></i> <span><?php echo $button_cart; ?></span></button>
                        <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="btadd.wishlist('<?php echo $product['product_id']; ?>');"><i class="lnr lnr-heart"></i></button>
                        <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="btadd.compare('<?php echo $product['product_id']; ?>');"><i class="lnr lnr-sync"></i></button>
                      </div>
                      <?php } ?>
                    </div>
                    <div class="caption">
                      <h4 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                      <?php if ($product['price']) { ?>
                      <p class="price">
                        <?php if (!$product['special']) { ?>
                        <?php echo $product['price']; ?>
                        <?php } else { ?>
                        <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                        <?php } ?>
                      </p>
                      <?php } ?>
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
                <?php }?>
              </div>
              <?php } ?>
            </div>
            <?php } else { ?>
            <?php if ($product_data['products']) { ?>
            <div class="<?php echo (!$sidebar) ? 'row' : ''; ?>">
              <?php foreach ($product_data['products'] as $product) { ?>
              <div class="product-layout <?php echo $product_layout; ?> col-lg-<?php echo (12/$column); ?> col-md-<?php echo (12/$column); ?> col-sm-<?php echo 12/(round($column/2)); ?> col-xs-12">
                <div class="product-thumb">
                  <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                    <?php if (!$sidebar || $product_layout != 'product-list') { ?>
                    <div class="button-group">
                      <button type="button" onclick="btadd.cart('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="lnr lnr-cart"></i> <span><?php echo $button_cart; ?></span></button>
                      <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="btadd.wishlist('<?php echo $product['product_id']; ?>');"><i class="lnr lnr-heart"></i></button>
                      <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="btadd.compare('<?php echo $product['product_id']; ?>');"><i class="lnr lnr-sync"></i></button>
                    </div>
                    <?php } ?>
                  </div>
                  <div class="caption">
                    <h4 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                    <?php if ($product['price']) { ?>
                    <p class="price">
                      <?php if (!$product['special']) { ?>
                      <?php echo $product['price']; ?>
                      <?php } else { ?>
                      <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                      <?php } ?>
                    </p>
                    <?php } ?>
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
            <?php } ?>
            <?php } ?>
          </div>
          <?php if ($banner_right) { ?>
          <div class="col-sm-3 hidden-xs banner-right">
            <div class="image"><a href="<?php echo $banner_right['link']; ?>" title="<?php echo $heading_title; ?>"><img src="image/<?php echo $banner_right['image']; ?>" class="img-responsive" alt="<?php echo $heading_title; ?>" /></a></div>
          </div>
          <?php } ?>
        </div>
      </div>
    </div>
  </div>
</div>
<?php if($show_slider && $mode == 'center-mode'){ ?>
<script type="text/javascript"><!--
$(function() {
	function setPrevNext(index) {
		index.removeClass('slide-prev slide-next').addClass('slide-center').height('auto');
		index.prevAll().removeClass('slide-next slide-center').addClass('slide-prev');
		index.nextAll().removeClass('slide-prev slide-center').addClass('slide-next');
	}
	
	if ($('html').attr('dir') == 'rtl') {
		var rtl = true;
	} else {
		var rtl = false;
	}
	
	$('#boss_featured_<?php echo $module; ?>').on('init', function(event, slick){
		setPrevNext($('[data-slick-index="' + slick.currentSlide + '"]', this));
	});
	
	$('#boss_featured_<?php echo $module; ?>').slick({
		initialSlide: 1,
		slidesToShow: <?php echo $per_row; ?>,
		slidesToScroll: 1,
		prevArrow: '<div class="slick-prev"><img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMjIuNDU3MjA3NCAxLjAwNzQ2MTQ3bC0yMSAyMC4wMjQ4MjE0MyAyMC45NDc5Mzk3IDE5Ljk3NTE3ODYiIHN0cm9rZT0iIzJEMkQyRCIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjwvc3ZnPg==" /></div>',
		nextArrow: '<div class="slick-next"><img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMS40NTY3OSAxLjAwNzQ2MTQ3bDIxIDIwLjAyNDgyMTQzTDEuNTA4ODUgNDEuMDA3NDYxNSIgc3Ryb2tlPSIjMkQyRDJEIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PC9zdmc+" /></div>',
		dots: <?php echo ($pagination) ? 'true' : 'false'; ?>,
		centerPadding: '12.5%',
		centerMode: true,
		variableWidth: true,
		speed: 300,
		rtl: rtl
	});
	
	$('#boss_featured_<?php echo $module; ?>').on('beforeChange', function(event, slick, currentSlide, nextSlide){
		var height = $('[data-slick-index="' + currentSlide + '"]', this).height();
		$('.slick-slide', this).first().height(height);
		
		setPrevNext($('[data-slick-index="' + nextSlide + '"]', this));
	});
});
//--></script>
<?php } else if($show_slider){ ?>
<script type="text/javascript"><!--
$(window).load(function(){
	if ($('html').attr('dir') == 'rtl') {
		var rtl = true;
	} else {
		var rtl = false;
	}
	
	if (<?php echo $sidebar; ?> || <?php echo $infinite; ?>) {
		var responsive = {};
	} else {
		var responsive = {
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
	}
	
	var elm = $('#boss_featured_<?php echo $module; ?>');
	var loop = (elm.children().length > <?php echo $per_row; ?>) ? true : false;
	
	elm.owlCarousel2({
		items: <?php echo ($sidebar || $infinite) ? 1 : $per_row; ?>,
		loop: loop,
		nav: true,
		navText: ['<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMjIuNDU3MjA3NCAxLjAwNzQ2MTQ3bC0yMSAyMC4wMjQ4MjE0MyAyMC45NDc5Mzk3IDE5Ljk3NTE3ODYiIHN0cm9rZT0iIzJEMkQyRCIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjwvc3ZnPg==" />', '<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMS40NTY3OSAxLjAwNzQ2MTQ3bDIxIDIwLjAyNDgyMTQzTDEuNTA4ODUgNDEuMDA3NDYxNSIgc3Ryb2tlPSIjMkQyRDJEIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PC9zdmc+" />'],
		dots: <?php echo ($pagination) ? 'true' : 'false'; ?>,
		center: <?php echo ($center) ? 'true' : 'false'; ?>,
		autoWidth: <?php echo ($infinite) ? 'true' : 'false'; ?>,
		margin: 20,
		rtl: rtl,
		responsive: responsive
	});
});
//--></script>
<?php } ?>
<?php } ?>
