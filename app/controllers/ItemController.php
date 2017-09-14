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
        $this->f3->set('page_head','item List');
        $this->f3->set('message', $this->f3->get('PARAMS.message'));
        $this->f3->set('view','item/list.htm');
	}

    public function data()
    {
        $sort = $this->f3->get('GET.sort');
        $order = $this->f3->get('GET.order');
        $search = $this->f3->get('GET.search');
        $offset = $this->f3->get('GET.offset');
        $limit = $this->f3->get('GET.limit');
        $item = new Item($this->db);
        $option = $sort ? array(
                                'order' => $sort.' '.$order
                                // 'offset' => $offset,
                                // 'order' => $order
                                ) 
                        : null;       
        $items = $item->page(
                             $offset,$limit,
                             array('description LIKE ? OR upc LIKE ?','%'.$search.'%','%'.$search.'%'),
                             $option
                            );
        
        $rows = array();
        foreach ($items['subset'] as $field) {
            array_push($rows, array('upc'=>$field->upc,
                                    'description'=>$field->description,
                                    'barcode'=>$field->barcode,
                                    'createdate'=>$field->createdate
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
        if($this->f3->exists('POST.create'))
        {
            $item = new Item($this->db);
            $item->add();

            $this->f3->reroute('/item/success/New item Created');
        } else
        {
            $this->f3->set('page_head','Create item');
            $this->f3->set('view','item/create.htm');
        }

    }

    public function update()
    {

        $item = new Item($this->db);

        if($this->f3->exists('POST.update'))
        {
            $item->edit($this->f3->get('POST.id'));
            $this->f3->reroute('/item/success/item Updated');
        } else
        {
            $item->getById($this->f3->get('PARAMS.id'));
            $this->f3->set('item',$item);
            $this->f3->set('page_head','Update itemanguage');
            $this->f3->set('view','item/update.htm');
        }

    }

    public function delete()
    {
        if($this->f3->exists('PARAMS.id'))
        {
            $item = new Item($this->db);
            $item->delete($this->f3->get('PARAMS.id'));
        }

        $this->f3->reroute('/item/success/item Deleted');
    }
}