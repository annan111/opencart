<script type="text/javascript"><!--
$(function() {
	boss_quick_shop();
});

function boss_quick_shop() {
	<?php	foreach($selecters as $selecter){ ?>
	$('<?php echo $selecter; ?>').each(function(index, value) {
		var id_product = '';
		var reloadurl = false;

		if ($(".image>a", this).attr('href')) {

			var href_pro = $(".image>a", this).attr('href');
		} else {
			var href_pro = '';
		}
		if (href_pro) {
			var check = href_pro.match("index.php");
		}
		var last_index = '';
		var product_id = 0;
		if (check == "index.php") { //direct link
			var str = href_pro.split("&");
			for (var i = 0; i < str.length; i++) {
				if (str[i].match("product_id=") == "product_id=") {

					last_index = str[i];
					var id = last_index.split("=");
					product_id = id[1];
					break;
				}
			}
			reloadurl = true;
		} else { //mode SEO
			var check_seo = href_pro.match("product_id=");
			if (check_seo == "product_id=") {

				var str = href_pro.split("&");
				for (var i = 0; i < str.length; i++) {
					if (str[i].match("product_id=") == "product_id=") {
						var temp = str[i].split("?");
						last_index = temp[temp.length - 1]; // lay phan tu cuoi cung
						var id = last_index.split("=");
						product_id = id[1];
						break;
					}
				}
				reloadurl = true;
			} else {
				var str_1 = href_pro.split("/");
				var str_2 = str_1[str_1.length - 1];
				var temp = str_2.split("?");
				last_index = temp[0];
				var id_index = '';
				<?php foreach($seo_data as $keyseo){?>
				if (last_index == "<?php echo $keyseo['keyword'];?>") {
					id_index = "<?php echo $keyseo['query'];?>";
				}
				<?php } ?>
				if (id_index != '') {
					var id = id_index.split('=');
					product_id = id[1];
					reloadurl = true;
				}
			}
		}

		if (reloadurl) {

			var _qsHref = '<button title =\"<?php echo $text; ?>\" onclick=\"getModalContent(' + product_id + ');\" class=\"sft_quickshop_icon \" data-toggle=\"modal\" data-target=\"#bt-quick-shop-modal\"><i class="lnr lnr-eye"></i></button>';
			$('.image .button-group', this).append(_qsHref);

			var quick_button = $('.btn-quickshop');
			var width_button = (quick_button.width()) / 2;
			var height_button = (quick_button.height()) / 2;
			var w_image = $('.image').width();
			var w_qs = quick_button.width();
		}
	});
	<?php	} ?>
	var content_modal = '<div id="bt-quick-shop-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;"></div><div class="loading-qs" style="position:fixed;top:50%;left:50%"></div>';
	$('body').append(content_modal);
}

function getModalContent(product_id) {
	$.ajax({
		url: 'index.php?route=extension/module/boss_quick_shop_product',
		dataType: 'json',
		data: 'product_id=' + product_id,
		beforeSend: function() {
			$('body').append('<span class="loading"></span>');
		},
		complete: function() {
			$('.loading').remove();
		},
		success: function(json) {
			$('#bt-quick-shop-modal').html(json['html']);
			$('#bt-quick-shop-modal > .modal-dialog').css({
				'width': '95%',
				'max-width': '<?php echo $width; ?>px',
			});
		}
	});
}
//--></script>