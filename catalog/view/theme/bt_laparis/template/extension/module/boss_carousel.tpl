<div class="bt-carousel box <?php echo $style; ?> <?php if($style != 'normal') echo 'style-1'; ?>">
  <div class="<?php echo ($full_width) ? 'container-fluid' : 'container'; ?>">
    <div class="<?php echo ($full_width) ? 'row' : ''; ?>">
      <?php if ($heading_title) { ?>
      <div class="box-heading title">
        <h2><?php echo $heading_title; ?></h2>
      </div>
      <?php } ?>
      <div id="carousel<?php echo $module; ?>">
        <div class="box-content">
          <ul id="boss_carousel<?php echo $module; ?>" class="<?php if ($js == 'owl') { ?>owl-carousel-2 owl-theme-2 nav-middle nav-visible fix-padding<?php } ?>">
            <?php foreach (array_chunk($banners, $num_row) as $banners) { ?>
            <li>
              <?php foreach ($banners as $banner) { ?>
              <div class="image"> <a href="<?php echo $banner['link']; ?>"><img class="img-responsive <?php echo ($opacity) ? 'img-opacity' : '';?>" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a> </div>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
        </div>
      </div>
    </div>
  </div>
<?php if ($style == 'flip') { ?>
<script type="text/javascript">
$(function() {
	if ($('html').attr('dir') == 'rtl') {
		var rtl = true;
	} else {
		var rtl = false;
	}
	
	$('#boss_carousel<?php echo $module; ?>').slick({
		slidesToShow: <?php echo $img_row; ?>,
		slidesToScroll: 1,
		prevArrow: '<div class="slick-prev"><img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMjIuNDU3MjA3NCAxLjAwNzQ2MTQ3bC0yMSAyMC4wMjQ4MjE0MyAyMC45NDc5Mzk3IDE5Ljk3NTE3ODYiIHN0cm9rZT0iIzJEMkQyRCIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjwvc3ZnPg==" /></div>',
		nextArrow: '<div class="slick-next"><img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMS40NTY3OSAxLjAwNzQ2MTQ3bDIxIDIwLjAyNDgyMTQzTDEuNTA4ODUgNDEuMDA3NDYxNSIgc3Ryb2tlPSIjMkQyRDJEIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PC9zdmc+" /></div>',
		autoplay:  <?php echo ($auto) ? 'true' : 'false'; ?>,
		dots: <?php echo ($pagination) ? 'true' : 'false'; ?>,
		autoplaySpeed: <?php echo ($time*1000); ?>,
		centerMode: <?php echo ($center) ? 'true' : 'false'; ?>,
		centerPadding: '12.5%',
		speed: 500,
		rtl: rtl
	});
});
//--></script>
<?php } else if ($style == 'vertical') { ?>
<script type="text/javascript">
$(function() {
	if ($('html').attr('dir') == 'rtl') {
		var rtl = true;
	} else {
		var rtl = false;
	}
	
	$('#boss_carousel<?php echo $module; ?>').slick({
		slidesToShow: <?php echo $img_row; ?>,
		slidesToScroll: 1,
		prevArrow: '<div class="slick-prev"><img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMjIuNDU3MjA3NCAxLjAwNzQ2MTQ3bC0yMSAyMC4wMjQ4MjE0MyAyMC45NDc5Mzk3IDE5Ljk3NTE3ODYiIHN0cm9rZT0iIzJEMkQyRCIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjwvc3ZnPg==" /></div>',
		nextArrow: '<div class="slick-next"><img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMS40NTY3OSAxLjAwNzQ2MTQ3bDIxIDIwLjAyNDgyMTQzTDEuNTA4ODUgNDEuMDA3NDYxNSIgc3Ryb2tlPSIjMkQyRDJEIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PC9zdmc+" /></div>',
		autoplay:  <?php echo ($auto) ? 'true' : 'false'; ?>,
		dots: <?php echo ($pagination) ? 'true' : 'false'; ?>,
		autoplaySpeed: <?php echo ($time*1000); ?>,
		centerMode: <?php echo ($center) ? 'true' : 'false'; ?>,
		vertical: <?php echo ($vertical) ? 'true' : 'false'; ?>,
		rtl: rtl
	});
});
//--></script>
<?php  } else { ?>
<script type="text/javascript"><!--
$(function() {
	if ($('html').attr('dir') == 'rtl') {
		var rtl = true;
	} else {
		var rtl = false;
	}
	
	var elm = $('#boss_carousel<?php echo $module; ?>');
	var loop = (elm.children().length > <?php echo $img_row; ?>) ? true : false;
	
	if (<?php echo $img_row; ?> > 1) {
		var responsive = {
			992: {
				items: <?php echo $img_row; ?>
			},
			768: {
				items: <?php echo round($img_row/2); ?>
			},
			560: {
				items: <?php echo round($img_row/2); ?>,
				autoHeight: false
			},
			0: {
				items: <?php echo round($img_row/4); ?>,
				autoHeight: false
			}
		};
	} else {
		var responsive = {};
	}
	
	elm.owlCarousel2({
		items: <?php echo $img_row; ?>,
		loop: loop,
		nav: <?php echo ($navigation) ? 'true' : 'false'; ?>,
		navText: ['<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMjIuNDU3MjA3NCAxLjAwNzQ2MTQ3bC0yMSAyMC4wMjQ4MjE0MyAyMC45NDc5Mzk3IDE5Ljk3NTE3ODYiIHN0cm9rZT0iIzJEMkQyRCIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjwvc3ZnPg==" />', '<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMS40NTY3OSAxLjAwNzQ2MTQ3bDIxIDIwLjAyNDgyMTQzTDEuNTA4ODUgNDEuMDA3NDYxNSIgc3Ryb2tlPSIjMkQyRDJEIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PC9zdmc+" />'],
		dots: <?php echo ($pagination) ? 'true' : 'false'; ?>,
		center: <?php echo ($center) ? 'true' : 'false'; ?>,
		autoplay: <?php echo ($auto) ? 'true' : 'false'; ?>,
		autoplayTimeout: <?php echo ($time*1000); ?>,
		smartSpeed: 500,
		rtl: rtl,
		responsive: responsive
	});
});
//--></script>
<?php } ?>
</div>