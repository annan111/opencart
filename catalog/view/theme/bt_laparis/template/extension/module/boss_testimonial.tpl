<div class="bt-testimonial box style-1 parallax" id="boss_testimonial_min_height_<?php echo $module; ?>">
  <?php if($testimonial_title){?>
  <div class="box-heading title">
    <h2><?php echo $testimonial_title; ?></h2>
  </div>
  <?php } ?>
  <div class="box-content">
    <div class="content" id="content<?php echo $module; ?>">
      <div id="boss_testimonial_<?php echo $module; ?>" class="<?php echo ($auto_scroll) ? 'owl-carousel-2 owl-theme-2 nav-middle nav-visible' : ''; ?>">
        <?php foreach (array_chunk($testimonials, $row) as $testimonials) { ?>
        <div class="item">
            <?php foreach ($testimonials as $testimonial) { ?>
            <div class="item-info">
              <?php if(isset($show_subject) && $show_subject){ ?>
              <h2 class="subject"> <?php echo $testimonial['title']; ?> </h2>
              <?php } ?>
              <?php if(isset($show_message) && $show_message){ ?>
              <div class="message"> <?php echo $testimonial['description']; ?> 
              <?php if(isset($show_date) && $show_date){ ?>
              <div class="date"> <span class="time-stamp">
                <?php $date = new DateTime($testimonial['date_added']);?>
                <small><?php echo $date->format('M d, Y');?></small> </span> </div>
              <?php } ?>
              </div>
              <?php } ?>
              <div class="user-info">
                <?php if(isset($show_name) && $show_name){ ?>
                <div class="name"> <?php echo $testimonial['name']; ?> </div>
                <?php } ?>
                <?php if(isset($show_city) && $show_city){ ?>
                <div class="city"> <?php echo $testimonial['city']; ?> </div>
                <?php } ?>
                <?php if(isset($show_image) && $show_image){ ?>
                <div class="image"> <img alt="<?php echo $testimonial['name']; ?>" src="<?php echo $testimonial['avatar']; ?>"/> </div>
                <?php } ?>
              </div>
              <?php if(isset($show_rating) && $show_rating){ ?>
              <div class="rating"> 
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($testimonial['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
              </div>
              <?php } ?>
            </div>
            <?php } ?>
        </div>
        <?php } ?>
      </div>
      <?php if(isset($show_all_link) && $show_all_link){ ?>
      <div class="show-all-url"> <a href="<?php echo $showall_url;?>" title="<?php echo $show_all; ?>"><?php echo $show_all; ?></a> </div>
      <?php } ?>
      <?php if(isset($show_write) && $show_write){ ?>
      <div class="show-write"> <a href="<?php echo $isitesti; ?>" title="<?php echo $isi_testimonial; ?>"><?php echo $isi_testimonial; ?></a> </div>
      <?php } ?>
    </div>
    <div id="bt_testimonial_pag_<?php echo $module; ?>" class="bt-pag"></div>
  </div>
</div>
<?php if($auto_scroll){ ?>
<script type="text/javascript"><!--
$(function() {
	if ($('html').attr('dir') == 'rtl') {
		var rtl = true;
	} else {
		var rtl = false;
	}
	
	var elm = $('#boss_testimonial_<?php echo $module; ?>');
	var loop = (elm.children().length > <?php echo $per_row; ?>) ? true : false;
	
	elm.owlCarousel2({
		items: <?php echo $per_row; ?>,
		loop: loop,
		nav: false,
		navText: ['<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMjIuNDU3MjA3NCAxLjAwNzQ2MTQ3bC0yMSAyMC4wMjQ4MjE0MyAyMC45NDc5Mzk3IDE5Ljk3NTE3ODYiIHN0cm9rZT0iIzJEMkQyRCIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjwvc3ZnPg==" />', '<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMS40NTY3OSAxLjAwNzQ2MTQ3bDIxIDIwLjAyNDgyMTQzTDEuNTA4ODUgNDEuMDA3NDYxNSIgc3Ryb2tlPSIjMkQyRDJEIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PC9zdmc+" />'],
		dots: true,
		autoplay: false,
		rtl: rtl
	});
});
//--></script>
<?php } ?>
