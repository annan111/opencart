<?php
class ControllerExtensionModuleBossDynamicHTML extends Controller {
	public function index($setting) {
		$this->document->addStyle($setting['css_link']);
		
		$data['html'] = html_entity_decode($setting['description'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
		
		return $this->load->view('extension/module/boss_dynamic_html', $data);
	}
}