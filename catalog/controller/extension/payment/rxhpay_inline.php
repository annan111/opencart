<?php
class ControllerExtensionPaymentRxhPayinline extends Controller {
	/**支付操作
	 * checkout/confirm 加载支付操作,用于确认下单
	 */
	public function index() {
		$data['button_confirm'] = $this->language->get('button_confirm');
		$data['button_back'] = $this->language->get('button_back');
		return $this->load->view('extension/payment/rxhpay_inline', $data);
	}

	/**确认订单步骤
	 * 支付操作确认下单时调用确认订单步骤
	 */
	public function confirm()
	{
		$this->load->model('checkout/order');
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
		$this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $this->config->get('rxhpay_inline_unpaid_id'), 'Order submitted', true);
	}
	/**获取用户输入的卡号信息
	 * 存储支付输入页面传递过来的用户卡号信息到会话中
	 */
	public function getCredit(){
		$this->session->data['cardNo'] = $_POST['rxhpay_cc_number'];
		$this->session->data['securityNum'] = $_POST['rxhpay_cc_checkcode'];
		$this->session->data['expireYear'] = $_POST['rxhpay_cc_expires_year'];
		$this->session->data['expireMonth'] = $_POST['rxhpay_cc_expires_month'];
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

	/**支付接口参数组合,并提交rxhpay进行支付
	 * 订单确认提交并经过验证后，经过该方法整合数据后提交到支付接口
	 */
	public function torxhpay_inline() {
		$this->load->language('extension/payment/rxhpay_inline');
		if(isset($this->session->data['order_id'])){
			$this->load->model('checkout/order');
			$data['logged'] = $this->customer->isLogged();
			$order_info= $this->model_checkout_order->getOrder($this->session->data['order_id']);
			
			$data['button_confirm'] = $this->language->get('button_confirm');
			$data['button_back'] = $this->language->get('button_back');

			$url=$this->config->get('rxhpay_inline_transaction_url');
			if($url){
				$data['action'] = $url;
			}else{
				$data['action'] = "http://pay.rxhpay.com/inline_pay";			
			}
			$rxhpay = array();
			$rxhpay['merNo'] = $this->config->get('rxhpay_inline_merchant');
			$rxhpay['billNo'] = $order_info['order_id'];
			$data['MerWebsite'] = $this->config->get('config_url');
			
			//货物信息
			$rxhpay['goodsListInfo'] = '';
			foreach ($this->cart->getProducts() as $item) {
				$rxhpay['goodsListInfo']  .= "<Goods><GoodId>".$item['product_id']."</GoodId><GoodName>".$item['name']."</GoodName><Qty>" .$item['quantity']."</Qty><Price>".sprintf('%.2f', $item['price'])."</Price></Goods>";
			}
			//支付手续费
			$rxhpay['fee']='0';
			//交易币种
			$rxhpay['currencyCode'] = $order_info['currency_code'];
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
			$rxhpay['billState']=$order_info['payment_zone'];
			$rxhpay['billCountry']=$order_info['payment_iso_code_2'];
			//收货人相关信息
			$rxhpay['billEmail']=$order_info['email'];
			$rxhpay['billPhone']=$order_info['telephone'];
			$rxhpay['shipPhone']=$order_info['telephone'];
			$rxhpay['shipEmail']=$order_info['email'];
			//支付模式:
			$rxhpay['payMode']="Credit";
			//支付类型:
			$rxhpay['payType']=null;
			$rxhpay['ip']=$this->getip();
			
			if ($this->cart->hasShipping()) {
				$rxhpay['shipFirstName'] = $order_info['shipping_firstname'];
				$rxhpay['shipLastName'] = $order_info['shipping_lastname'];
				$rxhpay['shipZip']= $order_info['shipping_postcode'];		
				if (!$order_info['shipping_address_2']) {
					$rxhpay['shipAddress'] = $order_info['shipping_address_1'] ;
				} else {
					$rxhpay['shipAddress'] = $order_info['shipping_address_1'] . ', ' . $order_info['shipping_address_2'];
				}
				$rxhpay['shipCity'] = $order_info['shipping_city'];
				$rxhpay['shipState'] = $order_info['shipping_zone'];
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
				$rxhpay['shipState'] = $order_info['payment_zone'];
				$rxhpay['shipCountry']=$order_info['payment_iso_code_2'];
			}

			$rxhpay['language']=$this->getLanguageCode($this->session->data['language']);

			//其他
			$rxhpay['returnURL'] = $this->url->link('extension/payment/rxhpay_inline/callback');
			$rxhpay['notifyURL'] =$this->url->link('extension/payment/rxhpay_inline/notify');
			$rxhpay['userAgent'] =$_SERVER['HTTP_USER_AGENT'];
			$rxhpay['md5Key'] = $this->config->get('rxhpay_inline_md5key');
			$rxhpay['md5Src']  = $rxhpay['merNo'].$rxhpay['billNo'].$rxhpay['freight'].$rxhpay['amount'].$rxhpay['fee'].$rxhpay['currencyCode'].$rxhpay['returnURL'].$rxhpay['shipEmail'].$rxhpay['md5Key'];
			$rxhpay['md5Info'] = strtoupper(md5($rxhpay['md5Src'])); 

			//备注
			$rxhpay['remark'] = $order_info['comment'];
			$basexml  = '<?xml version="1.0" encoding="UTF-8" ?><Order>';
			$basexml .= "<MerNo>". $rxhpay['merNo'] ."</MerNo>";
			$basexml .= "<BillNo>". $rxhpay['billNo'] ."</BillNo>";
			$basexml .= "<GoodList>".$rxhpay['goodsListInfo']."</GoodList>";
			$basexml .= "<Amount>". $rxhpay['amount'] ."</Amount>";
			$basexml .= "<Fee>". $rxhpay['fee'] ."</Fee>";
			$basexml .= "<Freight>". $rxhpay['freight'] ."</Freight>";
			$basexml .= "<Currency>". $rxhpay['currencyCode']."</Currency>";
			$basexml .= "<BillFirstName>". $rxhpay['billFirstName'] ."</BillFirstName>";
			$basexml .= "<BillLastName>". $rxhpay['billLastName'] ."</BillLastName>";
			$basexml .= "<BillEmail>".$rxhpay['billEmail']."</BillEmail>";
			$basexml .= "<BillPhone>". $rxhpay['billPhone'] ."</BillPhone>";
			$basexml .= "<BillAddress>". $rxhpay['billAddress'] ."</BillAddress>";
			$basexml .= "<BillCity>". $rxhpay['billCity'] ."</BillCity>";
			$basexml .= "<BillState>". $rxhpay['billState'] ."</BillState>";
			$basexml .= "<BillCountry>". $rxhpay['billCountry'] ."</BillCountry>";
			$basexml .= "<BillZip>". $rxhpay['billZip'] ."</BillZip>";
			$basexml .= "<ShipFirstName>". $rxhpay['shipFirstName'] ."</ShipFirstName>";
			$basexml .= "<ShipLastName>". $rxhpay['shipLastName'] . "</ShipLastName>";
			$basexml .= "<ShipPhone>".$rxhpay['shipPhone'] ."</ShipPhone>";
			$basexml .= "<ShipEmail>".$rxhpay['shipEmail'] ."</ShipEmail>";
			$basexml .= "<ShipAddress>". $rxhpay['shipAddress'] ."</ShipAddress>";
			$basexml .= "<ShipCity>". $rxhpay['shipCity'] ."</ShipCity>";
			$basexml .= "<ShipState>". $rxhpay['shipState'] ."</ShipState>";
			$basexml .= "<ShipCountry>". $rxhpay['shipCountry'] ."</ShipCountry>";
			$basexml .= "<ShipZip>". $rxhpay['shipZip'] ."</ShipZip>";
			$basexml .= "<PayMode>".$rxhpay['payMode'] ."</PayMode>";
			$basexml .= "<PayType>".$rxhpay['payType'] ."</PayType>";
			$basexml .= "<Lang>". $rxhpay['language'] ."</Lang>";
			$basexml .= "<ReturnURL>". $rxhpay['returnURL'] ."</ReturnURL>";
			$basexml .= "<NotifyURL>".$rxhpay['notifyURL'] ."</NotifyURL>";
			$basexml .= "<UserAgent>".$rxhpay['userAgent'] ."</UserAgent>";
			$basexml .= "<Remark>". $rxhpay['remark'] ."</Remark>";
			$basexml .= "<Md5Info>". $rxhpay['md5Info'] ."</Md5Info>";
			//卡号信息
			$basexml .= "<CardNo>".$this->session->data['cardNo']."</CardNo>";
			$basexml .= "<SecurityNum>".$this->session->data['securityNum']."</SecurityNum>";
			$basexml .= "<ExpireYear>".$this->session->data['expireYear']."</ExpireYear>";
			$basexml .= "<ExpireMonth>".$this->session->data['expireMonth']."</ExpireMonth>";
			$basexml .= "<Ip>".$rxhpay['ip']."</Ip></Order>";
			$tradeInfo = base64_encode(urlencode($basexml));
			
			//请求响应接口之前清空购物车
			$this->cart->clear();
			//清除会话中的订单id
			$order_id = $this->session->data['order_id'];
			unset($this->session->data['order_id']);
			
			$decryData=$this->curlPost($data['action'],"tradeInfo=".$tradeInfo);
			$splitdata=array();
			$edata=explode(';',$decryData);
			foreach($edata as $key=>$value){
			$splitdata[$key]= explode('=',$value);
			}
			
			//交易流水号
			$verify_tradeNo=!empty($splitdata[0][1])? $splitdata[0][1]:'';
			//订单号
			$verify_orderNo  = !empty($splitdata[1][1])? $splitdata[1][1]:$rxhpay['billNo'];
			//通道参数
			$verify_currency = !empty($splitdata[6][1])? $splitdata[6][1]:'';
			//金额
			$verify_amount = !empty($splitdata[7][1])? $splitdata[7][1]:'';
			//支付状态
			$verify_succeed = isset($splitdata[2][1])? $splitdata[2][1]:'';
			//支付结果
			$verify_result = !empty($splitdata[3][1])? $splitdata[3][1]:'';
			//取得的MD5校验信息
			$verify_md5Info = !empty($splitdata[4][1])? strtoupper($splitdata[4][1]):'';
			//备注
			$verify_remark = !empty($splitdata[5][1])? $splitdata[5][1]:'';
			
			//校验源字符串
			$verifyCode=strtoupper(md5($verify_orderNo.$verify_currency.$verify_amount.$verify_succeed.$rxhpay['md5Key']));
			/*--支付结果处理 bof --*/

			$data['heading_title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));
			$data['text_result']='<font color="green">'.$verify_result.'</font>';	
			$this->document->setTitle(sprintf($this->language->get('heading_title'), $this->config->get('config_name')));
			//
			if (!isset($this->request->server['HTTPS']) || ($this->request->server['HTTPS'] != 'on')) {
				$data['base'] = HTTP_SERVER;
			} else {
				$data['base'] = HTTPS_SERVER;
			}

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
					$this->model_checkout_order->addOrderHistory($verify_orderNo, $this->config->get('rxhpay_inline_approved_id'), $data['text_result'], true);
				}else if($verifyCode == $verify_md5Info && $verify_succeed == '1'){
					//支付失败
					if(empty($verify_result)){
						$verify_result = 'Payment failure!';
						$data['text_result']='<font color="green">'.$verify_result.'</font>';
					}
					$this->model_checkout_order->addOrderHistory($verify_orderNo, $this->config->get('rxhpay_inline_declined_id'), $data['text_result'], true);
				}else if($verifyCode == $verify_md5Info && ($verify_succeed == '2' || $verify_succeed == '98')){
					//支付中或者支付超时
					if(empty($verify_result)){
						$verify_result = 'Bank timeout!';
						$data['text_result']='<font color="green">'.$verify_result.'</font>';
					}
					$this->model_checkout_order->addOrderHistory($verify_orderNo, $this->config->get('rxhpay_inline_pending_id'), $data['text_result'], true);
				}else if(!empty($order_id)){
					if($verify_succeed == "error"){
						//支付出错
						if(empty($verify_result)){
							$verify_result = 'Payment error!';
							$data['text_result'] ='<font color="green">'.$verify_result.'</font>';
						}
						$this->model_checkout_order->addOrderHistory($verify_orderNo,$this->config->get('rxhpay_inline_error_id'),$data['text_result'], true);
					}else{
						//签名不正确
						if(empty($verify_result)) $verify_result = '<font color="green">Signature incorrect!</font>';
						$data['text_result'] = $verify_result;
						//签名不正确数据加入订单历史记录
						$this->model_checkout_order->addOrderHistory($verify_orderNo, $this->config->get('rxhpay_inline_abnormal_id'), $data['text_result'], true);
					}
				}else{
					//签名不正确
					if(empty($verify_result)) $verify_result = '<font color="green">Signature incorrect!</font>';
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
			
		/*--支付结果处理 eof --*/
		}else{
			//错误处理页面
			$this->response->redirect($this->url->link('error/not_found', '', true));
		}
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

	/** 回调方法
	 * 有访问到的时候输出 succeed
	 * 方法用于接口判断页面是否正常，如果访问不正常（即因网络等原因无法访问到网站）由接口调用通知方法请求网站
	 */
	public function callback() {
		echo 'succeed';
	}
	/**通知方法
	 * 接口没有捕获到 callback 输出到页面的字符串 succeed (或访问 callback 失败),异步调用notify请求网站订单数据
	 * 如果支付接口没有正常响应网站的回调方法，则会调用通知方法，请求网站，传递参数给网站用于判断订单是否未支付状态，
	 * 订单若还处于未支付状态,更改订单状态
	 */
	public function notify(){
		if($this->request->post){
			$this->load->model('checkout/order');
			$this->language->load('extension/payment/rxhpay');

			$md5Key=$this->config->get('rxhpay_inline_md5key');
			$verify_orderNo=isset($this->request->post['billNo'])? $this->request->post['billNo']:'';
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
						$this->model_checkout_order->addOrderHistory($verify_orderNo, $this->config->get('rxhpay_inline_approved_id'), $verify_result, true);
					}else if($verify_succeed == '1'){
						if(empty($verify_result)) $verify_result = 'Payment failure!';
						$this->model_checkout_order->addOrderHistory($verify_orderNo, $this->config->get('rxhpay_inline_declined_id'), $verify_result, true);
					}else if($verify_succeed == '2' || $verify_succeed == '98'){
						//支付中或者支付超时
						if(empty($verify_result)) $verify_result = 'Bank timeout!';
						$this->model_checkout_order->addOrderHistory($verify_orderNo, $this->config->get('rxhpay_inline_pending_id'), $verify_result, true);
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
			return $this->config->get('rxhpay_inline_approved_id');
		}else if($succed=='1'){
			return $this->config->get('rxhpay_inline_declined_id');
		}else if($succed=='2' || $succed=='98'){
			return $this->config->get('rxhpay_inline_pending_id');
		}else if($succed=='error'){
			return $this->config->get('rxhpay_inline_error_id');
		}else{
			return $this->config->get('rxhpay_inline_abnormal_id');
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
	//直连
	function curlPost($url, $data) {
		$wesite = "http://".$_SERVER['HTTP_HOST'];
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL ,$url);
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
		curl_setopt($ch, CURLOPT_REFERER,$wesite);
		curl_setopt($ch, CURLOPT_TIMEOUT,60);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
		$data = curl_exec($ch);
		curl_close($ch);
		return $data;
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
}
