<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Taxes extends MY_Controller
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
        $taxes = Tax::create($_POST);
        redirect("/settings?tab=taxes", "location");
    }

    public function edit($id = FALSE)
    {
        if ($_POST) {
            $taxes = Tax::find($id);
            $taxes->update_attributes($_POST);
            redirect("/settings?tab=taxes", "location");
        } else {
            $this->view_data['taxes'] = Tax::find($id);
            $this->content_view = 'setting/modifyTax';
        }
    }

    public function delete($id)
    {
        $taxes = Tax::find($id);
        $taxes->delete();
        redirect("/settings?tab=taxes", "location");
    }
}
