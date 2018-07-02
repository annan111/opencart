<?php
class ControllerExtensionModuleBossModuleLayout extends Controller {
	private $modules; 
	
	public function index($setting) {
		$content = html_entity_decode($setting['publish']);
		
		$this->load->model('extension/module/boss_module_layout');
		
		$this->modules = array();

		// Get a list of installed modules
		$extensions = $this->model_extension_module_boss_module_layout->getInstalled('module');

		// Add all the modules which have multiple settings for each module
		foreach ($extensions as $code) {		
			$modules = $this->model_extension_module_boss_module_layout->getModulesByCode($code);
			
			if ($modules) {
				foreach ($modules as $module) {
					$index = $code . '.' .  $module['module_id'];
					
					$this->modules[$index] = $index;
				}
			} else if ($this->config->has($code . '_status')){
				$this->modules[$code] = $code;
			}
		}
		
		$pattern = $this->getRegex();
		
		while ($this->hasShortCode($content)) {
			$content = preg_replace_callback($pattern, 'ControllerExtensionModuleBossModuleLayout::doShortCode', $content);
		}
		
		return $content;
	}
	
	private function doShortCode($matches) {
		$part = explode('.', $matches[1]);
		
		$output = '';
		
		if (isset($part[0]) && $this->config->get($part[0] . '_status')) {
			$output .= $this->load->controller('extension/module/' . $part[0]);
		}

		if (isset($part[1])) {
			$setting_info = $this->model_extension_module->getModule($part[1]);

			if ($setting_info && $setting_info['status']) {
				$output .= $this->load->controller('extension/module/' . $part[0], $setting_info);
			}
		}
		
		return $output;
	}
	
	private function hasShortCode($content = '') {
		$pattern = $this->getRegex();
		
		preg_match_all($pattern, $content, $matches, PREG_SET_ORDER);
		
		if (empty($matches)) {
			return false;
		}
		
		foreach ($matches as $shortcode) {
			if (array_key_exists($shortcode[1], $this->modules)) {
				return true;
			}
		}
		
		return false;
	}
	
	private function getRegex() {
		$tagnames = array_keys($this->modules);
		$tagregexp = join( '|', array_map('preg_quote', $tagnames) );
		
		$regex = '/\[(' . $tagregexp . ') \/\]/s';
		
		return $regex;
	}
}