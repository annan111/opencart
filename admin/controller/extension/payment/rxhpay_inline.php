<?php 
class ControllerExtensionPaymentRxhPayinline extends Controller {
	private $error = array(); 

	public function index() {
		$this->language->load('extension/payment/rxhpay_inline');
		$this->document->setTitle($this->language->get('heading_title'));

		if(!isset($this->session->data['token'])){
			$this->session->data['token'] = "";
		}
		
		//保存rxhpayinline配置信息
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->load->model('setting/setting');
			$this->model_setting_setting->editSetting('rxhpay_inline', $this->request->post);
			//增加rxhpayinline的订单状态
			/**
			 * approved		支付成功
			 * declined		支付失败
			 * refund		退款
			 * unpaid		未付款
			 * pending		交易处理中
			 * error		支付出错
			 * testapprove	测试
			 * canceled		付款取消
			 * chargeback	拒付
			 * fraud		欺诈
			 * abnormal		支付异常
			 */
			$payStatus = array('approved', 'declined', 'refund', 'unpaid', 'pending', 'error', 'testapprove', 'canceled', 'chargeback', 'fraud', 'abnormal');
			$config = $this->request->post;
			$this->load->model('localisation/order_status');
			$oldStatus = $this->model_localisation_order_status->getOrderStatuses();
			foreach($oldStatus as $detail){
				if(in_array($detail['name'], $payStatus)){
					array_splice($payStatus, array_search($detail['name'], $payStatus), 1);
					$config["rxhpay_inline_" . $detail['name'] . "_id"] = $detail['order_status_id'];
				}
			}
			if(count($payStatus) > 0){
				foreach($payStatus as $val){
					$query = $this->db->query("SELECT language_id FROM " . DB_PREFIX . "language")->rows;
					for($i=0;$i<count($query);$i++){
						$arr[$query[$i]['language_id']]=array("name"=>$val);
					}
					$statusdata = array("order_status"=>$arr);
					$this->model_localisation_order_status->addOrderStatus($statusdata);
				}
			}

			$newStatus = $this->model_localisation_order_status->getOrderStatuses();
			foreach($newStatus as $detail){
				if(in_array($detail['name'], $payStatus)){
					$config["rxhpay_inline_" . $detail['name'] . "_id"] = $detail['order_status_id'];
				}
			}
			
			
			$this->model_setting_setting->editSetting('rxhpay_inline', $config);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true));
		}
		// rxhpayinline配置页面数据准备
		$data['heading_title'] = $this->language->get('heading_title');
		// $data['text_layout_style'] = explode(',',$this->language->get('text_layout_style'));
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['entry_merchantid'] = $this->language->get('entry_merchantid');
		$data['entry_md5key'] = $this->language->get('entry_md5key');
		$data['entry_transaction_url'] = $this->language->get('entry_transaction_url');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		// $data['entry_layout_style'] = $this->language->get('entry_layout_style');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_opencart_version'] = $this->language->get('entry_opencart_version');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
 		if (isset($this->error['merchant'])) {
			$data['error_merchant'] = $this->error['merchant'];
		} else {
			$data['error_merchant'] = '';
		}
 		if (isset($this->error['md5key'])) {
			$data['error_md5key'] = $this->error['md5key'];
		} else {
			$data['error_md5key'] = '';
		}
 		if (isset($this->error['transactionUrl'])) {
			$data['error_transaction_url'] = $this->error['transactionUrl'];
		} else {
			$data['error_transaction_url'] = '';
		}
 		if (isset($this->error['sortOrder'])) {
			$data['error_sort_order'] = $this->error['sortOrder'];
		} else {
			$data['error_sort_order'] = '';
		}
		
  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
       		'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
   		);
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_payment'),
       		'href'      => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true)
   		);
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
       		'href'      => $this->url->link('extension/payment/rxhpay_inline', 'token=' . $this->session->data['token'], true)
   		);
				
		$data['action'] = $this->url->link('extension/payment/rxhpay_inline', 'token=' . $this->session->data['token'], true);
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true);
		
		if (isset($this->request->post['rxhpay_inline_merchant'])) {
			$data['rxhpay_inline_merchant'] = $this->request->post['rxhpay_inline_merchant'];
		} else {
			$data['rxhpay_inline_merchant'] = $this->config->get('rxhpay_inline_merchant');
		}
		if (isset($this->request->post['rxhpay_inline_md5key'])) {
			$data['rxhpay_inline_md5key'] = $this->request->post['rxhpay_inline_md5key'];
		} else {
			$data['rxhpay_inline_md5key'] = $this->config->get('rxhpay_inline_md5key');
		}
		
		if (isset($this->request->post['rxhpay_inline_geo_zone_id'])) {
			$data['rxhpay_inline_geo_zone_id'] = $this->request->post['rxhpay_inline_geo_zone_id'];
		} else {
			$data['rxhpay_inline_geo_zone_id'] = $this->config->get('rxhpay_inline_geo_zone_id'); 
			$this->load->model('localisation/geo_zone');
			$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();
		} 
		
		/* add transaction URL */
		if(isset($this->request->post['rxhpay_inline_transaction_url'])){
			$data['rxhpay_inline_transaction_url'] = $this->request->post['rxhpay_inline_transaction_url'];
		}else{
			$data['rxhpay_inline_transaction_url'] = $this->config->get('rxhpay_inline_transaction_url');
		}
		if(empty($data['rxhpay_inline_transaction_url'])){
			$data['rxhpay_inline_transaction_url'] = 'http://pay.rxhpay.com/inline_pay';
		}
		// if (isset($this->request->post['rxhpay_inline_layout_style'])) {
			// $data['rxhpay_inline_layout_style'] = $this->request->post['rxhpay_inline_layout_style'];
		// } else {
			// $data['rxhpay_inline_layout_style'] = $this->config->get('rxhpay_inline_layout_style');
		// }
		if (isset($this->request->post['rxhpay_inline_status'])) {
			$data['rxhpay_inline_status'] = $this->request->post['rxhpay_inline_status'];
		} else {
			$data['rxhpay_inline_status'] = $this->config->get('rxhpay_inline_status');
		}
		if (isset($this->request->post['rxhpay_inline_sort_order'])) {
			$data['rxhpay_inline_sort_order'] = $this->request->post['rxhpay_inline_sort_order'];
		} else {
			$data['rxhpay_inline_sort_order'] = $this->config->get('rxhpay_inline_sort_order');
		}
		if(empty($data['rxhpay_inline_sort_order'])){
			$data['rxhpay_inline_sort_order'] = '1';
		}
		if(isset($this->request->post['rxhpay_inline_opencart_version'])){
			$data['rxhpay_inline_opencart_version'] = $this->request->post['rxhpay_inline_opencart_version'];
		}else{
			$data['rxhpay_inline_opencart_version'] = $this->config->get('rxhpay_inline_opencart_version');
		}
		$data['versions'] = array("2.3.0.0");
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view('extension/payment/rxhpay_inline', $data));
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'extension/payment/rxhpay_inline')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if (!$this->request->post['rxhpay_inline_merchant']) {
			$this->error['merchant'] = $this->language->get('error_merchant');
		}
		if (!$this->request->post['rxhpay_inline_md5key']) {
			$this->error['md5key'] = $this->language->get('error_md5key');
		}
		if (!$this->request->post['rxhpay_inline_transaction_url']) {
			$this->error['transactionUrl'] = $this->language->get('error_transaction_url');
		}
		if (!$this->request->post['rxhpay_inline_sort_order']) {
			$this->error['sortOrder'] = $this->language->get('error_sort_order');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>