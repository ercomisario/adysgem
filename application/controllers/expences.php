<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Expences extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model('catalog_expence', 'Catalog_expence');
        if (! $this->user) {
            redirect('login');
        }
        $this->register = $this->session->userdata('register') ? $this->session->userdata('register') : FALSE;
    }

    public function index()
    {
        if ($this->register) {
            $Register = Register::find($this->register);
            $store = Store::find($Register->store_id);
            $this->view_data['storeName'] = $store->name;
            $this->view_data['storeId'] = $store->id;
        } else {
            $this->view_data['stores'] = Store::all();
        }
        $this->view_data['categories'] = Catalog_expence::find('all', array('conditions' => array('id not in (1,9) ')));

        $this->content_view = 'expence/view';
    }

    public function add()
    {
        $config['upload_path'] = './files/expences/';
        $config['encrypt_name'] = TRUE;
        $config['overwrite'] = FALSE;
        $config['allowed_types'] = 'gif|jpg|jpeg|png|pdf|doc|docx|xls|xlsx|zip';
        $config['max_size'] = '2048';
        $dataBD = array(
                "date" => $this->input->post('date'),
                "reference" => $this->input->post('reference'),
                "category_id" => $this->input->post('category'),
                "register_id" => $this->register,
                "store_id" => $this->input->post('store_id'),
                "amount" => $this->input->post('amount'),
                "note" => $this->input->post('note'),
                "attachment" => '',
                "created_by" => $this->session->userdata('user_id')
        );
        
        $this->load->library('upload', $config);

        if ($this->upload->do_upload()) {
            $data = array(
                'upload_data' => $this->upload->data()
            );
            $attachment = $data['upload_data']['file_name'];            
       
            $dataBD['attachment']=$attachment;
          
        } 
        //print_r($dataBD);
        $expence = Expence::create($dataBD);
        redirect("expences", "refresh");
        
    }

    public function edit($id = FALSE)
    {
        if ($_POST) {
            $expence = Expence::find($id);

            $config['upload_path'] = './files/expences/';
            $config['encrypt_name'] = TRUE;
            $config['overwrite'] = FALSE;
            $config['allowed_types'] = 'gif|jpg|jpeg|png|pdf|doc|docx|xls|xlsx|zip';
            $config['max_size'] = '2048';
            $dataBD = array(
                "date" => $this->input->post('date'),
                "reference" => $this->input->post('reference'),
                "category_id" => $this->input->post('category'),
                "register_id" => $this->register,
                "store_id" => $this->input->post('store_id'),
                "amount" => $this->input->post('amount'),
                "note" => $this->input->post('note'),
                "attachment" => $this->input->post('hdnAttachment'),
                "created_by" => $this->session->userdata('user_id')
            );
            
            $this->load->library('upload', $config);
            if ($this->upload->do_upload()) {
                $data = array(
                    'upload_data' => $this->upload->data()
                );
                $attachment = $data['upload_data']['file_name'];
            
                if ($expence->attachment !== '') {
                    unlink('./files/expences/' . $expence->attachment);
                }
                $dataBD['attachment']=$attachment;
             
            }
            
            $expence->update_attributes($dataBD);
            redirect("expences", "refresh");

        } else {

            $expence = Expence::find($id);

            $store = $expence->store_id == 0 ? FALSE : Store::find($expence->store_id);
            $this->view_data['storeName'] = $store ? $store->name : 'Store';
            $this->view_data['stores'] = Store::all();
            $this->view_data['categories'] = Catalog_expence::find('all', array('conditions' => array('id not in (1,9) ')));

            $this->view_data['expence'] = $expence;
            $this->content_view = 'expence/edit';
        }
    }
    
    public function showTicket($id)
    {
         
        $expences = Expence::find($id);
        $category = Catalog_expence::find($expences->category_id);
             //print_r($posale);
              
                //$product = Product::find($row->product_id);            
        $user=User::find($expences->created_by);
        $ticket = '<div class="col-md-12"> 
                    <div class="text-center">' . $this->setting->receiptheader . '</div>
                    <div class="text-center"></div>
                    <div >'.label("Date").': '.$expences->date->format('d/m/Y') .'</div>
                    <div >'.label("Reference").': '.$expences->reference.'</div>
                    <div >'.label("Amount").': '.$expences->amount.'</div>
                    <div >'.label("Motivo").': '.$category->name.'</div>
                    <div >'.label("Creado por").': '.$user->lastname.' '.$user->firstname.'</div>
                    <div >'.label("Caja").': '.$user->username.'</div>
                    </div>';
            

                
        die($ticket);   

       
    }
   
}
