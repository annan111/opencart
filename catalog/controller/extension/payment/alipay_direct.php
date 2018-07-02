<?php

class ControllerExtensionPaymentAlipayDirect extends Controller {
	public function index() {
		
		$this->load->language('extension/payment/alipay_direct');

		$data['button_confirm'] = $this->language->get('button_confirm');
		
		$alipay_config['app_id'] 				= $this->config->get('alipay_direct_app_id');
		
		$alipay_config['alipay_public_key']		= $this->config->get('alipay_direct_public_key');

		$alipay_config['merchant_private_key']	= $this->config->get('alipay_direct_merchant_private_key');
		
		$alipay_config['sign_type']    			= 'RSA2';
		
		$alipay_config['gatewayUrl']    		= 'https://openapi.alipay.com/gateway.do';
		
		$alipay_config['charset']				= 'UTF-8';

		$alipay_config['notify_url'] 			= $this->url->link('extension/payment/alipay_direct/callback');

        $alipay_config['return_url'] 			= $this->url->link('extension/payment/alipay_direct/returnurl');
		
		// $alipay_config['return_url'] 			= HTTP_SERVER . 'alipay-php/return_url.php';
		
		
		
		$this->load->model('checkout/order');

		$order_id = $this->session->data['order_id'];

		$order_info = $this->model_checkout_order->getOrder($order_id);

		$item_name = $this->config->get('config_name');
		
		$fullname = $order_info['payment_firstname'];
		
		$this->load->model('account/order');

		$shipping_cost = 0;

		$totals = $this->model_account_order->getOrderTotals($order_id);

		foreach ($totals as $total) {
			
			if($total['title'] == 'shipping') {
				
				$shipping_cost = $total['value'];
				
			}
			
		}
		
        $seller_email = $this->config->get('alipay_direct_seller_email');

        $out_trade_no = $this->session->data['order_id'];

        $subject = $item_name . ' ' . $this->language->get('text_order') .' '. $order_id;

        $amount = $order_info['total'];
		$currency_value = $this->currency->getValue('CNY');
		$price = $amount * $currency_value;
		$price = number_format($price,2,'.','');
		$total_amount = $price;
		
		$body =  $this->language->get('text_owner') . ' ' . $fullname;
		
		require_once DIR_SYSTEM . 'alipay-php/pagepay/service/AlipayTradeService.php';
		require_once DIR_SYSTEM . 'alipay-php/pagepay/buildermodel/AlipayTradePagePayContentBuilder.php';
		
		//构造参数
		$payRequestBuilder = new AlipayTradePagePayContentBuilder();
		
		$payRequestBuilder->setBody($body);
		$payRequestBuilder->setSubject($subject);
		$payRequestBuilder->setTotalAmount($total_amount);
		$payRequestBuilder->setOutTradeNo($out_trade_no);
		$aop = new AlipayTradeService($alipay_config);
		/**
		 * pagePay 电脑网站支付请求
		 * @param $builder 业务参数，使用buildmodel中的对象生成。
		 * @param $return_url 同步跳转地址，公网可以访问
		 * @param $notify_url 异步通知地址，公网可以访问
		 * @return $response 支付宝返回的信息
		*/
		$data['html_text'] = $aop->pagePay($payRequestBuilder,$alipay_config['return_url'],$alipay_config['notify_url']);

		$data['html_text'] = str_replace("</form>","<div class='buttons'><div class='pull-right'><input type='submit' value='".$this->language->get('button_confirm')."' class='btn btn-primary' /></div></div></form>",$data['html_text']);

		return $this->load->view('extension/payment/alipay_direct', $data);
		
	}
	
