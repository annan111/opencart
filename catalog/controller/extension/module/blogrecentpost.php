<?php
class ControllerExtensionModuleBlogRecentPost extends Controller {
	public function index($setting) {
		if(empty($setting)) return;		
		$this->load->model('bossblog/article');
		$this->load->model('tool/image'); 
		$this->load->language('extension/module/blogrecentpost');
		
		$boss_blogrecentpost = $setting['blogrecentpost_module'];
		$data['text_postby'] = $this->language->get('text_postby');
		$data['config_teamplate'] = $this->config->get($this->config->get('config_theme') . '_directory');
        $data['heading_title'] = isset($boss_blogrecentpost['title'][$this->config->get('config_language_id')])?$boss_blogrecentpost['title'][$this->config->get('config_language_id')]:'';
        
        if (file_exists('catalog/view/theme/' . $this->config->get($this->config->get('config_theme') . '_directory') . '/stylesheet/bossthemes/boss_blog.css')){
			$this->document->addStyle('catalog/view/theme/' . $this->config->get($this->config->get('config_theme') . '_directory') . '/stylesheet/bossthemes/boss_blog.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/bossthemes/boss_blog.css');
		}
        
		$data['articles'] = array();
		
		$data_sort = array(
			'sort'  => 'ba.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $boss_blogrecentpost['limit']
		);
		
		$results = $this->model_bossblog_article->getArticles($data_sort);

		foreach ($results as $result) {
			if ($result['image']) {
			$image = $this->model_tool_image->resize($result['image'], $this->config->get('bossblog_image_category_width'), $this->config->get('bossblog_image_category_height'));
			} else {
				$image = false;
			}

			$data['articles'][] = array(
				'blog_article_id' => $result['blog_article_id'],
				'name'    	 => $result['name'],
				'image'    	 => $image,
                'title' => utf8_substr(strip_tags(html_entity_decode($result['title'], ENT_QUOTES, 'UTF-8')), 0, 50) . '...',
                'date_added' => $result['date_added'],
                'author'     => $result['author'],
				'href'    	 => $this->url->link('bossblog/article', 'blog_article_id=' . $result['blog_article_id']),
			);
		}
		//echo '<pre>';print_r($results);die();echo '</pre>';
		
		return $this->load->view('extension/module/blogrecentpost', $data);
	}
}
?>