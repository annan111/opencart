<?php echo $header; ?>
<?php
$config = $registry->get('config');
$language_id = $config->get('config_language_id');

$boss_category = $config->get('boss_category');
$b_model = $registry->get('model_bossthemes_boss_refinesearch');
$image_model = $registry->get('model_tool_image');

$b_f_setting = $config->get('boss_refinesearch_module');
$b_f_status = $config->get('boss_refinesearch_status');

$text_save_off = $config->get($config->get('config_theme') . '_text_save_off');
$text_save_off = (isset($text_save_off[$language_id])) ? $text_save_off[$language_id] : '';
?>
<?php if (isset($boss_category['layout'])) { ?>
<script type="text/javascript">
var product_layout = '<?php echo $boss_category["layout"]; ?>';

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
      <?php if (isset($boss_category['info'])) { ?>
      <?php if ($thumb) { ?>
      <img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-responsive" />
      <?php } ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php if ($description) { ?>
      <div class="col-sm-12"><?php echo $description; ?></div>
      <?php } ?>
      <?php } ?>
      <?php if (isset($boss_category['refine_search'])) { ?>
      <?php if ($categories) { ?>
      <h3><?php echo $text_refine; ?></h3>
      <?php if (count($categories) <= 5) { ?>
      <div class="row">
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
      </div>
      <?php } else { ?>
      <div class="row">
        <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
      <br />
      <?php } ?>
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
      <div class="row products-category">
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
              <div class="b-filter">
                <?php if($b_f_status && $b_model){ ?>
                <?php $b_filters = $b_model->getFilterByProductId($product['product_id']); ?>
                <?php if(!empty($b_filters)){ ?>
                <?php foreach($b_filters as $b_filters){  ?>
                <?php if(isset($b_f_setting[$b_filters['filter_group_id']]['display']) && isset($b_f_setting[$b_filters['filter_group_id']]['under']) && $b_f_setting[$b_filters['filter_group_id']]['display']=='text' && $b_f_setting[$b_filters['filter_group_id']]['under']){ ?>
                <span><?php echo $b_filters['name'] ?></span>
                <?php } ?>
                <?php if(isset($b_f_setting[$b_filters['filter_group_id']]['display']) && isset($b_f_setting[$b_filters['filter_group_id']]['under']) && $b_f_setting[$b_filters['filter_group_id']]['display']=='image' && $b_f_setting[$b_filters['filter_group_id']]['under']){ ?>
                <img src="<?php echo $image_model->resize($b_filters['image'],isset($b_f_setting['width'])?$b_f_setting['width']:20,isset($b_f_setting['height'])?$b_f_setting['height']:20); ?>" title="<?php echo $b_filters['name'] ?>" alt="<?php echo $b_filters['name'] ?>">
                <?php } ?>
                <?php } ?>
                <?php } ?>
                <?php } ?>
              </div>
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
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>