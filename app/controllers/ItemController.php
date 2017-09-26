<?php

class ItemController extends Controller { 
    function beforeroute() {        
        parent::beforeroute();
        $this->f3->set('menu','item');
    }   

	public function index()
    {
        $item = new Item($this->db);
        $this->f3->set('items',$item->all());
        $this->f3->set('page_head','Item List');
        $this->f3->set('message', $this->f3->get('PARAMS.message'));
        $this->f3->set('view','item/list.htm');
	}

    public function data()
    {
        $sort = $this->f3->get('GET.sort');
        $order = $this->f3->get('GET.order');
        $search = $this->f3->get('GET.search');        
        $limit = $this->f3->get('GET.limit');

        $offset = $limit ? $this->f3->get('GET.offset')/$limit : null;        
        $option = $sort ? array('order' => $sort.' '.$order) : null; 
        $filter = $search ? array('description LIKE ? OR code LIKE ?','%'.$search.'%','%'.$search.'%') : null;

        $item = new Item($this->db);
        $items = $item->page($offset, $limit, $filter, $option);        
        $rows = array();
        foreach ($items['subset'] as $field) {
            array_push($rows, array(
                                    'id'=>$field->id,
                                    'code'=>$field->code,
                                    'description'=>$field->description,
                                    'barcode'=>$field->barcode,
                                    'createdate'=>$field->createdate,
                                    'updatedate'=>$field->updatedate
                                    ));
        }
        $data = array('total'=>$items['total'], 'rows'=>$rows);        
        echo json_encode($data);
        die();
    }


    public function create()
    {   if($this->f3->get('role') == 2 ){
          $this->f3->reroute('/items');
        }
        $brand = new Brand($this->db);
        $upc = new Upc($this->db);
        if($this->f3->exists('POST.create'))
        {
            $item = new Item($this->db);
            $itemCode = $item->add();
            
            $upc->edit($this->f3->get('POST.company'));
            $brand->editWithCode($this->f3->get('POST.brand_id'),$this->f3->get('POST.brand_code'));
            $this->f3->reroute('/item/success/New item '.$itemCode.' Created');
        } else
        {
            //create model data            
            $this->f3->set('brands',$brand->all());
            $extension = new Extension($this->db);
            $this->f3->set('extensions',$extension->all());
            $language = new Language($this->db);
            $this->f3->set('languages',$language->all());
            
            $upcItem = $upc->all()[0];             
            $upcNumber = $upcItem->company.$upcItem->latest_number;            
            $upcFull = $upcNumber.Util::generate_checkdigit($upcNumber);            
            $this->f3->set('upc',$upcFull);
            
            $dateNow = date("Y-m-d");
            $this->f3->set('date_now',$dateNow);

            $this->f3->set('company',$upcItem->company);
            $this->f3->set('latest_number',($upcItem->latest_number+1));

            $this->f3->set('page_head','Create item');
            $this->f3->set('view','item/create.htm');
        }

    }

    public function update()
    {

        $item = new Item($this->db);

        if($this->f3->exists('POST.update'))
        {            
            $itemCode = $item->edit($this->f3->get('POST.id'));
            $this->f3->reroute('/item/success/Item '.$itemCode.' Updated');
        } else
        {
            $item->getById($this->f3->get('PARAMS.id'));
            $this->f3->set('item',$item);

            $dateNow = date("Y-m-d");
            $this->f3->set('date_now',$dateNow);

            $this->f3->set('page_head','Update Item');
            $this->f3->set('view','item/update.htm');
        }

    }

    public function delete()
    {   $item = new Item($this->db);
        if($this->f3->exists('POST.delete'))
        {            
            $itemCode = $item->delete($this->f3->get('POST.id'));
            $this->f3->reroute('/item/success/Item '.$itemCode.' Deleted');
        }
        else
        {
            $item->getById($this->f3->get('PARAMS.id'));
            $this->f3->set('item',$item);           

            $this->f3->set('page_head','Delete Item');
            $this->f3->set('view','item/delete.htm');
        }
        
    }
}