<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Transfers extends MY_Controller
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
        $this->view_data['stores'] = Store::all();
        $this->view_data['products'] = Product::all();
     
        $sql="SELECT a.id, a.created_at, a.created_by, 
                     a.store_id_out, a.store_id_in,
                     a.total,
                     c.username AS created_name,
                     d.name AS store_name_out,
                     e.name AS store_name_in

              FROM   transfers a, users c, stores d, stores e 

              WHERE  a.created_by=c.id 
              AND    a.store_id_out=d.id AND a.store_id_in=e.id
              ORDER BY 2 DESC
              ";
    // $sql;
      
        //$this->view_data['purchases'] = Purchase::find_by_sql($sql);
        $this->view_data['transfers'] = Transfer::find_by_sql($sql);
        //$this->view_data['purchases'] = Purchase::all();
        $this->content_view = 'transfer/view';
    }
    public function add()
    {
        $store_id_out = $this->input->post('store_id_out');
        $store_id_in = $this->input->post('store_id_in');
        $products = $this->input->post('product_id');
        $qts = $this->input->post('qt');
        $total = 0;
        $dataBD = array(
               "store_id_out" => $store_id_out,
               "store_id_in" => $store_id_in,
               "total" => $total,
               "created_by" => $this->session->userdata('user_id')
        );
            
        $transfer = Transfer::create($dataBD);

        for($i=0;$i<count($products);$i++)
        {
            $product_id=$products[$i];
            $price = $this->input->post('price_'.$i);
            $qt=$qts[$i];
            $total+=$price*$qt;


            $dataBD2 = array(
                    "transfer_id" => $transfer->id,
                    "price" => $price,
                    "product_id" => $product_id,
                    "qt" => $qt
            );
            //print_r($dataBD);
            $stock_out = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $store_id_out, $product_id)));
                
            if($stock_out)
            {
                $stock_out->quantity-=$qt;
                $stock_out->save();
            }
            else 
            {
                $store_new['product_id'] = $product_id;
                $store_new['store_id'] = $store_id_in;
                $store_new['quantity'] = -$qt;

                Stock::create($store_new);
            }    
            $stock_in = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $store_id_in, $product_id)));
                
            if($stock_in)
            {
                $stock_in->quantity+=$qt;
                $stock_in->save();
            } 
            else 
            {
                $store_new['product_id'] = $product_id;
                $store_new['store_id'] = $store_id_in;
                $store_new['quantity'] = $qt;

                Stock::create($store_new);
            }  
            //echo count($products).' '.$i.' '.$transfer->id.' '.$product_id.' '.$price.'<br>';
            //print_r($dataBD2);
                   
            Transfer_item::create($dataBD2);
        }
        $transfer->total=$total;
        $transfer->save();
        //die();
        redirect("transfers", "refresh");
    }
    public function edit($id = FALSE)
    {
        $this->view_data['stores'] = Store::all();
        $this->view_data['products'] = Product::all();   

        date_default_timezone_set($this->setting->timezone);
        $date = date("Y-m-d H:i:s");    
        $store_id_out = $this->input->post('store_id_out');
        $store_id_in = $this->input->post('store_id_in');
        $products = $this->input->post('product_id');
        $qts = $this->input->post('qt');
        $items_id = $this->input->post('item_id');


        if ($_POST) {
            $transfers = Transfer_item::find('all', array(
                'conditions' => array(
                    'transfer_id = ?', $id
                )
            ));
            //echo count($items_id).'<br>';
            foreach ($transfers as $item)
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

                    $transfer_delete = Transfer_item::find($item->id);
                    $transfer_delete->delete();

                  }                

            }

            $transfer = Transfer::find($id);
            $total=0;
            for($i=0;$i<count($items_id);$i++)
            {
                $product_id=$products[$i];
                $qt=$qts[$i];
                $item_id=$items_id[$i];
                $price = $this->input->post('price_'.$i);
                $total+=$price*$qt;

                if($item_id>0)
                    $transfer_item = Transfer_item::find($item_id);

                

                $dataBD2 = array(
                        "product_id" => $product_id,
                        "qt" => $qt,
                        "price" => $price
                );
                $stock_out = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $store_id_out, $product_id)));
                    
                if($stock_out)
                {
                    if($item_id>0)
                    {                         
                        $stock_out->quantity+=$transfer_item->qt;
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

                $stock_in = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $store_id_in, $product_id)));
                    
                if($stock_in)
                {
                    if($item_id>0)
                    {                         
                        $stock_in->quantity-=$transfer_item->qt;
                        $stock_in->save();
                    }
                    $stock_in->quantity+=$qt;
                    $stock_in->save();
                } 
                else 
                {
                    $store_new['product_id'] = $product_id;
                    $store_new['store_id'] = $store_id_in;
                    $store_new['quantity'] = $qt;

                    Stock::create($store_new);
                }  
                if($item_id>0)
                {
                    $transfer_item->update_attributes($dataBD2);
                }
                else
                {
                    $dataBD2['transfer_id']=$id;
                    //echo count($items_id).' '.$i.' '.$id.' '.$product_id.' '.$price.'<br>';
                    //print_r($dataBD2);
                    Transfer_item::create($dataBD2);
                }

            }
            //die();

            $dataBD = array(
                    "store_id_out" => $store_id_out,
                    "store_id_in" => $store_id_in,
                    "total" => $total,
                    "created_by" => $this->session->userdata('user_id')
            );
            
            $transfer->update_attributes($dataBD);
            redirect("transfers", "refresh");
            //die();;
        
        } else {
            $transfer = Transfer::find($id);

            $sql="SELECT a.id, a.transfer_id, a.product_id, 
                     a.price, a.qt

              FROM   transfer_items a

              WHERE  a.transfer_id=".$id;
    // $sql;
      
        //$this->view_data['purchases'] = Purchase::find_by_sql($sql);
            $this->view_data['transfers'] = Transfer_item::find_by_sql($sql);          

            $this->view_data['transfer'] = $transfer;
            

            $this->content_view = 'transfer/edit';
        }
    }
    public function delete($id)
    {
        $transfer = Transfer::find($id);

        $stock_out = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $transfer->store_id_out, $transfer->product_id)));
                
        if($stock_out)
        {
            $stock_out->quantity+=$transfer->qt;
            $stock_out->save();
        }   
        $stock_in = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $transfer->store_id_in, $transfer->product_id)));
                
        if($stock_in)
        {
            $stock_in->quantity-=$transfer->qt;
            $stock_in->save();
        } 

        $transfer->delete();
        //redirect("transfers", "refresh");
        die();
    }
    public function searchStocks()
    {
        $store_id_out = $this->input->post('store_id_out');
        $store_id_in = $this->input->post('store_id_in');
        $product_id = $this->input->post('product_id');
       
        $stock_out = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $store_id_out, $product_id)));

        $qt_stock_out=0;        
        if($stock_out)
        {
            $qt_stock_out=$stock_out->quantity;
        }   
        $stock_in = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $store_id_in, $product_id)));
                
        $qt_stock_in=0;        
        if($stock_in)
        {
            $qt_stock_in=$stock_in->quantity;
        } 
        $price=Product::find($product_id)->price;

        echo $qt_stock_out.'|'.$qt_stock_in.'|'.$price;
        die();
    }
     public function printInvoice($id)
    {
        $transfer = Transfer::find($id);

        $items = Transfer_item::find('all', array(
            'conditions' => array(
                'transfer_id = ?', $id
            )
        ));

        $store_out = Store::find($transfer->store_id_out);
        $store_in = Store::find($transfer->store_id_in);
        $user = User::find($transfer->created_by);

    
        $ticket = ' <div id ="cabecera" style="display:none;"><table cellspacing="0" border="0" width="100%">
                            <tr style="font-size: small;">
                                <td style="text-align:center;">'.$this->setting->receiptheader.'</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:left;">Nota de Traslado # ' . sprintf("%08d", $transfer->id) . ' - '.label("Date").': '.$transfer->created_at->format('d/m/Y') . '.</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:left;">' . label("StoreOut") . ': ' . $store_out->name . '.</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:left;">' . label("StoreIn") . ': ' . $store_in->name . '.</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:left;">' . label("Caja") . ': '.$user->username.'.</td>
                            </tr>
                            <tr><td style= "text-align:center;" ><em></em></td></tr>
                   </table> </div>';

        $ticket .= '<table id="tableTransference" class="table display nowrap">
        <thead>
            <tr style="font-size: smaller;">
                <th style="border-top:1px dashed #000;text-align:left; width:50%;">' . label("Product") . '</th>
                <th style="border-top:1px dashed #000;text-align:center; width:20%;">' . label("P/U") . '</th>
                <td style="border-top:1px dashed #000;text-align:center; width:10%;">' . label("Quantity") . '</td>
                <th style="border-top:1px dashed #000;text-align:right; width:20%;">' . label("Total") . '</th>
            </tr>
        </thead><tbody>';

        foreach ($items as $row)
        {
            $product = Product::find($row->product_id);

            $ticket .= '
            <tr style="font-size: smaller;">
                <td style="text-align:left; width:50%;">'.substr($product->reference.'  '.$product->name,0,60).'</td>
                <td style="text-align:center; width:20%; ">'.number_format($row->price, $this->setting->decimals, ',', '.') . '  </td>
                <td style="text-align:center; width:10%;">'.$row->qt . '</td>
                <td style="text-align:right; width:20%; ">'.number_format($row->price*$row->qt, $this->setting->decimals, ',', '.').'</td>
            </tr>';

        }

        $head='Nota de Traslado # '.sprintf("%08d", $transfer->id).' - '.label("Date").': '.$transfer->created_at->format("d/m/Y").'. \n ' . label("StoreOut") . ': ' . $store_out->name . '. \n ' . label("StoreIn") . ': ' . $store_in->name . '. \n ' . label("Caja") . ': '.$user->username.'.';
        
        $bcs = 'code128';
        $height = 20;
        $width = 3;
        
        $setting=strip_tags($this->setting->receiptheader,'<br>');
        
        $this->GenerateBarcode(sprintf("%06d", $transfer->id), $bcs, $height, $width);
        $path = base_url()."files/barcodes/T".sprintf("%06d", $transfer->id).".png";
        $type = pathinfo($path, PATHINFO_EXTENSION);
        $data = file_get_contents($path);
        $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);

        $img = '<img style="margin-top:30px;display:block;margin:auto;width:100%;" src="' . $path . '" />';
              
        $ticket .= '       
                    <tr style="font-size: smaller;">
                        <td style="border-top:1px dashed #000;text-align:left; font-weight:bold; padding-top:5px;">' . label("Total") . '</td>
                        <td style="border-top:1px dashed #000;text-align:left; font-weight:bold; padding-top:5px;"></td>
                        <td style="border-top:1px dashed #000;padding-top:5px; text-align:right; font-weight:bold;">'.$img.'</td>
                        <td style="border-top:1px dashed #000;padding-top:5px; text-align:right; font-weight:bold;">'.number_format($transfer->total, $this->setting->decimals, ',', '.') . '</td>
                    </tr>
                    </tbody>
                    </table>
                    <h4>Total: '.number_format($transfer->total, $this->setting->decimals, ',', '.') . '</h4>'.$img;

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

                    $("#tableTransference").append("<caption id=\'capDT\' style=\'caption-side: top\'>"+head+".</caption>");

                    $(document).ready(function() {
                        //console.log(cabecera);
                          $("#tableTransference").DataTable({
                                "pageLength": 50,
                                 dom: "Bfrtip",
                                 buttons: [
                                    "excelHtml5",
                                    "csvHtml5",
                                     {
                                        extend: "pdfHtml5",
                                        title: setting,
                                        messageBottom: null,
                                        exportOptions: {
                                            columns: [ 0, 1, 2, 3]
                                        },
                                        customize:function(doc) 
                                        {
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
       
        
        die($ticket);


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
       $store_image = imagepng($imageResource,"./files/barcodes/T".$code.".png");
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

        $sql="SELECT id FROM transfers WHERE LPAD(ID, 6, '0') = ".$id;

        $transfer = Transfer::find_by_sql($sql);
        $resp=0;
        if($transfer)
        {
               foreach ($transfer as $row)
               {
                    $resp=$row->id;
               }
        }
        echo $resp;
        die();
    }
    public function crearPlantilla($id)
    {

        $transfer = Transfer::find($id);

        if($transfer)
        {
            $dataDB = array(
                    "store_id_out" => $transfer->store_id_out,
                    "store_id_in" => $transfer->store_id_in,
                    "total" => $transfer->total,
                    "created_by" => $transfer->created_by
            );
            $newTransfer=Transfer::create($dataDB);
            $items = Transfer_item::find('all', 
                array('conditions' => 
                    array('transfer_id = ? ', $id )
                )
            );             
            
            foreach ($items as $row) {
                $item = Transfer_item::find($row->id);
                $dataDB2 = array(
                    "transfer_id" => $newTransfer->id,
                    "product_id" => $item->product_id,
                    "price" => $item->price,
                    "qt" => $item->qt
                );
                $newItem=Transfer_item::create($dataDB2);
            }

        }
        echo true;
        die();
        
   }
    
}
