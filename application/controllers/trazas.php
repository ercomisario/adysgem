<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Trazas extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        if (! $this->user) {
            redirect('login');
        }
        $this->register = $this->session->userdata('register') ? $this->session->userdata('register') : FALSE;
    }

    public function index()
    {
        date_default_timezone_set($this->setting->timezone);
        $today=date('Y-m-d');
        $date = $this->input->post('date') ? $this->input->post('date') : $today;
      
        $this->view_data['date'] = $date;
        $trazas = Traza::find('all', array('conditions' => array(
            "DATE_FORMAT(created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(created_at, '%Y-%m-%d') <= ? ", $date, $date
        )));

        $this->view_data['trazas'] = $trazas;
        $this->content_view = 'traza/view';
    }

}
