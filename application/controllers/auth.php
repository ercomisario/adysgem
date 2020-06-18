<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Auth extends MY_Controller
{
    function __construct()
    {
        parent::__construct();
        

    }
    function login()
    {
        $this->layout_view = 'login';
        $this->view_data['licencia'] = -1;

        $store=Store::all();
        if($store)
        {                    
            $user=User::all();
            if($user)
            {                    
                $this->view_data['licencia'] = 1;
            
            }else{                    
            
                $this->view_data['licencia'] = 'user';
            }
            
        }
      
        if ($_POST) {              

            $user = User::validate_login($_POST['username'], $_POST['password']);
            
            if($user) 
            {
                redirect('');

            } else {

                $this->view_data['username'] = $_POST['username'];
                $this->view_data['message'] = $this->lang->line('login_incorrect');

            }
        }
        
    }
    public function addUser()
    {
        date_default_timezone_set($this->setting->timezone);
        $date = date("Y-m-d H:i:s");
        unset($_POST['submit']);
        $store = Store::find('first', array('conditions' => array('licencia_id > 0')));        
        
        $_POST['store_id'] = $store->id;
        $_POST['role'] = 'admin';
        $_POST['last_active'] = $date;
        $_POST['created_at'] = $date;
        $user = User::create($_POST);
        $this->layout_view = 'login';
        $this->view_data['licencia'] = 1;
        
    }
    function licencia()
    {
        date_default_timezone_set($this->setting->timezone);
        $date = date("Y-m-d H:i:s");            
        
        $this->layout_view = 'login';
        $this->view_data['licencia'] = null;

        if ($_POST) {      
        
            $text=$_POST['text'];
            $store = $_POST['store'];
            $phone = $_POST['phone'];
            $adresse = $_POST['adresse'];
            $city = $_POST['city'];
            $country = $_POST['country'];
            $email = $_POST['email'];

            $hash = hash('md5', $text);

            $licencia = Licencia::find('first', array('conditions' => array('text = ? AND in_activo= ? ', $hash, 1)));

            
            if ($licencia) {

                $licencia->in_activo=2;
                $licencia->date_activo=$date;
                $licencia->save();

                $arreglo = array(
                    "name" => $store,
                    "phone" => $phone,
                    "adresse" => $adresse,
                    "email" => $email,
                    "city" => $city,
                    "country" => $country,
                    "footer_text" => 'Gracias por su compra!',
                    "created_at" => $date,
                    "licencia_id" => $licencia->id,
                    "status" => 1
                 );

                $store=Store::create($arreglo);
                if($store)
                {
                    $user=User::all();
                    if($user)
                    {                    
                        $this->view_data['licencia'] = $licencia->id;   
                    
                    }else{                    
                    
                        $this->view_data['licencia'] = 'user';
                    }    
                }
                

               // redirect('');
            } else {

                $this->view_data['text'] = $text;
                $this->view_data['store'] = $store;
                $this->view_data['phone'] = $phone;
                $this->view_data['adresse'] = $adresse;
                $this->view_data['email'] = $email;
                $this->view_data['message'] = 'Licencia incorrecta o no autorizada';
            }
            //die($hash);
        }
    }

    function logout()
    {
        if (! $this->user) {
            redirect('login');
        } else {
            $update = User::find($this->user->id);
            $update->last_active = date("Y-m-d H:i:s");
            $update->save();
            
            User::logout();
            redirect('login');
        }
    }
    public function authdiscount($password)
    {

        $p=0;
        $type = $this->input->post('type');

        $user = user::find('all', array(
            'conditions' => array(
                'role = ?' ,
                'admin'
            )
        ));
        //print_r($user);
        foreach ($user as $row) {

            $salt = substr($row->hashed_password, 0, 64);
            $hash = substr($row->hashed_password, 64, 64);
            $password_hash = hash('sha256', $salt . $password);
            //echo $password_hash.' : '.$hash;
            if($password_hash == $hash)
            {
                ///Traza de seguridad
                $userTraza = User::find($this->user->id);
                if($type==1)
                {
                    $action = "Autorización para descuento y/o precio especial, con la clave de ".$row->username;
                    
                }
                if($type==2)
                {
                    $action = "Autorización para anular factura, con la clave de ".$row->username;
                    
                }
                if($type==3)
                {
                    $action = "Autorización para realizar remisión, con la clave de ".$row->username;
                    
                }
                $dataDB = array(
                        "action" => $action,
                        "created_by" => $userTraza->username.' '.$userTraza->firstname.' '.$userTraza->lastname
                );   
                Traza::create($dataDB);
                /////////////////////////////
                $p=1;
            }
        }       
        echo $p;
        die();
       
    }
}
