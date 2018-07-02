<?php echo $header; ?>
<?php 
$config = $registry->get('config');
$language_id = $config->get('config_language_id');
$request = $registry->get('request');

$boss_product = $config->get('boss_product');

$text_save_off = $config->get($config->get('config_theme') . '_text_save_off');
$text_save_off = (isset($text_save_off[$language_id])) ? $text_save_off[$language_id] : '';

$template_directory = $config->get($config->get('config_theme') . '_directory');
$path = $template_directory . '/template/product/product/';
$layout = (isset($boss_product['layout'])) ? $boss_product['layout'] . '.tpl' : 'product_1.tpl';

if (isset($request->get['style'])) {
	if (file_exists(DIR_TEMPLATE . $path . $request->get['style'] . '.tpl')) {
		$layout = $request->get['style'] . '.tpl';
	}
}

if (file_exists(DIR_TEMPLATE . $path . $layout)) {
	include(DIR_TEMPLATE . $path . $layout);
}
?>
<?php echo $footer; ?>