<?php if ($thumb || $images || $products) { ?>
<script src="catalog/view/javascript/bossthemes/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/bossthemes/jquery.zoom.min.js"></script>
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
      <div itemscope itemtype="http://schema.org/Product">
        <div class="row product-info product-4">
          <?php if ($column_left || $column_right) { ?>
          <?php $class = 'col-sm-6'; ?>
          <?php } else { ?>
          <?php $class = 'col-sm-7'; ?>
          <?php } ?>
          <div class="<?php echo $class; ?>">
            <?php if ($thumb || $images) { ?>
            <div class="product-thumb" id="product-thumb">
              <div class="row">
                <?php if ($popup) { ?>
                <div class="col-sm-6">
                  <div class="image-item"><img src="<?php echo $popup; ?>" class="product-image" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"/></div>
                </div>
                <?php } ?>
                <?php foreach ($images as $image) { ?>
                <div class="col-sm-6">
                  <div class="image-item"><img src="<?php echo $image['popup']; ?>" class="product-image" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></div>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
          </div>
          <?php if ($column_left || $column_right) { ?>
          <?php $class = 'col-sm-6'; ?>
          <?php } else { ?>
          <?php $class = 'col-sm-5'; ?>
          <?php } ?>
          <div class="<?php echo $class; ?>">
            <h1 itemprop="name"><?php echo $heading_title; ?></h1>
            <?php if ($price) { ?>
            <ul id="product-price" class="list-unstyled price-box">
              <?php if (!$special) { ?>
              <li class="price" itemprop="offers" itemscope itemtype="http://schema.org/Offer"><span class="price-main" itemprop="price"><?php echo $price; ?></span><span itemprop="availability" content="<?php echo $stock; ?>"></span></li>
              <?php } else { ?>
              <li class="price" itemprop="offers" itemscope itemtype="http://schema.org/Offer"><span class="price-old"><?php echo $price; ?></span> <span class="price-new" itemprop="price"><?php echo $special; ?><span itemprop="availability" content="<?php echo $stock; ?>"></span></span></li>
              <?php } ?>
              <?php if ($tax) { ?>
              <li><?php echo $text_tax; ?> <span class="price-tax"><?php echo $tax; ?></span></li>
              <?php } ?>
              <?php if ($points) { ?>
              <li><?php echo $text_points; ?> <span class="price-reward"><?php echo $points; ?></span></li>
              <?php } ?>
              <?php if ($discounts) { ?>
              <?php foreach ($discounts as $discount) { ?>
              <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
              <?php } ?>
              <?php } ?>
            </ul>
            <?php } ?>
            <?php if ($review_status) { ?>
            <div class="rating">
              <p>
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($rating < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } ?>
                <?php } ?>
                <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); $('html, body').animate({ scrollTop: $('#tab-review').offset().top }, 'slow'); return false;"><?php echo $reviews; ?></a> / <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); $('html, body').animate({ scrollTop: $('#tab-review').offset().top }, 'slow'); return false;"><?php echo $text_write; ?></a></p>
            </div>
            <?php } ?>
            <ul class="list-unstyled description">
              <li><b><?php echo $text_stock; ?></b> <?php echo $stock; ?></li>
              <?php if ($manufacturer) { ?>
              <li><b><?php echo $text_manufacturer; ?></b> <a href="<?php echo $manufacturers; ?>"><span itemprop="brand"><?php echo $manufacturer; ?></span></a></li>
              <?php } ?>
              <li><b><?php echo $text_model; ?></b> <span itemprop="mpn"><?php echo $model; ?></span></li>
              <?php if ($reward) { ?>
              <li><b><?php echo $text_reward; ?></b> <?php echo $reward; ?></li>
              <?php } ?>
            </ul>
            <div id="product">
              <?php if ($options) { ?>
              <h3><?php echo $text_option; ?></h3>
              <?php foreach ($options as $option) { ?>
              <?php if ($option['type'] == 'select') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                  </option>
                  <?php } ?>
                </select>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'radio') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label"><?php echo $option['name']; ?></label>
                <div id="input-option<?php echo $option['product_option_id']; ?>">
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <div class="radio <?php echo ($option_value['image']) ? 'radio-inline has-image' : ''; ?>">
                    <label>
                      <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" data-image="<?php echo ($option_value['image']) ? 'true' : 'false'; ?>" />
                      <?php if ($option_value['image']) { ?>
                      <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-option" data-toggle="tooltip" title="<?php echo $option_value['name']; ?> <?php if ($option_value['price']) { ?> (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>) <?php } ?>" />
                      <?php } ?>
                      <span <?php echo ($option_value['image']) ? 'class="hidden"' : ''; ?>>
                      <?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                      (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                      <?php } ?>
                      </span>
                    </label>
                  </div>
                  <?php } ?>
                </div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'checkbox') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label"><?php echo $option['name']; ?></label>
                <div id="input-option<?php echo $option['product_option_id']; ?>">
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <div class="checkbox <?php echo ($option_value['image']) ? 'checkbox-inline has-image' : ''; ?>">
                    <label>
                      <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" data-image="<?php echo ($option_value['image']) ? 'true' : 'false'; ?>" />
                      <?php if ($option_value['image']) { ?>
                      <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-option" data-toggle="tooltip" title="<?php echo $option_value['name']; ?> <?php if ($option_value['price']) { ?> (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>) <?php } ?>" />
                      <?php } ?>
                      <span <?php echo ($option_value['image']) ? 'class="hidden"' : ''; ?>>
                      <?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                      (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                      <?php } ?>
                      </span>
                    </label>
                  </div>
                  <?php } ?>
                </div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'text') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'textarea') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'file') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label"><?php echo $option['name']; ?></label>
                <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'date') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <div class="input-group date">
                  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'datetime') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <div class="input-group datetime">
                  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'time') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <div class="input-group time">
                  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <?php } ?>
              <?php } ?>
              <?php } ?>
              <?php if ($recurrings) { ?>
              <hr>
              <h3><?php echo $text_payment_recurring ?></h3>
              <div class="form-group required">
                <select name="recurring_id" class="form-control">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($recurrings as $recurring) { ?>
                  <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                  <?php } ?>
                </select>
                <div class="help-block" id="recurring-description"></div>
              </div>
              <?php } ?>
              <div class="qty">
                <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
                <input type="number" name="quantity" value="<?php echo $minimum; ?>" size="5" id="input-quantity" class="form-control" />
                <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
              </div>
              <?php if ($minimum > 1) { ?>
              <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
              <?php } ?>
              <div class="cart">
                <div class="button-cart">
                  <button type="button" class="btn btn-primary btn-block" id="button-cart" data-loading-text="<?php echo $text_loading; ?>"> <?php echo $button_cart; ?> </button>
                </div>
                <div class="btn-group">
                  <button type="button" class="btn btn-default" onclick="btadd.wishlist('<?php echo $product_id; ?>');"><i class="lnr lnr-heart"></i> <?php echo str_replace('Add to', '', $button_wishlist); ?></button>
                  <button type="button" class="btn btn-default" onclick="btadd.compare('<?php echo $product_id; ?>');"><i class="lnr lnr-sync"></i> <?php echo str_replace(' this Product', '', $button_compare); ?></button>
                </div>
              </div>
              <?php if (isset($boss_product['sharing'])) { ?>
              <div class="sharing"> 
                <!-- AddThis Button BEGIN -->
                <div class="addthis_toolbox addthis_default_style addthis_20x20_style" data-addthis-title="<?php echo $heading_title; ?>" data-addthis-description="<?php echo utf8_substr(strip_tags(html_entity_decode($description, ENT_QUOTES, 'UTF-8')), 0, 150) . '..'; ?>" data-addthis-media="<?php echo $popup; ?>"><a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a> <a class="addthis_button_google_plusone_share"></a><a class="addthis_button_pinterest_share"></a><a class="addthis_button_email"></a><a class="addthis_button_compact"></a><a class="addthis_counter addthis_bubble_style"></a></div>
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
              <?php } ?>
              <?php if ($tags) { ?>
              <div class="tag"><span class="tag-heading"><?php echo $text_tags; ?></span>
                <?php foreach ($tags as $tag) { ?>
                <a href="<?php echo $tag['href']; ?>"><?php echo $tag['tag']; ?></a>
                <?php } ?>
              </div>
              <?php } ?>
            </div>
          </div>
        </div>
        <div id="product-description">
          <?php if (isset($boss_product['description']) && $boss_product['description'] == 'tab') { ?>
          <div class="nav-heading">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
              <?php if ($attribute_groups) { ?>
              <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
              <?php } ?>
              <?php if ($review_status) { ?>
              <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
              <?php } ?>
            </ul>
          </div>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-description" itemprop="description"><?php echo $description; ?></div>
            <?php if ($attribute_groups) { ?>
            <div class="tab-pane" id="tab-specification">
              <table class="table table-bordered">
                <?php foreach ($attribute_groups as $attribute_group) { ?>
                <thead>
                  <tr>
                    <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                  <tr>
                    <td><?php echo $attribute['name']; ?></td>
                    <td><?php echo $attribute['text']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
                <?php } ?>
              </table>
            </div>
            <?php } ?>
            <?php if ($review_status) { ?>
            <div class="tab-pane" id="tab-review">
              <form class="form-horizontal" id="form-review">
                <div id="review"></div>
                <h2><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <?php echo $captcha; ?>
                <div class="buttons">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
            <?php } ?>
          </div>
          <?php } else { ?>
          <div class="panel-group" id="accordion">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#accordion" href="#collapse-description"><?php echo $tab_description; ?></a> </h4>
              </div>
              <div id="collapse-description" class="panel-collapse collapse in">
                <div class="panel-body" itemprop="description"><?php echo $description; ?></div>
              </div>
            </div>
            <?php if ($attribute_groups) { ?>
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#accordion" href="#collapse-specification"><?php echo $tab_attribute; ?></a> </h4>
              </div>
              <div id="collapse-specification" class="panel-collapse collapse">
                <div class="panel-body">
                  <table class="table table-bordered">
                    <?php foreach ($attribute_groups as $attribute_group) { ?>
                    <thead>
                      <tr>
                        <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                      </tr>
                    </thead>
                    <tbody>
                      <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                      <tr>
                        <td><?php echo $attribute['name']; ?></td>
                        <td><?php echo $attribute['text']; ?></td>
                      </tr>
                      <?php } ?>
                    </tbody>
                    <?php } ?>
                  </table>
                </div>
              </div>
            </div>
            <?php } ?>
            <?php if ($review_status) { ?>
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#accordion" href="#collapse-review"><?php echo $tab_review; ?></a> </h4>
              </div>
              <div id="collapse-review" class="panel-collapse collapse">
                <div class="panel-body">
                  <form class="form-horizontal" id="form-review">
                    <div id="review"></div>
                    <h2><?php echo $text_write; ?></h2>
                    <?php if ($review_guest) { ?>
                    <div class="form-group required">
                      <div class="col-sm-12">
                        <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                        <input type="text" name="name" value="" id="input-name" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group required">
                      <div class="col-sm-12">
                        <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                        <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                        <div class="help-block"><?php echo $text_note; ?></div>
                      </div>
                    </div>
                    <div class="form-group required">
                      <div class="col-sm-12">
                        <label class="control-label"><?php echo $entry_rating; ?></label>
                        &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                        <input type="radio" name="rating" value="1" />
                        &nbsp;
                        <input type="radio" name="rating" value="2" />
                        &nbsp;
                        <input type="radio" name="rating" value="3" />
                        &nbsp;
                        <input type="radio" name="rating" value="4" />
                        &nbsp;
                        <input type="radio" name="rating" value="5" />
                        &nbsp;<?php echo $entry_good; ?></div>
                    </div>
                    <?php echo $captcha; ?>
                    <div class="buttons">
                      <div class="pull-right">
                        <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                      </div>
                    </div>
                    <?php } else { ?>
                    <?php echo $text_login; ?>
                    <?php } ?>
                  </form>
                </div>
              </div>
            </div>
            <?php } ?>
          </div>
          <?php } ?>
        </div>
      </div>
      <?php if ($products) { ?>
      <?php if ($column_left && $column_right) { ?>
      <?php $per_row = 2; ?>
      <?php } elseif ($column_left || $column_right) { ?>
      <?php $per_row = 3; ?>
      <?php } else { ?>
      <?php $per_row = 4; ?>
      <?php } ?>
      <?php if (isset($boss_product['related'])) { ?>
      <div class="related-title">
        <h2><?php echo $text_related; ?></h2>
      </div>
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
      <?php } ?>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
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
		items: 3,
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
<?php if ($thumb || $images) { ?>
<script type="text/javascript">
$(function() {
	$('#product-thumb .image-item').zoom({
		responsive: {
			767: {
				on: 'click',
				touch: false
			}
		}
	});
});

$('input[data-image="true"]').each(function(index, element) {
	var name = $(this).attr('name');
	var type = $(this).attr('type');
	
	$(this).addClass('hidden');
	
	if (type == 'radio') {
		$(this).on('change', function(e) {
			$('input[name="' + name + '"]').next('img').removeClass('active');
			
			if ($(this).is(':checked')) {
				$(this).next('img').addClass('active');
			}
		});
	} else if (type == 'checkbox') {
		$(this).on('change', function(e) {
			if ($(this).is(':checked')) {
				$(this).next('img').addClass('active');
			} else {
				$(this).next('img').removeClass('active');
			}
		});
	}
});
</script>
<?php } ?>
<script type="text/javascript"><!--
var ajax;
$(function() {if ($('#product [name=\'quantity\']').val() > 1) getPrice()});
$(document).on('change','[name^=\'option[\']', getPrice);
$(document).on('keyup','[name=\'quantity\']', function() {
	if (!isNaN(this.value) && this.value > 0) getPrice();
});

function getPrice() {
	var index = $('#product-price');
	
	if (ajax) ajax.abort();
	ajax = $.ajax({
		url: 'index.php?route=bossthemes/utilities/optionPrice',
		type: 'get',
		data: $('#product [type=\'checkbox\']:checked, #product [type=\'radio\']:checked, #product select, #product [name=\'product_id\'], #product [name=\'quantity\']'),
		dataType: 'json',
		success: function(response) {
			$('.price-main', index).text(response.price);
			$('.price-old', index).text(response.price);
			$('.price-new', index).text(response.special);
			$('.price-tax', index).text(response.ex_tax);
			$('.price-reward', index).text(response.points);
		}
	});
}
//--></script> 
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=bossthemes/boss_add/cart/',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'number\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				addNotice(json, 'index.php?route=checkout/checkout');

				$('#cart > button').html('<span id="cart-total"><i class="lnr lnr-cart"></i> ' + json['total'] + '</span>');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script> 
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script> 
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});
//--></script>