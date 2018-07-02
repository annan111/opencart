<?php
if(isset($boss_manager)){
	$b_color = isset($boss_manager['color'])?$boss_manager['color']:1;
} else {
	$b_color=1;
}

$css_file = DIR_APPLICATION . 'view/theme/' . $template_directory . '/stylesheet/bt_stylesheet.css';
$font_file = dirname(DIR_APPLICATION) . '/config_xml/font_setting.xml';

if (filesize(dirname(DIR_APPLICATION) . '/config_xml/color_setting.xml') == 0) {
	$color_file = dirname(DIR_APPLICATION) . '/config_xml/theme_color_' . $b_color . '.xml';
} else {
	$color_file = dirname(DIR_APPLICATION) . '/config_xml/color_setting.xml';
}

if (!file_exists($css_file) || ((filemtime($color_file) > filemtime($css_file)) || (filemtime($font_file) > filemtime($css_file)))) {
	$objXML = simplexml_load_file($color_file);
	
	$stylesheet = '';
	
	foreach ($objXML->groups as $xml) {
		foreach ($xml->item as $item) {
			$stylesheet .= html_entity_decode($item->class, ENT_QUOTES, 'UTF-8') . '{';
			foreach (explode(',', $item->style) as $style) {
				$stylesheet .= $style . ': #' . $item->value . ';';
			}
			$stylesheet .= '}';
		}
	}
	
	foreach ($objXML->customs->item as $item) {
		$stylesheet .= html_entity_decode($item->class, ENT_QUOTES, 'UTF-8') . '{';
			foreach (explode(',', $item->style) as $style) {
				$stylesheet .= $style . ': #' . $item->value . ';';
			}
		$stylesheet .= '}';
	}
	
	$defaultFont = array(
		'Arial',
		'Verdana',
		'Helvetica',
		'Lucida Grande',
		'Trebuchet MS',
		'Times New Roman',
		'Tahoma',
		'Georgia'
	);
	
	$objXML = simplexml_load_file($font_file);
	
	$fonts = array();
	
	foreach($objXML->groups as $xml){
		foreach($xml->item as $item){
			$flag = false;
			$font_setting = html_entity_decode($item->class_name, ENT_QUOTES, 'UTF-8') . '{';
			
			if($item->style != 'default' && !in_array($item->style, $defaultFont)) {
				$fonts[(string)$item->style] = $item->style;
				$font_setting .= 'font-family: ' . str_replace("+", " ", $item->style) . ';';
				$flag = true;
			}
			
			if($item->size != 'default') {
				$font_setting .= 'font-size: ' . $item->size . ';';
				$flag = true;
			}
			
			if ($item->weight == 'italic') {
				$font_setting .= 'font-style: italic;' ;
				$flag = true;
			} else if ($item->weight != 'default') {
				$font_setting .=  'font-weight: ' . $item->weight . ';';
				$flag = true;
			}
			
			if($item->transform != 'default') {
				$font_setting .=  'text-transform: ' . $item->transform . ';';
				$flag = true;
			}
			
			$font_setting .= '}';
			
			if ($flag) $stylesheet .= $font_setting;
		}
	}
	
	foreach($objXML->customs->item as $item){
		foreach($xml->item as $item){
			$flag = false;
			$font_setting = html_entity_decode($item->class_name, ENT_QUOTES, 'UTF-8') . '{';
			
			if($item->style != 'default' && !in_array($item->style, $defaultFont)) {
				$fonts[(string)$item->style] = $item->style;
				$font_setting .= 'font-family: ' . str_replace("+", " ", $item->style) . ';';
				$flag = true;
			}
			
			if($item->size != 'default') {
				$font_setting .= 'font-size: ' . $item->size . ';';
				$flag = true;
			}
			
			if ($item->weight == 'italic') {
				$font_setting .= 'font-style: italic;' ;
				$flag = true;
			} else if ($item->weight != 'default') {
				$font_setting .=  'font-weight: ' . $item->weight . ';';
				$flag = true;
			}
			
			if($item->transform != 'default') {
				$font_setting .=  'text-transform: ' . $item->transform . ';';
				$flag = true;
			}
			
			$font_setting .= '}';
			
			if ($flag) $stylesheet .= $font_setting;
		}
	}
	
	foreach ($fonts as $font) {
		$stylesheet = "@import url('https://fonts.googleapis.com/css?family=" . $font . "');" . $stylesheet;
	};
	
	$fhandle = fopen($css_file, 'w+') or die('Unable to open file!');
	fwrite($fhandle, $stylesheet);
	fclose($fhandle);
}
?>
<link href='catalog/view/theme/<?php echo $template_directory; ?>/stylesheet/bt_stylesheet.css' rel='stylesheet' type='text/css'>