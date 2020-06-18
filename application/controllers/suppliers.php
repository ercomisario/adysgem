<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Suppliers extends MY_Controller
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
        $this->view_data['suppliers'] = Supplier::all();
        $sql="SELECT a.id, a.name, a.numdoc, 
                     a.email, a.phone,
                     a.city, a.created_at,
                     (SELECT count(*) FROM purchases WHERE supplier_id=a.id) AS total 

              FROM   suppliers a ";
    
        $this->view_data['suppliers'] = Supplier::find_by_sql($sql);

        $this->view_data['band'] = $band;
        $this->content_view = 'supplier/view';
    }

    public function add()
    {
        date_default_timezone_set($this->setting->timezone);
        $date = date("Y-m-d H:i:s");
        $_POST['created_at'] = $date;
        $supplier = Supplier::create($_POST);
        redirect("suppliers", "refresh");
    }

    public function edit($id = FALSE)
    {
        if ($_POST) {
            $supplier = Supplier::find($id);
            $supplier->update_attributes($_POST);
            redirect("suppliers", "refresh");
        } else {
            $this->view_data['supplier'] = Supplier::find($id);
            $this->content_view = 'supplier/edit';
        }
    }

    public function delete($id)
    {
        $supplier = Supplier::find($id);
        $supplier->delete();
        redirect("suppliers", "refresh");
    }
    public function csv($type)
    {
        $this->load->dbutil();
        $this->load->helper('file');
        $this->load->helper('download');
        $delimiter = ",";
        $newline = "\r\n";
        $filename = "suppliers.csv";
        $query = "SELECT numdoc, name, movil1, movil2, phone, email, city, adresse, note FROM suppliers";
         
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
                'name',
                'movil1',
                'movil2',
                'phone',
                'email',
                'city',
                'adresse',
                'note'
            );

            $final = array();
            foreach ($filearray as $key => $value) {
                $suppliers[] = array_combine($fields, $value);
            }
            //print_r($products);
            date_default_timezone_set($this->setting->timezone);
            $date = date("Y-m-d H:i:s");
            $band=-1;

              foreach ($suppliers as $row) {
                //echo $row['numdoc'].'<br>';
                    $item = Supplier::find('first', array('conditions' => array('numdoc = ? ', $row['numdoc'])));
                    if($item)
                    {
                      $band=1;
                    }
              
              }
              //die ("Aqui ".$band);
              if($band==-1)
              {
                  foreach ($suppliers as $row) {
                  
                  $data = array(

                      "typedoc" =>  1, 
                      "type" =>  1, 
                      "regime" =>  1, 
                      "numdoc" =>  $row['numdoc'],
                      "name" => $row['name'],
                      "movil1" => $row['movil1'],
                      "movil2" => $row['movil2'],
                      "phone" => $row['phone'],
                      "email" => $row['email'],
                      "city" => $row['city'],
                      "adresse" => $row['adresse'],
                      "note" => $row['note'],
                      "created_at" => $date
                  );
                  //print_r($data);
                  Supplier::create($data);
                }                  
              }
              unlink('./files/products/' . $file);
              redirect('suppliers/index/'.$band);

        }
        //else die("error aqui".$this->upload->display_errors());
        redirect('suppliers');
    }
}
