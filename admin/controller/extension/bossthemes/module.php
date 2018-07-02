<?php
class ControllerExtensionBossthemesModule extends Controller {
	private $error = array();
	
	public function index() {
		$this->load->language('extension/bossthemes/module');
		$this->load->model('extension/extension');
		$this->load->model('extension/module');
		
		$data = (isset($data)) ? array_merge($data, $this->language->all()) : $this->language->all();
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		if (!isset($this->request->get['module']) && !is_file(DIR_APPLICATION . 'controller/extension/module/' . $this->request->get['module'] . '.php')) {
			$this->response->redirect($this->url->link('extension/bossthemes/manager', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			$this->response->redirect($this->url->link('extension/bossthemes/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['boss_module'])) {
			$data['error_boss_module'] = $this->error['boss_module'];
		} else {
			$data['error_boss_module'] = '';
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
			'href' => $this->url->link('extension/bossthemes/module', 'token=' . $this->session->data['token'], true)
		);
		
		$extensions = $this->model_extension_extension->getInstalled('module');
		
		$data['install'] = $this->url->link('extension/bossthemes/module/install', 'token=' . $this->session->data['token'] . '&extension=' . $this->request->get['module'], true);
		$data['uninstall'] = $this->url->link('extension/bossthemes/module/uninstall', 'token=' . $this->session->data['token'] . '&extension=' . $this->request->get['module'], true);
		$data['edit'] = $this->url->link('extension/module/' . $this->request->get['module'], 'token=' . $this->session->data['token'], true);
		$data['installed'] = in_array($this->request->get['module'], $extensions);
		
		$data['modules'] = array();
		
		$modules = $this->model_extension_module->getModulesByCode($this->request->get['module']);
		
		if ($modules && in_array($this->request->get['module'], $extensions)) {
			foreach ($modules as $module) {
				$data['modules'][] = array(
					'module_id' => $module['module_id'],
					'name'      => $module['name'],
					'edit'      => $this->url->link('extension/module/' . $this->request->get['module'], 'token=' . $this->session->data['token'] . '&module_id=' . $module['module_id'], true),
					'delete'    => $this->url->link('extension/bossthemes/module/delete', 'token=' . $this->session->data['token'] . '&module_id=' . $module['module_id'], true)
				);
			}
		} else if (!$modules && in_array($this->request->get['module'], $extensions)) {
			$language = new Language($this->config->get('config_language'));
			$language->load('extension/module/' . $this->request->get['module']);
			
			$data['modules'][] = array(
				'name'      => $this->language->get('heading_title'),
				'edit'      => $this->url->link('extension/module/' . $this->request->get['module'], 'token=' . $this->session->data['token'], true)
			);
		}
		
		$data['topbar'] = $this->load->controller('extension/bossthemes/topbar');
		$data['sidebar'] = $this->load->controller('extension/bossthemes/sidebar');
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/bossthemes/module', $data));
	}
	
	public function install() {
		$this->load->language('extension/bossthemes/module');
		$this->load->model('extension/extension');
		$this->load->model('extension/module');
		
		$json = array();
		
		if ($this->validate()) {
			$this->model_extension_extension->install('module', $this->request->get['extension']);

			$this->load->model('user/user_group');

			$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'extension/module/' . $this->request->get['extension']);
			$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'extension/module/' . $this->request->get['extension']);

			// Call install method if it exsits
			$this->load->controller('extension/module/' . $this->request->get['extension'] . '/install');

			$json['success'] = $this->language->get('text_success');
		} else {
			$json['error'] = $this->error['warning'];
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function uninstall() {
		$this->load->language('extension/bossthemes/module');
		$this->load->model('extension/extension');
		$this->load->model('extension/module');
		
		$json = array();
		
		if ($this->validate()) {
			$this->model_extension_extension->uninstall('module', $this->request->get['extension']);

			$this->model_extension_module->deleteModulesByCode($this->request->get['extension']);

			// Call uninstall method if it exsits
			$this->load->controller('extension/module/' . $this->request->get['extension'] . '/uninstall');

			$json['success'] = $this->language->get('text_success');
		} else {
			$json['error'] = $this->error['warning'];
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	public function add() {
		$this->load->language('extension/bossthemes/module');
		$this->load->model('extension/extension');
		$this->load->model('extension/module');
		
		$json = array();

		if ($this->validate()) {
			$this->load->language('module' . '/' . $this->request->get['extension']);
			
			$this->model_extension_module->addModule($this->request->get['extension'], $this->language->get('heading_title'));

			$json['success'] = $this->language->get('text_success');
		} else {
			$json['error'] = $this->error['warning'];
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function delete() {
		$this->load->language('extension/bossthemes/module');

		$this->load->model('extension/extension');

		$this->load->model('extension/module');

		if (isset($this->request->get['module_id']) && $this->validate()) {
			$this->model_extension_module->deleteModule($this->request->get['module_id']);

			$json['success'] = $this->language->get('text_success');
		} else {
			$json['error'] = $this->error['warning'];
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/bossthemes/module')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		return !$this->error;
	}
}
