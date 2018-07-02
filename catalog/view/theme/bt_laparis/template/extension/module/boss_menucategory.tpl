<div class="menu-category box">
  <div class="box-heading title">
    <h2><?php echo $heading_title; ?></h2>
  </div>
  <div class="box-content">
    <ul class="box-category boss-menu-cate">
      <?php if(isset($menus) && !empty($menus)){ ?>
      <?php foreach($menus as $menu){ ?>
      <li>
        <div class="nav_title">
          <?php if (isset($menu['icon']) && $menu['icon']) { ?>
          <img alt="<?php echo $menu['title']; ?>" src="<?php echo $menu['icon']; ?>" />
          <?php } ?>
          <a class="title" href="<?php echo $menu['href']; ?>"><?php echo $menu['title']; ?>
          <?php if ($menu['categories']){?>
          <span class="pull-right"><i class="fa fa-caret-right"></i></span>
          <?php } ?>
          </a> </div>
        <?php if ($menu['categories']){ ?>
        <div class="nav_submenu" style="width:<?php echo $menu['sub_width']; ?>px;">
          <?php if($menu['bgimage']){ ?>
          <a title="<?php echo $menu['title']; ?>" href="<?php echo $menu['href']; ?>"> <img alt="<?php echo $menu['title']; ?>" src="<?php echo $menu['bgimage']; ?>" class="bg-img-cate"> </a>
          <?php } ?>
          <?php $sub_column = $menu['sub_width']/$menu['column']; ?>
          <div class="nav_sub_submenu">
            <ul>
              <?php foreach($menu['categories'] as $category){ ?>
              <li class="<?php if ($category['children']) echo 'nav_cat_parent'; ?>"> <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?>
                <?php if ($category['children']) { ?>
                <span class="pull-right"><i class="fa fa-caret-right"></i></span>
                <?php } ?>
                </a>
                <?php if ($category['children']){ ?>
                <div class="sub_cat_child" style="width:<?php echo $sub_column; ?>px;">
                  <ul>
                    <?php foreach($category['children'] as $cat_child){ ?>
                    <li><a href="<?php echo $cat_child['href']; ?>"><?php echo $cat_child['name']; ?></a></li>
                    <?php } ?>
                  </ul>
                </div>
                <?php } ?>
              </li>
              <?php } ?>
            </ul>
          </div>
        </div>
        <?php } ?>
      </li>
      <?php } ?>
      <?php } ?>
    </ul>
  </div>
</div>
