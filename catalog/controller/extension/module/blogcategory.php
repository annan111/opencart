<?php  
class ControllerExtensionModuleBlogcategory extends Controller {
	public function index($setting) {
		if(empty($setting)) return;
		
		static $module = 0;
		
		$this->load->language('extension/module/blogcategory');
		
    	$data['heading_title'] = $this->language->get('heading_title');
		
		$data['config_teamplate'] = $this->config->get($this->config->get('config_theme') . '_directory');
		
        if (file_exists('catalog/view/theme/' . $this->config->get($this->config->get('config_theme') . '_directory') . '/stylesheet/bossthemes/boss_blog.css')){
			$this->document->addStyle('catalog/view/theme/' . $this->config->get($this->config->get('config_theme') . '_directory') . '/stylesheet/bossthemes/boss_blog.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/bossthemes/boss_blog.css');
		}
		
		$this->document->addScript('catalog/view/javascript/bossthemes/jquery.dcjqaccordion.min.js');
		
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}
        
		if (isset($parts[0])) {
			$data['blog_category_id'] = $parts[0];
		} else {
			$data['blog_category_id'] = 0;
		}
		
		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}
							
		$this->load->model('bossblog/blogcategory');

		$this->load->model('bossblog/article');

		$data['categories'] = array();

		$categories = $this->model_bossblog_blogcategory->getBlogCategories(0);

		foreach ($categories as $category) {
			$total = $this->model_bossblog_article->getTotalArticles(array('filter_category_id'  => $category['blog_category_id']));

			$children_data = array();

			$children = $this->model_bossblog_blogcategory->getBlogCategories($category['blog_category_id']);

			foreach ($children as $child) {
				$data_sort = array(
					'filter_category_id'  => $child['blog_category_id'],
					'filter_sub_category' => true
				);

				$article_total = $this->model_bossblog_article->getTotalArticles($data_sort);

				//$total += $article_total;

				$children_data[] = array(
					'blog_category_id' => $child['blog_category_id'],
					'name'        => $child['name'],
					'total'		  => ($setting['count']) ? $article_total : '',
					'href'        => $this->url->link('bossblog/blogcategory', 'path=' . $category['blog_category_id'] . '_' . $child['blog_category_id'])	
				);		
			}

			$data['categories'][] = array(
				'blog_category_id' => $category['blog_category_id'],
				'name'        => $category['name'],
				'total'		  => ($setting['count']) ? $total : '',
				'children'    => $children_data,
				'href'        => $this->url->link('bossblog/blogcategory', 'path=' . $category['blog_category_id'])
			);	
		}

		$data['module'] = $module++;
		
		return $this->load->view('extension/module/blogcategory', $data);
  	}

}
?>