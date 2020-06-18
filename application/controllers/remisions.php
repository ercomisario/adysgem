<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Remisions extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        if (! $this->user) {
            redirect('login');
        }
        $this->register = $this->session->userdata('register') ? $this->session->userdata('register') : FALSE;
    }

    public function index()
    {
        $this->view_data['customers'] = Customer::all();
        $this->view_data['stores'] = Store::all();
        $this->view_data['products'] = Product::all();
      
        $sql="SELECT a.id, a.created_at, a.created_by, 
                     a.store_id_out, a.customer_id,
                     a.type, a.total,
                     c.username AS created_name,
                     d.name AS store_name_out,
                     e.firstname1 AS customer_firstname,
                     e.lastname1 AS customer_lastname

              FROM   remisions a
              LEFT JOIN users c ON (a.created_by=c.id)
              LEFT JOIN stores d ON (a.store_id_out=d.id)
              LEFT JOIN customers e ON (a.customer_id=e.id)
              ";
    // $sql;
      
        //$this->view_data['purchases'] = Purchase::find_by_sql($sql);
        $this->view_data['remisions'] = Remision::find_by_sql($sql);
        //$this->view_data['purchases'] = Purchase::all();
        $this->content_view = 'remision/view';
    }
    public function add()
    {
        $store_id_out = $this->input->post('store_id_out');
        $type = $this->input->post('type');
        $customer_id = $this->input->post('customer_id');
        $products = $this->input->post('product_id');
        $qts = $this->input->post('qt');
        $total=0;
        $dataBD = array(
                "store_id_out" => $store_id_out,
                "customer_id" => $customer_id,
                "total" => $total,
                "type" => $type,
                "created_by" => $this->session->userdata('user_id')
        );
        $remision = Remision::create($dataBD);

        for($i=0;$i<count($products);$i++)
        {
            $product_id=$products[$i];
            $qt=$qts[$i];
            $price = $this->input->post('price_'.$i);
            $total+=$price*$qt;

            $dataBD2 = array(
                    "remision_id" => $remision->id,
                    "product_id" => $product_id,
                    "price" => $price,
                    "qt" => $qt
            );
            //print_r($dataBD);
            $stock_out = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $store_id_out, $product_id)));
                
            if($stock_out)
            {
                $stock_out->quantity-=$qt;
                $stock_out->save();
            }   
                   
            Remision_item::create($dataBD2);
        }
        $remision->total=$total;
        $remision->save();

        redirect("remisions", "refresh");
    }

    public function edit($id = FALSE)
    {
        $this->view_data['stores'] = Store::all();
        $this->view_data['products'] = Product::all();   
        $this->view_data['customers'] = Customer::all();   

        date_default_timezone_set($this->setting->timezone);
        $date = date("Y-m-d H:i:s");    
        $store_id_out = $this->input->post('store_id_out');
        $customer_id = $this->input->post('customer_id');
        $type = $this->input->post('type');
        $products = $this->input->post('product_id');
        $qts = $this->input->post('qt');
        $items_id = $this->input->post('item_id');

        if ($_POST) {
            $remisions = Remision_item::find('all', array(
                'conditions' => array(
                    'remision_id = ?', $id
                )
            ));

            foreach ($remisions as $item)
            {

                  $p=0;
                  for($i=0;$i<count($items_id);$i++)
                  {
                    $item_id=$items_id[$i];
                    if($item_id==$item->id)
                        $p=1;
                  }
                  if($p==0)
                  {

                    $remision_delete = Remision_item::find($item->id);
                    $remision_delete->delete();

                  }                

           }


            $remision = Remision::find($id);

            $total=0;
            for($i=0;$i<count($qts);$i++)
            {
                $product_id=$products[$i];
                $qt=$qts[$i];
                $item_id=$items_id[$i];
                $price = $this->input->post('price_'.$i);
                $total+=$price*$qt;
                if($item_id>0)
                    $remision_item = Remision_item::find($item_id);

                $dataBD2 = array(
                        "remision_id" => $id,
                        "product_id" => $product_id,
                        "price" => $price,
                        "qt" => $qt
                );
                //print_r($dataBD);
                $stock_out = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $store_id_out, $product_id)));
                    
                if($stock_out)
                {
                    if($item_id>0)
                    {
                        $stock_out->quantity+=$remision_item->qt;
                        $stock_out->save();   
                    }
                    $stock_out->quantity-=$qt;
                    $stock_out->save();
                } 
                else 
                {
                    $store_new['product_id'] = $product_id;
                    $store_new['store_id'] = $store_id_out;
                    $store_new['quantity'] = $qt;

                    Stock::create($store_new);
                }
                if($item_id>0)
                {
                    $remision_item->update_attributes($dataBD2);
                }
                else
                {
                    Remision_item::create($dataBD2);
                }

            }
            $dataBD = array(
                "store_id_out" => $store_id_out,
                "customer_id" => $customer_id,
                "total" => $total,
                "type" => $type,
                "created_by" => $this->session->userdata('user_id')
            );
              
            $remision->update_attributes($dataBD);
            redirect("remisions", "refresh");
           // die();
        
        } else {
            $remision = Remision::find($id);
            
            $sql="SELECT a.id, a.remision_id, a.product_id, 
                     a.price, a.qt, b.price as base

              FROM   remision_items a, products b 

              WHERE  a.product_id=b.id AND a.remision_id=".$id;
    // $sql;
      
        //$this->view_data['purchases'] = Purchase::find_by_sql($sql);
            $this->view_data['remisions'] = Remision_item::find_by_sql($sql);
            $this->view_data['remision'] = $remision;
            //$this->view_data['remisions'] = $remisions;

            $this->content_view = 'remision/edit';
        }
    }
    public function delete($id)
    {
        $remision = Remision::find($id);
        $items = Remision_item::find('all', array(
            'conditions' => array(
                'remision_id = ?', $id
            )
        ));

        foreach ($items as $row)
        {
            $stock_out = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $remision->store_id_out, $row->product_id)));
                    
            if($stock_out)
            {
                $stock_out->quantity+=$row->qt;
                $stock_out->save();
            }   

        }
        Remision_item::delete_all(array(
            'conditions' => array(
                'remision_id = ?', $id

            )
        ));
        $remision->delete();
        //die();
        //redirect("remisions", "refresh");
        echo json_encode(array(
            "status" => TRUE
        ));
    }
    public function searchStocks()
    {
        $product_id = $this->input->post('product_id');
       
        $price = Product::find($product_id)->price;

        echo $price;
        die();
    }
     public function printInvoice($id)
    {

        $remision = Remision::find($id);
        $type=$remision->type;
        $items = Remision_item::find('all', array(
            'conditions' => array(
                'remision_id = ?', $id
            )
        ));

        $typeNote='Nota de crédito';
        if($type==2)
            $typeNote='Nota de débito';
        if($type==3)
            $typeNote='Nota de entrega';

        $customer = Customer::find($remision->customer_id);
        $store = Store::find($remision->store_id_out);
        $user = User::find($remision->created_by);

    
        $ticket = '<div id="cabecera" style="display:none;"> <table cellspacing="0" border="0" width="100%">
                            <tr style="font-size: small;">
                                <td style="text-align:center;">'.$this->setting->receiptheader.'</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;">' . $typeNote.' # ' . sprintf("%08d", $remision->id) . ' - '.label("Date").': '.$remision->created_at->format('d/m/Y') . '.</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;">' . label("Cliente") . ': ' . $customer->firstname1. ' ' . $customer->lastname1. ' - ' . label("Phone") . ': ' . $customer->phone. ' ' . $customer->movil. '.</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;">' . label("Adresse") . ': ' . $customer->city. ', ' . $customer->adresse. '.</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;">' . label("Store") . ': ' . $store->name . '.</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;">' . label("Caja") . ': '.$user->username.'.</td>
                            </tr>
                            <tr><td style="text-align:center;"><em></em></td></tr>
                    </table></div>';

        $ticket .= '
        <table  id="tableTransference" class="table display nowrap"><thead>
            <tr style="font-size: smaller;">
                <th style="border-top:1px dashed #000;text-align:left; width:50%;">' . label("Product") . '</th>
                <th style="border-top:1px dashed #000;text-align:center; width:20%;">' . label("P/U") . '</th>
                <th style="border-top:1px dashed #000;text-align:center; width:10%;">' . label("Quantity") . '</th>
                <th style="border-top:1px dashed #000;text-align:right; width:20%;">' . label("Total") . '</th>
            </tr></thead><tbody>';

        foreach ($items as $row)
        {
            $product = Product::find($row->product_id);

            $ticket .= '
            <tr style="font-size: smaller;">
                <td style="text-align:left; width:50%;">'.$product->reference.' '.$product->name . '</td>
                <td style="text-align:center; width:20%; ">'.number_format($row->price, $this->setting->decimals, ',', '.') . '  </td>
                <td style="text-align:center; width:10%;">'.$row->qt.'</td>
                <td style="text-align:right; width:20%; ">'.number_format($row->price*$row->qt, $this->setting->decimals, ',', '.').'</td>
            </tr>';

        }
        $head= $typeNote.' # '.sprintf("%08d", $remision->id).' - '.label("Date").': '.$remision->created_at->format("d/m/Y").'. \n ' . label("Cliente") . ': ' . $customer->firstname1. ' ' . $customer->firstname2. ' ' . $customer->lastname1. ' ' . $customer->lastname2. '. \n ' . label("Phone") . ': ' . $customer->phone. ' ' . $customer->movil. '. \n ' . label("Store") . ': ' . $store->name . '. \n ' . label("Adresse") . ': ' . $customer->city . ', ' . $customer->adresse . '. \n ' . label("Caja") . ': '.$user->username.'.';
     
        $bcs = 'code128';
        $height = 20;
        $width = 3;
        
        $setting=strip_tags($this->setting->receiptheader,'<br>');
        
        $this->GenerateBarcode(sprintf("%06d", $remision->id), $bcs, $height, $width);
        $path = base_url()."files/barcodes/R".sprintf("%06d", $remision->id).".png";
        $type = pathinfo($path, PATHINFO_EXTENSION);
        $data = file_get_contents($path);
        $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);

        $img = '<img style="margin-top:30px;display:block;margin:auto;width:100%;" src="' . $path . '" />';
     
        $ticket .= '<tr style="font-size: smaller;">
                        <td style="border-top:1px dashed #000;text-align:left; font-weight:bold; padding-top:5px;">' . label("Total") . '</td>
                        <td style="border-top:1px dashed #000;text-align:left; font-weight:bold; padding-top:5px;"></td>
                        <td style="border-top:1px dashed #000;padding-top:5px; text-align:right; font-weight:bold;"></td>
                        <td style="border-top:1px dashed #000;padding-top:5px; text-align:right; font-weight:bold;">'.number_format($remision->total, $this->setting->decimals, ',', '.') . '</td>
                    </tr>
                    </tbody></table>
                    <h4>Total: '.number_format($remision->total, $this->setting->decimals, ',', '.') . '</h4>'.$img;

        $ticket .= '<script type="text/javascript">
                    var setting="";
                    var img="'.$base64.'";
                    var cabecera=\''.$setting.'\';
                    var head=\''.$head.'\';
                    var arreglo=cabecera.split("<br>");
                    for(i=0;i<arreglo.length;++i)
                    {
                        setting=setting+arreglo[i]+"\n";
                    }

                    $("#tableTransference").append("<caption id=\'capDT\' style=\'caption-side: top\'>"+head+"</caption>");

                    $(document).ready(function() {

                          $("#tableTransference").DataTable({
                                "pageLength": 50,
                                 dom: "Bfrtip",
                                 buttons: [
                                    "excelHtml5",
                                    "csvHtml5",
                                     {
                                        extend: "pdfHtml5",
                                        title: setting,
                                        exportOptions: {
                                            columns: [ 0, 1, 2, 3]
                                        },
                                        customize:function(doc) {
                                         console.log(doc);
                                            doc.styles.title = {
                                                color: "#18293d",
                                                fontSize: "12",
                                                alignment: "center"
                                            };
                                            doc.styles.tableHeader = {
                                              fillColor:"#18293d",
                                              color:"white"
                                            };
                                            doc.content[2].table.widths = ["70%","*","*","*"];
                                            doc["footer"]=(function(page, pages) {
                                                return {
                                                    columns: [
                                                                {
                                                                    image: img,
                                                                    width: 250,
                                                                    height: 20
                                                                },
                                                                {
                                                                    alignment: "center",
                                                                    text: 
                                                                    [
                                                                        "Página ", 
                                                                         { text: 
                                                                            page.toString()
                                                                         },  
                                                                         " de ", 
                                                                         { text: 
                                                                            pages.toString()
                                                                         },  
                                                                         " "
                                                                    ]
                                                                }
                                                            ]
                                                        }
                                            });
                                        }


                                     }
                                ]
                          });
                          $("#tableTransference_filter").css("display", "none");


                      });  
                      </script>';

      /*
        $sql="SELECT DISTINCT a.name, a.value, b.qt*c.price as base 
              FROM taxes a, transfers b, products c
              WHERE a.id=c.tax_sale_id and b.product_id=c.id and b.id=".$transfer_id;
        //$sql.=" GROUP BY a.name";
        $diftax = Transfer::find_by_sql($sql);   

        $ticket .= '<br><br><h4>' . label("Resúmen IVA") . '</h4>
              <table class="table" cellspacing="0" border="0"><thead><tr><th style="text-align:center;">' . label("Tax") . '</th><th style="text-align:center;">' . label("Base") . '</th><th style="text-align:center;">' . label("IVA") . '</th><th style="text-align:center;">' . label("Total") . '</th></tr></thead>
              <tbody>';
            foreach ($diftax as $row) {
              $taxamount=$row->value*$row->base/100;
              $total=$row->base+$taxamount;
              

              $ticket .= '<tr style="font-size: smaller;"><td style="text-align:center;">'.$row->name.'</td><td style="text-align:center;">'.number_format($row->base, $this->setting->decimals, ',', '.').'</td><td style="text-align:center;">'.number_format($taxamount, $this->setting->decimals, ',', '.').'</td><td style="text-align:center;">'.number_format($total, $this->setting->decimals, ',', '.').'</td></tr>';
            }
              $ticket .= '</tbody></table>';
       */
        
        die($ticket);
        //echo $ticket;

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
        $rendererOptions = array(
            'imageType' => 'png',
            'horizontalPosition' => 'center',
            'verticalPosition' => 'middle'
        );
        
        $imageResource = Zend_Barcode::draw($bcs, 'image', $barcodeOptions, $rendererOptions);

      // $file = Zend_Barcode::draw('code128', 'image', array('text' => $code), array());
       $store_image = imagepng($imageResource,"./files/barcodes/R".$code.".png");
   }
     public function pdfreceipt()
    {
        $content = $this->input->post('content');
        $this->load->library('Pdf');
        $pdf = new Pdf('P', 'mm', 'A4', true, 'UTF-8', false);
        $pdf->SetTitle('Pdf');
        $pdf->SetHeaderMargin(30);
        $pdf->SetTopMargin(20);
        $pdf->setFooterMargin(20);
        $pdf->SetAutoPageBreak(true);
        $pdf->SetAuthor('Author');
        $pdf->SetDisplayMode('real', 'default');
        // add a page
        $pdf->AddPage();

        $pdf->writeHTMLCell(0, 0, '', '', $content, 0, 1, 0, true, '', true);
        ob_end_clean();
        $pdf->Output('pdfexample.pdf', 'D');
    }

    public function searchPlantilla($id)
    {

        $sql="SELECT id FROM remisions WHERE LPAD(ID, 8, '0') = ".$id;

        $remision = Remision::find_by_sql($sql);
        $resp=0;
        if($remision)
        {
               foreach ($remision as $row)
               {
                    $resp=$row->id;
               }
        }
        echo $resp;
        die();
    }
    public function crearPlantilla($id)
    {

        $remision = Remision::find($id);

        if($remision)
        {
            $dataDB = array(
                    "store_id_out" => $remision->store_id_out,
                    "customer_id" => $remision->customer_id,
                    "total" => $remision->total,
                    "created_by" => $remision->created_by
            );
            $newRemision=Remision::create($dataDB);
            $items = Remision_item::find('all', 
                array('conditions' => 
                    array('remision_id = ? ', $id )
                )
            );             
            
            foreach ($items as $row) {
                $item = Remision_item::find($row->id);
                $dataDB2 = array(
                    "remision_id" => $newRemision->id,
                    "product_id" => $item->product_id,
                    "price" => $item->price,
                    "qt" => $item->qt
                );
                $newItem=Remision_item::create($dataDB2);
            }

        }
        echo true;
        die();
        
   }
}
