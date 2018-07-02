<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1><?php echo $heading_title; ?></h1>
    </div>
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-info"></i> <?php echo $text_info; ?></h3>
      </div>
      <div class="panel-body">
        <?php if ($extensions) { ?>
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-left"><?php echo $column_name; ?></td>
              <td class="text-left"><?php echo $column_setting; ?></td>
              <td class="text-left"><?php echo $column_layout; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($extensions as $extension) { ?>
            <tr>
              <td class="text-left"><?php echo $extension['name']; ?></td>
              <td class="text-left"><?php echo $extension['setting']; ?></td>
              <td class="text-left"><?php echo $extension['layout']; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
        <?php } else { ?>
		  <?php echo $text_no_results; ?>
        <?php } ?>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?> 