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
            $curLanguage = $language->add();
            $this->f3->reroute('/language/success/New Language '.$curLanguage.' Created');
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
            $curLanguage = $language->edit($this->f3->get('POST.id'));
            $this->f3->reroute('/language/success/Language '.$curLanguage.' Updated');
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
         $language = new Language($this->db);
        if($this->f3->exists('POST.id'))
        {           
            $curLanguage = $language->delete($this->f3->get('POST.id'));
            $this->f3->reroute('/language/success/Language '.$curLanguage.' Deleted');
        } 
        else
        {
            $language->getById($this->f3->get('PARAMS.id'));
            $this->f3->set('language',$language);
            $this->f3->set('page_head','Delete Language');
            $this->f3->set('view','language/delete.htm');
        }        
    }
}