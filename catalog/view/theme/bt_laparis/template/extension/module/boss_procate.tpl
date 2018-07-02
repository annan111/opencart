<?php if ($categories) { ?>

<div id="boss-procate-<?php echo $module;?>" class="bt-product-category box <?php echo ($show_slider) ? 'slide' : 'non-slide'; ?>" <?php if ($bg_image) { ?> style="background-image: url('<?php echo $bg_image; ?>');" <?php } ?> >
  <div class="<?php echo ($sidebar) ? 'container-fluid' : 'container'; ?>">
    <div class="<?php echo ($sidebar) ? 'row' : 'bt-row'; ?>">
      <div class="box-content">
        <div class="row">
          <div class="col-sm-3">
            <h2><?php echo $heading_title; ?></h2>
            <ul class="tabs-headings">
              <?php foreach ($categories as $index => $category) { ?>
              <li class="<?php echo ($index == 0) ? 'active' : ''; ?>"> <a href="#product-category-tab<?php echo $index.$module; ?>" title="tab" data-toggle="tab"> <?php echo $category['name']; ?></a></li>
              <?php } ?>
            </ul>
          </div>
          <div class="col-sm-9">
            <div class="tab-content">
              <?php foreach ($categories as $index => $category) { ?>
              <div id="product-category-tab<?php echo $index.$module; ?>" class="tab-pane <?php echo ($index == 0) ? 'in active' : ''; ?>">
                <?php if ($show_slider) { ?>
                <div class="box-product owl-carousel-2 owl-theme-2 nav-visible nav-middle">
                  <?php foreach (array_chunk($category['products'], $num_row) as $products){ ?>
                  <div class="bt-item">
                    <?php foreach ($products as $product) { ?>
                    <div class="product-layout <?php echo $product_layout; ?>">
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
                  <?php } ?>
                </div>
                <?php } else { ?>
                <div class="row">
                  <?php foreach ($category['products'] as $product) { ?>
                  <div class="product-layout <?php echo $product_layout; ?> col-lg-<?php echo (12/$column); ?> col-md-<?php echo (12/$column); ?> col-sm-<?php echo 12/(round($column/2)); ?> col-xs-12">
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
                <?php } ?>
              </div>
              <?php } ?>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<?php } ?>
<?php if($show_slider){ ?>
<script type="text/javascript"><!--
$(function() {
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		$($(e.target).attr('href')).find('.owl-carousel2').owlCarousel2('invalidate', 'width').owlCarousel2('update')
	});
	
	if ($('html').attr('dir') == 'rtl') {
		var rtl = true;
	} else {
		var rtl = false;
	}
	
	if (<?php echo $sidebar; ?>) {
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
	
	$('#boss-procate-<?php echo $module; ?> .box-product').each(function(index, element) {
		var elm = $(this);
		var loop = (elm.children().length > <?php echo $per_row; ?>) ? true : false;
		
		elm.owlCarousel2({
			items: <?php echo $per_row; ?>,
			loop: loop,
			nav: true,
			navText: ['<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMjIuNDU3MjA3NCAxLjAwNzQ2MTQ3bC0yMSAyMC4wMjQ4MjE0MyAyMC45NDc5Mzk3IDE5Ljk3NTE3ODYiIHN0cm9rZT0iIzJEMkQyRCIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjwvc3ZnPg==" />', '<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMS40NTY3OSAxLjAwNzQ2MTQ3bDIxIDIwLjAyNDgyMTQzTDEuNTA4ODUgNDEuMDA3NDYxNSIgc3Ryb2tlPSIjMkQyRDJEIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PC9zdmc+" />'],
			dots: false,
			margin: 30,
			rtl:rtl,
			responsive: responsive,
			onInitialize: function(e) {
				var elm = e.target;
				$(elm).parent().css('display', 'block');
			},
			onInitialized : function(e) {
				var elm = e.target;
				$(elm).parent().css('display', '');
			}
		});
	});
});
//--></script>
<?php } ?>
