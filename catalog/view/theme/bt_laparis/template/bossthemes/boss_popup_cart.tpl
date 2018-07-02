<div class="modal-dialog modal-popup-cart">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" title="<?php echo $button_close; ?>" data-dismiss="modal" aria-hidden="true">&times;</button>
    </div>
    <div class="modal-body">
      <div class="addcart-popup">
        <div class="item-box">
          <div class="item-thumbnail"> <img src="<?php echo $image ?>" alt="<?php echo $name ?>" class="photo" /> </div>
          <h3 class="added-item-message"> <i class="fa fa-check-square"></i> <span><?php echo $text_product_added ?></span> </h3>
          <div class="name"><span><?php echo $name ?></span></div>
          <div class="item-price"> <span><?php echo $quantity ?></span> <span class="multiplier">x</span> <span class="surcharge"><?php echo $price ?></span> </div>
          <div class="item-buttons"> <a class="btn btn-default" href="#" data-dismiss="modal" aria-hidden="true"><span><?php echo $button_continue ?></span></a> <a class="btn btn-primary" href="<?php echo $checkout ?>"><span><?php echo $button_checkout ?></span></a> </div>
        </div>
        <div class="minicart-box">
          <div class="bt-drop-cart-popup"><span><?php echo $sum_cart ?> <?php echo $text_item; ?></span></div>
        </div>
        <div class="clearfix"></div>
        <div class="items-list items-list-products add-to-cart-popup">
          <?php if ($products) { ?>
          <h2 class="box-title"><?php echo $text_customer_bought ?></h2>
          <div class="row">
            <?php foreach ($products as $product) { ?>
            <div class="product-layout product-grid col-sm-4">
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
                <?php if ($product['special']) { ?>
                <div class="save-off"><?php echo $text_save_off; ?></div>
                <?php } ?>
              </div>
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
<script>
bossDragDrop(1)
$('.btn-quickshop').click(function(){
	$('#myModal_drag').modal('hide');
});
</script>