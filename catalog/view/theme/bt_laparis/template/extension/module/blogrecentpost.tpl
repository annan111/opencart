<div class="box style-2 block boss-recent-post">
  <div class="box-heading">
    <h2><?php echo $heading_title; ?></h2>
  </div>
  <div class="box-content block-content">
    <?php if($articles){?>
    <ol>
      <?php foreach ($articles as $article) { ?>
      <li class="item item-recent-post">
        <div class="image"> <a class="article-title" href="<?php echo $article['href']; ?>"><img src="<?php echo $article['image']; ?>" alt="<?php echo $article['name']; ?>" title="<?php echo $article['name']; ?>"/></a> </div>
        <div class="title"> <a class="article-title" href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a>
          <div class="post-date"> <?php echo $article['date_added']; ?> </div>
        </div>
      </li>
      <?php } ?>
    </ol>
    <?php } else {?>
    <?php echo 'There are no Articles.'; ?>
    <?php } ?>
  </div>
</div>