	public function returnurl() {
		
		$alipay_config['app_id'] 				= $this->config->get('alipay_direct_app_id');

		$alipay_config['merchant_private_key']	= $this->config->get('alipay_direct_merchant_private_key');
		
		$alipay_config['notify_url'] 			= $this->url->link('extension/payment/alipay_direct/callback');

        $alipay_config['return_url'] 			= $this->url->link('extension/payment/alipay_direct/returnurl');
		
		$alipay_config['charset']				= 'UTF-8';
		
		$alipay_config['sign_type']    			= 'RSA2';
		
		$alipay_config['gatewayUrl']    		= 'https://openapi.alipay.com/gateway.do';
		
		$alipay_config['alipay_public_key']			= $this->config->get('alipay_direct_public_key');
		
		require_once DIR_SYSTEM . 'alipay-php/config.php';
		require_once DIR_SYSTEM . 'alipay-php/pagepay/service/AlipayTradeService.php';


		$arr=$_GET;
		if(isset($arr['route'])){
			unset($arr['route']);
		}
		// $alipaySevice = new AlipayTradeService($alipay_config); 
		// $verify_result = $alipaySevice->check($arr);

		if($this->request->get['out_trade_no']) {
					
			$out_trade_no = htmlspecialchars($this->request->get['out_trade_no']);
			
			$order_id   = $out_trade_no; 

			//支付宝交易号
			$trade_no = htmlspecialchars($this->request->get['trade_no']);
		
			//$trade_status = $this->request->get['trade_status'];

			$order_status_id = $this->config->get('config_order_status_id');
			
			$this->load->model('checkout/order');

			$order_info = $this->model_checkout_order->getOrder($order_id);
			
			if ($order_info) {
		
				$order_status_id = $this->config->get('alipay_direct_trade_success_status_id');
				
				if (!$order_info['order_status_id']) {
					
					$this->model_checkout_order->addOrderHistory($order_id, $order_status_id, '', true);
					
				} else {
					
					$this->model_checkout_order->addOrderHistory($order_id, $order_status_id, '', true);
					
				}

				
				//清除sesssion，避免客户返回不到成功页面而无法清除原有的购物车等信息
				$this->cart->clear();
				unset($this->session->data['shipping_method']);
				unset($this->session->data['shipping_methods']);
				unset($this->session->data['payment_method']);
				unset($this->session->data['payment_methods']);
				unset($this->session->data['guest']);
				unset($this->session->data['comment']);
				unset($this->session->data['order_id']);
				unset($this->session->data['coupon']);
				unset($this->session->data['reward']);
				unset($this->session->data['voucher']);
				unset($this->session->data['vouchers']);
				unset($this->session->data['totals']);
				
				$this->response->redirect($this->url->link('account/order', '', true));
				
			}
			
		}
			
	}
	
	public function callback() {
		
		$alipay_config['app_id'] 				= $this->config->get('alipay_direct_app_id');

		$alipay_config['merchant_private_key']	= $this->config->get('alipay_direct_merchant_private_key');
		
		$alipay_config['notify_url'] 			= $this->url->link('extension/payment/alipay_direct/callback');

        $alipay_config['return_url'] 			= $this->url->link('extension/payment/alipay_direct/callback');
		
		$alipay_config['charset']				= 'UTF-8';
		
		$alipay_config['sign_type']    			= 'RSA2';
		
		$alipay_config['gatewayUrl']    		= 'https://openapi.alipay.com/gateway.do';
		
		$alipay_config['alipay_public_key']			= $this->config->get('alipay_direct_public_key');
		
		require_once DIR_SYSTEM . 'alipay-php/config.php';
		require_once DIR_SYSTEM . 'alipay-php/pagepay/service/AlipayTradeService.php';

		$arr=$_POST;
		if(isset($arr['route'])){
			unset($arr['route']);
		}
		$alipaySevice = new AlipayTradeService($alipay_config); 
		$verify_result = $alipaySevice->check($arr);
		$this->model_checkout_order->addOrderHistory($order_id, $this->config->get('alipay_direct_trade_finished_status_id'), 'test', true);
		if($verify_result) {
					
			$out_trade_no = htmlspecialchars($this->request->post['out_trade_no']);
			
			$order_id   = $out_trade_no; 
		
		
			//支付宝交易号
			$trade_no = htmlspecialchars($this->request->post['trade_no']);
		
			$trade_status = $this->request->post['trade_status'];
			
			$order_status_id = $this->config->get('config_order_status_id');
			
			$this->load->model('checkout/order');

			$order_info = $this->model_checkout_order->getOrder($order_id);

			if ($order_info) {

				if($trade_status == 'TRADE_FINISHED') {

					$order_status_id = $this->config->get('alipay_direct_trade_finished_status_id');
					
					if (!$order_info['order_status_id']) {
						
						$this->model_checkout_order->addOrderHistory($order_id, $order_status_id, '', true);
						
					} else {
						
						$this->model_checkout_order->addOrderHistory($order_id, $order_status_id, '', true);
						
					}

					echo "success";	
			
				} else if ($trade_status == 'TRADE_SUCCESS') {

					$order_status_id = $this->config->get('alipay_direct_trade_success_status_id');
					
					if (!$order_info['order_status_id']) {
						
						$this->model_checkout_order->addOrderHistory($order_id, $order_status_id, '', true);
						
					} else {
						
						$this->model_checkout_order->addOrderHistory($order_id, $order_status_id, '', true);
						
					}
						
					echo "success";	
			
				}
				
				//清除sesssion，避免客户返回不到成功页面而无法清除原有的购物车等信息
				$this->cart->clear();
				unset($this->session->data['shipping_method']);
				unset($this->session->data['shipping_methods']);
				unset($this->session->data['payment_method']);
				unset($this->session->data['payment_methods']);
				unset($this->session->data['guest']);
				unset($this->session->data['comment']);
				unset($this->session->data['order_id']);
				unset($this->session->data['coupon']);
				unset($this->session->data['reward']);
				unset($this->session->data['voucher']);
				unset($this->session->data['vouchers']);
				unset($this->session->data['totals']);
				
			}else{

				echo "fail";
				
			}
			
		} else {

			echo "fail";
		
		}

	}

}
