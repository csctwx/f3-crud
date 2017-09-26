<?php

class Brand extends DB\SQL\Mapper {

    public function __construct(DB\SQL $db) {
        parent::__construct($db,'brands');
    }

    public function all() {
        $this->load();
        return $this->query;
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

    public function getByName($name) {
        $this->load(array('name=?', $name));
    }

    public function edit($id) {
        $this->load(array('id=?',$id));
        $this->copyFrom('POST');         
        $this->update();
        return $this->code;
    }

    public function editWithCode($id, $code) {
        $this->load(array('id=?',$id));
        $this->copyFrom('POST'); 
        $this->code = $code;       
        $this->update();
    }

    public function delete($id) {
        $this->load(array('id=?',$id));
        $brandCode = $this->code;
        $this->erase();
        return $brandCode;
    }
}
