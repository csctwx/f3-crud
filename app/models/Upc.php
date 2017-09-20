<?php

class Upc extends DB\SQL\Mapper {

    public function __construct(DB\SQL $db) {
        parent::__construct($db,'upc');
    }

    public function all() {
        $this->load();
        return $this->query;
    }

    public function add() {
        $this->copyFrom('POST');        
        $this->save();
    }

    public function getById($id) {
        $this->load(array('id=?',$id));
        $this->copyTo('POST');
    }

    public function getByName($name) {
        $this->load(array('name=?', $name));
    }

    public function edit($company) {
        $this->load(array('company=?',$company));
        $this->copyFrom('POST');        
        $this->update();
    }

    public function delete($id) {
        $this->load(array('id=?',$id));
        $this->erase();
    }
}
