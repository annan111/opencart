<?php
class ControllerExtensionPaymentrxhpayQiwi extends Controller {
	
	public function index() {
		$data['button_confirm'] = $this->language->get('button_confirm');
		$data['button_back'] = $this->language->get('button_back');
		return $this->load->view('extension/payment/rxhpay_qiwi', $data);
	}
	
	//确认订单步骤(并新增订单)
	public function confirm()
	{
		$this->load->model('checkout/order');
		$this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $this->config->get('rxhpay_qiwi_unpaid_id'), '', true);
	}
	
	/**订单支付时验证参数
	 * 用户在支付页面提交的参数需要经过改方法验证
	 * 这里暂时做用户信息，商品数据的非空验证
	 */
	public function arguments_confirmed(){
		$this->load->model('checkout/order');
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
		$rxhpay = array();
		//货物信息
		$rxhpay['product'] = '';
		foreach ($this->cart->getProducts() as $item) {
			$rxhpay['product']  .= "<Goods><GoodId>".$item['product_id']."</GoodId><GoodName>".$item['name']."</GoodName><Qty>" .$item['quantity']."</Qty><Price>".sprintf('%.2f', $item['price'])."</Price></Goods>";
		}
		//运费
		$rxhpay['freight'] = sprintf("%01.2f", 0);
		if(isset($this->session->data['shipping_method']['cost'])){
			$rxhpay['freight'] = sprintf("%01.2f", $this->currency->format($this->session->data['shipping_method']['cost'], $order_info['currency_code'], $order_info['currency_value'], false));
		}
		$rxhpay['amount'] = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], FALSE);
		//持卡人相关信息
		$rxhpay['billFirstName']=$order_info['payment_firstname'];
		$rxhpay['billLastName']=$order_info['payment_lastname'];
		$rxhpay['billZip']=$order_info['payment_postcode'];
		$rxhpay['billAddress']=$order_info['payment_address_1'];
		$rxhpay['billCity']=$order_info['payment_city'];
		$rxhpay['billCountry']=$order_info['payment_iso_code_2'];
		//收货人相关信息
		$rxhpay['billEmail']=$order_info['email'];
		$rxhpay['billPhone']=$order_info['telephone'];
		$rxhpay['shipPhone']=$order_info['telephone'];
		$rxhpay['shipEmail']=$order_info['email'];

		if ($this->cart->hasShipping()) {
			$rxhpay['shipFirstName'] = $order_info['shipping_firstname'];
			$rxhpay['shipLastName'] = $order_info['shipping_lastname'];
			$rxhpay['shipZip']= $order_info['shipping_postcode'];		
			if (!$order_info['shipping_address_2']) {
				$rxhpay['shipAddress'] = $order_info['shipping_address_1'];
			} else {
				$rxhpay['shipAddress'] = $order_info['shipping_address_1'] . ', ' . $order_info['shipping_address_2'];
			}
			$rxhpay['shipCity'] = $order_info['shipping_city'];
			//$rxhpay['shipState'] = $order_info['shipping_zone'];
			$rxhpay['shipCountry']=$order_info['shipping_iso_code_2'];
		} else {
			$rxhpay['shipFirstName'] = $order_info['payment_firstname'];
			$rxhpay['shipLastName'] = $order_info['payment_lastname'];
			$rxhpay['shipZip']= $order_info['payment_postcode'];		
			if (!$order_info['payment_address_2']) {
				$rxhpay['shipAddress'] = $order_info['payment_address_1'] ;
			} else {
				$rxhpay['shipAddress'] = $order_info['payment_address_1'] . ', ' . $order_info['payment_address_2'];
			}
			$rxhpay['shipCity'] = $order_info['payment_city'];
			//$rxhpay['shipState'] = $order_info['payment_zone'];
			$rxhpay['shipCountry'] = $order_info['payment_iso_code_2'];
		}
		$result = array();
		foreach($rxhpay as $key => $val){
			if(empty($val)){
				$result['error'] = $key.' ';
			}
		}
		
		$filter_countries = array('Canada','CA','CAN','United States','US','USA');
		if(in_array($rxhpay['billCountry'],$filter_countries)){
			//账单人省份/州
			$rxhpay['billState'] = $order_info['payment_zone'];
			
			if(empty($rxhpay['billState'])){
				$result['error'] .= 'billState';
			}
		}
		if(in_array($rxhpay['shipCountry'],$filter_countries)){
			//账单人省份/州
			$rxhpay['shipState'] = !empty(trim($order_info['shipping_zone'])) ? $order_info['shipping_zone'] : $order_info['payment_zone'];
			
			if(empty($rxhpay['shipState'])){
				$result['error'] .= 'shipState';
			}
		}
		
		if(empty($result)){
			$result['msg'] = true;
			echo json_encode($result);
		}else{
			echo json_encode('The parameter is not null: '.$result['error']);
		}
		
	}
	
	//支付接口参数组合,并提交rxhpay_qiwi进行支付
	public function torxhpay_qiwi() {
		$this->load->model('checkout/order');
		$order_info= $this->model_checkout_order->getOrder($this->session->data['order_id']);
		
		$url=$this->config->get('rxhpay_qiwi_transaction_url');
		if($url){
			$data['action'] = $url;
		}else{
			$data['action'] = "http://pay.rxhpay.com/cross_pay";
		}
		$merNo= $this->config->get('rxhpay_qiwi_merchant');
		$billNo=$order_info['order_id'];
		$remark = $order_info['comment'];
		//货物信息
		$goodsListInfo = '';
		foreach ($this->cart->getProducts() as $item) {
			$goodsListInfo  .= "<Goods><GoodId>".$item['product_id']."</GoodId><GoodName>".$item['name']."</GoodName><Qty>" .$item['quantity']."</Qty><Price>".sprintf('%.2f', $item['price'])."</Price></Goods>";
		}
		
		//交易币种
		$freight = sprintf("%01.2f", 0);//运费
		$currencyCode = $order_info['currency_code'];
		if(isset($this->session->data['shipping_method']['cost'])){
			$freight = sprintf("%01.2f", $this->currency->format($this->session->data['shipping_method']['cost'], $order_info['currency_code'], $order_info['currency_value'], false)); 
		}
		$amount = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], FALSE);
		//持卡人相关信息
		$billFirstName=$order_info['payment_firstname'];
		$billLastName=$order_info['payment_lastname'];
		$billZip=$order_info['payment_postcode'];
		$billAddress=$order_info['payment_address_1'];
		$billCity=$order_info['payment_city'];
		$billState=$order_info['payment_zone'];
		$billCountry=$order_info['payment_iso_code_2'];
		//收货人相关信息
		$email =$order_info['email'];
		$phone =$order_info['telephone'];
		$shipPhone=$order_info['telephone'];
		$shipEmail=$order_info['email'];
		
		//支付模式:
		$payMode="Qiwi";
		//支付类型:
		$payType='qw';

		if ($this->cart->hasShipping()) {
			$shipFirstName = $order_info['shipping_firstname'];
			$shipLastName = $order_info['shipping_lastname'];
			$shipZip= $order_info['shipping_postcode'];		
			if (!$order_info['shipping_address_2']) {
				$shipAddress = $order_info['shipping_address_1'] ;
			} else {
				$shipAddress = $order_info['shipping_address_1'] . ', ' . $order_info['shipping_address_2'];
			}
			$shipCity = $order_info['shipping_city'];
			$shipState = $order_info['shipping_zone'];
			$shipCountry=$order_info['shipping_iso_code_2'];
		} else {
			$shipFirstName = $order_info['payment_firstname'];
			$shipLastName = $order_info['payment_lastname'];
			$shipZip= $order_info['payment_postcode'];		
			if (!$order_info['payment_address_2']) {
				$shipAddress = $order_info['payment_address_1'] ;
			} else {
				$shipAddress = $order_info['payment_address_1'] . ', ' . $order_info['payment_address_2'];
			}
			$shipCity = $order_info['payment_city'];
			$shipState = $order_info['payment_zone'];
			$shipCountry=$order_info['payment_iso_code_2'];
		}

		$language=$this->getLanguageCode($this->session->data['language']);
		
		$fee='0';
		//其他
	  	$returnURL = $this->url->link('extension/payment/rxhpay_qiwi/callback');
	  	$NotifyURL =$this->url->link('extension/payment/rxhpay_qiwi/notify');
	  	$UserAgent =$_SERVER['HTTP_USER_AGENT'];
		$md5Key = $this->config->get('rxhpay_qiwi_md5key');
		$md5Src  = $merNo.$billNo.$freight.$amount.$fee.$currencyCode.$returnURL.$email.$md5Key;
        $md5Info = strtoupper(md5($md5Src)); 
        
		$basexml  = '<?xml version="1.0" encoding="UTF-8" ?><Order>';
		$basexml .= "<MerNo>". $merNo ."</MerNo>";
		$basexml .= "<BillNo>". $billNo ."</BillNo>";
		$basexml .= "<GoodList>".$goodsListInfo."</GoodList>";
		$basexml .= "<Amount>". $amount ."</Amount>";
		$basexml .= "<Fee>". $fee ."</Fee>";
		$basexml .= "<Freight>". $freight ."</Freight>";
		$basexml .= "<Currency>". $currencyCode."</Currency>";
		$basexml .= "<BillFirstName>". $billFirstName ."</BillFirstName>";
		$basexml .= "<BillLastName>". $billLastName ."</BillLastName>";
		$basexml .= "<BillEmail>".$email."</BillEmail>";
		$basexml .= "<BillPhone>". $phone ."</BillPhone>";
		$basexml .= "<BillAddress>". $billAddress ."</BillAddress>";
		$basexml .= "<BillCity>". $billCity ."</BillCity>";
		$basexml .= "<BillState>". $billState ."</BillState>";
		$basexml .= "<BillCountry>". $billCountry ."</BillCountry>";
		$basexml .= "<BillZip>". $billZip ."</BillZip>";
		$basexml .= "<ShipFirstName>". $shipFirstName ."</ShipFirstName>";
		$basexml .= "<ShipLastName>". $shipLastName . "</ShipLastName>";
		$basexml .= "<ShipPhone>".$shipPhone ."</ShipPhone>";
		$basexml .= "<ShipEmail>".$shipEmail ."</ShipEmail>";
		$basexml .= "<ShipAddress>". $shipAddress ."</ShipAddress>";
		$basexml .= "<ShipCity>". $shipCity ."</ShipCity>";
		$basexml .= "<ShipState>". $shipState ."</ShipState>";
		$basexml .= "<ShipCountry>". $shipCountry ."</ShipCountry>";
		$basexml .= "<ShipZip>". $shipZip ."</ShipZip>";
		$basexml .= "<PayMode>".$payMode ."</PayMode>";
		$basexml .= "<PayType>".$payType ."</PayType>";
		$basexml .= "<Ip>".$this->getip()."</Ip>";
		$basexml .= "<Lang>". $language ."</Lang>";
		$basexml .= "<ReturnURL>". $returnURL ."</ReturnURL>";
		$basexml .= "<NotifyURL>".$NotifyURL ."</NotifyURL>";
		$basexml .= "<UserAgent>".$UserAgent ."</UserAgent>";
		$basexml .= "<Remark>". $remark ."</Remark>";
		$basexml .= "<Md5Info>". $md5Info ."</Md5Info></Order>";
		
		$tradeInfo = base64_encode(urlencode($basexml));
		$data['tradeInfo'] =$tradeInfo;
		
		//请求响应接口之前清空购物车
		$this->cart->clear();
		
		echo json_encode($data);
	}
	
	/**判断视图文件所在模板的方法封装
	 * 将判断文件所在模板的条件封装在方法体里，用函数调用，使代码整体看起来更简洁了
	 */
	public function temp($route){
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/'. $route .'.tpl')) {
			return $this->config->get('config_template') . '/template/'. $route .'.tpl';
		}else{
			return 'default/template/'. $route .'.tpl';
		}
	}
	
	/*持卡人ip*/
	function getip(){
		if(isset($_SERVER['HTTP_X_FORWARDED_FOR'])){
			$online_ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
		}elseif(isset($_SERVER['HTTP_CLIENT_IP'])){
			$online_ip = $_SERVER['HTTP_CLIENT_IP'];
		}else{
			$online_ip = $_SERVER['REMOTE_ADDR'];
		}
		return $online_ip;
	}
	
	/**
	 * 获取支付语言代码
	 * @返回字符串
	 */
	function getLanguageCode($language){
		$languageCode = strtolower($language);
		if($languageCode == "en" || $languageCode == "english" || $languageCode == "en-gb"){
		   $langCode = "en";
		}elseif($languageCode == "fr" || $languageCode == "france" || $languageCode == "french" || $languageCode == "fr-fr"){
			$langCode = "fr";
		}elseif($languageCode == "it" || $languageCode == "italy" || $languageCode == "italian" || $languageCode == "it-it"){
			$langCode = "it";
		}elseif($languageCode == "ja" || $languageCode == "jp" || $languageCode == "japanese" || $languageCode == "jp-jp"){
			$langCode = "jp";
		}elseif($languageCode == "de" || $languageCode == "ge" || $languageCode == "german" || $languageCode == "de-de"){
			$langCode = "de";
		}elseif($languageCode == "es" || $languageCode == "sp" || $languageCode == "spanish" || $languageCode == "es-es"){
			$langCode = "es";
		}elseif($languageCode == "ru" || $languageCode == "rf" || $languageCode == "russian" || $languageCode == "ru-ru"){
			$langCode = "ru";
		}elseif($languageCode == "pt" || $languageCode == "po" || $languageCode == "portuguese" || $languageCode == "pt-pt"){
			$langCode = "pt";
		}else{
			$langCode = "en";
		}
		return $langCode;
	}
	
	//返回通知处理
	public function notify() {
		if($this->request->post){
			$this->load->model('checkout/order');
			$this->language->load('extension/payment/rxhpay_qiwi');
			
			$md5Key=$this->config->get('rxhpay_qiwi_md5key');
			$verify_orderNo = isset($this->request->post['billNo']) ? $this->request->post['billNo'] :'';
			$verify_currency=isset($this->request->post['currency'])? $this->request->post['currency']:'';
			$verify_amount=isset($this->request->post['amount'])? $this->request->post['amount']:'';
			$verify_succeed=isset($this->request->post['succeed'])? $this->request->post['succeed']:'';
			$verify_result=isset($this->request->post['result'])? $this->request->post['result']:'';
			$verify_md5Info=isset($this->request->post['md5Info'])? strtoupper($this->request->post['md5Info']):'';
			
			$verifyCode=strtoupper(md5($verify_orderNo.$verify_currency.$verify_amount.$verify_succeed.$md5Key));

			if($verifyCode == $verify_md5Info){
				$order = $this->model_checkout_order->getOrder($verify_orderNo);
				if(isset($order['order_status_id']) && ($order['order_status_id'] != $this->pay_state($verify_succeed))){
					if($verify_succeed == '0'){
						//支付成功后清空购物车
						if(empty($verify_result)) $verify_result = 'Payment success!';
						$this->model_checkout_order->addOrderHistory($verify_orderNo, $this->config->get('rxhpay_qiwi_approved_id'), $verify_result, true);
					}else if($verify_succeed == '1'){
						//支付失败
						if(empty($verify_result)) $verify_result = 'Payment failure!';
						$this->model_checkout_order->addOrderHistory($verify_orderNo, $this->config->get('rxhpay_qiwi_declined_id'), $verify_result, true);
					}else if($verify_succeed == '2' || $verify_succeed == '98'){
						//支付中或者支付超时
						if(empty($verify_result)) $verify_result = 'Bank timeout!';
						$this->model_checkout_order->addOrderHistory($verify_orderNo, $this->config->get('rxhpay_qiwi_pending_id'), $verify_result, true);
					}
				}
			}
			echo 'succeed';
		}
	}
	
	/** 
	 * 回掉时判断支付状态
	 */
	public function pay_state($succed){
		if($succed=='0'){
			return $this->config->get('rxhpay_qiwi_approved_id');
		}else if($succed=='1'){
			return $this->config->get('rxhpay_qiwi_declined_id');
		}else if($succed=='2' || $succed=='98'){
			return $this->config->get('rxhpay_qiwi_pending_id');
		}else if($succed=='error'){
			return $this->config->get('rxhpay_qiwi_error_id');
		}else{
			return $this->config->get('rxhpay_qiwi_abnormal_id');
		}
	}

	/**
	 * 对特殊字符进行转义
	 * @param string string_before
	 * @return string string_after
	 */
	function intval_replace($string_before) {
		$string_after = str_replace("\n"," ",$string_before);
		$string_after = str_replace("\r"," ",$string_after);
		$string_after = str_replace("\r\n"," ",$string_after);
		$string_after = str_replace("'","&#39 ",$string_after);
		$string_after = str_replace('"',"&#34 ",$string_after);
		$string_after = str_replace("(","&#40 ",$string_after);
		$string_after = str_replace(")","&#41 ",$string_after);
		$string_after = str_replace("[","&#91 ",$string_after);
		$string_after = str_replace("]","&#93 ",$string_after);
		$string_after = str_replace("<","&#60 ",$string_after);
		$string_after = str_replace(">","&#62 ",$string_after);
		$string_after = str_replace("?","&#63 ",$string_after);
		return $string_after;
	}
	
	//支付结果处理
	public function callback() {
		$this->load->model('checkout/order');
		$this->language->load('extension/payment/rxhpay_qiwi');
		$data['logged'] = $this->customer->isLogged();
		$md5Key=$this->config->get('rxhpay_qiwi_md5key');

		if($this->request->post){
			$verify_orderNo=isset($this->request->post['billNo'])? $this->request->post['billNo']: $this->session->data['order_id'];
			$verify_currency=isset($this->request->post['currency'])? $this->request->post['currency']:'';
			$verify_amount=isset($this->request->post['amount'])? $this->request->post['amount']:'';
			$verify_succeed=isset($this->request->post['succeed'])? $this->request->post['succeed']:'';
			$verify_result=isset($this->request->post['result'])? $this->request->post['result']:'';
			$verify_md5Info=isset($this->request->post['md5Info'])? strtoupper($this->request->post['md5Info']):'';

			$verifyCode=strtoupper(md5($verify_orderNo.$verify_currency.$verify_amount.$verify_succeed.$md5Key));

			$data['charset'] = $this->language->get('charset');
			$data['language'] = $this->language->get('code');
			$data['direction'] = $this->language->get('direction');
			$data['heading_title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));
			$data['text_result']='<font color="green">'.$verify_result.'</font>';	
			$data['title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));

			$data['text_billno'] = $verify_orderNo;
			if (!isset($this->request->server['HTTPS']) || ($this->request->server['HTTPS'] != 'on')) {
				$data['base'] = HTTP_SERVER;
			} else {
				$data['base'] = HTTPS_SERVER;
			}
			
			$data['text_success'] = $this->language->get('text_success');
			$data['text_failure'] = $this->language->get('text_failure');
			if($data['logged']){
				$data['text_success_wait'] = $data['text_failure_wait'] = sprintf($this->language->get('text_failure_wait'), $data['base'] . 'index.php?route=account/order');
			}else{
				$data['text_success_wait'] = $data['text_failure_wait'] = sprintf($this->language->get('text_failure_wait'), $data['base'] . 'index.php?route=checkout/cart');
			}
			
			$data['header'] = $this->load->controller('common/header');
			$data['footer'] = $this->load->controller('common/footer');

			$order = $this->model_checkout_order->getOrder($this->intval_replace($verify_orderNo));
			if(isset($order['order_status_id']) && ($order['order_status_id'] != $this->pay_state($verify_succeed))){
				if($verifyCode == $verify_md5Info && $verify_succeed == '0'){
					//支付成功后清空购物车
					if(empty($verify_result)){
						$verify_result = 'Payment success!';
						$data['text_result']='<font color="green">'.$verify_result.'</font>';
					}
					$this->model_checkout_order->addOrderHistory($verify_orderNo, $this->config->get('rxhpay_qiwi_approved_id'), $verify_result, true);
				}else if($verifyCode == $verify_md5Info && $verify_succeed == '1'){
					//支付失败
					if(empty($verify_result)){
						$verify_result = 'Payment failure!';
						$data['text_result']='<font color="green">'.$verify_result.'</font>';
					}
					$this->model_checkout_order->addOrderHistory($verify_orderNo, $this->config->get('rxhpay_qiwi_declined_id'), $verify_result, true);
				}else if($verifyCode == $verify_md5Info && ($verify_succeed == '2' || $verify_succeed == '98')){
					//支付中或者支付超时
					if(empty($verify_result)){
						$verify_result = 'Bank timeout!';
						$data['text_result']='<font color="green">'.$verify_result.'</font>';
					}
					$this->model_checkout_order->addOrderHistory($verify_orderNo, $this->config->get('rxhpay_qiwi_pending_id'), $verify_result, true);
				}else if(!empty($this->session->data['order_id'])){
					if($verify_succeed == "error"){
						//支付出错
						if(empty($verify_result)){
							$verify_result = 'Payment error!';
							$data['text_result'] ='<font color="green">'.$verify_result.'</font>';
						}
						$this->model_checkout_order->addOrderHistory($verify_orderNo,$this->config->get('rxhpay_qiwi_error_id'),$verify_result, true);
					}else{
						//签名不正确
						if(empty($verify_result)) $verify_result = '<font color="green">Signature incorrect!</font>';
						$data['text_result'] = $verify_result;
					}
				}else{
					//签名不正确
					$verify_result = '<font color="green">Signature incorrect!</font>';
					$data['text_result'] = $verify_result;
				}
			}
			//跳转地址统一在下面输出
			if($verify_succeed == '0'){
				if(empty($verify_result)) $data['text_result']='<font color="green">Payment Success!</font>';
				$this->response->setOutput($this->load->view('extension/payment/rxhpay_success', $data));
			}else{
				if(empty($verify_result)) $data['text_result']='<font color="green">Signature incorrect!</font>';
				$this->response->setOutput($this->load->view('extension/payment/rxhpay_failure', $data));
			}
		}else{
			//错误处理页面
			$this->response->redirect($this->url->link('error/not_found', '', true));
		}
	}
}
