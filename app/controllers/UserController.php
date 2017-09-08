<?php

class UserController extends Controller {
    function beforeroute() {        
        parent::beforeroute();
        $this->f3->set('menu','user');
    }   

    function render(){
        $this->f3->set('page_head','Login');
        $this->f3->set('message', '');
        $this->f3->set('view','user/login.htm');
    }    

    function logout(){   

        $this->f3->set('SESSION.user', null);          
        $this->f3->reroute('/login');
    }    

    function authenticate() {

        $username = $this->f3->get('POST.username');
        $password = $this->f3->get('POST.password');

        $user = new User($this->db);
        $user->getByName($username);

        if($user->dry()) {
            $this->f3->reroute('/login');
        }

        if(password_verify($password, $user->password)) {   
            $this->f3->set('SESSION.user', $user->username);     
            $this->f3->set('SESSION.role', $user->role);  
            $this->f3->set('SESSION.id', $user->id);       
            $this->f3->reroute('/');
        } else {            
            $this->f3->reroute('/login');
        }
    }

	public function index()
    {
        $user = new User($this->db);
        $this->f3->set('users',$user->all());
        $this->f3->set('page_head','User List');
        $this->f3->set('message', $this->f3->get('PARAMS.message'));
        $this->f3->set('view','user/list.htm');
	}

    public function create()
    {   if($this->f3->get('role') == 2 ){
          $this->f3->reroute('/');
        }
        if($this->f3->exists('POST.create'))
        {
            $user = new User($this->db);
            $user->add();

            $this->f3->reroute('/success/New User Created');
        } else
        {
            $this->f3->set('page_head','Create User');
            $this->f3->set('view','user/create.htm');
        }

    }

    public function update()
    {

        $user = new User($this->db);

        if($this->f3->exists('POST.update'))
        {
            $user->edit($this->f3->get('POST.id'));
            $this->f3->reroute('/user/success/User Updated');
        } else
        {
            $user->getById($this->f3->get('PARAMS.id'));
            //$this->f3->set('user',$user);
            $this->f3->set('page_head','Update User');
            $this->f3->set('view','user/update.htm');
        }

    }

    public function reset()
    {

        $user = new User($this->db);

        if($this->f3->exists('POST.reset'))
        {
            $user->myreset($this->f3->get('POST.id'));
            $this->f3->reroute('/user/success/User Reseted');
        } else
        {
            $user->getById($this->f3->get('PARAMS.id'));
            $this->f3->set('POST.password','');
            //$this->f3->set('user',$user);
            $this->f3->set('page_head','Reset Password');
            $this->f3->set('view','user/reset.htm');
        }

    }

    public function password()
    {

        $user = new User($this->db);
        $this->f3->set('menu','password');

        if($this->f3->exists('POST.password'))
        {
            $user->myreset($this->f3->get('POST.id'));
            $this->f3->reroute('/users');
        } else
        {
            $user->getById($this->f3->get('PARAMS.id'));
            $this->f3->set('POST.password','');            
            $this->f3->set('page_head','Change Password');
            $this->f3->set('view','user/password.htm');
        }

    }

    public function delete()
    {
        if($this->f3->exists('PARAMS.id'))
        {
            $user = new User($this->db);
            $user->delete($this->f3->get('PARAMS.id'));
        }

        $this->f3->reroute('/success/User Deleted');
    }
}