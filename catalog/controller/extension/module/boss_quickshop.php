<?php
class ControllerExtensionModuleBossQuickshop extends Controller {
	public function index($setting) {
		if(empty($setting)) return;
		$data['selecters'] = array();
		$data['selecters'] = explode(",", html_entity_decode($setting['array_class_selected'], ENT_QUOTES, 'UTF-8'));
		
		$this->document->addScript('catalog/view/javascript/bossthemes/jquery.zoom.min.js');
		$this->document->addScript('catalog/view/javascript/bossthemes/jquery.jgrowl.min.js');
		
		$this->document->addScript('catalog/view/javascript/bossthemes/slick/slick.min.js');
		$this->document->addStyle('catalog/view/javascript/bossthemes/slick/slick.css');
		$this->document->addStyle('catalog/view/theme/' . $this->config->get($this->config->get('config_theme') . '_directory') . '/stylesheet/bossthemes/slick-theme.css');

		$data['text'] = isset($setting['title'][$this->config->get('config_language_id')]) ? $setting['title'][$this->config->get('config_language_id')] : '';

		$data['width'] =  $setting['width'];

		$data['seo_data'] = array();

		$this->load->model('catalog/product');

		$datas = $this->db->query("SELECT `query`, `keyword`  FROM `" . DB_PREFIX . "url_alias`");

		foreach ($datas->rows as $dataf) {
			if(preg_match("/product_id/i", $dataf['query'])){
				$data['seo_data'][]= array(
					'query' => $dataf['query'],
					'keyword' => $dataf['keyword']
				);
			}
		}
		
		return $this->load->view('extension/module/boss_quickshop', $data);
	}
}