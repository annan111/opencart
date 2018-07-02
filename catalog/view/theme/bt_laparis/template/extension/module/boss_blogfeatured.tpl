<div class="boss-blog-featured box <?php echo ($sidebar) ? 'sidebar style-2' : 'style-1'; ?> <?php echo ($show_slider) ? 'slide' : 'non-slide'; ?>">
  <div class="<?php echo ($full_width) ? 'container-fluid' : 'container'; ?>">
    <div class="<?php echo ($full_width) ? 'row' : ''; ?>">
      <div class="box-heading title">
        <h2><?php echo $heading_title; ?></h2>
      </div>
      <div class="box-content">
        <div class="box-article">
          <?php if ($show_slider) { ?>
          <div id="boss-blog-featured-<?php echo $module; ?>" class="owl-carousel-2 owl-theme-2 nav-top-right nav-visible">
            <?php foreach (array_chunk($articles, $num_row) as $articles){ ?>
            <div class="bt-row">
              <?php foreach ($articles as $article) { ?>
              <div class="article-layout <?php echo $article_layout; ?>">
                <div class="article-thumb">
                  <div class="article-image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" title="<?php echo $article['name']; ?>" class="img-responsive" /></a></div>
                  <div class="article-info">
                    <div class="post-date">
                      <div class="day"><?php echo $article['day']; ?></div>
                      <div class="month-year">
                        <p><?php echo $article['month']; ?></p>
                        <p><?php echo $article['year']; ?></p>
                      </div>
                    </div>
                    <div class="article-name"> <a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a> </div>
                    <a href="<?php echo $article['href']; ?>" class="view-more"><?php echo $button_read_more; ?></a> </div>
                </div>
              </div>
              <?php } ?>
            </div>
            <?php } ?>
          </div>
          <?php } else { ?>
          <div class="row">
            <?php foreach ($articles as $article) { ?>
            <div class="article-layout <?php echo $article_layout; ?> col-lg-<?php echo (12/$column); ?> col-md-<?php echo (12/$column); ?> col-sm-<?php echo 12/(round($column/2)); ?> col-xs-12">
              <div class="article-thumb">
                <div class="article-image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" title="<?php echo $article['name']; ?>" class="img-responsive" /></a></div>
                <div class="article-info">
                  <div class="post-date">
                    <div class="day"><?php echo $article['day']; ?></div>
                    <div class="month-year">
                      <p><?php echo $article['month']; ?></p>
                      <p><?php echo $article['year']; ?></p>
                    </div>
                  </div>
                  <div class="article-name"> <a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a> </div>
                  <a href="<?php echo $article['href']; ?>" class="view-more"><?php echo $button_read_more; ?></a> </div>
              </div>
            </div>
            <?php } ?>
          </div>
          <?php } ?>
        </div>
      </div>
    </div>
  </div>
</div>
<?php if($show_slider){ ?>
<script type="text/javascript"><!--
if ($('#boss-blog-featured-<?php echo $module; ?>').parents('#column-left, #column-right').length) {
	$('#boss-blog-featured-<?php echo $module; ?>').parents('.boss-blog-featured').addClass('style-4');
	var sidebar = true;
} else {
	$('#boss-blog-featured-<?php echo $module; ?>').parents('.boss-blog-featured').addClass('style-1');
	var sidebar = true;
}

$(function() {
	if (sidebar) {
		var responsive = {};
	} else {
		var responsive = {
			992: {
				items: <?php echo $per_row; ?>
			},
			768: {
				items: <?php echo round($per_row/2); ?>
			},
			560: {
				items: <?php echo round($per_row/2); ?>
			},
			0: {
				items: 1
			}
		}
	}
	
	if ($('html').attr('dir') == 'rtl') {
		var rtl = true;
	} else {
		var rtl = false;
	}
	
	var elm = $('#boss-blog-featured-<?php echo $module; ?>');
	var loop = (elm.children().length > <?php echo $per_row; ?>) ? true : false;
	
	elm.owlCarousel2({
		items: <?php echo $per_row; ?>,
		loop: loop,
		nav: true,
		navText: ['<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMjIuNDU3MjA3NCAxLjAwNzQ2MTQ3bC0yMSAyMC4wMjQ4MjE0MyAyMC45NDc5Mzk3IDE5Ljk3NTE3ODYiIHN0cm9rZT0iIzJEMkQyRCIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjwvc3ZnPg==" />', '<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMS40NTY3OSAxLjAwNzQ2MTQ3bDIxIDIwLjAyNDgyMTQzTDEuNTA4ODUgNDEuMDA3NDYxNSIgc3Ryb2tlPSIjMkQyRDJEIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PC9zdmc+" />'],
		dots: false,
		margin: 20,
		rtl:rtl,
		responsive: responsive
	});
});
//--></script>
<?php } ?>
