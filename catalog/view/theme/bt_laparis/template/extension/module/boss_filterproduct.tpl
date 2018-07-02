<!--module boss - fillter product-->
<?php if(!empty($tabs)){ ?>

<div id="filter-product-<?php echo $module; ?>" class="bt-filter-product box <?php echo ($sidebar) ? 'sidebar style-2' : 'style-1'; ?> <?php echo ($scrolling_panel) ? 'slide' : 'non-slide'; ?>">
  <div class="<?php echo ($sidebar) ? 'container-fluid' : 'container'; ?>">
    <div class="<?php echo ($sidebar) ? 'row' : 'bt-row'; ?>">
      <div id="boss_homefilter_tabs<?php echo $module; ?>" class="boss_homefilter_tabs">
        <?php if ($heading_title) { ?>
        <div class="box-heading title">
          <h2>
            <?php if($icon) { ?>
            <i class="fa <?php echo $icon; ?>"></i>
            <?php } ?>
            <?php echo $heading_title; ?></h2>
        </div>
        <?php } ?>
        <div class="clearfix"></div>
        <div id="tabs_content_container<?php echo $module; ?>" class="box-content">
          <?php if ($use_tab) { ?>
          <ul class="tabs-headings <?php echo ($scrolling_tab) ? 'owl-carousel-2 owl-theme-2 nav-middle nav-visible padding-nav' : ''; ?>">
            <?php foreach ($tabs as $index => $tab) { ?>
            <li class="<?php echo ($index == 0) ? 'active' : ''; ?>"> <a href="#filter-product-tab<?php echo $index.$module; ?>" title="tab" data-toggle="tab">
              <?php if(!empty($tab['icon'])) { ?>
              <img src="<?php echo $tab['icon'];?>" title="<?php echo $tab['title'];?>" alt="<?php echo $tab['title'];?>"/>
              <?php } ?>
              <?php echo $tab['title']; ?></a></li>
            <?php } ?>
          </ul>
          <?php } ?>
          <div class="tab-content">
            <?php foreach ($tabs as $index => $tab) { ?>
            <div id="filter-product-tab<?php echo $index.$module; ?>" class="tab-pane fade <?php echo ($index == 0) ? 'in active' : ''; ?>">
              <?php if(!empty($tab['products'])){ ?>
              <?php if ($product_large && !$sidebar) { ?>
              <div class="row bt-row">
                <?php $product = $tab['products'][0]; ?>
                <div class="col-sm-6">
                  <div class="product-layout large-product <?php echo $class_css; ?>" data-product="<?php echo $product['product_id']; ?>" data-sort="<?php echo $product['sort_order']; ?>">
                    <div class="product-thumb">
                      <div class="image"><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                        <div class="button-group">
                          <button type="button" onclick="btadd.cart('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="lnr lnr-cart"></i> <span><?php echo $button_cart; ?></span></button>
                          <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="btadd.wishlist('<?php echo $product['product_id']; ?>');"><i class="lnr lnr-heart"></i></button>
                          <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="btadd.compare('<?php echo $product['product_id']; ?>');"><i class="lnr lnr-sync"></i></button>
                        </div>
                      </div>
                      <div class="caption">
                        <h4 class="name"><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><?php echo $product['name']; ?></a></h4>
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
                      <div class="sort-order"><?php echo $product['sort_order']; ?></div>
                    </div>
                  </div>
                  <ul class="addition-image">
                    <?php foreach ($product['images'] as $image) { ?>
                    <li class="image-additional text-center"><a href="<?php echo $image['popup']; ?>" title="<?php echo $product['name']; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a></li>
                    <?php } ?>
                  </ul>
                </div>
                <?php unset($tab['products'][0]); ?>
                <div class="col-sm-6 list-product">
                  <div class="row">
                    <?php foreach ($tab['products'] as $index => $product) { ?>
                    <div class="col-sm-4">
                      <div class="product-thumb">
                        <div class="image"><a href="<?php echo $product['href']; ?>"  title="<?php echo $product['name']; ?>" data-product="<?php echo $product['product_id']; ?>" data-sort="<?php echo $product['sort_order']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                        <div class="caption">
                          <h4 class="name"><a href="<?php echo $product['href']; ?>"  title="<?php echo $product['name']; ?>"><?php echo $product['name']; ?></a></h4>
                          <?php if ($product['price']) { ?>
                          <p class="price">
                            <?php if (!$product['special']) { ?>
                            <?php echo $product['price']; ?>
                            <?php } else { ?>
                            <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                            <?php } ?>
                          </p>
                          <?php } ?>
                        </div>
                        <div class="sort-order"><?php echo $product['sort_order']; ?></div>
                      </div>
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <?php } else if ($scrolling_panel) { ?>
              <div class="box-product owl-carousel-2 owl-theme-2 nav-top-right nav-visible">
                <?php foreach (array_chunk($tab['products'], $num_row) as $products){ ?>
                <div class="bt-item">
                  <?php foreach ($products as $product) { ?>
                  <div class="product-layout <?php echo $class_css; ?>">
                    <div class="product-thumb">
                      <div class="image"><a href="<?php echo $product['href']; ?>"  title="<?php echo $product['name']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                        <div class="button-group">
                          <button type="button" onclick="btadd.cart('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="lnr lnr-cart"></i> <span><?php echo $button_cart; ?></span></button>
                          <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="btadd.wishlist('<?php echo $product['product_id']; ?>');"><i class="lnr lnr-heart"></i></button>
                          <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="btadd.compare('<?php echo $product['product_id']; ?>');"><i class="lnr lnr-sync"></i></button>
                        </div>
                      </div>
                      <div class="caption">
                        <h4 class="name"><a href="<?php echo $product['href']; ?>"  title="<?php echo $product['name']; ?>"><?php echo $product['name']; ?></a></h4>
                        <?php if ($product['price']) { ?>
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
                      <?php if (!$sidebar) { ?>
                      <?php if ($product['special']) { ?>
                      <div class="save-off"><?php echo $text_save_off; ?></div>
                      <?php } ?>
                      <?php } ?>
                    </div>
                  </div>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <?php } else { ?>
              <div class="row">
                <?php foreach ($tab['products'] as $product) { ?>
                <div class="product-layout <?php echo $class_css; ?> col-lg-<?php echo (12/$column); ?> col-md-<?php echo (12/$column); ?> col-sm-<?php echo 12/(round($column/2)); ?> col-xs-12">
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
              <?php } ?>
            </div>
            <?php } ?>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<?php if($scrolling_panel && !$product_large){ ?>
<script type="text/javascript"><!--
$(function() {
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
	
	$('#filter-product-<?php echo $module; ?> .box-product').each(function(index, element) {
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
<?php if($scrolling_tab){ ?>
<script type="text/javascript"><!--
$(function() {
	if ($('html').attr('dir') == 'rtl') {
		var rtl = true;
	} else {
		var rtl = false;
	}
	
	var elm = $('#filter-product-<?php echo $module; ?> .tabs-headings');
	var loop = (elm.children().length > <?php echo $num_tab; ?>) ? true : false;
	
	elm.owlCarousel2({
		items: <?php echo $num_tab; ?>,
		loop: loop,
		nav: true,
		navText: ['<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMjIuNDU3MjA3NCAxLjAwNzQ2MTQ3bC0yMSAyMC4wMjQ4MjE0MyAyMC45NDc5Mzk3IDE5Ljk3NTE3ODYiIHN0cm9rZT0iIzJEMkQyRCIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjwvc3ZnPg==" />', '<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMS40NTY3OSAxLjAwNzQ2MTQ3bDIxIDIwLjAyNDgyMTQzTDEuNTA4ODUgNDEuMDA3NDYxNSIgc3Ryb2tlPSIjMkQyRDJEIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PC9zdmc+" />'],
		dots: false,
		rtl:rtl,
		responsive:{
			992: {
				items: <?php echo $num_tab; ?>
			},
			768: {
				items: <?php echo round($num_tab/2); ?>
			},
			560: {
				items: <?php echo round($num_tab/2); ?>
			},
			0: {
				items: 1
			}
		}
	});
	
	$('#filter-product-<?php echo $module; ?> .tabs-headings li').on('click', function() {
		$('#filter-product-<?php echo $module; ?> .tabs-headings li').not(this).removeClass('active');
	});
});
//--></script>
<?php } ?>
<?php if($product_large){ ?>
<script type="text/javascript"><!--
var products = jQuery.parseJSON('<?php echo $products; ?>');

$('#filter-product-<?php echo $module; ?>').delegate('.list-product .image a', 'click', function(e) {
	e.preventDefault();
	
	var index = $(this).parent().parent();
	var target = $(this).parents('.list-product').prev().children('.large-product');
	
	var current_product_id = parseInt(target.attr('data-product'));
	var current_sort = parseInt(target.attr('data-sort'));
	
	var product_id = parseInt($(this).attr('data-product'));
	var sort = parseInt($(this).attr('data-sort'));
	
	if (typeof products[current_product_id] != 'undefined') {
		var product = products[current_product_id];
		
		var html = '';
		html += '<div class="image">';
			html += '<a href="' + product['href'] + '" data-product="' + product['product_id'] + '" data-sort="' + current_sort + '"><img src="' + product['thumb'] + '" alt="' + product['name'] + '" title="' + product['name'] + '" class="img-responsive" /></a>';
		html += '</div>';
		html += '<div class="caption">';
			html += '<h4 class="name"><a href="' + product['href'] + '">' + product['name'] + '</a></h4>';
			if (product['price']) {
				html += '<p class="price">';
				if (!product['special']) {
					html += product['price'];
				} else {
					html += '<span class="price-new">' + product['special'] + '</span> <span class="price-old">' + product['price'] + '</span>';
				}
				html += '</p>';
			}
		html += '</div>';
		html += '<div class="sort-order">' + current_sort + '</div>';
		
		index.html(html);
	}
	
	if (typeof products[product_id] != 'undefined') {
		var product = products[product_id];
		
		var html = '';
		
		html += '<div class="product-thumb">';
			html += '<div class="image">';
				html += '<a href="' + product['href'] + '"><img src="' + product['thumb'] + '" alt="' + product['name'] + '" title="' + product['name'] + '" class="img-responsive" /></a>';
				html += '<div class="button-group">';
					html += '<button type="button" onclick="btadd.cart(' + product['product_id'] + ', ' + product['minimum'] + ');"><i class="lnr lnr-cart"></i> <span><?php echo $button_cart; ?></span></button>';
					html += '<button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="btadd.wishlist(' + product['product_id'] + ');"><i class="lnr lnr-heart"></i></button>';
					html += '<button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="btadd.compare(' + product['product_id'] + ');"><i class="lnr lnr-sync"></i></button>';
				html += '</div>';
				if (product['special']) { 
					html += '<div class="save-off"><?php echo $text_save_off; ?></div>';
				}
			html += '</div>';
			
			html += '<div class="caption">';
				html += '<h4 class="name"><a href="' + product['href'] + '">' + product['name'] + '</a></h4>';
				if (!<?php echo $sidebar; ?>) {
					//html += '<p>' + product['description'] + '</p>';
				}
				if (product['price']) {
					html += '<p class="price">'
					if (!product['special']) {
						html += product['price'];
					} else {
						html += '<span class="price-new">' + product['special'] + '</span> <span class="price-old">' + product['price'] + '</span>';
					}
					html += '</p>';
				}
				if (product['rating']) {
					html += '<div class="rating">';
						for (var i = 1; i <= 5; i++) {
							if (product['rating'] < i) {
								html += '<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>';
							} else {
								html += '<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>';
							}
						}
					html += '</div>';
				}
			html += '</div>';
			html += '<div class="sort-order">' + sort + '</div>';
		html += '</div>';
		
		target.html(html).attr('data-product', product_id).attr('data-sort', sort);
		
		var html = '';
		
		if (product['images'].length) {
			for (i in product['images']) {
				html += '<li class="image-additional"><a href="' + product['images'][i]['popup'] + '" title="' + product['name'] + '"> <img src="' + product['images'][i]['thumb'] + '" title="' + product['name'] + '" alt="' + product['name'] + '" /></a></li>';
			}
		}
		
		target.next().html(html);
	}
});

$('#filter-product-<?php echo $module; ?>').delegate('.image-additional a', 'click', function(e) {
	e.preventDefault();
	
	$('#filter-product-<?php echo $module; ?> .large-product .image img').attr('src', $(this).attr('href'));
});
//--></script>
<?php } ?>
<?php } ?>
