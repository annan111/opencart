<?php  
class ControllerExtensionModuleBossDragDrop extends Controller {
	public function index($setting) { 
		if(empty($setting)) return;
		
		$this->document->addScript('catalog/view/javascript/bossthemes/dragdrop/jquery.event.drag-2.2.js');
		$this->document->addScript('catalog/view/javascript/bossthemes/ui/jquery-ui.min.js');
		
		$this->document->addStyle('catalog/view/javascript/bossthemes/ui/jquery-ui.min.css');
		
		if (file_exists('catalog/view/theme/' . $this->config->get($this->config->get('config_theme') . '_directory') . '/stylesheet/bossthemes/boss_drag_drop.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get($this->config->get('config_theme') . '_directory') . '/stylesheet/bossthemes/boss_drag_drop.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/bossthemes/boss_drag_drop.css');
		}
		
		$data['selecters'] = array();
		$data['selecters'] = explode(",", html_entity_decode($setting['classes'], ENT_QUOTES, 'UTF-8'));
		
		$language_id = (int)$this->config->get('config_language_id');
				
		$data['seo_data'] = array();
		$data['type_product'] = $setting['type_product'];
		$data['title'] = (isset($setting['module_language'][$language_id]['title'])) ? $setting['module_language'][$language_id]['title'] : '';
		$data['description'] = (isset($setting['module_language'][$language_id]['description'])) ? $setting['module_language'][$language_id]['description'] : '';
		$data['handle'] = (isset($setting['module_language'][$language_id]['handle'])) ? $setting['module_language'][$language_id]['handle'] : '';
		
		$this->load->model('catalog/product');
		$this->load->language('extension/module/boss_drag_drop');
		
		$datas = $this->db->query("SELECT `query`, `keyword`  FROM `" . DB_PREFIX . "url_alias`");
		
		foreach ($datas->rows as $dataf) {
			if(preg_match("/product_id/i", $dataf['query'])){
				$data['seo_data'][]= array(
					'query' => $dataf['query'],
					'keyword' => $dataf['keyword']
				);
			}
		}
		
			return $this->load->view('extension/module/boss_drag_drop.tpl', $data);
	}
}