<div class="bt-recent-comments box style-2">
  <div class="box-heading block-title">
    <h2><?php echo $heading_title; ?></h2>
  </div>
  <div class="box-content">
    <?php if($articles){?>
    <div id="bt-recent-comment-<?php echo $module; ?>" class="v-padding-10 <?php echo ($scrolling) ? 'owl-carousel-2 owl-theme-2 nav-middle fix-padding' : ''; ?>">
      <?php foreach ($articles as $article) { ?>
      <div class="comment-item text-left">
        <div class="comment-body">
          <div class="title"> <a class="article-title" href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a> </div>
          <?php echo $article['comment'];?>
        </div>
        <div class="comment-header">
          <div class="comment-author">
            <div class="comment-name"><?php echo $article['author'];?></div>
            <div class="comment-time"><?php echo $article['date_added'];?></div>
          </div>
        </div>
      </div>
      <?php } ?>
    </div>
    <?php } else {?>
    <?php echo 'There are no comments.'; ?>
    <?php } ?>
  </div>
</div>
<?php if ($scrolling) { ?>
<script type="text/javascript"><!--
$(function() {
	if ($('html').attr('dir') == 'rtl') {
		var rtl = true;
	} else {
		var rtl = false;
	}
	
	var elm = $('#bt-recent-comment-<?php echo $module; ?>');
	var loop = (elm.children().length > 1) ? true : false;
	
	elm.owlCarousel2({
		items: 1,
		loop: loop,
		nav: true,
		navText: ['<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMjIuNDU3MjA3NCAxLjAwNzQ2MTQ3bC0yMSAyMC4wMjQ4MjE0MyAyMC45NDc5Mzk3IDE5Ljk3NTE3ODYiIHN0cm9rZT0iIzJEMkQyRCIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjwvc3ZnPg==" />', '<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMS40NTY3OSAxLjAwNzQ2MTQ3bDIxIDIwLjAyNDgyMTQzTDEuNTA4ODUgNDEuMDA3NDYxNSIgc3Ryb2tlPSIjMkQyRDJEIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PC9zdmc+" />'],
		dots: false,
		autoplay: true,
		autoplayTimeout: 5000,
		autoplayHoverPause: true,
		rtl:rtl
	});
});
//--></script>
<?php } ?>
