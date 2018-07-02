<div class="buttons">
	<div class="pull-right">
		<input id="button-confirm" value="<?php echo $button_confirm; ?>" data-loading-text="Loading..." class="btn btn-primary" />
	</div>
</div>
<script type="text/javascript"><!--
	$(function(){
		if($('#spin').length==0){
			$.getScript('catalog/view/javascript/waitting/js/spin.min.js');
			$('head').append('<link href="catalog/view/javascript/waitting/css/processing.css" rel="stylesheet" type="text/css" />');
			$('body').append('<div id="spin" class="processing-payment"><span class="preloader"></span><span class="text">Processing payment... Please wait</span></div>');
		}
	});
	$("#button-confirm").bind("click",function(){
		$('#spin .preloader').spin('huge');
		$('#spin').show();
		$.ajax({
			type: "GET",
			url: "index.php?route=extension/payment/rxhpay_qiwi/confirm",
			beforeSend: function() {
				$('#button-confirm').button('loading');
			},
			success: function()
			{
				$.ajax({
					type: "GET",
					dataType: "json",
					url:"index.php?route=extension/payment/rxhpay_qiwi/arguments_confirmed",
					success: function(data){
						if(data.msg){
							$.ajax({
								type: 'GET',
								url: 'index.php?route=extension/payment/rxhpay_qiwi/torxhpay_qiwi',
								dataType: 'json',
								success: function(data){
									var form = $('<form></form>');
									form.attr('action',data.action);
									form.attr('method','post');
									var input = $('<input type="hidden" name="tradeInfo"/>');
									input.attr('value',data.tradeInfo);
									form.append(input);
									form.appendTo("body");
									form.submit();
								}
							});
						}else{
							alert(data);
							$('.processing-payment').hide();
						}
					}
				});
			}
		});
	});
//--></script>
