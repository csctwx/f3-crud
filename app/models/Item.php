<?php

class Item extends DB\SQL\Mapper {

    public function __construct(DB\SQL $db) {
        parent::__construct($db,'items');
    }

    public function all() {
        $this->load();
        return $this->query;
    }

    public function page($offset,$limit,$filter,$option) {
        return $this->paginate($offset,$limit,$filter,$option);        
    }

    public function add() {
        $this->copyFrom('POST');        
        $this->save();
        return $this->code;
    }

    public function getById($id) {
        $this->load(array('id=?',$id));
        $this->copyTo('POST');
    }

    public function getByUpc($upc) {
        $this->load(array('upc=?', $upc));
    }

    public function edit($id) {
        $this->load(array('id=?',$id));
        $this->copyFrom('POST');        
        $this->update();
    }

    public function delete($id) {
        $this->load(array('id=?',$id));
        $this->erase();
    }
}
