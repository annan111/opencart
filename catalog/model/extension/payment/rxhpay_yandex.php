<?php 
class ModelExtensionPaymentrxhpayyandex extends Model {
	/* 支付显示方式 */
	public function design_method(){
		$html = '<div id="yandex_types" style="display:none;">
		<ul>
			<li><img src="' .HTTP_SERVER. 'image/payment/rxhpay/yandex.png"/></li>
			<li><label for="yandex-save" class="radioButtonLabel radio-inline"><input type="radio" name="yandex-list" value="PC" id="yandex-save" style="margin-left:30px">'.$this->language->get('yandex_save').'</label></li>
			<li><label for="yandex-bankCard" class="radioButtonLabel radio-inline"><input type="radio" name="yandex-list" value="AC" id="yandex-bankCard" style="margin-left:30px">'.$this->language->get('yandex_bankcard').'</label></li>
			<li><label for="yandex-terminal" class="radioButtonLabel radio-inline"><input type="radio" name="yandex-list" value="GP" id="yandex-terminal" style="margin-left:30px">'.$this->language->get('yandex_terminal').'</label></li>
			<li><label for="yandex-Sberbank" class="radioButtonLabel radio-inline"><input type="radio" name="yandex-list" value="SB" id="yandex-Sberbank" style="margin-left:30px">'.$this->language->get('yandex_sberbank').'</label></li>
			<li><label for="yandex-Alfa" class="radioButtonLabel radio-inline"><input type="radio" name="yandex-list" value="AB" id="yandex-Alfa" style="margin-left:30px">'.$this->language->get('yandex_alfa').'</label></li>
			<li><label for="yandex-PSB" class="radioButtonLabel radio-inline"><input type="radio" name="yandex-list" value="PB" id="yandex-PSB" style="margin-left:30px">'.$this->language->get('yandex_psb').'</label></li>
		</ul>
		</div>
		<script type="text/javascript">
		function rxhpay_yandex(){
			var yandex_list = $(\'input:radio[name="yandex-list"]:checked\').val();
			if(!yandex_list){
				alert("Please choose a payment method under the Yandex.money option!");
				return false;
			}else{
				$.ajax({
					type: "GET",
					data:{payType:yandex_list},
					url: "index.php?route=extension/payment/rxhpay_yandex/getPayType"
				});
				return true;
			}
		}
		function show_yandex(target){
			
			if($(target).val() == "rxhpay_yandex"){
				$(\'#button-payment-method\').on(\'click\',rxhpay_yandex);
				$("#yandex_types").show();
			}else{
				$(\'#button-payment-method\').unbind(\'click\',rxhpay_yandex);
				$("#yandex_types").hide();
			}
		}
		
		$(function(){
			$("input[name=\'payment_method\']").on("click",function(){
				show_yandex(this);
			});
			if(!$(\'input[name="payment_method"][value="rxhpay_yandex"]\').attr(\'id\')){
				$(\'input[name="payment_method"][value="rxhpay_yandex"]\').attr(\'id\',\'rxhpay_yandex\');
			}
			$(\'input:radio[name="yandex-list"]\').change(function(){
				if($(\'input[name="payment_method"]\').val()!=\'rxhpay_yandex\'){
					$(\'input[name="payment_method"][value="rxhpay_yandex"]\').attr(\'checked\',\'checked\');
				}
			});
			// 页面加载脚本时，判断默认选中值为 rxhpay_yandex 的单选框则调用 show_yandex(target) 函数
			if($(\'input[name="payment_method"][value="rxhpay_yandex"]\').attr(\'checked\')== \'checked\'){
				var _this = $(\'input[name="payment_method"][value="rxhpay_yandex"]\');
				show_yandex(_this);
			}	
		});
		</script>
		<style>
		#yandex_types input {margin: 5px 5px 0px -15px !important;position: absolute;}
		#yandex_types label {padding:0 0;position:relative;}
		#yandex_types ul {padding-left:15px;list-style:none;}
		#yandex_types ul li {padding:5px 0;}
		#yandex_types ul li img {min-height:25px;float: none!important;max-width: 250px;margin-left: -15px;}
		</style>';
		return $html;
	}
	//选择支付方式步骤 判断是否显示 rxhpay_yandex
  	public function getMethod($address) {
		$this->language->load('extension/payment/rxhpay_yandex');
		if ($this->config->get('rxhpay_yandex_status')) {
      		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('rxhpay_yandex_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");
			
			if (!$this->config->get('rxhpay_yandex_geo_zone_id')) {
        		$status = TRUE;
      		} elseif ($query->num_rows) {
      		  	$status = TRUE;
      		} else {
     	  		$status = FALSE;
			}	
      	} else {
			$status = FALSE;
		}
		
		$method_data = array();
		if ($status) {  
      		$method_data = array( 
        		'code'       => 'rxhpay_yandex',
        		'title'      => $this->language->get('text_title'),
				'terms'      => $this->design_method(),
				'sort_order' => $this->config->get('rxhpay_yandex_sort_order')
      		);
    	}
    	return $method_data;
  	}
}
