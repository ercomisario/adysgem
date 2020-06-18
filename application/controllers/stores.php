<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Stores extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        if (! $this->user) {
            redirect('login');
        }
    }

    public function add()
    {
        date_default_timezone_set($this->setting->timezone);
        $date = date("Y-m-d H:i:s");

        $text=$_POST['licencia']; 
        $hash = hash('md5', $text);

        $licencia = Licencia::find('first', array('conditions' => array('text = ? AND in_activo= ? ', $hash, 1)));
           
        if ($licencia) {
            $licencia->in_activo=2;
            $licencia->date_activo=$date;
            $licencia->save();
            $_POST['created_at'] = $date;
            $_POST['licencia_id'] = $licencia->id;
            $_POST['status'] = 1;
            unset($_POST['licencia']);
            $store = Store::create($_POST);
            redirect("/settings?tab=stores&resp=".$licencia->text, "location");
        }else{
            redirect("/settings?tab=stores&resp=nolicencia", "location");
        }
    }

    public function edit($id = FALSE)
    {
        if ($_POST) {
            $store = Store::find($id);
            $store->update_attributes($_POST);
            redirect("/settings?tab=stores", "location");
        } else {
            $this->view_data['store'] = Store::find($id);
            $this->content_view = 'setting/modifyStore';
        }
    }

    public function delete($id)
    {
        $store = Store::find($id);
        $store->delete();
        redirect("/settings?tab=stores", "location");
    }
}
