<div class="bt-filter box style-2" data-animate="fadeInLeft" data-delay="200">
  <div class="box-content">
    <?php if ($route != 'product/category') { ?>
    <div class="search-form" id="search-form<?php echo $module; ?>">
      <div class="input-group">
        <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
        <span class="input-group-btn">
        <button id="button-search" class="btn btn-default"><i class="lnr lnr-magnifier"></i></button>
        </span>
      </div>
    </div>
    <?php } ?>
    <div class="list" id="filter-list<?php echo $module; ?>">
      <?php foreach ($filter_groups as $filter_group) { ?>
      <?php if($filter_group['show_image']=='image'){ ?>
      <div class="bt-filter-image">
        <h3 class="title"><?php echo $filter_group['name']; ?></h3>
        <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
          <ul>
            <?php foreach ($filter_group['filter'] as $filter) { ?>
            <li <?php echo(in_array($filter['filter_id'], $filter_filter))?'class="active"':''; ?>><a title="<?php echo $filter['name']; ?>" href="<?php echo $filter['filter_id']; ?>" ><img alt="<?php echo $filter['name']; ?>" src="<?php echo $filter['image']; ?>" /></a></li>
            <?php } ?>
          </ul>
        </div>
      </div>
      <?php }else{ ?>
      <div class="filter-item">
        <h3 class="title"><?php echo $filter_group['name']; ?></h3>
        <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
          <ul>
            <?php foreach ($filter_group['filter'] as $filter) { ?>
            <li <?php echo(in_array($filter['filter_id'], $filter_filter))?'class="active"':''; ?>><a title="<?php echo $filter['name']; ?>" href="<?php echo $filter['filter_id']; ?>"><i class="fa fa-angle-right"></i><span class="fe-checkbox"></span> <?php echo $filter['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
      </div>
      <?php } ?>
      <?php } ?>
    </div>
  </div>
</div>
<?php global $request;?>
<script type="text/javascript"><!--
var filter = JSON.parse('<?php echo json_encode($filter_filter); ?>');
<?php if (isset($request->get['filter'])){ ?>
<?php $filters =  explode(',', (string)$request->get['filter']); ?>
<?php foreach($filters as $filter){ ?>
		filter.push(<?php echo $filter; ?>);
	<?php } ?>
<?php } ?>
var idarr = '';
<?php foreach ($filter_groups as $filter_group) { ?>
<?php if($filter_group == end($filter_groups)){ ?>
		mark = '';
		<?php }else{ ?>
		mark = ',';
		<?php } ?>
	idarr = idarr + '#filter-group<?php echo $filter_group['filter_group_id']; ?> ul li a'+ mark;
<?php } ?>
$(function () {
	$(idarr).click(function (event) {
		event.preventDefault();
		$(this).parent('li').toggleClass('active');
		var a = filter.indexOf(parseInt($(this).attr('href')));
		if(a == -1){
			filter.push(parseInt($(this).attr('href')));
		}else{
			filter.splice(a,1)
		}
		
		var url = '<?php echo $action; ?>&filter=' + filter.join(',');
		
		$.ajax({
			type: 'GET',
			url: url,
			data: {},
			beforeSend: function( xhr ) {
				$("#tags-load").show();
			},
			complete: function (data) {
				$('#content').html($("#content", data.responseText).html());
				history.pushState({
					page: url
				}, url, url);
				$("#tags-load").hide();
				reinitView();
			}
		});
	});
});

function reinitView() {
	// Product List
	$('#bt-list-view').click(function() {
		$('#bt-list-view, #bt-grid-view, #bt-grid-view-2, #bt-grid-view-3, #bt-grid-view-4, #bt-grid-view-6, #bt-table-view').removeClass('active');
		$('#bt-list-view').addClass('active');
		
		$('#content .product-layout').attr('class', 'product-layout product-list col-xs-12');
		
		localStorage.setItem('bt_display', 'list');
	});
	
	// Product Grid
	$('#bt-grid-view').click(function() {
		$('#bt-list-view, #bt-grid-view, #bt-grid-view-2, #bt-grid-view-3, #bt-grid-view-4, #bt-grid-view-6, #bt-table-view').removeClass('active');
		$('#bt-grid-view').addClass('active');
		
		var cols = $('#column-right, #column-left').length;

		if (cols == 2) {
			$('#content .product-layout').attr('class', 'product-layout product-grid col-lg-6 col-md-6 col-sm-12 col-xs-12');
		} else if (cols == 1) {
			$('#content .product-layout').attr('class', 'product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12');
		} else {
			$('#content .product-layout').attr('class', 'product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12');
		}
		
		localStorage.setItem('bt_display', 'grid');
	});
	
	// Product Grid 2
	$('#bt-grid-view-2').click(function() {
		$('#bt-list-view, #bt-grid-view, #bt-grid-view-2, #bt-grid-view-3, #bt-grid-view-4, #bt-grid-view-6, #bt-table-view').removeClass('active');
		$('#bt-grid-view-2').addClass('active');
		
		$('#content .product-layout').attr('class', 'product-layout product-grid product-grid-2 col-lg-6 col-md-6 col-sm-6 col-xs-12');
		
		localStorage.setItem('bt_display', 'grid-2');
	});
	
	// Product Grid 3
	$('#bt-grid-view-3').click(function() {
		$('#bt-list-view, #bt-grid-view, #bt-grid-view-2, #bt-grid-view-3, #bt-grid-view-4, #bt-grid-view-6, #bt-table-view').removeClass('active');
		$('#bt-grid-view-3').addClass('active');
		
		$('#content .product-layout').attr('class', 'product-layout product-grid product-grid-3 col-lg-4 col-md-4 col-sm-6 col-xs-12');
		
		localStorage.setItem('bt_display', 'grid-3');
	});
	
	// Product Grid 4
	$('#bt-grid-view-4').click(function() {
		$('#bt-list-view, #bt-grid-view, #bt-grid-view-2, #bt-grid-view-3, #bt-grid-view-4, #bt-grid-view-6, #bt-table-view').removeClass('active');
		$('#bt-grid-view-4').addClass('active');
		
		$('#content .product-layout').attr('class', 'product-layout product-grid product-grid-4 col-lg-3 col-md-3 col-sm-6 col-xs-12');
		
		localStorage.setItem('bt_display', 'grid-4');
	});
	
	// Product Grid 6
	$('#bt-grid-view-6').click(function() {
		$('#bt-list-view, #bt-grid-view, #bt-grid-view-2, #bt-grid-view-3, #bt-grid-view-4, #bt-grid-view-6, #bt-table-view').removeClass('active');
		$('#bt-grid-view-6').addClass('active');
		
		$('#content .product-layout').attr('class', 'product-layout product-grid product-grid-6 col-lg-2 col-md-4 col-sm-6 col-xs-12');
		
		localStorage.setItem('bt_display', 'grid-6');
	});

	// Product Table
	$('#bt-table-view').click(function() {
		$('#bt-list-view, #bt-grid-view, #bt-grid-view-2, #bt-grid-view-3, #bt-grid-view-4, #bt-grid-view-6, #bt-table-view').removeClass('active');
		$('#bt-table-view').addClass('active');
		
		$('#content .product-layout').attr('class', 'product-layout product-table col-xs-12');
		
		localStorage.setItem('bt_display', 'table');
	})
	
	if (localStorage.getItem('bt_display') == 'table') {
		$('#bt-table-view').trigger('click');
	} else if (localStorage.getItem('bt_display') == 'grid'){
		$('#bt-grid-view').trigger('click');
	} else if (localStorage.getItem('bt_display') == 'grid-2'){
		$('#bt-grid-view-2').trigger('click');
	} else if (localStorage.getItem('bt_display') == 'grid-3'){
		$('#bt-grid-view-3').trigger('click');
	} else if (localStorage.getItem('bt_display') == 'grid-4'){
		$('#bt-grid-view-4').trigger('click');
	} else if (localStorage.getItem('bt_display') == 'grid-6'){
		$('#bt-grid-view-6').trigger('click');
	} else {
		$('#bt-list-view').trigger('click');
	}
	
	$('.product-thumb .button-group button:first-child').onresize(function(elm) {
		if (elm.width() < 140) {
			$('span', elm).addClass('hidden');
		} else {
			$('span', elm).removeClass('hidden');
		}
	}).trigger('onresize');
}

//--></script>
<?php if ($route != 'product/category') { ?>
<script type="text/javascript"><!--

$('#button-search').bind('click', function() {
	url = 'index.php?route=bossthemes/filter';

	var search = $('#search-form<?php echo $module; ?> input[name=\'search\']').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}
	
	var filter = [];
	
	$('#filter-list<?php echo $module; ?> li.active').each(function(index, element) {
        filter.push(parseInt($('a', this).attr('href')));
    });
	
	if (filter.join(',')) {
		url += '&filter=' + filter.join(',');
	}

	location = url;
});

$('#search-form<?php echo $module; ?> input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});
--></script>
<?php } ?>
