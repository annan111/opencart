<div class="boss-search">
  <div id="blogsearch" class="input-group">
    <input type="text" name="blogsearch" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" class="form-control" />
    <span class="input-group-btn">
    <button type="button" class="btn btn-default btn-lg"><i class="lnr lnr-magnifier"></i></button>
    </span> </div>
  <script type="text/javascript"><!--
	/* Search */
	$('#blogsearch input[name=\'blogsearch\']').parent().find('button').on('click', function() {
		url = $('base').attr('href') + 'index.php?route=bossblog/blogsearch';

		var value = $('#blogsearch input[name=\'blogsearch\']').val();

		if (value) {
			url += '&filter_name=' + encodeURIComponent(value);
		}

		location = url;
	});

	$('#blogsearch input[name=\'blogsearch\']').on('keydown', function(e) {
		if (e.keyCode == 13) {
			$('#blogsearch input[name=\'blogsearch\']').parent().find('button').trigger('click');
		}
	});
	//--></script> 
</div>
