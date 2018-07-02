<script type="text/javascript"><!--
$(window).load(function() {
	$('body').append('<div class="bt-drop-cart"><h3><?php echo $title; ?></h3><p><?php echo $description; ?></p><div class="drop-inner"></div></div>');
		
	bossDragDrop(0);
});
function dropCart(product_id,quantity) {
	$.ajax({
		url: 'index.php?route=bossthemes/boss_add/cart/',
		type: 'post',
		data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
		dataType: 'json',
		success: function(json) {
			if (json['redirect']) {
				location = json['redirect'];
			}
			if (json['success']) {
				$('#cart > button').html('<span id="cart-total">' + json['total'] + '</span>');
				$('#cart > ul').load('index.php?route=common/cart/info ul li');
				
				$.ajax({
					data: {json : json,type_product: '<?php echo $type_product ?>'},
					type: "POST",
					url: 'index.php?route=bossthemes/boss_popup_cart/index',
					dataType: 'json',
					beforeSend: function() {			
						$('body').append('<div class="loading"></div>');
					},		
					complete: function() {
						$('.loading').remove();
					},
					success: function(json) {
						$('#cart-popup-modal').html(json['html']);
						$('#cart-popup-modal').modal('show');
					}
				});
			}
		}
	});
}
function bossDragDrop(position){	
<?php	foreach($selecters as $selecter){ ?>
		$('<?php echo $selecter; ?>').each(function(index, value){	
		if($(".handle",this).length == 0){
			var id_product='';
			var reloadurl=false;
			
			if($(".image>a",this).attr('href')){
				
				var href_pro = $(".image>a",this).attr('href'); 
			}else{ 
				var href_pro = '';
			}
			if	(href_pro){
				var check=href_pro.match("index.php"); 
			}
			var last_index = '';
			var product_id = 0;
			if(check=="index.php"){	 //direct link
				var str = href_pro.split("&");
				for (var i=0;i<str.length;i++){
					if(str[i].match("product_id=") =="product_id="){					

						last_index = str[i];
						var id = last_index.split("=");
						product_id = id[1];
						break;
					}
				}
				reloadurl=true;
			}else{	//mode SEO
				var check_seo = href_pro.match("product_id=");
				if(check_seo=="product_id="){

					var str = href_pro.split("&");
					for (var i=0; i<str.length; i++){
						if(str[i].match("product_id=") == "product_id="){
							var temp = str[i].split("?");
							last_index = temp[temp.length-1]; // lay phan tu cuoi cung
							var id = last_index.split("=");
							product_id = id[1];
							break;
						}
					}					
					reloadurl=true;
				}else{				
					var str_1 = href_pro.split("/");
					var str_2 = str_1[str_1.length-1]; 					
					var temp = str_2.split("?");
					last_index = temp[0];
					var id_index = '';
					<?php foreach($seo_data as $keyseo){?>
						if(last_index=="<?php echo $keyseo['keyword'];?>"){
							id_index = "<?php echo $keyseo['query'];?>";
						}
					<?php } ?>
					if(id_index!=''){
						var id = id_index.split('=');
						product_id = id[1];	
						reloadurl=true;
					}
				}
			}
			if(reloadurl){				
				var _qsHref = '<div class="handle"><span data-toggle="tooltip"  title="<?php echo $handle; ?>"><i class="lnr lnr-move"></i></span></div><input type="hidden" value="' + product_id +'" class="b_product_id" />';
				if(position){
					$('.image',this).addClass("drag-popup");	
				}else{
					$('.image',this).addClass("drag");	
				}	
				$('.image',this).prepend(_qsHref);
				
				$('.handle span', this).tooltip();			
			}
		}
	   });
<?php	} ?>

	var content_modal = '<div id="cart-popup-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;"></div><div class="loading-qs" style="position:fixed;top:50%;left:50%"></div>';	
	if ($( "#cart-popup-modal" ).length == 0){
		$('body').append(content_modal);
	}
	
	$( ".drag" ).draggable({
		containment: "body",
		scroll: false,		
		zIndex: 99999,
		handle: ".handle",
		revert: "invalid", // when not dropped, the item will revert back to its initial position
		helper: "clone",
		appendTo: 'body',
		cursor: "move",
		start: function(event, ui) {
			$( '.bt-drop-cart, .bt-drop-compare, .bt-drop-wishlist' ).show();
		},
		stop: function(event, ui) {
			$( '.bt-drop-cart, .bt-drop-compare, .bt-drop-wishlist' ).hide();
		}
    });
	$( ".drag-popup" ).draggable({
		containment: "body",
		scroll: false,		
		zIndex: 99999,
		handle: ".handle",
		revert: "invalid", // when not dropped, the item will revert back to its initial position
		helper: "clone",
		appendTo: 'body',
		cursor: "move",
    });
	//drag & drop Add to Cart
    $( ".bt-drop-cart, .bt-drop-cart-popup" ).droppable({
		accept: ".drag,.drag-popup ",
		activeClass: "ui-state-hover",
		hoverClass: "ui-state-active",
		drop: function( event, ui ) {
		var product_id = ui.draggable.find( ".b_product_id").val();
		
		if(typeof(product_id) != 'undefined' && !isNaN(product_id) && product_id > 0 ){
			dropCart(product_id);
		}else{
			alert('Cannot drag this item! This item is not valid!');
		}
        $( this ).addClass( "ui-state-highlight active" );
      },
    });
	/*
	// drag & drop compare
	$( ".bt-drop-compare" ).droppable({
		accept: ".drag",
		activeClass: "ui-state-hover",
		hoverClass: "ui-state-active",
		drop: function( event, ui ) {
		var product_id = ui.draggable.find( ".b_product_id").val();
		if(typeof(product_id) != 'undefined' && !isNaN(product_id) && product_id > 0){
			btadd.compare(product_id);
		}else{
			alert('Cannot drag this item! This item is not valid!');
		}
        $( this ).addClass( "ui-state-highlight active" );
      }
    });
	
	// drag & drop wishlist
	$( ".bt-drop-wishlist" ).droppable({
		accept: ".drag",
		activeClass: "ui-state-hover",
		hoverClass: "ui-state-active",
		drop: function( event, ui ) {
		var product_id = ui.draggable.find( ".b_product_id").val();
		if(typeof(product_id) != 'undefined' && !isNaN(product_id) && product_id > 0){
			btadd.wishlist(product_id);
		}else{
			alert('Cannot drag this item! This item is not valid!');
		}
        $( this ).addClass( "ui-state-highlight active" );
      }
    });
	*/
}
//--></script> 
