<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Dashboard extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        if (! $this->user) {
            redirect('login');
        }
        $this->load->model('catalog_expence', 'Catalog_expence');
        $this->register = $this->session->userdata('register') ? $this->session->userdata('register') : FALSE;
        $this->store = $this->session->userdata('store') ? $this->session->userdata('store') : FALSE;
    }

    public function index()
    {
       $sql="SELECT  a.id, a.name, a.price, a.price_major, a.price_credit, 
                     a.color, a.photo, a.photothumb, a.reference,
                     a.description, a.h_stores, a.type, a.code, a.quantity,
                     a.tax_sale_id, 
                     b.name AS brand_name, 
                     c.name AS category_name,
                     d.name AS tax_name

              FROM   products a, brands b, categories c, taxes d

              WHERE  a.brand_id=b.id  and a.category_id=c.id and a.tax_sale_id=d.id";
              
      $products = Product::find_by_sql($sql);

      //$products = Product::all();
      if($this->register){
         $register = Register::find($this->register);
         foreach ($products as $product) {
            if($product->type == '0'){
               $stock = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $register->store_id, $product->id)));
               $price = $stock ? ($stock->price > 0 ? $stock->price : $product->price) :$product->price;
               $product->price = $price;
               if($stock)
                  $product->quantity = $stock->quantity;
               else
                  $product->quantity = 0;
            }
         }
      }
        date_default_timezone_set($this->setting->timezone);
        $date = date("Y-m-d");
     
        if ($this->register) {
            $Register = Register::find($this->register);
            $store = Store::find($Register->store_id);
            $this->view_data['storeName'] = $store->name;
            $this->view_data['storeId'] = $store->id;
        } 
        //*else {
            $user=User::find($this->session->userdata('user_id'));
            $stores=Store::find($user->store_id);
            if($user->role=='admin')
            {
              $sql="SELECT a.store_id, b.date FROM holds a, registers b WHERE a.register_id=b.id AND a.user_id=".$user->id;
              $this->view_data['holdIdStore'] = Hold::find_by_sql($sql);

              /*$holds=Hold::find('all', array('conditions' => array('user_id = ? ', $user->id)));
              $this->view_data['holdIdStore'] = $holds;*/

            }
            else
            {
              $holds=Hold::find('first', array('conditions' => array('user_id = ? ', $user->id)));
              if($holds)
                $this->view_data['holdIdStore'] = $holds->store_id;
              else
                $this->view_data['holdIdStore'] = null;
              
            }
            //print_r($stores);
            $this->view_data['storeIdUser'] = $stores->id;

            //die();


        //}

        $emailadmins = user::find('all', array('conditions' => array('role = ?', 'admin')));
        //$invoices = Sale::find('all', array('conditions' => array('role = ?', 'admin')));
        
        //die(print_r($products));
        //$this->view_data['expenses'] = Catalog_expence::all();
        $this->view_data['expenses'] = Catalog_expence::find('all', array('conditions' => array('id not in (1,9) ')));

        $this->view_data['customers'] = Customer::all();
        $this->view_data['emailadmins'] = $emailadmins;
        $this->view_data['products'] = $products;
        $this->view_data['categories'] = Category::all();
        $this->view_data['stores'] = Store::all();
        $this->view_data['licencias'] = Licencia::find(1);
        //$this->view_data['stores'] = Store::find($user->store_id);
        if (! Posale::first()) {
            $hold = Hold::last();
            if ($hold)
                $hold->update_attributes(array(
                    'time' => date("H:i")
                ));
        }
        $this->content_view = 'pos';
    }

    public function change($type)
    {
        $this->session->set_userdata('lang', $type);
        $this->setting->language = $type;
        $this->setting->save();
        redirect("", "refresh");
    }
}
