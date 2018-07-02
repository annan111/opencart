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
        <h3 class="panel-title"><i class="fa fa-puzzle-piece"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <fieldset>
          <legend><?php echo $heading_title; ?></legend>
          <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_layout; ?></div>
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-left"><?php echo $column_name; ?></td>
                  <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($extensions) { ?>
                <?php foreach ($extensions as $extension) { ?>
                <tr>
                  <td><b><?php echo $extension['name']; ?></b> - <?php echo $extension['code']; ?></td>
                  <td class="text-right"><?php if ($extension['installed']) { ?>
				    <a href="<?php echo $extension['info']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a>
                    <?php } else { ?>
                    <button type="button" class="btn btn-primary" disabled="disabled"><i class="fa fa-eye"></i></button>
                    <?php } ?>
					</td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="2"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </fieldset>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?> 