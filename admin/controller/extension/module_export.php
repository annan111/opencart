<?php
class ControllerExtensionModuleExport extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module_export');

		$this->load->model('extension/extension');

		$this->load->model('extension/module');

		$this->getList();
	}
	
	public function info() {
		$this->load->language('extension/module_export');

		$this->load->model('extension/extension');

		$this->load->model('extension/module');
		
		$this->load->model('setting/setting');
		
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_info'] = $this->language->get('text_info');
		
		$data['column_name'] = $this->language->get('column_name');
		$data['column_setting'] = $this->language->get('column_setting');
		$data['column_layout'] = $this->language->get('column_layout');
		
		if (isset($this->request->get['extension'])) {
			$extension = $this->request->get['extension'];
		} else {
			$extension = '';
		}
		
		$extensions = $this->model_extension_extension->getInstalled('module');
		
		$data['extensions'] = array();
		
		if (!empty($extension) && in_array($extension, $extensions)) {
			$modules = $this->model_extension_module->getModulesByCode($extension);
			
			if ($modules) {
				foreach ($modules as $module) {
					$data['extensions'][] = array(
						'name'    => $module['name']  . ' (' . $module['code'] . '.' . $module['module_id'] . ')',
						'setting' => htmlentities($module['setting']),
						'layout'  => htmlentities(json_encode($this->getModuleLayouts($module['code'] . '.' . $module['module_id']), true))
					);
				}
			} else {
				$data['extensions'][] = array(
					'name'    => $extension,
					'setting' => htmlentities(json_encode($this->model_setting_setting->getSetting($extension), true)),
					'layout'  => htmlentities(json_encode($this->getModuleLayouts($extension), true))
				);
			}
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('extension/module_export_info', $data));
	}
	
	public function export() {
		$this->load->model('setting/setting');
		$this->load->model('extension/extension');
		$this->load->model('extension/module');
		
		if ($this->validate()) {
			// Create storage directory
			$package_path = 'bossthemes/sample_data/' . date('Y-m-d-H-i') . '/';
			
			$path = '';

			$directories = explode('/', $package_path);

			foreach ($directories as $directory) {
				$path = $path . '/' . $directory;
				if (!is_dir(DIR_SYSTEM . $path)) {
					@mkdir(DIR_SYSTEM . $path, 0777);
				}
			}
			
			// Manager
			$settings = array(
				'boss_manager',
				'boss_category',
				'boss_product',
				'boss_header',
				'boss_footer',
				'boss_social',
				'boss_payment'
			);
			
			$json = array();
			foreach ($settings as $setting) {
				$json[] = array(
					'code'    => $setting,
					'setting' => $this->model_setting_setting->getSetting($setting)
				);
			}
			
			$handle = fopen(DIR_SYSTEM . $package_path . 'setting_boss_manager.dat', 'w');
			fwrite($handle, json_encode($json));
			fclose($handle);
			
			// Module
			$extensions = $this->model_extension_extension->getInstalled('module');
			
			foreach ($extensions as $key => $value) {
				if (!is_file(DIR_APPLICATION . 'controller/extension/module/' . $value . '.php')) {
					$this->model_extension_extension->uninstall('module', $value);
	
					unset($extensions[$key]);
					
					$this->model_extension_module->deleteModulesByCode($value);
				}
			}
			
			foreach ($extensions as $extension) {
				if ($extension == 'boss_manager') continue;
				$json = array();
				$modules = $this->model_extension_module->getModulesByCode($extension);
				
				if ($modules) {
					foreach ($modules as $module) {
						$json[] = array(
							'module_id' => $module['module_id'],
							'name'      => $module['name'],
							'setting'   => json_decode($module['setting'], true),
							'layout'    => $this->getModuleLayouts($module['code'] . '.' . $module['module_id'])
						);
					}
					
					$handle = fopen(DIR_SYSTEM . $package_path . 'module_module_' . $extension . '.dat', 'w');
					fwrite($handle, json_encode($json));
					fclose($handle);
				} else {
					$json[] = array(
						'setting' => $this->model_setting_setting->getSetting('module_' . $extension),
						'layout'  => $this->getModuleLayouts($extension)
					);
					
					$handle = fopen(DIR_SYSTEM . $package_path . 'module_setting_' . $extension . '.dat', 'w');
					fwrite($handle, json_encode($json));
					fclose($handle);
				}
			}
			
			// Banners
			$banners = $this->db->query("SELECT * FROM " . DB_PREFIX . "banner WHERE `name` LIKE '%Boss%'")->rows;
			
			foreach ($banners as $key => $value) {
				$banner_image_data = array();
				
				$banner_image_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "banner_image WHERE banner_id = '" . (int)$value['banner_id'] . "' ORDER BY sort_order ASC");
				
				foreach ($banner_image_query->rows as $banner_image) {
					$banner_image_data[$banner_image['language_id']][] = array(
						'title'      => $banner_image['title'],
						'link'       => $banner_image['link'],
						'image'      => $banner_image['image'],
						'sort_order' => $banner_image['sort_order']
					);
				}
				
				$banners[$key]['banner_image'] = $banner_image_data;
			}
			
			$handle = fopen(DIR_SYSTEM . $package_path . 'banners.dat', 'w');
			fwrite($handle, json_encode($banners));
			fclose($handle);
		}
	}
	
	protected function getList() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_layout'] = sprintf($this->language->get('text_layout'), $this->url->link('design/layout', 'token=' . $this->session->data['token'], true));
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_list'] = $this->language->get('text_list');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_view'] = $this->language->get('button_view');

		$extensions = $this->model_extension_extension->getInstalled('module');

		foreach ($extensions as $key => $value) {
			if (!is_file(DIR_APPLICATION . 'controller/extension/module/' . $value . '.php') && !is_file(DIR_APPLICATION . 'controller/module/' . $value . '.php')) {
				$this->model_extension_extension->uninstall('module', $value);

				unset($extensions[$key]);
				
				$this->model_extension_module->deleteModulesByCode($value);
			}
		}

		$data['extensions'] = array();

		// Compatibility code for old extension folders
		$files = glob(DIR_APPLICATION . 'controller/{extension/module,module}/*.php', GLOB_BRACE);

		if ($files) {
			foreach ($files as $file) {
				$extension = basename($file, '.php');

				$this->load->language('extension/module/' . $extension);

				$data['extensions'][] = array(
					'name'      => $this->language->get('heading_title'),
					'code'      => $extension,
					'installed' => in_array($extension, $extensions),
					'info'		=> $this->url->link('extension/module_export/info', 'token=' . $this->session->data['token'] . '&extension=' . $extension, true)
				);
			}
		}

		$sort_order = array();

		foreach ($data['extensions'] as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $data['extensions']);
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module_export_list', $data));
	}
	
	private function getModuleLayouts($extension = '') {
		$query = $this->db->query("SELECT DISTINCT * FROM `" . DB_PREFIX . "layout_module` lm LEFT JOIN `" . DB_PREFIX . "layout` l ON (`lm`.`layout_id` = `l`.`layout_id`) WHERE `lm`.`code` = '" . $this->db->escape($extension) . "' ORDER BY `lm`.`position` ASC, `lm`.`sort_order` ASC");

		return $query->rows;
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module_export')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		return !$this->error;
	}
}
