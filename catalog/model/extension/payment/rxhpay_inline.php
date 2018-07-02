<?php 
class ModelExtensionPaymentRxhPayinline extends Model {
	private $expires_month = array();
	private $expires_year = array();
	private $issue_year = array();
	
	public function __construct($registry){
		parent::__construct($registry);
		$this->expires_month[] = array('id'=>'00','text'=>'Month');
		$this->expires_year[] = array('id'=>'00','text'=>'Year');
		for ($i = 1; $i < 13; $i++) {
		  $this->expires_month[] = array('id' => sprintf('%02d', $i), 'text' => strftime('%m',mktime(0,0,0,$i,1,2000)));
		}
		$today = getdate();
		for ($i = $today['year']; $i < $today['year'] + 15; $i++) {
		  $this->expires_year[] = array('id' => strftime('%Y',mktime(0,0,0,1,1,$i)), 'text' => strftime('%Y',mktime(0,0,0,1,1,$i)));
		}
		
		
	}

	/*下拉框*/
	public function draw_pull_down_menu($name, $values, $default = '', $parameters = '') {
		$field = '<select name="' . $name . '"';
		if (!empty($parameters)) $field .= ' ' . $parameters;
		$field .= '>' . "\n";
		for ($i=0, $n=sizeof($values); $i<$n; $i++) {
			
		  $field .= '  <option value="' . $values[$i]['id'] . '"';
		  if ($default == $values[$i]['id']) {
			$field .= ' selected="selected"';
		  }
		  $field .= '>' . $this->process_output_string($values[$i]['text'], array('"' => '&quot;', '\'' => '&#039;', '<' => '&lt;', '>' => '&gt;')) . '</option>' . "\n";
		}
		$field .= '</select>' . "\n";
		return $field;
	}

	
	
	
	/*处理传入字符串*/
	public function process_output_string($string, $translate = false, $protected = false) {
		if ($protected == true) {
		  return htmlspecialchars($string, ENT_COMPAT, CHARSET, TRUE);
		} else {
		  if ($translate == false) {
			return strtr(trim($string), array('"' => '&quot;'));
		  } else {
			return strtr(trim($string), $translate);
		  }
		}
	}
	/* 支付显示方式 */
	public function design_method(){
		$html = '
		<div id="gc_box">
			<dl class="right-container pb40">
				<dl class="fake_paymethod mt">
                <dl class="col-xs-12 col-sm-6 col-md-4"> 
				 <dl class="content-paymethod pt30 pl30 pr30 pb50">
                    <dd style="width:100%;margin-left: 0;"><input style=" background: #fff;border: none;" type="text" id="card_number" name="rxhpay_cc_number" placeholder="Card Number" autocomplete="off" maxlength="16" size="23"></dd>
                    <dd id="card_number_error" style="display:none;"><div class="card_paymethod_er"></div></dd>          
                    <dd class="pt20 pb10 fl cff" style="width:100%;margin-top:5px;margin-left: 0px;">Expiration Date:</dd>
                    <dd class="col-xs-9 col-md-12">
                    	'.$this->draw_pull_down_menu('rxhpay_cc_expires_month', $this->expires_month, 'Month', 'id="card_exp_month"') . '&nbsp;' . $this->draw_pull_down_menu('rxhpay_cc_expires_year', $this->expires_year, 'Year', 'id="card_exp_year"').'
                    </dd>
                    <dd id="expiration_date_error" style="display:none; clear:both;"><dd class="card_paymethod_er"></dd></dd>
                 </dl>
				</dl>
                <dl class="col-xs-12 col-sm-6 col-md-4 ">
                  <dl class="content-paymethod content-paymethod-card ">
					<dd class="card-stripe"></dd>
					<dl class="pt20 pl30 pr30" style="float: left;width: 100%;">
						<dd class="security-code col-xs-6 pt20"><img src="image/payment/security-code-bg.png"></dd>
						<dl class="cvvn col-xs-6">
							<dd class="cff fs12 ls1 pb10 pl10">Security Code:</dd>
							<dd>
								<input style="border: none;background: #fff;" type="password" id="card_cvn" name="rxhpay_cc_checkcode" value="" autocomplete="new-password" maxlength="3" size="3"> 
							</dd>
							<dd id="card_cvn_error" style="display:none;"><dd class="card_paymethod_er"></dd></dd>
						</dl>
                    </dl>
						<dd class="w-security fl pl30 pb20">
							<a class="confirm_normal cff text-u" role="button" style="cursor: pointer; " data-toggle="modal" data-body="#divCVVHelp" data-target="#modal-simple">What is a security code?</a>
						</dd>
					</dd>
                  </dl>          
                </dl>
				<dl class="col-xs-12 col-sm-12 col-md-4 ">
				 <dl class="right-container_p c88 fs12 lh22">
					<h3 class="txt-u c3 lh24 fs14 pb10 ls1">credit and debit card information</h3>
					<dd class="c88 lh22">
						We accept the following credit/debit cards. Please select a card type, complete the information below, and click Continue.<br>Don\'t leave until payment result returns.<br>(Note: For security purposes, we will not save any of your credit card data.)
					</dd>
				 </dl>
			   </dl>
		  </dl>
		  </dl>
		</div>';
		$html .= $this->_script();
		return $html;
	}
	
	private function _script(){
		return '<script type="text/javascript">$(function(){$(\'head\').append(\'<link href="catalog/view/javascript/rxhpay/css/inline-green.css" rel="stylesheet" type="text/css" /><link href="catalog/view/javascript/rxhpay/css/local.css" rel="stylesheet" type="text/css" />\');$.getScript("catalog/view/javascript/rxhpay/js/inline-green.js");});</script>';
	}
	
	//选择支付方式步骤 判断是否显示 rxhpay_inline
  	public function getMethod($address) {
		$this->language->load('extension/payment/rxhpay_inline');
		
		if ($this->config->get('rxhpay_inline_status')) {
      		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('rxhpay_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");
			
			if (!$this->config->get('rxhpay_inline_geo_zone_id')) {
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
        		'code'       => 'rxhpay_inline',
        		'title'      => $this->language->get('text_title'),
				'terms'      => $this->design_method(),
				'sort_order' => $this->config->get('rxhpay_inline_sort_order')
      		);
    	}
    	return $method_data;
  	}
}
?>