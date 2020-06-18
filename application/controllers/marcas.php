<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Marcas extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model('marca', 'Marca');
        if (! $this->user) {
            redirect('login');
        }
    }

    public function index()
    {
        $this->view_data['marcas'] = Marca::all();
        $this->content_view = 'marcas/view';
    }

    public function add()
    {
        Marca::create($_POST);
        redirect("marcas", "refresh");
    }

    public function edit($id = FALSE)
    {
        if ($_POST) {
            $category = Marca::find($id);
            $category->update_attributes($_POST);
            redirect("marcas", "refresh");
        } else {
            $this->view_data['marcas'] = Marca::find($id);
            $this->content_view = 'marcas/edit';
        }
    }

    public function delete($id)
    {
        $category = Marca::find($id);
        $category->delete();
        redirect("marcas", "refresh");
    }
}
