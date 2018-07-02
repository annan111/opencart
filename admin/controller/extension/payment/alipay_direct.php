<?php 
class ControllerExtensionPaymentAlipayDirect extends Controller {
	private $error = array(); 

	public function index() {
		$this->load->language('extension/payment/alipay_direct');

		$this->document->settitle($this->language->get('heading_title'));
		
		if (isset($this->error['merchant_private_key'])) {
			$data['error_merchant_private_key'] = $this->error['merchant_private_key'];
		} else {
			$data['error_merchant_private_key'] = '';
		}

		if (isset($this->error['app_id'])) {
			$data['error_app_id'] = $this->error['app_id'];
		} else {
			$data['error_app_id'] = '';
		}

		if (isset($this->error['public_key'])) {
			$data['error_public_key'] = $this->error['public_key'];
		} else {
			$data['error_public_key'] = '';
		}
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_payment'),
			'href' => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/payment/alipay_direct', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/payment/alipay_direct', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], true);
		
		$this->load->model('setting/setting');
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->load->model('setting/setting');
			
			$this->model_setting_setting->editSetting('alipay_direct', $this->request->post);				
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->response->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], true));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		
		$data['entry_alipay_direct_app_id'] = $this->language->get('entry_alipay_direct_app_id');
		$data['entry_alipay_direct_merchant_private_key'] = $this->language->get('entry_alipay_direct_merchant_private_key');
		$data['entry_alipay_direct_public_key'] = $this->language->get('entry_alipay_direct_public_key');
		$data['entry_alipay_direct_trade_type'] = $this->language->get('entry_alipay_direct_trade_type');
			
		$data['entry_alipay_direct_status'] = $this->language->get('entry_alipay_direct_status');
		$data['entry_alipay_direct_sort_order'] = $this->language->get('entry_alipay_direct_sort_order');
		$data['entry_total'] = $this->language->get('entry_total');
		
		$data['entry_trade_success_status'] = $this->language->get('entry_trade_success_status');
		$data['entry_trade_finished_status'] = $this->language->get('entry_trade_finished_status');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_log'] = $this->language->get('entry_log');
		
		
		/* $data['help_app_id'] = $this->language->get('help_app_id');
		$data['help_total'] = $this->language->get('help_total');
		$data['help_trade_finished'] = $this->language->get('help_trade_finished');
		$data['help_trade_success'] = $this->language->get('help_trade_success');
		$data['help_log'] = $this->language->get('help_log'); */
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_order_status'] = $this->language->get('tab_order_status');

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
 		if (isset($this->error['app_id'])) {
			$data['error_alipay_direct_app_id'] = $this->error['app_id'];
		} else {
			$data['error_alipay_direct_app_id'] = '';
		}
		
		if (isset($this->error['merchant_private_key'])) {
			$data['error_alipay_direct_merchant_private_key'] = $this->error['merchant_private_key'];
		} else {
			$data['error_alipay_direct_merchant_private_key'] = '';
		}
		
		if (isset($this->error['public_key'])) {
			$data['error_alipay_direct_public_key'] = $this->error['public_key'];
		} else {
			$data['error_alipay_direct_public_key'] = '';
		}


		
		if (isset($this->request->post['alipay_direct_app_id'])) {
			$data['alipay_direct_app_id'] = $this->request->post['alipay_direct_app_id'];
		} else {
			$data['alipay_direct_app_id'] = $this->config->get('alipay_direct_app_id');
		}

		if (isset($this->request->post['alipay_direct_merchant_private_key'])) {
			$data['alipay_direct_merchant_private_key'] = $this->request->post['alipay_direct_merchant_private_key'];
		} else {
			$data['alipay_direct_merchant_private_key'] = $this->config->get('alipay_direct_merchant_private_key');
		}

		if (isset($this->request->post['alipay_direct_public_key'])) {
			$data['alipay_direct_public_key'] = $this->request->post['alipay_direct_public_key'];
		} else {
			$data['alipay_direct_public_key'] = $this->config->get('alipay_direct_public_key');
		}		
		
		if (isset($this->request->post['alipay_direct_total'])) {
			$data['alipay_direct_total'] = $this->request->post['alipay_direct_total'];
		} else {
			$data['alipay_direct_total'] = $this->config->get('alipay_direct_total');
		}
		
		if (isset($this->request->post['alipay_direct_log'])) {
			$data['alipay_direct_log'] = $this->request->post['alipay_direct_log'];
		} else {
			$data['alipay_direct_log'] = $this->config->get('alipay_direct_log');
		}

		if (isset($this->request->post['alipay_direct_trade_success_status_id'])) {
			$data['alipay_direct_trade_success_status_id'] = $this->request->post['alipay_direct_trade_success_status_id'];
		} elseif($this->config->get('alipay_direct_trade_success_status_id')) {
			$data['alipay_direct_trade_success_status_id'] = $this->config->get('alipay_direct_trade_success_status_id'); 
		} else {
			$data['alipay_direct_trade_success_status_id'] = 5;//complete
		}
		
		
		if (isset($this->request->post['alipay_direct_trade_finished_status_id'])) {
			$data['alipay_direct_trade_finished_status_id'] = $this->request->post['alipay_direct_trade_finished_status_id'];
		} elseif($this->config->get('alipay_direct_trade_finished_status_id')) {
			$data['alipay_direct_trade_finished_status_id'] = $this->config->get('alipay_direct_trade_finished_status_id'); 
		} else {
			$data['alipay_direct_trade_finished_status_id'] = 5;//complete
		}

		$this->load->model('localisation/order_status');
		
		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
			
		if (isset($this->request->post['alipay_direct_geo_zone_id'])) {
			$data['alipay_direct_geo_zone_id'] = $this->request->post['alipay_direct_geo_zone_id'];
		} else {
			$data['alipay_direct_geo_zone_id'] = $this->config->get('alipay_direct_geo_zone_id');
		}

		$this->load->model('localisation/geo_zone');

		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();
		
		if (isset($this->request->post['alipay_direct_status'])) {
			$data['alipay_direct_status'] = $this->request->post['alipay_direct_status'];
		} else {
			$data['alipay_direct_status'] = $this->config->get('alipay_direct_status');
		}
		
		if (isset($this->request->post['alipay_direct_sort_order'])) {
			$data['alipay_direct_sort_order'] = $this->request->post['alipay_direct_sort_order'];
		} else {
			$data['alipay_direct_sort_order'] = $this->config->get('alipay_direct_sort_order');
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/payment/alipay_direct', $data));
		
	}


	private function validate() {
		if (!$this->user->hasPermission('modify', 'extension/payment/alipay_direct')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->request->post['alipay_direct_app_id']) {
			$this->error['app_id'] = $this->language->get('error_alipay_direct_app_id');
		}

		if (!$this->request->post['alipay_direct_merchant_private_key']) {
			$this->error['merchant_private_key'] = $this->language->get('error_alipay_direct_merchant_private_key');
		}

		if (!$this->request->post['alipay_direct_public_key']) {
			$this->error['partner'] = $this->language->get('error_alipay_direct_public_key');
		}

		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>