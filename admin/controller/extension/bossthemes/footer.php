<?php
class ControllerExtensionBossthemesFooter extends Controller {
	private $error = array();
	
	public function index() {
		$this->load->language('extension/bossthemes/footer');
		$this->load->model('setting/setting');
		
		$data = (isset($data)) ? array_merge($data, $this->language->all()) : $this->language->all();
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('boss_footer', $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->response->redirect($this->url->link('extension/bossthemes/footer', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('marketplace/extension', 'token=' . $this->session->data['token'] . '&type=bossthemes', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/bossthemes/footer', 'token=' . $this->session->data['token'], true)
		);
		
		$data['action'] = $this->url->link('extension/bossthemes/footer', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->post['boss_footer'])) {
			$data['boss_footer'] = $this->request->post['boss_footer'];
		} else {
			$data['boss_footer'] = $this->config->get('boss_footer');
		}
		
		$this->load->model('tool/image');
		
		if (isset($data['boss_footer']['about_us']['image']) && is_file(DIR_IMAGE . $data['boss_footer']['about_us']['image'])) {
			$data['boss_footer']['about_us']['thumb'] = $this->model_tool_image->resize($data['boss_footer']['about_us']['image'], 100, 100);
		}
		
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		$data['topbar'] = $this->load->controller('extension/bossthemes/topbar');
		$data['sidebar'] = $this->load->controller('extension/bossthemes/sidebar');
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/bossthemes/footer', $data));
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/bossthemes/footer')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}
