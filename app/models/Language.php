<?php

class Language extends DB\SQL\Mapper {

    public function __construct(DB\SQL $db) {
        parent::__construct($db,'languages');
    }

    public function all() {
        $this->load();
        return $this->query;
    }

    public function add() {
        $this->copyFrom('POST');        
        $this->save();
        return $this->language;
    }

    public function getById($id) {
        $this->load(array('id=?',$id));
        $this->copyTo('POST');
    }

    public function getByLanguage($language) {
        $this->load(array('language=?', $language));
    }

    public function edit($id) {
        $this->load(array('id=?',$id));
        $this->copyFrom('POST');        
        $this->update();
        return $this->language;
    }

    public function delete($id) {
        $this->load(array('id=?',$id));
        $curLanguage = $this->language;
        $this->erase();
        return $curLanguage;
    }
}
