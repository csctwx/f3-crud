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
        $item = new Item($this->db);
        $items = $item->all();
        $params = $this->f3->get('GET.limit');
        print_r($params);
//         $data=array("total"=>20,"rows"=>array(
//     array(
//       "upc"=> 210,
//       "description"=> "Item 10",
//       "barcode"=> "033154358",
//       "createdate"=> "20170516"
//     ),
//     array(
//       "upc"=> 11,
//       "description"=> "Item 11",
//       "barcode"=> "033154458",
//       "createdate"=> "20150516"
//     )));

// echo json_encode($data);
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