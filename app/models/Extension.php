<?php

class Extension extends DB\SQL\Mapper {

    public function __construct(DB\SQL $db) {
        parent::__construct($db,'extensions');
    }

    public function all() {
        $this->load();
        return $this->query;
    }

    public function add() {
        $this->copyFrom('POST');        
        $this->save();
        return $this->extension;
    }

    public function getById($id) {
        $this->load(array('id=?',$id));
        $this->copyTo('POST');
    }

    public function getByName($name) {
        $this->load(array('extension=?', $name));
    }

    public function edit($id) {
        $this->load(array('id=?',$id));
        $this->copyFrom('POST');        
        $this->update();
        return $this->extension;
    }

    public function delete($id) {
        $this->load(array('id=?',$id));
        $extension = $this->extension;
        $this->erase();
        return $extension;
    }
}
