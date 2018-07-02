<?php
$config = $registry->get('config');

$language_id = $config->get('config_language_id');

$text_view_cart = $text_cart;

$text_cart = $config->get($config->get('config_theme') . '_text_cart');
$text_cart = (isset($text_cart[$language_id])) ? $text_cart[$language_id] : '';
?>

<div id="cart" class="dropdown pull-right"> <a data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="dropdown-toggle"><i class="lnr lnr-cart"></i> <span class="hidden-xs"><?php echo $text_cart; ?></span></a>
  <ul class="dropdown-menu dropdown-menu-right">
    <?php if ($products || $vouchers) { ?>
    <li class="show-product-cart">
      <table class="table">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="text-left image"><div class="image">
              <?php if ($product['thumb']) { ?>
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
              <?php } ?>
              <div class="remove">
                <button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="btn-danger"><i class="fa fa-times"></i></button>
              </div>
            </div></td>
          <td class="text-left name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?>
            <div class="quantity-price"><?php echo $product['quantity']; ?> x <span class="price"><?php echo $product['total']; ?></span></div></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="text-left image"><div class="image">
              <div class="remove">
                <button type="button" onclick="voucher.remove('<?php echo $voucher['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="btn-danger"><i class="fa fa-times"></i></button>
              </div>
            </div></td>
          <td class="text-left"><div class="description"><?php echo $voucher['description']; ?></div>
            <div class="quantity">1 x <span class="price"><?php echo $voucher['amount']; ?></div></td>
        </tr>
        <?php } ?>
      </table>
    </li>
    <li>
      <div class="cart-bottom">
        <table class="minicart-total">
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td class="text-left"><span><?php echo $total['title']; ?></span></td>
            <td class="text-right"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </table>
        <div class="buttons"> <a href="<?php echo $cart; ?>" class="btn btn-primary btn-block"><i class="lnr lnr-cart"></i> <?php echo $text_view_cart; ?></a><a class="btn btn-default btn-block" href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a> </div>
      </div>
    </li>
    <?php } else { ?>
    <li>
      <p class="text-center"><?php echo $text_empty; ?></p>
    </li>
    <?php } ?>
  </ul>
</div>
