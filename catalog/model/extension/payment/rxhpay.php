<?php 
class ModelExtensionPaymentRxhPay extends Model {
	//选择支付方式步骤 判断是否显示 rxhpay
  	public function getMethod($address) {
		$this->language->load('extension/payment/rxhpay');
		
		if ($this->config->get('rxhpay_status')) {
      		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('rxhpay_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");
			
			if (!$this->config->get('rxhpay_geo_zone_id')) {
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
        		'code'       => 'rxhpay',
        		'title'      => $this->language->get('text_title'),
				'terms'      => $this->language->get('text_terms'),
				'sort_order' => $this->config->get('rxhpay_sort_order')
      		);
    	}
    	return $method_data;
  	}
}
?>