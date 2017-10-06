<?php

class User extends DB\SQL\Mapper {

    public function __construct(DB\SQL $db) {
        parent::__construct($db,'users');
    }

    public function all() {
        $this->load();
        return $this->query;
    }

    public function add() {
        $this->copyFrom('POST');
        $this->password = password_hash($this->password, PASSWORD_DEFAULT);
        try {
          $this->save();
          return $this->username;
        } catch(\PDOException $e) {
          $err=$e->errorInfo;          
          return $err;
        }
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

    public function myreset($id) {
        $this->load(array('id=?',$id));
        $this->copyFrom('POST',function($val) {
                            // the 'POST' array is passed to our callback function
                            return array_intersect_key($val, array_flip(array('username','password')));
                        }); 
        $this->password = password_hash($this->password, PASSWORD_DEFAULT);     
        $this->update();
    }

    public function delete($id) {
        $this->load(array('id=?',$id));
        $this->erase();
    }
}
