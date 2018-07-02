<div class="box bt-instagram">
  <?php if ($title || strip_tags($description)) { ?>
  <div class="instagram-box">
    <?php if ($title || $description) { ?>
    <div class="box-heading">
      <?php if ($title) { ?>
      <h2><?php echo $title; ?></h2>
      <?php } ?>
      <?php if ($description) { ?>
      <div class="box-description"> <?php echo $description; ?> </div>
      <?php } ?>
    </div>
    <?php } ?>
  </div>
  <?php } ?>
  <div id="instafeed" class="owl-carousel-2 owl-theme-2 nav-middle nav-visible fix-padding"></div>
</div>
<script type="text/javascript">
(function() {
	var feed = new Instafeed({
		get: 'user',
		userId: '<?php echo $user_id; ?>',
		clientId: '<?php echo $client_id; ?>',
		accessToken: '<?php echo $token; ?>',
		resolution: 'standard_resolution',
		template: '<div class="instafeed-item"><a href="{{link}}" target="_blank" id="{{id}}"><img src="{{image}}" alt="{{caption}}" /></a></div>',
		sortBy: 'most-recent',
		limit: <?php echo $limit; ?>,
		links: false,
		after: function() {
			if ($('html').attr('dir') == 'rtl') {
				var rtl = true;
			} else {
				var rtl = false;
			}
			
			var elm = $('#instafeed')
			
			elm.owlCarousel2({
				loop: true,
				nav: true,
				navText: ['<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMjIuNDU3MjA3NCAxLjAwNzQ2MTQ3bC0yMSAyMC4wMjQ4MjE0MyAyMC45NDc5Mzk3IDE5Ljk3NTE3ODYiIHN0cm9rZT0iIzJEMkQyRCIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjwvc3ZnPg==" />', '<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCAyNCA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMS40NTY3OSAxLjAwNzQ2MTQ3bDIxIDIwLjAyNDgyMTQzTDEuNTA4ODUgNDEuMDA3NDYxNSIgc3Ryb2tlPSIjMkQyRDJEIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PC9zdmc+" />'],
				dots: false,
				autoWidth: true,
				margin: 30,
				rtl:rtl,
			});
		}
	});
	
	feed.run();
})();
</script>