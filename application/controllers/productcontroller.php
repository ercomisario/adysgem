<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Productcontroller extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->user = $this->session->userdata('user_id') ? User::find_by_id($this->session->userdata('user_id')) : FALSE;
        $lang = $this->session->userdata("lang") == null ? "english" : $this->session->userdata("lang");
        $this->lang->load($lang, $lang);
        $this->register = $this->session->userdata('register') ? $this->session->userdata('register') : FALSE;
        $this->store = $this->session->userdata('store') ? $this->session->userdata('store') : FALSE;
        $this->setting = Setting::find(1);
    }


    public function add()
    {
      $warehouses = Warehouse::find('all');
      $stores = Store::find('all');
      $content = "";
      
      date_default_timezone_set($this->setting->timezone);
      $date = date("Y-m-d H:i:s");
      $config['upload_path'] = './files/products/';
      $config['encrypt_name'] = TRUE;
      $config['allowed_types'] = 'gif|jpg|jpeg|png';
      $config['max_width'] = '1000';
      $config['max_height'] = '1000';

        $array_tax=explode('|',$this->input->post('tax_sale_id'));
        $tax_sale_id=$array_tax[0];
        $name = strtoupper($this->input->post('name'));        
        $reference = $this->input->post('reference');

        $base = $this->input->post('base');
        $price = $this->input->post('price');
        $taxamount=$price-$base;
        $color="color01";
        if($this->input->post('color'))$color=$this->input->post('color');
        $arreglo = array(
                "type" => $this->input->post('type'),
                "name" => $name,
                "description" => $this->input->post('description'),
                "area_id" => $this->input->post('area_id'),
                "brand_id" => $this->input->post('brand_id'),
                "category_id" => $this->input->post('category_id'),
                "tax_sale_id" => $tax_sale_id,
                "taxamount" => $taxamount,
                "tax_purchase_id" => $this->input->post('tax_purchase_id'),
                
                "reference" => $reference,
                "h_stores" => $this->store.',',
                "st_max" => $this->input->post('st_max'),
                "st_min" => $this->input->post('st_min'),
                "combo_id" => $this->input->post('combo_id'),
                "presentation_id" => $this->input->post('presentation_id'),
                "identifier" => $this->input->post('identifier'),
                "fractional" => $this->input->post('fractional'),

                "alertqt" => $this->input->post('alertqt'),
                "cost_yt" => $this->input->post('cost_yt'),
                "cost_nt" => $this->input->post('cost_nt'),
                "base" => $base,
                "price" => $price,
                "price_major" => $this->input->post('price_major'),
                "price_credit" => $this->input->post('price_credit'),
                "utility" => $this->input->post('utility'),
                "utility_major" => $this->input->post('utility_major'),
                "utility_credit" => $this->input->post('utility_credit'),
                "color" => $color,
                "supplier_id" => $this->input->post('supplier_id'),
                //"quantity" => $this->input->post('quantity'),
                
                "commission" => $this->input->post('commission'),
                "cardtype_id" => $this->input->post('cardtype_id'),
                "desc_prog" => $this->input->post('desc_prog'),
                "start_date_desc" => $this->input->post('start_date_desc'),
                "end_date_desc" => $this->input->post('end_date_desc'),
                "commission_desc" => $this->input->post('commission_desc'),
                
                "sale_by_quantity" => $this->input->post('sale_by_quantity'),
                
                "min_1" => $this->input->post('min_1'),
                "max_1" => $this->input->post('max_1'),
                "price_1" => $this->input->post('price_1'),
                "utility_1" => $this->input->post('utility_1'),
                
                "min_2" => $this->input->post('min_2'),
                "max_2" => $this->input->post('max_2'),
                "price_2" => $this->input->post('price_2'),
                "utility_2" => $this->input->post('utility_2'),
                
                "min_3" => $this->input->post('min_3'),
                "max_3" => $this->input->post('max_3'),
                "price_3" => $this->input->post('price_3'),
                "utility_3" => $this->input->post('utility_3'),

                "photo" => '',
                "photothumb" => NULL,
                "modified_at" => $date,
                "created_at" => $date
              );
   
        $this->load->library('upload', $config);
        $this->upload->initialize($config);
        $this->load->library('image_lib');

        if ($this->upload->do_upload('user_file')) {
            $data = array(
                'upload_data' => $this->upload->data()
            );
            $config2['image_library'] = 'gd2';
            $config2['source_image'] = $data['upload_data']['full_path'];
            $config2['create_thumb'] = TRUE;
            $config2['maintain_ratio'] = TRUE;
            $config2['width'] = 120;
            $config2['height'] = 120;

            $this->image_lib->clear();
            $this->image_lib->initialize($config2);
            $this->image_lib->resize();

            $image = $data['upload_data']['file_name'];
            $image_thumb = $data['upload_data']['raw_name'] . '_thumb' . $data['upload_data']['file_ext'];
            $arreglo['photo']=$image;
            $arreglo['photothumb']=$image_thumb;
            //die(print_r($arreglo));
              //redirect("products", "refresh");
        } 
        //else {}
         $p=0;
         $txterror='';
         $product = Product::find('first', array('conditions' => array('name = ? ', $name)));
         if($product)
         {
            $p=1;
            $txterror='NOMBRE';
         }else{
            $product = Product::find('first', array('conditions' => array('reference = ? ', $reference)));
            if($product)
            {
               $p=1;
               $txterror='CÓDIGO';
            }
         }
         if($p==0)
         {
            $product = Product::create($arreglo);
            $code = "P".str_pad($product->id, 6, "0", STR_PAD_LEFT);
            $barcode=str_pad($product->id, 10, "0", STR_PAD_LEFT);

            $product->code=$code;
            $product->barcode=$barcode;
            $product->save();


            if($this->input->post('type') === '0')
            {
               $content .= '<div class="col-md-12">
               <input type="hidden" id="id_product" value="'.$product->id.'">
               <table class="table table-striped"><thead><tr><th width="40%">'.label("Store").'</th><th width="30%">'.label("Quantity").'</th><th width="30%">'.label("price").'</th></tr></thead><tbody class="itemslist">';
               foreach ($stores as $store) {
                  $content .= '<tr><td>'.$store->name.'</td><td><input type="number" id="quantity" store-id="'.$store->id.'" value="0"></td><td><input type="number" id="pricestr" store-id="'.$store->id.'" value="0"></td></tr>';
               }
               $content .= '  </tbody></table></div>';
            
            }
               /*elseif ($this->input->post('type') === '2') {
                  $content .= '<div><label for="add_item">'.label("AddProduct").'</label><input type="text" id="add_item" class="col-md-12"></div>
                  <div>
                  <label for="Comboprd">'.label("combination").'</label>
                  <table id="Comboprd" class="table items table-striped table-bordered table-condensed table-hover">
                  <thead>
                  <tr>
                  <th class="col-xs-9">'.label("ProductName").'</th>
                  <th class="col-xs-2">'.label("Quantity").'</th>
                  <th class=" col-xs-1 text-center"><i class="fa fa-trash-o trash-opacity-50"></i></th>
                  </tr>
                  </thead>
                  <tbody></tbody>
                  </table>
                  </div>';
               }*/

               $content .= '<input type="hidden" id="prodctID" value="'.$product->id.'">';
               echo $content;
         }
         else{
            
            echo $txterror;

         }
            
                  
    }


    public function modifystock($id)
    {
      $warehouses = Warehouse::find('all');
      $stores = Store::find('all');
      $product = Product::find($id);

      $content = '
       <div class="col-md-12">
       <table class="table table-striped">
          <thead>
             <tr>
                <th width="40%">'.label("Store").'</th>
                <th width="30%">'.label("Quantity").'</th>
             </tr>
          </thead>
          <tbody class="itemslist">';
           foreach ($stores as $store) {
               $cheked = false;
               $invis = $product->h_stores;
               $invis = trim($invis, ",");
               $array = explode(',', $invis); //split string into array seperated by ', '
               foreach($array as $value) //loop over values
               {
                  if($value == $store->id)
                    $cheked=true;
               }
               if($cheked) {
                   $stock = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $store->id, $id)));
                   $quantity = $stock ? $stock->quantity : '0';
                     $content .= '<tr>
                       <td>'.$store->name.'</td>
                       <td><input type="number" step="0.01" id="quantity" store-id="'.$store->id.'" value="'.$quantity.'" style="color: black;width: 7.1em;"></td>
                   </tr>';
                }
           }
        $content .= '  </tbody>
       </table></div>';

      /*$content .= '
        <div class="col-md-12">
        <table class="table table-striped">
           <thead>
              <tr>
                 <th width="40%">'.label("Warehouses").'</th>
                 <th width="30%">'.label("Quantity").'</th>
                 <th width="30%">'.label("price").'</th>
              </tr>
           </thead>
           <tbody class="itemslist">';
            foreach ($warehouses as $warehouse) {
               $stock = Stock::find('first', array('conditions' => array('warehouse_id = ? AND product_id = ?', $warehouse->id, $id)));
               $quantity = $stock ? $stock->quantity : '0';
                $content .= '<tr>
                  <td>'.$warehouse->name.'</td>
                  <td><input type="number" id="quantityw" warehouse-id="'.$warehouse->id.'" value="'.$quantity.'"></td>
                  <td><input type="number" id="pricew" value="" disabled="true"></td>
               </tr>';
            }
         $content .= '  </tbody>
        </table></div>';*/
        $content .= '<input type="hidden" id="prodctID" value="'.$id.'">';
        echo $content;
    }

    public function Viewproduct($id)
    {
      $warehouses = Warehouse::find('all');
      $stores = Store::find('all');
      $product = Product::find($id);

      $category = Category::find('first', array('conditions' => array('id = ? ', $product->category_id)));
      $category_name = $category ? $category->name : '0';
      
      $brand = Brand::find('first', array('conditions' => array('id = ? ', $product->brand_id)));
      $brand_name = $brand ? $brand->name : '0';
      
      $supplier = Supplier::find('first', array('conditions' => array('id = ? ', $product->supplier_id)));
      $supplier_name = $supplier ? $supplier->name : '0';
      
      $tax = Tax::find('first', array('conditions' => array('id = ? ', $product->tax_sale_id)));
      $tax_sale = $tax ? $tax->name : '0';
             

      if($product->photo)
         $photo = '<img class="media-object img-rounded" src="'.base_url().'files/products/'.$product->photo.'" alt="image" width="200px">';
      else
         $photo = '<img class="media-object img-rounded" src="http://dummyimage.com/200x200/e3e0e3/fff" alt="image" width="200px">';
      $content = '<div class="col-md-6"><div class="media">
         <div class="media-left">
               '.$photo.' <br>
               <b>'.label("LastDateSale").' :</b> '.$product->last_date_sale.' <br>
               <b>'.label("LastDatePurchase").' :</b> '.$product->last_date_purchase.' <br>
         </div>
      
         
         <div class="media-body">
          <h1 class="media-heading">'.$product->name.'</h1>
          <b>'.label("Category").' :</b> '.$category_name.' <br>
          <b>'.label("Brand").' :</b> '.$brand_name.' <br>
          <b>'.label("ProductTax").' :</b> '.$tax_sale.' <br>
          <b>'.label("Price").' :</b> '.$product->price.' <br>
          <b>'.label("PriceMajor").' :</b> '.$product->price_major.' <br>
          <b>'.label("PriceCredit").' :</b> '.$product->price_credit.' <br>
          <b>'.label("Supplier").' :</b> '.$supplier_name.' <br>
          <b>'.label("ProductDescription").' :</b><br> '.$product->description.'
         </div>
      </div></div>

      <div class="col-md-6">
      <table class="table">
          <thead>
             <tr>
                <th width="50%">'.label("Store").'</th>
                <th width="20%">'.label("Quantity").'</th>
                <th width="20%"><i class="fa fa-eye" aria-hidden="true"></i></th>
             </tr>
          </thead>
          <tbody class="itemslist">';
       foreach ($stores as $store) {
          if($product->type == '0'){
             $stock = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $store->id, $id)));
             $quantity = $stock ? $stock->quantity : '0';
          }else {
             $quantity = '-';
          }
          /************************************************* store visibility value ***************************************************************/
            $cheked = '';
            $invis = $product->h_stores;
            $invis = trim($invis, ",");
            $array = explode(',', $invis); //split string into array seperated by ', '
            foreach($array as $value) //loop over values
            {
               if($value == $store->id)
                    $cheked = 'checked';
            }
            $content .= '<tr>
             <td>'.$store->name.'</td>
             <td><b>'.$quantity.'</b></td>
             <td><label>
             <input type="checkbox" id="invis" name="invis" value="1" '.$cheked.' onclick="makePrdInvis('.$store->id.', '.$product->id.')">
             <span class="label-text"></span>
             </label></td>
          </tr>';
       }
       $content .= '  </tbody>
      </table>
      </div>';
      if ($product->type == 2) {
         $combos = Combo_item::find('all', array('conditions' => array('product_id = ?', $id)));
         $content .= '<div class="row"><div class="col-md-12"><h1>'.label("combinations").'</h1></div><div class="col-md-12"><table class="table">
             <thead>
                <tr>
                   <th class="col-xs-9">'.label("ProductName").'</th>
                   <th class="col-xs-2">'.label("Quantity").'</th>
                </tr>
             </thead>
             <tbody>';
             foreach ($combos as $combo) {
                $prod = product::find($combo->item_id);
                $content .= '<tr>
                  <td><a href="javascript:void(0)" onclick="Viewproduct('.$combo->item_id.')">'.$prod->name.' ('. $prod->code .')</a></td>
                  <td><b>'.$combo->quantity.'</b></td>
               </tr>';
             }
             $content .= '  </tbody>
           </table></div></div><button type="submit" class="btn btn-add col-md-12" style="margin-bottom:0" onclick="modifycombo('.$id.')">'.label("Modify").'</button>';
      }
      echo $content;

   }

   function GenerateBarcode($code = NULL, $bcs = 'code128', $height = 60, $width = 1)
   {
      $this->load->library('zend');
      $this->zend->load('Zend/Barcode');
      $barcodeOptions = array(
           'text' => $code,
           'barHeight' => $height,
           'barThinWidth' => $width
      );
      //print_r($barcodeOptions);
      $rendererOptions = array(
           'imageType' => 'png',
           'horizontalPosition' => 'center',
           'verticalPosition' => 'middle'
      );
      $imageResource = Zend_Barcode::render($bcs, 'image', $barcodeOptions, $rendererOptions);
      return $imageResource;
   }

   public function barcode($row, $num, $productBcode, $name, $precio, $description, $reference)
   {
      $content = '';
      $bcs = 'code128';
      $height = 10;
      $width = 1;
      if($reference>0)
        $codigo=$reference;
      else
      {
        $codigo=sprintf("%010d", $productBcode);
        $product = Product::find($productBcode);
        $product->reference=$codigo;
        $product->save();

      }

      for ($i=0; $i < $num; $i++) {
         $content .= '<div class="col-sm-'.$row.'" style="text-align:center; margin-bottom: 10px;">
            <div style="width:250px; border:2px solid black; border-radius:3%;">
               <span style="font-size: 10px; float:left;">
             '.urldecode($name).' </span><br>
              <span style="font-weight: bold;font-size: 28px; text-align:center;">
             '.sprintf("%.0f", $precio).' </span><br>
             <span style="font-size: 8px;float: left;">
             '.date('d/m/Y',time()). '<br>'.urldecode($description).' </span>          
            <div align="right"><img src="' . site_url('productcontroller/GenerateBarcode/' . $codigo. '/' . $bcs . '/' . $height . '/' . $width) . '" alt="'.$productBcode.'" />
           </div></div>
        </div>
       ';
      } 

   echo $content;
   }
   public function barcodeprice($productBcode)
   {
      $product = Product::find('first', array('conditions' => array('reference = ?', $productBcode)));
      $content = '';
      $image = 'sin_imagen.jpg';

      if($product)
      {
          $description = $product->description;
          $name = $product->name;
          $price = $product->price;
          if($product->photothumb)
              $image = $product->photothumb;
          
          $bcs = 'code128';
          $height = 40;
          $width = 3;
          $content .= '
            <div style="text-align: center; width: 170px">
              <img src="'.base_url().'assets/img/logo.png" width="170" style="margin-left: 10px;margin-top: 50px;">
            </div>';
            
         $content .= '<div style="text-align:center; margin-bottom: 10px;">
            <div style="width:720px; border:2px solid black; border-radius:3%;margin-top: 10px;margin-left: 20px;">
               <span style="font-size: 20px; float:left; margin-left: 20px;">
             '.urldecode($name).' </span><br>
              <span style="font-weight: bold;font-size: 30px;">
             '.number_format($price, $this->setting->decimals, ',', '.').'</span><br>
             <span style="font-size: 20px;float: left;  margin-left: 20px;">
             '.date('d/m/Y',time()). '<br>'.urldecode($description).' </span>          
            <div align="right" style="margin-top: 25px;"><img src="' . site_url('productcontroller/GenerateBarcode/'.$productBcode.'/'. $bcs.'/'. $height.'/'.$width).'" alt="'.$productBcode.'" />
           </div></div>
        </div>
       ';
       $content .= '
            <div style="text-align: center; width: 170px;margin-left:10px;">
               <img src="'.base_url().'files/products/'.$image.'" width="170">
            </div>';
       }
       else
       {
          $content .= '
            <div style="text-align: center; width: 170px">
              <img src="'.base_url().'assets/img/logo.png" width="170" style="margin-left: 10px;margin-top: 40px;">
            </div>';
          $content .= '
            <div class="well" style="background-color: white;margin-bottom:10px; text-align: center; height: 115px; border: solid #666666 1px; width: 730px; margin-left:20px; margin-top:10px;">
                <span style="margin-top:40px;">PRODUCTO NO REGISTRADO</span>
            </div>';

          $content .= '
            <div style="text-align: center; width: 150px">
               <img src="'.base_url().'files/products/'.$image.'" width="150" style=" margin-left:10px; margin-top:10px;">
            </div>';
         
       }  
       

      echo $content;
   }

   /****************************************** combo functions *****************************************/

   public function getProductNames($term) {
      $prd = Product::find('all', array('select' => 'name'), 
                                  array('conditions' => "(name LIKE '%" . $term . "%'  OR code LIKE '%" . $term . "%') AND type != 2"));
      if ($prd) {
           return $prd;
      }
      return FALSE;
   }
   public function getProductPrice($term) {
    $term=urldecode($term);
      $prd = Product::find('all', array('select' => 'code', 'select' => 'name', 'select' => 'price', 'select' => 'description'),array('conditions' => "(name LIKE '%" . $term . "%' OR reference LIKE '%" . $term . "%') AND type != 2 AND in_activo = 1"));
      if ($prd) {
           return $prd;
      }
      return FALSE;
   }

   public function suggest()
   {
        $term = $this->input->get('term', TRUE);

        $rows = $this->getProductNames($term);
        if ($rows) {
            foreach ($rows as $row) {
               $pr[] = array('id' => $row->id, 'label' => $row->name, 'name' => $row->name, 'code' => $row->code, 'cost' => $row->cost);
            }
            echo json_encode($pr);
        } else {
            echo json_encode(array('id' => 0, 'label' => label('NoProduct')));
        }
    }
   public function searchPrice($term=NULL)
   {
        //$term = $this->input->post('term');
        $data = '';
        $rows = '';
        $i=-1;

        if(strlen($term)>2)
            $rows = $this->getProductPrice($term);
         
        if ($rows) 
        {
              
                $fila = '<div class="col-sm-12" id="rowProduct">
                            <div class="col-xs-3 nopadding">
                              <span class="text-left">' . label('Reference'). '</span> 
                            </div>
                            <div class="col-xs-7 nopadding">
                              <p class="text-left">' . label('ProductName') . '</p>
                            </div>                              
                            <div class="col-xs-2 nopadding">
                              <p class="text-left">' . label('Price') . '</p>
                            </div>
                        </div>';

                $data .= $fila;

            foreach ($rows as $row) 
            {
               $cheked = false;
               $invis = $row->h_stores;
               $invis = trim($invis, ",");
               $array = explode(',', $invis); //split string into array seperated by ', '
               foreach($array as $value) //loop over values
               {
                  if($value == $this->store)
                     $cheked = true;
               }
               if($cheked) {
               $i++;
                $fila = '<div class="col-sm-12" id="rowProduct_'.$i.'" style="background-color: white;white;color: gray;">
                            <div class="col-xs-3 nopadding">
                                <span id="codeProduct_'.$i.'" class="text-left">' . $row->reference . '</span> 
                                <input type="hidden" id="hdnIdProduct_'.$i.'" value="'.$row->id.'">
                            </div>
                            <div class="col-xs-7 nopadding">
                                <p class="text-left">' . $row->name . '</p>
                            </div>                         
                            <div class="col-xs-2">
                              <p class="text-left">' . number_format((float)$row->price, $this->setting->decimals, ',', '.').'</p>
                            </div>
                        </div>';

                $data .= $fila;
              }

            }
            $data.='<input type="hidden" id="hdnSearchProduct" value="'.($i+1).'">';

        } 
        echo $data;

   }
   public function searchProduct()
   {
        $id = $this->input->post('id');
        $term = $this->input->post('term');
        $store_id = $this->input->post('store_id');
        
 
        $data = '';
        $rows = '';
        if(strlen($term)>2)
            $rows = $this->getProductPrice($term);
         
        if ($rows) {
                $taxes = Tax::all();
                if ($this->register) {
                    $Register = Register::find($this->register);
                    $store = Store::find($Register->store_id);
                    $storeId = $store->id;
                    $storeName = $store->name;
                    
                }
                else
                {
                    $store = Store::find($store_id);
                    $storeId = $store->id;
                    $storeName = $store->name;

                }


                $row = '<div class="col-sm-12">
                            <div class="col-xs-2 nopadding">
                              <p class="text-left">' . label('ProductDescription') . '</p>
                            </div>                              
                            <div class="col-xs-2 nopadding">
                              <p class="text-center">' . label('Fecha expedición') . '</p>
                            </div>                              
                            <div class="col-xs-2 nopadding">
                              <p class="text-center">' . label('Fecha vencimiento') . '</p>
                            </div>                              
                            <div class="col-xs-1 nopadding">
                              <p class="text-center">' . label('Lote') . '</p>
                            </div>                              
                            <div class="col-xs-1 nopadding">
                              <p class="text-center">' . label('Tax') . '</p>
                            </div>                              
                            <div class="col-xs-1 nopadding">
                              <p class="text-center">' . label('Cost') . '</p>
                            </div>                              
                            <div class="col-xs-1 nopadding">
                              <p class="text-center">' . label('Quantity') . '</p>
                            </div>                              
                            <div class="col-xs-1 nopadding">
                              <p class="text-center">' . label('Price') . '</p>
                            </div>                              
                            <div class="col-xs-1 nopadding">
                              <p class="text-center">' . label('Action') . '</p>
                            </div>
                        </div>';

                $data .= $row;

            foreach ($rows as $row_rec) {
                $in_stock= 0;
                $stock = Stock::find('all', array('conditions' => array('product_id = ? AND store_id = ?', $row_rec->id, $storeId)));
                foreach ($stock as $qt_st) {

                 $in_stock=$qt_st->quantity;

                }

                
                $row = '<div class="col-sm-12">
                            <div class="col-xs-2 nopadding">
                                <p class="text-left">' . $row_rec->description . ' ' . $row_rec->reference . '</p>
                            </div>';    
                    $row .='<div class="col-xs-2">
                              <input type="text" name="date_exp_'.$row_rec->id.'" class="form-control date_purchase" id="date_exp_'.$row_rec->id.'" readonly>
                            </div>                                                    
                            <div class="col-xs-2">
                              <input type="text" name="date_ven_'.$row_rec->id.'" class="form-control date_purchase" id="date_ven_'.$row_rec->id.'" readonly>
                            </div>     
                            <div class="col-xs-1">
                              <input type="text" id="lote_'.$row_rec->id.'" size="5" name="lote_'.$row_rec->id.'" class="form-control" value="0">
                            </div>
                            <div class="col-xs-1">
                               <select class="form-control" name="tax_id_'.$row_rec->id.'" id="tax_id_'.$row_rec->id.'">
                                 <option value="">'.label("Choice").'</option>';
                                 foreach ($taxes as $row_tax):
                                    $row .= '<option value="'.$row_tax->id.'"';
                                    if($row_tax->id==$row_rec->tax_sale_id)
                                      $row .= ' selected ';

                                    $row .= '>'.$row_tax->name.'</option>';
                                 endforeach;
                         $row .= '</select>
                          

                            </div>
                            <div class="col-xs-1">
                              <input type="text" id="idcost_'.$row_rec->id.'" name="idcost_'.$row_rec->id.'" class="form-control" value="0">

                            </div>
                            <div class="col-xs-1">
                              <input type="number" id="idqt_'.$row_rec->id.'" size="5" name="idqt_'.$row_rec->id.'" class="form-control" value="0">
                            </div>
                            <div class="col-xs-1">
                              <input type="text" id="idprice_'.$row_rec->id.'" name="idprice_'.$row_rec->id.'" class="form-control" value="' . $row_rec->price . '" readonly>
                            </div>

                            <div class="col-xs-1">
                                <div class="btn-group">
                                 <a class="btn btn-default" href="javascript:void(0)" data-toggle="tooltip" data-placement="top" title="Agregar Producto" onclick="addItemPurchase('.$id.','.$row_rec->id.')"><i class="glyphicon glyphicon-save"></i></a>
                               </div>
                            </div>

                            
                        </div>';

                $data .= $row;

            }
            $data.='<script type="text/javascript">
                    $(document).ready(function() {
                      $(".date_purchase").datepicker({
                        todayHighlight: true,
                        format:"yyyy-mm-dd"
                        });
                    });
                    </script>';

        } 
        echo $data;

    }

    public function addcombo()
    {
      $items = $this->input->post('items');
      $productID = $this->input->post('productID');
      if ($items) {
         $combos = Combo_item::delete_all(array(
            'conditions' => array(
                'product_id = ?',
                $productID
            )
        ));
         foreach ($items as $item) {
            $item['product_id'] = $productID;
            unset($item['code']);
            unset($item['name']);
            Combo_item::create($item);
         }
      }
   }

   public function modifycombo($id)
   {
      $combos = Combo_item::find('all', array('conditions' => array('product_id = ?', $id)));

      $content = '<div><label for="add_item">'.label("AddProduct").'</label><input type="text" id="add_item" class="col-md-12"></div>
         <div>
         <label for="Comboprd">'.label("combination").'</label>
         <table id="Comboprd" class="table items table-striped table-bordered table-condensed table-hover">
         <thead>
         <tr>
         <th class="col-xs-9">'.label("ProductName").'</th>
         <th class="col-xs-2">'.label("Quantity").'</th>
         <th class=" col-xs-1 text-center"><i class="fa fa-trash-o trash-opacity-50"></i></th>
         </tr>
         </thead>
         <tbody>';
         foreach ($combos as $combo) {
            $prod = Product::find($combo->item_id);
            $content .= '<tr id="rowid_' . $combo->item_id . '" class="item_' . $combo->item_id . '">
              <td>'.$prod->name.' ('. $prod->code .')</td>
              <td><b>'.$combo->quantity.'</b></td>
              <td><i class="fa fa-times tip delt" id="' . $combo->item_id . '" title="Remove" style="cursor:pointer;"></i></td>
              </tr>';
         }
         $content .= '</tbody>
         </table>
         </div>
         <input type="hidden" id="prodctID" value="'.$id.'">';

      echo $content;

   }

   public function getcombos($id){
      $combos = Combo_item::find('all', array('conditions' => array('product_id = ?', $id)));

      if ($combos) {
          foreach ($combos as $row) {
             $prod = Product::find($row->item_id);
             $pr[] = array('item_id' => $row->item_id, 'quantity' => $row->quantity, 'code' => $prod->code, 'name' => $prod->name);
          }
          echo json_encode($pr);
      }else {
         echo json_encode();
      }

   }




   /********************* make product invisible on a store *******************************/

   public function makePrdInvis($id, $productId){
      $product = Product::find($productId);
      $cheked = false;
      $newVal = '';
      $invis = $product->h_stores;
      $invis = trim($invis, ",");
      $array = explode(',', $invis); //split string into array seperated by ','
      foreach($array as $value) //loop over values
      {
         if(intval($value) == intval($id)){
            $newVal = $newVal;
            $cheked = true;
         }else {
            $newVal .= $value.',';
         }
      }
      if(!$cheked){
         $product->h_stores .= $id.',';
         $product->save();
      }else{
         $product->h_stores = $newVal;
         $product->save();
      }
      echo json_encode(array(
          "status" => TRUE
      ));
   }
   public function addStoreSession(){
      $store_id=$this->input->post('store_id');
      $CI = & get_instance();
      $CI->session->set_userdata('store', $store_id);

      echo json_encode(array(
          "status" => TRUE
      ));
   }

}
