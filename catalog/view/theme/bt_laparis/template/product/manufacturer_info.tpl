<?php echo $header; ?>
<?php 
$config = $registry->get('config');

$language_id = $config->get('config_language_id');

$text_save_off = $config->get($config->get('config_theme') . '_text_save_off');
$text_save_off = (isset($text_save_off[$language_id])) ? $text_save_off[$language_id] : '';
?>
<?php if (isset($boss_option['view_pro'])) { ?>
<script type="text/javascript">
var product_layout = '<?php echo $boss_option["view_pro"]; ?>';

if (localStorage.getItem('bt_display') == null) {
	localStorage.setItem('bt_display', product_layout.replace('_', '-'));
}
</script>
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
      <h2><?php echo $heading_title; ?></h2>
      <?php if ($products) { ?>
      <div class="product-filter">
        <div class="row">
          <div class="col-md-3 hidden-sm hidden-xs">
            <div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
          </div>
          <div class="col-md-3 col-sm-5 col-xs-12">
            <div class="input-group input-group-sm">
              <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
              <select id="input-sort" class="form-control" onchange="location = this.value;">
                <?php foreach ($sorts as $sorts) { ?>
                <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="col-md-2 col-sm-3 col-xs-5">
            <div class="input-group input-group-sm">
              <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
              <select id="input-limit" class="form-control" onchange="location = this.value;">
                <?php foreach ($limits as $limits) { ?>
                <?php if ($limits['value'] == $limit) { ?>
                <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="col-md-4 col-sm-4 col-xs-7 text-right">
            <div class="button-group">
              <button type="button" id="bt-grid-view-2" class="btn btn-view hidden-sm hidden-xs">2</button>
              <button type="button" id="bt-grid-view-3" class="btn btn-view hidden-sm hidden-xs">3</button>
              <button type="button" id="bt-grid-view-4" class="btn btn-view hidden-sm hidden-xs">4</button>
              <button type="button" id="bt-grid-view-6" class="btn btn-view hidden-sm hidden-xs">6</button>
              <button type="button" id="bt-grid-view" class="btn btn-view hidden-lg hidden-md" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
              <button type="button" id="bt-list-view" class="btn btn-view" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
              <button type="button" id="bt-table-view" class="btn btn-view"><i class="fa fa-table" aria-hidden="true"></i></button>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-list col-xs-12">
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
              <p class="description"><?php echo $product['description']; ?></p>
            </div>
            <div class="button-list">
              <button type="button" onclick="btadd.cart('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="lnr lnr-cart"></i> <span><?php echo $button_cart; ?></span></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="btadd.wishlist('<?php echo $product['product_id']; ?>');"><i class="lnr lnr-heart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="btadd.compare('<?php echo $product['product_id']; ?>');"><i class="lnr lnr-sync"></i></button>
            </div>
            <?php if ($product['special']) { ?>
            <div class="save-off"><?php echo $text_save_off; ?></div>
            <?php } ?>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="pagination-result">
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $results; ?></div>
          <div class="col-sm-6 text-right"><?php echo $pagination; ?></div>
        </div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>