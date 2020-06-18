<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Brands extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        if (! $this->user) {
            redirect('login');
        }
    }

    public function index()
    {
        $this->view_data['brands'] = Brand::all();
        $this->content_view = 'brand/view';
    }

    public function add()
    {
        date_default_timezone_set($this->setting->timezone);
        $date = date("Y-m-d H:i:s");
        $_POST['created_date'] = $date;
        $user = Brand::create($_POST);
        redirect("brands", "refresh");
    }

    public function edit($id = FALSE)
    {
        if ($_POST) {
            $brand = Brand::find($id);
            $brand->update_attributes($_POST);
            redirect("brands", "refresh");
        } else {
            $this->view_data['brands'] = Brand::find($id);
            $this->content_view = 'brand/edit';
        }
    }

    public function delete($id)
    {
        $brand = Brand::find($id);
        $brand->delete();
        redirect("brands", "refresh");
    }
}
