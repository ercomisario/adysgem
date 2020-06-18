<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Customers extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        if (! $this->user) {
            redirect('login');
        }
    }

    public function index($band=NULL)
    {
        $sql="SELECT a.id, a.firstname1, a.lastname1, 
                     a.email, a.movil,
                     a.phone, a.discount,
                     a.created_at,
                     (SELECT count(*) FROM sales WHERE client_id=a.id) AS total 

              FROM   customers a ";
    
        $this->view_data['customers'] = Customer::find_by_sql($sql);

        $this->view_data['band'] = $band;
        $this->content_view = 'customer/view';
    }

    public function add()
    {
        date_default_timezone_set($this->setting->timezone);
        
        $customer = Customer::create($_POST);

        redirect("customers", "refresh");
    }

    public function edit($id = FALSE)
    {
        if ($_POST) {
            $customer = Customer::find($id);
            $customer->update_attributes($_POST);
            redirect("customers", "refresh");
        } else {
            $this->view_data['customer'] = Customer::find($id);
            $this->content_view = 'customer/edit';
        }
    }

    public function delete($id)
    {
        $customer = Customer::find($id);
        $customer->delete();
        redirect("customers", "refresh");
    }
    public function csv($type)
    {
        $this->load->dbutil();
        $this->load->helper('file');
        $this->load->helper('download');
        $delimiter = ",";
        $newline = "\r\n";
        $filename = "customer.csv";
        $query = "SELECT numdoc, firstname1, firstname2, lastname1, lastname2, movil, phone,
                         email, city, adresse 
                  FROM customers";
        
        if($type==2)
        {
          $query.=" LIMIT 1";
        }
        $result = $this->db->query($query);
        $data = $this->dbutil->csv_from_result($result, $delimiter, $newline);
        force_download($filename, $data);
    }
    public function importcsv()
    {
        $config['upload_path'] = './files/products';
        $config['allowed_types'] = 'csv';
        $config['overwrite'] = TRUE;
        $config['max_size'] = '500';
        
        $this->load->library('upload', $config);
        $this->upload->initialize($config);

        if ($this->upload->do_upload('user_file_import')) {
            $data = array(
                'upload_data' => $this->upload->data()
            );
            $file = $data['upload_data']['file_name'];

            $fileopen = fopen('files/products/' . $file, "r");
            if ($fileopen) {
                while (($row = fgetcsv($fileopen, 2075, ",")) !== FALSE) {
                    $filearray[] = $row;
                }
                fclose($fileopen);
            }
            array_shift($filearray);

            $fields = array(
                'numdoc',
                'firstname1',
                'firstname2',
                'lastname1',
                'lastname2',
                'movil',
                'phone',
                'email',
                'city',
                'adresse'
            );

            $final = array();
            foreach ($filearray as $key => $value) {
                $customers[] = array_combine($fields, $value);
            }
            //print_r($products);
            date_default_timezone_set($this->setting->timezone);
            $date = date("Y-m-d H:i:s");
            $band=-1;

              foreach ($customers as $row) {
                //echo $row['numdoc'].'<br>';
                    $item = Customer::find('first', array('conditions' => array('numdoc = ? ', $row['numdoc'])));
                    if($item)
                    {
                      $band=1;
                    }
              
              }
              //die ("Aqui ".$band);
              if($band==-1)
              {
                  foreach ($customers as $row) {
                  
                  $data = array(

                      "typedoc" =>  1, 
                      "numdoc" =>  $row['numdoc'],
                      "firstname1" => $row['firstname1'],
                      "firstname2" => $row['firstname2'],
                      "lastname1" => $row['lastname1'],
                      "lastname2" => $row['lastname2'],
                      "movil" => $row['movil'],
                      "phone" => $row['phone'],
                      "email" => $row['email'],
                      "city" => $row['city'],
                      "adresse" => $row['adresse'],
                      "created_at" => $date
                  );
                  //print_r($data);
                  Customer::create($data);
                }                  
              }
              unlink('./files/products/' . $file);
              redirect('customers/index/'.$band);

        }
        //else die("error aqui".$this->upload->display_errors());
        redirect('customers');
    }

}
