<div class="bt-product-showing box style-1">
  <div class="box-content">
    <div class="row product-content">
      <div class="col-lg-3 md-lg-3 hidden-sm hidden-xs">
        <div class="attribute">
          <?php foreach ($attributes as $attribute) { ?>
          <div class="attribute-item">
            <?php if ($attribute['image']) { ?>
            <span class="icon"><img src="<?php echo $attribute['image']; ?>" alt="<?php echo $attribute['name']; ?>" /></span>
            <?php } ?>
            <span><?php echo $attribute['name']; ?></span> </div>
          <?php } ?>
        </div>
      </div>
      <div class="col-lg-6 md-lg-6 col-sm-5">
        <div class="image"><a href="<?php echo $href; ?>" title="<?php echo $name; ?>"><img src="<?php echo $image; ?>" class="img-responsive" alt="<?php echo $heading_title; ?>" /> </a></div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-7">
        <div class="product-thumb">
          <h2><?php echo $heading_title; ?></h2>
          <p class="price">
            <?php if (!$special) { ?>
            <?php echo $price; ?>
            <?php } else { ?>
            <span class="price-new"><?php echo $special; ?></span> <span class="price-old"><?php echo $price; ?></span>
            <?php } ?>
            <?php if ($tax) { ?>
            <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span>
            <?php } ?>
          </p>
          <div class="description"><?php echo $description; ?></div>
          <div class="buttons"> <a href="<?php echo $href; ?>" title="<?php echo $name; ?>" class="btn btn-primary btn-block"><?php echo $button_product_detail; ?></a>
            <button type="button" onclick="btadd.cart('<?php echo $product_id; ?>', '<?php echo $minimum; ?>');" class="btn btn-primary btn-block"><?php echo $button_shop_now; ?></button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
