<?php
// Heading
$_['heading_title']     = '感谢您使用 %s 购物！ ';
// Text
$_['text_title']		= 'Yandex.money';
// Terms
$_['text_terms']        = "<label for=\"rxhpay_yandex\" class=\"yandex-logo\"><img src=\"image/payment/rxhpay/pm/yandex.png\"  alt=\"Yandex.money\" title=\"Yandex.money\"></label>
<div id=\"yandex_types\">
	<input type=\"radio\" name=\"yandex-list\" value=\"PC\" id=\"yandex-save\" style=\"margin-left:30px\">
	<label for=\"yandex-save\" class=\"radioButtonLabel\">
	Yandex电子钱包</label>
	<br>
	<br class=\"clearBoth\">
	<input type=\"radio\" name=\"yandex-list\" value=\"AC\" id=\"yandex-bankCard\" style=\"margin-left:30px\">
	<label for=\"yandex-bankCard\" class=\"radioButtonLabel\">
	银行卡支付</label>
	<br class=\"clearBoth\">
	<br class=\"clearBoth\">
	<input type=\"radio\" name=\"yandex-list\" value=\"GP\" id=\"yandex-terminal\" style=\"margin-left:30px\">
	<label for=\"yandex-terminal\" class=\"radioButtonLabel\"> 
	Yandex线下支付</label>
	<br class=\"clearBoth\">
	<br class=\"clearBoth\">
	<input type=\"radio\" name=\"yandex-list\" value=\"SB\" id=\"yandex-Sberbank\" style=\"margin-left:30px\">
	<label for=\"yandex-Sberbank\" class=\"radioButtonLabel\">
	Sberbank支付(俄罗斯联邦储蓄银行-短信或网银支付)</label>
	<br class=\"clearBoth\">
	<br class=\"clearBoth\">
	<input type=\"radio\" name=\"yandex-list\" value=\"AB\" id=\"yandex-Alfa\" style=\"margin-left:30px\">
	<label for=\"yandex-Alfa\" class=\"radioButtonLabel\">
	Alfa-Click支付(阿尔法银行)</label>
	<br class=\"clearBoth\">
	<br class=\"clearBoth\">
	<input type=\"radio\" name=\"yandex-list\" value=\"PB\" id=\"yandex-PSB\" style=\"margin-left:30px\">
	<label for=\"yandex-PSB\" class=\"radioButtonLabel\">
	Promsvyazbank支付(俄罗斯工业通讯银行)</label>
</div>
<script type=\"text/javascript\">
function rxhpay_yandex(){
	var yandex_list = $('input:radio[name=\"yandex-list\"]:checked').val();
	if(!yandex_list){
		alert(\"请选择Yandex.money选项下的一种支付方式！\");
		return false;
	}else{
		$.ajax({
			type: \"GET\",
			data:{payType:yandex_list},
			url: \"index.php?route=payment/rxhpay_yandex/getPayType\"
		});
	}
}
function show_yandex(target){
	if($(target).val() == \"rxhpay_yandex\"){
		$('#button-payment-method').unbind('click',rxhpay_yandex);
		$('#button-payment-method').bind('click',rxhpay_yandex);
		$(\"#yandex_types\").show();
	}else{
		$('#button-payment-method').unbind('click',rxhpay_yandex);
		$(\"#yandex_types\").hide();
	}
}
$(function(){
	$(\".panel-body input[name='payment_method']\").bind(\"click\",function(){
		show_yandex(this);
	});
	
	if(!$('input[name=\"payment_method\"][value=\"rxhpay_yandex\"]').attr('id')){
		$('input[name=\"payment_method\"][value=\"rxhpay_yandex\"]').attr('id','rxhpay_yandex');
	}
	$('input:radio[name=\"yandex-list\"]').change(function(){
		if($('input[name=\"payment_method\"]').val()!='rxhpay_yandex'){
			$('input[name=\"payment_method\"][value=\"rxhpay_yandex\"]').attr('checked',true);
			$('#button-payment-method').unbind('click',rxhpay_yandex);
			$('#button-payment-method').bind('click',rxhpay_yandex);
		}
	});

	// 页面加载脚本时，判断默认选中值为rxhpay_yandex 的单选框则调用 show_yandex(target) 函数
	if($('input[name=\"payment_method\"][value=\"rxhpay_yandex\"]').attr('checked')== 'checked'){
		var _this = $('.panel-body input[name=\"payment_method\"]');
		show_yandex(_this);
	}
	
	$('.yandex-logo').parents('.radio').css('cssText','margin:4px 0!important;');
	$('.yandex-logo').css('cssText','padding:0 0!important; float: right; position: relative; right: 200px;');
	$('.yandex-logo img').css('cssText','float:left;height:25px;');
	$('.yandex-logo span').css('cssText','line-height:24px');
	$('#yandex_types input').css('cssText','margin: 0 5px 0 -15px !important;height:20px;');
	$('#yandex_types label').css('cssText','padding:0 0;position:relative;');
})
</script>";
$_['text_response']     = '交易结果:';
$_['text_success']      = '您的支付结果已经成功提交.';
$_['text_success_wait'] = '<b><span style="color: #FF0000">请等待...</span></b> 在我们成功提交您的订单之前.<br>如果在3秒内没有自动跳转，请点击 <a href="%s">这里</a>.';
$_['text_failure']      = '您的订单已经取消!';
$_['text_failure_wait'] = '<b><span style="color: #FF0000">请等待...</span></b><br>如果在3秒内没有自动跳转，请点击<a href="%s">这里</a>.';	
$_['head_redirect']     ='您将在几秒钟内跳转到支付页面';									  
?>