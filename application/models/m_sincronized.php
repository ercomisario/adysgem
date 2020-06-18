<?php
defined('BASEPATH') or exit('No direct script access allowed');

class m_sincronized extends CI_Model
{

 
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
   
    public function insertardata($json_data) {
      
        $this->db->empty_table("stocks");
        $data=$json_data['stocks'];
        foreach ($data as $data2) {            
             $this->db->insert('stocks', $data2);
        }
        $this->db->empty_table("expences");
        $data=$json_data['expences'];
        foreach ($data as $data2) {            
             $this->db->insert('expences', $data2);
        }
        $this->db->empty_table("catalog_expences");
        $data=$json_data['catalog_expences'];
        foreach ($data as $data2) {            
             $this->db->insert('catalog_expences', $data2);
        }
        $this->db->empty_table("stocks");
        $data=$json_data['stocks'];
        foreach ($data as $data2) {            
             $this->db->insert('stocks', $data2);
        }
        $this->db->empty_table("posales");
        $data=$json_data['posales'];
        foreach ($data as $data2) {            
             $this->db->insert('posales', $data2);
        }
        $this->db->empty_table("holds");
        $data=$json_data['holds'];
        foreach ($data as $data2) {            
             $this->db->insert('holds', $data2);
        }
        $this->db->empty_table("sales");
        $data=$json_data['sales'];
        foreach ($data as $data2) {            
             $this->db->insert('sales', $data2);
        }
        $this->db->empty_table("sale_items");
        $data=$json_data['sale_items'];
        foreach ($data as $data2) {            
             $this->db->insert('sale_items', $data2);
        }
        $this->db->empty_table("products");
        $data=$json_data['products'];
        foreach ($data as $data2) {            
             $this->db->insert('products', $data2);
        
        }
        $this->db->empty_table("customers");
        $data=$json_data['customers'];
        foreach ($data as $data2) {            
             $this->db->insert('customers', $data2);
        }        
        return true;

    }

}
