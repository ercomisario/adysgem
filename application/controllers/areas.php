<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Areas extends MY_Controller
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
        $this->view_data['areas'] = Area::all();
        $this->content_view = 'area/view';
    }

    public function add()
    {
        date_default_timezone_set($this->setting->timezone);
        $date = date("Y-m-d H:i:s");
        $_POST['created_at'] = $date;
        $user = Area::create($_POST);
        redirect("areas", "refresh");
    }

    public function edit($id = FALSE)
    {
        if ($_POST) {
            $category = Area::find($id);
            $category->update_attributes($_POST);
            redirect("areas", "refresh");
        } else {
            $this->view_data['areas'] = Area::find($id);
            $this->content_view = 'area/edit';
        }
    }

    public function delete($id)
    {
        $category = Areas::find($id);
        $category->delete();
        redirect("areas", "refresh");
    }
}
