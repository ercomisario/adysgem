<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Catalog_expences extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model('catalog_expence', 'Catalog_expence');
        if (! $this->user) {
            redirect('login');
        }
    }

    public function index()
    {
        $this->view_data['categories'] = Catalog_expence::all();
        $this->content_view = 'catalog_expence/view';
    }

    public function add()
    {
        Catalog_expence::create($_POST);
        redirect("catalog_expences", "refresh");
    }

    public function edit($id = FALSE)
    {
        if ($_POST) {
            $category = Catalog_expence::find($id);
            $category->update_attributes($_POST);
            redirect("catalog_expences", "refresh");
        } else {
            $this->view_data['category'] = Catalog_expence::find($id);
            $this->content_view = 'catalog_expence/edit';
        }
    }

    public function delete($id)
    {
        $category = Catalog_expence::find($id);
        $category->delete();
        redirect("catalog_expences", "refresh");
    }
}
