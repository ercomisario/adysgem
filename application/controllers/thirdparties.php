<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Thirdparties extends MY_Controller
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
        $this->view_data['thirdparties'] = Thirdparty::all();
        $this->content_view = 'thirdparty/view';
    }

    public function add()
    {
        date_default_timezone_set($this->setting->timezone);
        $date = date("Y-m-d H:i:s");
        $_POST['created_at'] = $date;
        $thirdparties = Thirdparty::create($_POST);
        redirect("thirdparties", "refresh");
    }

    public function edit($id = FALSE)
    {
        if ($_POST) {
            $thirdparties = Thirdparty::find($id);
            $thirdparties->update_attributes($_POST);
            redirect("thirdparties", "refresh");
        } else {
            $this->view_data['thirdparties'] = Thirdparty::find($id);
            $this->content_view = 'thirdparty/edit';
        }
    }

    public function delete($id)
    {
        $thirdparties = Thirdparty::find($id);
        $thirdparties->delete();
        redirect("thirdparties", "refresh");
    }
}
