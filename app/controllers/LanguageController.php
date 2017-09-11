<?php

class LanguageController extends Controller { 
    function beforeroute() {        
        parent::beforeroute();
        $this->f3->set('menu','language');
    }   

	public function index()
    {
        $language = new Language($this->db);
        $this->f3->set('languages',$language->all());
        $this->f3->set('page_head','Language List');
        $this->f3->set('message', $this->f3->get('PARAMS.message'));
        $this->f3->set('view','language/list.htm');
	}

    public function create()
    {   if($this->f3->get('role') == 2 ){
          $this->f3->reroute('/languages');
        }
        if($this->f3->exists('POST.create'))
        {
            $language = new Language($this->db);
            $language->add();

            $this->f3->reroute('/language/success/New Language Created');
        } else
        {
            $this->f3->set('page_head','Create Language');
            $this->f3->set('view','language/create.htm');
        }

    }

    public function update()
    {

        $language = new Language($this->db);

        if($this->f3->exists('POST.update'))
        {
            $language->edit($this->f3->get('POST.id'));
            $this->f3->reroute('/language/success/Language Updated');
        } else
        {
            $language->getById($this->f3->get('PARAMS.id'));
            $this->f3->set('language',$language);
            $this->f3->set('page_head','Update languageanguage');
            $this->f3->set('view','language/update.htm');
        }

    }

    public function delete()
    {
        if($this->f3->exists('PARAMS.id'))
        {
            $language = new Language($this->db);
            $language->delete($this->f3->get('PARAMS.id'));
        }

        $this->f3->reroute('/language/success/Language Deleted');
    }
}