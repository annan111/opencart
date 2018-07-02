<?php
class ControllerExtensionModuleBlogSearch extends Controller {
	public function index($setting) {
		if(empty($setting)) return;
        if (file_exists('catalog/view/theme/' . $this->config->get($this->config->get('config_theme') . '_directory') . '/stylesheet/bossthemes/boss_blog.css')){
			$this->document->addStyle('catalog/view/theme/' . $this->config->get($this->config->get('config_theme') . '_directory') . '/stylesheet/bossthemes/boss_blog.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/bossthemes/boss_blog.css');
		}
		
		$this->load->language('extension/module/blogsearch');

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_search'] = $this->language->get('text_search');

		if (isset($this->request->get['search'])) {
			$data['search'] = $this->request->get['search'];
		} else {
			$data['search'] = '';
		}
		
		return $this->load->view('extension/module/blogsearch', $data);
	}
}