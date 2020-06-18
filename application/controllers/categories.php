<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Categories extends MY_Controller
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
         
          $this->view_data['band'] = $band;
          $this->view_data['categories'] = Category::all();
          $this->content_view = 'category/view';
    }

    public function add()
    {
        date_default_timezone_set($this->setting->timezone);
        $date = date("Y-m-d H:i:s");
        $_POST['created_date'] = $date;
        $user = Category::create($_POST);
        redirect("categories", "refresh");
    }

    public function edit($id = FALSE)
    {
        if ($_POST) {
            $category = Category::find($id);
            $category->update_attributes($_POST);
            redirect("categories", "refresh");
        } else {
            $this->view_data['category'] = Category::find($id);
            $this->content_view = 'category/edit';
        }
    }

    public function delete($id)
    {
        $category = Category::find($id);
        $category->delete();
        redirect("categories", "refresh");
    }
     public function importcsv()
    {
        $config['upload_path'] = './files/products';
        $config['allowed_types'] = 'csv';
        $config['overwrite'] = TRUE;
        $config['max_size'] = '2000';
        
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
                'name'
            );

            $final = array();
            foreach ($filearray as $key => $value) {
                $products[] = array_combine($fields, $value);
            }
            //print_r($products);
            date_default_timezone_set($this->setting->timezone);
            $date = date("Y-m-d H:i:s");
            $band=-1;
            $i=0;

              foreach ($products as $prdct) {
                $i++;
                $item = Category::find('first', array('conditions' => array('name = ? ', $prdct['name'])));
                if(!$item)
                {                 
                  $data = array(
                      "name" => $prdct['name'],
                      "created_date" => $date
                  );
                  //print_r($data);
                  Category::create($data);
                }                  
              }

              unlink('./files/products/' . $file);
              redirect('categories/index/'.$band);

        }
        //else die("error aqui".$this->upload->display_errors());
        redirect('categories');
    }

    public function csv($type)
    {
        $this->load->dbutil();
        $this->load->helper('file');
        $this->load->helper('download');
        $delimiter = ",";
        $newline = "\r\n";
        $filename = "categorias.csv";
        $sql="SELECT name                      
              FROM   categories
              ";
        if($type==2)
        {
          $sql.=" LIMIT 1";
        }
        $result = $this->db->query($sql);
        $data = $this->dbutil->csv_from_result($result, $delimiter, $newline);
        force_download($filename, $data);
    }


}
