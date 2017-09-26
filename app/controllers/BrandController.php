<?php

class BrandController extends Controller { 
    function beforeroute() {        
        parent::beforeroute();
        $this->f3->set('menu','brand');
    }   

	public function index()
    {
        $brand = new Brand($this->db);
        $this->f3->set('brands',$brand->all());
        $this->f3->set('page_head','Brand List');
        $this->f3->set('message', $this->f3->get('PARAMS.message'));
        $this->f3->set('view','brand/list.htm');
	}

    public function create()
    {   if($this->f3->get('role') == 2 ){
          $this->f3->reroute('/brands');
        }
        if($this->f3->exists('POST.create'))
        {
            $brand = new Brand($this->db);
            $brandCode = $brand->add();
            $this->f3->reroute('/brand/success/New Brand '.$brandCode.' Created');
        } else
        {
            $this->f3->set('page_head','Create Brand');
            $this->f3->set('view','brand/create.htm');
        }

    }

    public function update()
    {

        $brand = new Brand($this->db);

        if($this->f3->exists('POST.update'))
        {
            $brandCode = $brand->edit($this->f3->get('POST.id'));
            $this->f3->reroute('/brand/success/Brand '.$brandCode.' Updated');
        } 
        else
        {
            $brand->getById($this->f3->get('PARAMS.id'));
            $this->f3->set('brand',$brand);
            $this->f3->set('page_head','Update Brand');
            $this->f3->set('view','brand/update.htm');
        }

    }

    public function delete()
    {   
        $brand = new Brand($this->db);
        if($this->f3->exists('POST.delete'))
        {            
            $brandCode = $brand->delete($this->f3->get('POST.id'));
            $this->f3->reroute('/brand/success/Brand '.$brandCode.' Deleted');
        }
        else
        {
            $brand->getById($this->f3->get('PARAMS.id'));
            $this->f3->set('brand',$brand);
            $this->f3->set('page_head','Delete Brand');
            $this->f3->set('view','brand/delete.htm');
        }

        
    }
}