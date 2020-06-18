<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Products extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        if (! $this->user) {
            redirect('login');
        }
    $this->store = $this->session->userdata('store') ? $this->session->userdata('store') : FALSE;

    }

    public function index($result=NULL)
    {

      if($result)
      {
          $arreglo=explode('~', $result);
          $band=$arreglo[0];
          $line=$arreglo[1];
          $textcampo=$arreglo[2];
          $textcampo = str_replace("%20"," ",$textcampo);

      }
      else
      {
          $band=NULL;
          $line=NULL;
          $textcampo=NULL;
      } 

      $supplier = $this->input->post('filtersupp') ? $this->input->post('filtersupp') : '99';
      $supplierF = $supplier === '99' ? '99' : 'supplier';
      $type = $this->input->post('filtertype') || $this->input->post('filtertype') === '0' ? $this->input->post('filtertype') : '99';
      $typeF = $type === '99' ? '99' : 'type';
       //echo $supplierF.' = '.$supplier. ' // ' .$typeF.' = '.$type;
       
      $sql="SELECT   a.id as id, a.name as name, a.description as description, a.type as type, 
                     a.code as code, a.price as price, a.photo as photo, a.color as color, a.quantity as quantity, a.reference, a.in_activo, 
                     a.base as base, 
                     a.cost_yt as cost_yt,
                     b.name AS area_name,
                     c.name AS tax_name 

              FROM   products a, areas b, taxes c 

              WHERE  a.area_id = b.id
              AND    a.tax_sale_id=c.id 
              AND    99=99 AND 99=99";
    // $sql;
      
     $this->view_data['products'] = Product::find_by_sql($sql);
      //$this->view_data['id_product'] = Product::find_by_sql($sql);

     // $this->view_data['products'] = Product::find('all', array('conditions' => array($supplierF.' = ? AND '.$typeF.' = ?', $supplier, $type)));
      //   $this->view_data['products'] = Product::all();
      $this->view_data['supplierF'] = $supplier;
      $this->view_data['typeF'] = $type;
      $this->view_data['categories'] = Category::all();
      $this->view_data['suppliers'] = Supplier::all();
      $this->view_data['warehouses'] = Warehouse::all();
      $this->view_data['taxes'] = Tax::all();
      $this->view_data['presentations'] = presentation::all();
      $this->view_data['areas'] = Area::all();
      $this->view_data['brands'] = Brand::all();
      $this->view_data['stores'] = Store::all();
      $this->view_data['band'] = $band;
      $this->view_data['line'] = $line;
      $this->view_data['textcampo'] = $textcampo;
      $this->view_data['store'] = $this->store;
      $this->content_view = 'product/view';
    }
    public function addCategory()
    {
        date_default_timezone_set($this->setting->timezone);
        $date = date("Y-m-d H:i:s");            
        $name=$this->input->post('name');
        $category=$this->input->post('category');
        //echo $category;

        if($category=='area')
        {
            $label='Segmento';
            $name = strtoupper($name);
            $item = Area::find('first', array('conditions' => array('name = ? ', $name)));
            if(!$item)
            {
                $data = array(
                      "name" => $name,                      
                      "created_at" => $date
                );
                Area::create($data);
            }
            $items=Area::all();
        }
        if($category=='category')
        {
            $label='Categoría';
            $name = strtoupper($name);
            $item = Category::find('first', array('conditions' => array('name = ? ', $name)));
            if(!$item)
            {
                $data = array(
                      "name" => $name,                      
                      "created_date" => $date
                );
                Category::create($data);
            }
            $items=Category::all();
        }
        if($category=='brand')
        {
            $label='Marca';
            $name = strtoupper($name);
            $item = Brand::find('first', array('conditions' => array('name = ? ', $name)));
            if(!$item)
            {
                $data = array(
                      "name" => $name,                      
                      "created_date" => $date
                );
                Brand::create($data);
            }
            $items=Brand::all();
        }
        $arreglo='<select class="form-control" name="'.$category.'_id" id="'.$category.'_id" Required>
                      <option value="" >'.$label.'</option>';
                      foreach ($items as $row):
                      $arreglo.='<option value="'.$row->id.'">'.$row->name.'</option>';
                      endforeach;
        $arreglo.='</select>'; 
        //die();
        echo $arreglo;
        die();
        
    }
    public function addSupplier()
    {
        date_default_timezone_set($this->setting->timezone);
        $date = date("Y-m-d H:i:s");
        $name=$this->input->post('name');
        $type=$this->input->post('type');
        $typedoc=$this->input->post('typedoc');
        $numdoc=$this->input->post('numdoc');
        $regime=$this->input->post('regime');

        $dataDB = array(
                      "name" => $name,
                      "type" => $type,
                      "typedoc" => $typedoc,
                      "numdoc" => $numdoc,
                      "regime" => $regime,
                      "created_at" => $date
                  );
        
        
        Supplier::create($dataDB);
        $items=Supplier::all();

        $arreglo='<select class="form-control" name="supplier_id" id="supplier_id" Required>
                      <option value="" >Proveedor</option>';
                      foreach ($items as $row):
                      $arreglo.='<option value="'.$row->id.'">'.$row->name.'</option>';
                      endforeach;
        $arreglo.='</select>'; 
        //die();
        echo $arreglo;
        die();
      
        redirect("products", "refresh");
    }


    public function csv($type)
    {
        $this->load->dbutil();
        $this->load->helper('file');
        $this->load->helper('download');
        $delimiter = ",";
        $newline = "\r\n";
        $filename = "products.csv";
        $sql="SELECT a.reference as reference,
                     a.name as name, 
                     c.name AS category,
                     d.name AS brand,
                     b.name AS area,
                     f.name AS supplier ,
                     a.price as price,
                     e.name AS tax,
                     a.description as description          
                     

              FROM   products a, areas b, categories c, brands d, taxes e, suppliers f 

              WHERE  a.area_id = b.id
              AND    a.category_id=c.id 
              AND    a.brand_id=d.id 
              AND    a.tax_sale_id=e.id 
              AND    a.supplier_id=f.id
              ";
        if($type==2)
        {
          $sql.=" LIMIT 1";
        }
        $result = $this->db->query($sql);
        $data = $this->dbutil->csv_from_result($result, $delimiter, $newline);
        force_download($filename, $data);
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
                'reference',
                'name',
                'category',
                'brand',
                'area',
                'supplier',
                'price',
                'tax',
                'description'
            );

            $final = array();
            foreach ($filearray as $key => $value) {
                $products[] = array_combine($fields, $value);
            }
            //print_r($products);
            date_default_timezone_set($this->setting->timezone);
            $date = date("Y-m-d H:i:s");
            $line=-1;
            $band=-1;
            $i=0;
            $textcampo='';

              foreach ($products as $prdct) {
                $i++;
                $item = Category::find('first', array('conditions' => array('name = ? ', $prdct['category'])));
                if(!$item)
                {
                  if($line==-1)
                  {
                      $band=1;
                      $line=$i;
                      $textcampo=$prdct['category'];
                  } 
                }
                $item = Brand::find('first', array('conditions' => array('name = ? ', $prdct['brand'])));
                if(!$item)
                {
                  if($line==-1)
                  {
                      $band=2;
                      $line=$i;
                      $textcampo=$prdct['brand'];
                  }
                }
                $item = Area::find('first', array('conditions' => array('name = ? ', $prdct['area'])));
                if(!$item)
                {
                  if($line==-1)
                  {
                      $band=3;
                      $line=$i;
                      $textcampo=$prdct['area'];
                  }
                }
                $item = Supplier::find('first', array('conditions' => array('name = ? ', $prdct['supplier'])));
                if(!$item)
                {
                  if($line==-1)
                  {
                      $band=4;
                      $line=$i;
                      $textcampo=$prdct['supplier'];
                  }
                }
                $item = Tax::find('first', array('conditions' => array('name = ? ', $prdct['tax'])));
                if(!$item)
                {
                  if($line==-1)
                  {
                      $band=5;
                      $line=$i;
                      $textcampo=$prdct['tax'];
                  }
                }
                $item = Product::find('first', array('conditions' => array('name = ? ', $prdct['name'])));
                if($item)
                {
                  if($line==-1)
                  {
                      $band=6;
                      $line=$i;
                      $textcampo=$prdct['name'];
                  }
                }          
                $item = Product::find('first', array('conditions' => array('reference = ? ', $prdct['reference'])));
                if($item)
                {
                  
                  if($line==-1)
                  {
                      $band=7;
                      $line=$i;
                      $textcampo=$prdct['reference'];
                  }
                }
              
              }
              //echo "Aqui ".$band;
              if($band==-1)
              {
                  foreach ($products as $prdct) {
                  $item = Category::find('first', array('conditions' => array('name = ? ', $prdct['category'])));
                  $category_id=$item->id;
                  $item = Brand::find('first', array('conditions' => array('name = ? ', $prdct['brand'])));
                  $brand_id=$item->id;
                  $item = Area::find('first', array('conditions' => array('name = ? ', $prdct['area'])));
                  $area_id=$item->id;
                  $item = Supplier::find('first', array('conditions' => array('name = ? ', $prdct['supplier'])));
                  $supplier_id=$item->id;
                  $item = Tax::find('first', array('conditions' => array('name = ? ', $prdct['tax'])));
                  $tax_sale_id=$item->id;
                  $tax_value=$item->value;

                  $price = $prdct['price'];
                  $base = $price/(1 + $tax_value/100);
                  $cost_nt = $base;
                  $cost_yt = $price;
                  $taxamount = $price - $base;

               /*   $sql_id=" SELECT `AUTO_INCREMENT` as id
                            FROM  INFORMATION_SCHEMA.TABLES
                            WHERE TABLE_SCHEMA = 'u737899455_zarpo'
                            AND   TABLE_NAME   = 'products'";
                  //echo $sql_id;
                  $id_products = Product::find_by_sql($sql_id);
                  foreach ($id_products as $id_product) {
                    $id_product=$id_product->id;
                  }
                */
                  $data = array(
                      "reference" => $prdct['reference'],
                      "name" => $prdct['name'],
                      "category_id" => $category_id,
                      "supplier_id" => $supplier_id,
                      "price" => $price,
                      "base" => $base,
                      "cost_yt" => $cost_yt,
                      "cost_nt" => $cost_nt,
                      "taxamount" => $taxamount,
                      "brand_id" => $brand_id,
                      "area_id" => $area_id,
                      "h_stores" => $this->store.',',
                      "description" => $prdct['description'],
                      "tax_sale_id" => $tax_sale_id,
                      "price" => $prdct['price'],
                      "color" => 'color01',
                      "photo" => '',
                      "created_at" => $date,
                      "modified_at" => $date
                  );
                  //print_r($data);
                  $product=Product::create($data);
                  $code = "P".str_pad($product->id, 6, "0", STR_PAD_LEFT);
                  $product->code=$code;
                  $product->save();


                }                  
              }
              $result=$band.'~'.$line.'~'.$textcampo;

              unlink('./files/products/' . $file);
              redirect('products/index/'.$result);

        }
        //else die("error aqui".$this->upload->display_errors());
        //die();
        redirect('products');
    }


    public function edit($id = FALSE)
    {
        $this->view_data['categories'] = Category::all();
        $this->view_data['suppliers'] = Supplier::all();
       // $this->view_data['warehouses'] = Warehouse::all();
        $this->view_data['taxes'] = Tax::all();
        $this->view_data['presentations'] = presentation::all();
        $this->view_data['areas'] = Area::all();
        $this->view_data['brands'] = Brand::all();
        date_default_timezone_set($this->setting->timezone);
        $date = date("Y-m-d H:i:s");
        if ($_POST) {
            $config['upload_path'] = './files/products/';
            $config['encrypt_name'] = TRUE;
            $config['allowed_types'] = 'gif|jpg|jpeg|png';
            $config['max_width'] = '1000';
            $config['max_height'] = '1000';

            $product = Product::find($id);
            $array_tax=explode('|',$this->input->post('tax_sale_id'));
            $tax_sale_id=$array_tax[0];
            $base = $this->input->post('base');
            $price = $this->input->post('price');
            $taxamount=$price-$base;
            $name = strtoupper($this->input->post('name'));        
            $reference = $this->input->post('reference');

        

            $arreglo = array(
                "type" => $this->input->post('type'),
                "code" => $this->input->post('code'),
                "name" => $name,
                "description" => $this->input->post('description'),
                "barcode" => $this->input->post('barcode'),
                "area_id" => $this->input->post('area_id'),
                "brand_id" => $this->input->post('brand_id'),
                "category_id" => $this->input->post('category_id'),
                "taxamount" => $taxamount,
                "tax_sale_id" => $tax_sale_id,
                "tax_purchase_id" => $this->input->post('tax_purchase_id'),
                
                "reference" => $reference,
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
                "color" => $this->input->post('color'),
                "supplier_id" => $this->input->post('supplier_id'),
                "quantity" => $this->input->post('quantity'),
                
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

                "photo" => $product->photo,
                "photothumb" => $product->photothumb,
                "modified_at" => $date
              );

            $this->load->library('upload', $config);
            $this->upload->initialize($config);
            if ($this->upload->do_upload('user_file')) {
                $data = array(
                    'upload_data' => $this->upload->data()
                );
                if ($product->photo !== '') {
                    unlink('./files/products/' . $product->photo);
                    unlink('./files/products/' . $product->photothumb);
                }
                $this->resize($data['upload_data']['full_path'], $data['upload_data']['file_name']);
                $image = $data['upload_data']['file_name'];
                $image_thumb = $data['upload_data']['raw_name'] . '_thumb' . $data['upload_data']['file_ext'];
              
                $arreglo['photo']=$image;
                $arreglo['photothumb']=$image_thumb;
               
            } 
          
          
                $p=0;
                $check_product = Product::find('first', array('conditions' => array('reference = ? AND id != ?'
                , $reference, $id)));
               if($check_product)
                {
                    $p=1;
                }
                if($p==0)
                {
                    ///Traza de seguridad
                    $userTraza = User::find($this->session->userdata('user_id'));
                    $detailAction='';
                    $detailAction2='';
                    if($base!=$product->base)
                    {
                    $detailAction='precio base del';
                    $detailAction2='de '.number_format((float)$product->base, $this->setting->decimals, ',', '.').' a '.number_format((float)$base, $this->setting->decimals, ',', '.');
                    }
                    
                    $action = "Se modificó el ".$detailAction." producto ".$product->reference." ".$product->name." ".$detailAction2;
                    $dataDB = array(
                            "action" => $action,
                            "created_by" => $userTraza->username.' '.$userTraza->firstname.' '.$userTraza->lastname
                            );   
                    Traza::create($dataDB);
                    ///////////////////////////////        

                    $product->update_attributes($arreglo);
                
                    if ($product->is_valid()) {
                        redirect("products", "refresh");
                    } else {
                        $errorm = label('codeerror');
                        $this->session->set_flashdata('error', $errorm);
                        redirect("products/edit/" . $id);
                    }
                
                }
                else
                {
                   $this->view_data['texterror'] = 'CÓDIGO DE PRODUCTO YA REGISTRADO';
                   $this->view_data['product'] = Product::find($id);
                   $this->content_view = 'product/edit';
       
                }
        } else {
            $this->view_data['product'] = Product::find($id);
            $this->content_view = 'product/edit';
        }
    }

    public function delete($id)
    {
        $product = Product::find($id);
        /*if ($product->photo !== '') {
            unlink('./files/products/' . $product->photo);
            unlink('./files/products/' . $product->photothumb);
        }
        $aale = Sale_item::delete_all(array('conditions' => array('product_id = ?', $id)));
        $stock = Stock::delete_all(array('conditions' => array('product_id = ?', $id)));
        $combos = Combo_item::delete_all(array('conditions' => array('product_id = ?',$id)));
        */
        $product->in_activo=2;
        $product->save();
        redirect("products", "refresh");
    }

    function resize($path, $file)
    {
        $config['image_library'] = 'gd2';
        $config['source_image'] = $path;
        $config['create_thumb'] = TRUE;
        $config['maintain_thum'] = TRUE;
        $config['width'] = 120;
        $config['height'] = 120;
        $config['new_image'] = './files/products/' . $file;

        $this->load->library('image_lib', $config);
        $this->image_lib->resize();
    }

    function updatestock()
    {
      $quant = $this->input->post('quant');
      //$quantw = $this->input->post('quantw');
      $pricest = $this->input->post('pricest');
      $productID = $this->input->post('productID');
      if ($quant) {
         foreach ($quant as $qt) {
            if($item = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $qt['store_id'], $productID))))
            {
               $item->quantity = $qt['quantity'];
               $item->save();
            } else {
               $qt['product_id'] = $productID;
               Stock::create($qt);
            }
         }
      }
      if ($pricest) {
         foreach ($pricest as $pr) {
            if($item = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $pr['store_id'], $productID))))
            {
               $item->price = $pr['price'];
               $item->save();
            } else {
               $pr['product_id'] = $productID;
               Stock::create($pr);
            }
         }
      }
      /*if ($quantw) {
         foreach ($quantw as $qt) {
            if($item = Stock::find('first', array('conditions' => array('warehouse_id = ? AND product_id = ?', $qt['warehouse_id'], $productID))))
            {
               $item->quantity = $qt['quantity'];
               $item->save();
            } else {
               $qt['product_id'] = $productID;
               Stock::create($qt);
            }
         }
      }*/
   }
}
