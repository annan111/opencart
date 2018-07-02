<?php if (isset($objXML)) { ?>
<?php $i = 0; ?>
<?php foreach($objXML->groups as $xml){ ?>

<div class="panel panel-default color-default">
  <div class="panel-heading">
    <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#color-accordion" href="#color-collapse<?php echo $i; ?>"><?php echo($xml->title); ?></a> </h4>
  </div>
  <div id="color-collapse<?php echo $i; ?>" class="panel-collapse collapse">
    <div class="panel-body">
      <?php foreach($xml->item as $item){ ?>
      <div class="form-group">
        <label class="control-label col-sm-2"><?php echo $item->text;?></label>
        <div class="col-sm-2">
          <input size=6 type="text" class="hex form-control" name="xml[<?php echo $i;?>][value][]" id="<?php echo $item->name; ?>" value="<?php echo $item->value;  ?>">
        </div>
      </div>
      <input type="hidden" name="xml[<?php echo $i;?>][title][]" value="<?php echo($xml->title); ?>" />
      <input type="hidden" name="xml[<?php echo $i;?>][text][]" value="<?php echo($item->text); ?>" />
      <input type="hidden" name="xml[<?php echo $i;?>][name][]" value="<?php echo($item->name); ?>" />
      <input type="hidden" name="xml[<?php echo $i;?>][class][]" value="<?php echo($item->class); ?>" />
      <input type="hidden" name="xml[<?php echo $i;?>][style][]" value="<?php echo($item->style); ?>" />
      <?php } ?>
    </div>
  </div>
</div>
<?php $i++; ?>
<?php } ?>
<script type="text/javascript"><!--

    $('#color_default fieldset legend').click(function(){
        $(this).parent().toggleClass('open');
    });


    <?php
        $code_color = array();
    foreach($objXML->groups as $xml){
        foreach($xml->item as $item){
            $code_color[] = $item->name;
        }
    }
        ?>

    var id_Color_List_Tem = Array(<?php foreach ($code_color as $color) {
        if($color==end($code_color))
            echo "'".$color."'";
    else
        echo "'".$color."'".", ";

    } ?>);

    $(document).ready(function() {
        function addStyle(i){
            $("#" + id_Color_List_Tem[i]).css('background', '#' + $("#" + id_Color_List_Tem[i]).val());
        }
        for(var i = 0 ; i < id_Color_List_Tem.length; i++ ){
            addStyle(i);
        };
    });
    (function($){
        function changeColorPickerTem(i){
            $('#' + id_Color_List_Tem[i]).ColorPicker({
                onSubmit: function(hsb, hex, rgb, el) {
                    $(el).val(hex);
                    $(el).css({backgroundColor:"#" + hex});
                    $(el).ColorPickerHide();
                },
                onChange: function (hsb, hex, rgb) {

                    $("#" + id_Color_List_Tem[i]).css('background', '#' + hex);
                    $("#" + id_Color_List_Tem[i]).val(hex);
                },
                onBeforeShow: function () {
                    $(this).ColorPickerSetColor(this.value);
                }

            });
        };

        //var initLayout = function() {
        for(var i = 0 ; i < id_Color_List_Tem.length; i++ ){
            changeColorPickerTem(i);
        };
        //};
        //alert(initLayout);
        //EYE.register(initLayout, 'init');
    })(jQuery)
    //--></script> 
<script type="text/javascript" src="view/javascript/bossthemes/colorpicker.js"></script> 
<script type="text/javascript" src="view/javascript/bossthemes/eye.js"></script>
<link rel="stylesheet" type="text/css" href="view/stylesheet/bossthemes/colorpicker.css" />
<?php } ?>
