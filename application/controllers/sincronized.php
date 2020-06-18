<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Sincronized extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model('m_sincronized');
        $this->load->helper('file');

    }

    public function extraerdata()
    {
        $data = Stock::all();
        foreach ($data as &$result) {
            $arreglo['stocks'][] = $result->to_array();
        }
        $data = Expence::all();
        foreach ($data as &$result) {
            $arreglo['expences'][] = $result->to_array();
        }
        $data = catalog_expence::all();
        foreach ($data as &$result) {
            $arreglo['catalog_expences'][] = $result->to_array();
        }
        $data = Posale::all();
        foreach ($data as &$result) {
            $arreglo['posales'][] = $result->to_array();
        }
        $data = Hold::all();
        foreach ($data as &$result) {
            $arreglo['holds'][] = $result->to_array();
        }
        $data = Sale::all();
        foreach ($data as &$result) {
            $arreglo['sales'][] = $result->to_array();
        }
        $data = Sale_item::all();
        foreach ($data as &$result) {
            $arreglo['sale_items'][] = $result->to_array();
        }
        $data = Product::all();
        foreach ($data as &$result) {
            $arreglo['products'][] = $result->to_array();
        }
        $data = Customer::all();
        foreach ($data as &$result) {
            $arreglo['customers'][] = $result->to_array();
        }                
        echo json_encode($arreglo);
        $archivo='./files/data_migrada.json';
        @chmod($archivo, 0777);
        $fp = fopen($archivo, 'w');
        fwrite($fp, json_encode($arreglo));
        

    }
    public function insertardata()
    {
       
        $arregloJson = file_get_contents("./files/data_migrada.json");
        
        $arreglo=json_decode($arregloJson,true);        
        
        $resp=$this->m_sincronized->insertardata($arreglo);
        

    }
}
