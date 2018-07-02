function rxhpay_inline(){
	var cc_number = $("input[name=rxhpay_cc_number]").val();
	var cc_checkcode = $("input[name=rxhpay_cc_checkcode]").val();
	var expires_year = $("#card_exp_year option:selected").val();
	var expires_month = $("#card_exp_month option:selected").val();
	var startLetter = cc_number.substring(0, 1);
	if(cc_number==""){
		alert("Card number Can not be empty");	return false;
	}else if (cc_number.length < 13 || cc_number.length >16){	alert("Cardnumber is not between 13 and 16 digits long");	return false;
	}else if(/[^0-9]+/.test(cc_number)){
		alert("Card number contains characters that are not numbers");	return false;
	}else if(/[^1-6]/.test(startLetter)){
		alert("Card number did not match any known creditcard profiles");	return false;
	}
	
	var nCheck = 0, nDigit = 0, bEven = false;cc_number = cc_number.replace(/\D/g, "");
	for (var n = cc_number.length - 1; n >= 0; n--) {
		var cDigit = cc_number.charAt(n);
		var nDigit = parseInt(cDigit, 10);
		if (bEven) {
			if ((nDigit *= 2) > 9)nDigit -= 9;
		}
		nCheck += nDigit;
		bEven = !bEven;
	}
	if((nCheck % 10) != 0){
		alert("Bank card number must be consistent with the Luhm check");
		return false;
	}
	if (cc_checkcode.length != 3){alert("CVV is not 3 digits long");return false;}if (/[^0-9]+/.test(cc_checkcode)) {alert("CVV contains characters that are not numbers");return false;}
	
	if(parseInt(expires_month)==0){
		alert("Invalid month");
		return false;
	}
	if(parseInt(expires_year)==0){
		alert("Invalid year");
		return false;
	}
	
	$.ajax({
		type: "POST",
		data:{rxhpay_cc_number:cc_number,rxhpay_cc_checkcode:cc_checkcode,rxhpay_cc_expires_year:expires_year,rxhpay_cc_expires_month:expires_month},
		url: "index.php?route=extension/payment/rxhpay_inline/getCredit"
	});
}
function show_rxhpay_inline(target){
	
	if($(target).val() == "rxhpay_inline"){
		$("#button-payment-method").on("click",rxhpay_inline);
		$("#gc_box").show(500);
	}else{
		$("#button-payment-method").unbind("click",rxhpay_inline);
		$("#gc_box").hide(500);
	}
	
}
$(document).ready(function() {
	$(document).bind("contextmenu",function(e) {
		alert("sorry! No right-clicking!");
		return false;
	});
});
$(document).ready(function() {
	$(document).bind("keydown",function(e){ 
		e=window.event||e; 
		if(e.keyCode==116){ 
			e.keyCode = 0;
			return false;
		}
	});
});
$(function(){
	$('input[name="payment_method"]').on("click",function(){
		show_rxhpay_inline(this);
	});
	if($('input[name="payment_method"][value="rxhpay_inline"]').attr("checked")== "checked"){
		var _this = $('input[name="payment_method"][value="rxhpay_inline"]');
		show_rxhpay_inline(_this);	
	}else{
		$("#gc_box").hide();
	}
});