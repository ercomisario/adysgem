<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Debtspay extends MY_Controller
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
        $this->view_data['register'] = $this->register;
        $sql="SELECT a.id, a.purchase_order, a.totalitems, a.date, 
                     a.paidmethod, a.total, a.paid, a.status,                   
                     b.name AS supplier_name,
                     c.username AS created_name,
                     d.name AS tax_name

              FROM   purchases a, suppliers b, users c, taxes d 

              WHERE  a.supplier_id = b.id AND a.created_by=c.id AND a.tax_id=d.id AND a.status>0
              ";
    // $sql;
      
        $this->view_data['purchases'] = Purchase::find_by_sql($sql);
        //$this->view_data['purchases'] = Purchase::all();
        $this->content_view = 'debtspay/view';
    }
}
