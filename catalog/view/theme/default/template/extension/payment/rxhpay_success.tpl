<?php echo $header; ?>
<div style="text-align: center;">
  <h2 style="margin: 20px 0;"><?php echo $heading_title; ?></h2>
  <p><?php echo $text_result; ?></p>
  <div style="border: 1px solid #DDDDDD; margin-bottom: 20px; width: 350px; margin-left: auto; margin-right: auto;">
    <trade ITEM=banner>
  </div>
  <p><?php echo $text_success; ?></p>
  <p><?php echo 'Your OrderNo is:'.$text_billno; ?></p>
  <p><?php echo $text_success_wait; ?></p>
</div>
<script type="text/javascript"><!--
<?php if($logged){ ?>
	setTimeout('location = \'<?php echo $base . 'index.php?route=checkout/success' ; ?>\';', 3000);
<?php } ?>
//--></script>
<?php echo $footer; ?>