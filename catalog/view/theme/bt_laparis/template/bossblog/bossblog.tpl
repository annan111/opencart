<?php echo $header; ?>

<div class="bt-breadcrumb">
  <div class="container">
    <ul class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"><span itemprop="title"><?php echo $breadcrumb['text']; ?></span></a></li>
      <?php } ?>
    </ul>
  </div>
</div>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <?php if ($articles) { ?>
      <div class="article-filter">
        <div class="row">
          <div class="box_sort col-md-3 col-sm-4 col-xs-12">
            <div class="input-group input-group-sm">
              <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
              <select id="input-sort" class="form-control" onchange="location = this.value;">
                <?php foreach ($sorts as $sorts) { ?>
                <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="limit col-md-3 col-sm-4 col-xs-7">
            <div class="input-group input-group-sm">
              <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?> </label>
              <select id="input-limit" class="form-control" onchange="location = this.value;">
                <?php foreach ($limits as $limits) { ?>
                <?php if ($limits['value'] == $limit) { ?>
                <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="col-md-6 col-sm-4 col-xs-5 text-right">
            <button type="button" id="grid-view" class="btn btn-view" data-toggle="tooltip" title="<?php echo $text_grid; ?>"><i class="fa fa-th"></i></button>
            <button type="button" id="list-view" class="btn btn-view" data-toggle="tooltip" title="<?php echo $text_list; ?>"><i class="fa fa-th-list"></i></button>
          </div>
        </div>
      </div>
      <div class="row">
        <?php foreach ($articles as $article) { ?>
        <div class="article-layout article-list col-xs-12">
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
              <div class="article-description">
                <?php  echo $article['title']; ?>
              </div>
              <a href="<?php echo $article['href']; ?>" class="view-more"><?php echo $button_read_more; ?></a> </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="blog-result-pagination text-center"> 
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $results; ?></div>
          <div class="col-sm-6 text-right"><?php echo $pagination; ?></div>
        </div>
      </div>
      <?php }else{ ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?> </div>
</div>
<script type="text/javascript">
$(".sharing").find('[data-addthis-title]').each(function(index){
	$(this).attr("addthis:url",$(this).attr("data-addthis-url"));
	$(this).removeAttr('data-addthis-url');
	
	$(this).attr("addthis:title",$(this).attr("data-addthis-title"));
	$(this).removeAttr('data-addthis-title');
	
	$(this).attr("addthis:description",$(this).attr("data-addthis-description"));
	$(this).removeAttr('data-addthis-description');
	
	$(this).attr("addthis:media",$(this).attr("data-addthis-media"));
	$(this).removeAttr('data-addthis-media');
});
</script> 
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js"></script> 
<script type="text/javascript">
$(function() {
	// Article List
	$('#list-view').click(function() {
		$('#content .article-grid').attr('class', 'article-layout article-list col-xs-12');

		localStorage.setItem('display', 'list');
	});

	// Article Grid
	$('#grid-view').click(function() {
		// What a shame bootstrap does not take into account dynamically loaded columns
		cols = $('#column-right, #column-left').length;

		if (cols == 2) {
			$('#content .article-list').attr('class', 'article-layout article-grid col-sm-6 col-xs-12');
		} else if (cols == 1) {
			$('#content .article-list').attr('class', 'article-layout article-grid col-sm-6 col-xs-12');
		} else {
			$('#content .article-list').attr('class', 'article-layout article-grid col-sm-4 col-xs-12');
		}
		
		localStorage.setItem('display', 'grid');
	});
	
	if (localStorage.getItem('display') == 'grid') {
		$('#grid-view').trigger('click');
	} else {
		$('#list-view').trigger('click');
	}
});
</script> 
<?php echo $footer; ?> 