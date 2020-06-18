<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Priceconsultants extends MY_Controller
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
        $this->content_view = 'priceconsultant/view';
     
    }

}
