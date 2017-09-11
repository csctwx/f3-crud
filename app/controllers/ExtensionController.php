<?php

class ExtensionController extends Controller { 
    function beforeroute() {        
        parent::beforeroute();
        $this->f3->set('menu','extension');
    }   

	public function index()
    {
        $extension = new Extension($this->db);
        $this->f3->set('extensions',$extension->all());
        $this->f3->set('page_head','Extension List');
        $this->f3->set('message', $this->f3->get('PARAMS.message'));
        $this->f3->set('view','extension/list.htm');
	}

    public function create()
    {   if($this->f3->get('role') == 2 ){
          $this->f3->reroute('/extensions');
        }
        if($this->f3->exists('POST.create'))
        {
            $extension = new Extension($this->db);
            $extension->add();

            $this->f3->reroute('/extension/success/New Extension Created');
        } else
        {
            $this->f3->set('page_head','Create Extension');
            $this->f3->set('view','extension/create.htm');
        }

    }

    public function update()
    {

        $extension = new Extension($this->db);

        if($this->f3->exists('POST.update'))
        {
            $extension->edit($this->f3->get('POST.id'));
            $this->f3->reroute('/extension/success/Extension Updated');
        } else
        {
            $extension->getById($this->f3->get('PARAMS.id'));
            $this->f3->set('extension',$extension);
            $this->f3->set('page_head','Update Extension');
            $this->f3->set('view','extension/update.htm');
        }

    }

    public function delete()
    {
        if($this->f3->exists('PARAMS.id'))
        {
            $extension = new Extension($this->db);
            $extension->delete($this->f3->get('PARAMS.id'));
        }

        $this->f3->reroute('/extension/success/Extension Deleted');
    }
}