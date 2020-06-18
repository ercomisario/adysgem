<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Expences_controller extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('expence_model', 'expence');
        $this->load->model('catalog_expence', 'Catalog_expence');
        $this->user = $this->session->userdata('user_id') ? User::find_by_id($this->session->userdata('user_id')) : FALSE;
        $lang = $this->session->userdata("lang") == null ? "english" : $this->session->userdata("lang");
        $this->lang->load($lang, $lang);

        $this->setting = Setting::find(1);
    }

    public function ajax_list()
    {
      date_default_timezone_set($this->setting->timezone);
        $list = $this->expence->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $expence) {
            $no ++;
            $row = array();
            $row[] = $expence->date;
            $row[] = $expence->reference;
            $row[] = number_format((float)$expence->amount, $this->setting->decimals, '.', '');
            try{$category = Catalog_expence::find($expence->category_id)->name;}catch (\Exception $e){$category = "-";}
            $row[] = $category;
            try{$store = Store::find($expence->store_id)->name;}catch (\Exception $e){$store = "-";}
            $row[] = $store;
            try{$username = User::find($expence->created_by)->username;}catch (\Exception $e){$username = "-";}
            $row[] = $username;
            $cadena='';
            // add html for action
            $cadena.='<div class="btn-group"><a class="btn btn-primary" href="javascript:void(0)" dropdown-toggle" data-toggle="dropdown" ><i class="fa fa-cog fa-fw"></i> ' . label("Action") . '</a><a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="fa fa-caret-down" title="Toggle dropdown menu"></span></a><ul class="dropdown-menu">';
            if ($expence->category_id !=1 &&  $expence->category_id !=9 ){
                    
            $cadena.='<li><a href="expences/edit/' . $expence->id . '"><i class="fa fa-pencil fa-fw" aria-hidden="true"></i> ' . label("Edit") . '</a></li>
                    <li><a href="javascript:void(0)" onclick="delete_expences(' . $expence->id . ')"><i class="fa fa-trash"></i> '.label("Delete").'</a></li>';
            }       
            $cadena.='<li><a href="javascript:void(0)" onclick="viewExpence('.$expence->id.');">
                        <i class="fa fa-sticky-note" aria-hidden="true"></i> '.label("Ticket").'</a></li>
                    <li>
                      ' . ($expence->attachment ? '<a target="_blank" href="' . site_url() . 'files/expences/' . $expence->attachment . '" title="' . label("ViewFile") . '"><i class="fa fa-file-archive-o"></i> ' . label("ViewFile") . '</a>' : '') . '</li></ul></div>';
            $row[]=$cadena;

            $data[] = $row;
        }

        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->expence->count_all(),
            "recordsFiltered" => $this->expence->count_filtered(),
            "data" => $data
        );
        // output to json format
        echo json_encode($output);
    }

    public function ajax_delete($id)
    {
        $expence = Expence::find($id);
        if ($expence->attachment !== '') {
            unlink('./files/expences/' . $expence->attachment);
        }
        $this->expence->delete_by_id($id);
        echo json_encode(array(
            "status" => TRUE
        ));
    }
}
