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
    }

    public function getById($id) {
        $this->load(array('id=?',$id));
        $this->copyTo('POST');
    }

    public function getByName($name) {
        $this->load(array('username=?', $name));
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
