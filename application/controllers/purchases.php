<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Purchases extends MY_Controller
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
        if ($this->register) {
            $Register = Register::find($this->register);
            $store = Store::find($Register->store_id);
            $this->view_data['storeName'] = $store->name;
            $this->view_data['storeId'] = $store->id;
        } else {
            $this->view_data['stores'] = Store::all();
        }
        $this->view_data['suppliers'] = Supplier::all();
        $this->view_data['taxes'] = Tax::all();
        $sql="SELECT a.id, a.purchase_order, a.totalitems, a.date, 
                     a.paidmethod, a.total, a.paid, a.status,                   
                     b.name AS supplier_name,
                     c.username AS created_name,
                     d.name AS tax_name

              FROM   purchases a, suppliers b, users c, taxes d 

              WHERE  a.supplier_id = b.id AND a.created_by=c.id AND a.tax_id=d.id
              ";
    // $sql;
      
        $this->view_data['purchases'] = Purchase::find_by_sql($sql);
        //$this->view_data['purchases'] = Purchase::all();
        $this->content_view = 'purchase/view';
    }
    public function itemsview($id = FALSE)
    {

        if ($this->register) {
            $Register = Register::find($this->register);
            $store = Store::find($Register->store_id);
            $this->view_data['storeName'] = $store->name;
            $this->view_data['storeId'] = $store->id;
        }
        $this->view_data['stores'] = Store::all();
        $this->view_data['suppliers'] = Supplier::all();
        $this->view_data['taxes'] = Tax::all();
        
        $this->view_data['suppliers'] = Supplier::all();
        $sql="SELECT d.id as id, a.name as name, a.description as description, a.type as type, 
                     a.code as code, a.price as price, a.photo as photo, a.color as color, 
                     a.quantity as quantity, a.reference,
                     a.cost_yt as cost_yt,
                     d.cost, d.qt, d.subtot,
                     d.date_ven, d.lote, d.date_exp,
                     b.name AS area_name,
                     c.name AS tax_name  

              FROM   products a, areas b, taxes c, purchase_items d 

              WHERE  a.area_id = b.id
              AND    a.tax_sale_id=c.id 
              AND    a.id=d.product_id
              AND    d.purchase_id=".$id;
    // $sql;
        //die($sql);

        $this->view_data['products'] = Product::find_by_sql($sql);

        $sql="SELECT a.id, a.purchase_order, a.totalitems, a.date, 
                     a.paidmethod, a.total, a.subtot, a.paid, a.retention,      
                     a.supplier_id, a.tax_id, a.typedoc, a.numdoc, a.store_id,
                     a.discount

              FROM   purchases a

              WHERE a.id=".$id;
        //$this->view_data['purchase'] = Purchase::find_by_sql($sql);
        $purchases=Purchase::find($id);
        $this->view_data['purchase'] = $purchases;
        
        if($purchases->tax_id>0)
            $tax_value=Tax::find($purchases->tax_id)->value;
        else
            $tax_value=0;
        
        $sql="SELECT DISTINCT a.name, a.value, SUM(c.cost/(1+a.value/100)*c.qt) as base 
              FROM taxes a, products b, purchase_items c
              WHERE a.id=b.tax_sale_id and b.id=c.product_id and c.purchase_id=".$id;
        $sql.=" GROUP BY a.name";
        //die($sql);
        $diftax = Purchase::find_by_sql($sql);   

        $this->view_data['tax_value'] = $tax_value; 
        $this->view_data['diftax'] = $diftax; 
        $this->content_view = 'purchase/itemview';
    }

    public function add()
    {
        $store_id=0;
        if ($this->register) {

            $Register = Register::find($this->register);
            $store_id = $Register->store_id;

        }
        
        $config['upload_path'] = './files/purchases/';
        $config['encrypt_name'] = TRUE;
        $config['overwrite'] = FALSE;
        $config['allowed_types'] = 'gif|jpg|jpeg|png|pdf|doc|docx|xls|xlsx|zip';
        $config['max_size'] = '2048';
      /*  $sql_id=" SELECT `AUTO_INCREMENT` as id
                FROM  INFORMATION_SCHEMA.TABLES
                WHERE TABLE_SCHEMA = 'u737899455_zarpo'
                AND   TABLE_NAME   = 'purchases'";
        //echo $sql_id;
        $id_purchases = Purchase::find_by_sql($sql_id);
        foreach ($id_purchases as $id_purchase) {
            $id_purchase=$id_purchase->id;
        }*/
        $date = date("Y-m-d");


        $dataBD = array(
                "date" => $date,
                "register_id" => $this->register,
                "status" => 1,
                "attachment" => '',
                "created_by" => $this->session->userdata('user_id')
        );

        $purchase = Purchase::create($dataBD);
        $purchase_order=str_pad($purchase->id, 8, "0", STR_PAD_LEFT);

        $purchase->purchase_order=$purchase_order;
        $purchase->save();

        //print_r($dataBD);
        //crear como gasto
        $dataBD2 = array(
                "date" => $date,
                "reference" => $purchase_order,
                "category_id" => 1,
                "register_id" => $this->register,
                "store_id" => $store_id,
                "amount" => 0,
                "note" => "Compra ".$purchase_order,
                "attachment" => '',
                "created_by" => $this->session->userdata('user_id')
        );

        $this->load->library('upload', $config);

        if ($this->upload->do_upload()) {
            $data = array(
                'upload_data' => $this->upload->data()
            );
            $attachment = $data['upload_data']['file_name'];            
       
            $dataBD['attachment']=$attachment;
            $dataBD2['attachment']=$attachment;
          
        } 

        $expence = Expence::create($dataBD2);

       
        redirect("purchases/itemsview/".$purchase->id, "refresh");
        
    }
    public function addItemPurchase()
    {
        $purchase_id=$this->input->post('purchase_id');

        $array_tax=explode('|',$this->input->post('tax_id'));
        $tax_id=$array_tax[0];

        //$tax1 = Tax::find($tax_id);
        
        //$tax_value=$tax->value;
        $product_id=$this->input->post('product_id');
        $store_id=$this->input->post('store_id');

        $cost=$this->input->post('cost');
        $qt=$this->input->post('qt');

        $lote=$this->input->post('lote');
        $date_exp=$this->input->post('date_exp');
        $date_ven=$this->input->post('date_ven');
        //$subtot=(($cost*$tax1->value/100)+$cost)*$qt;
        $subtot=$cost*$qt;

        $purchase = Purchase::find($purchase_id);
        if($purchase)
        {            
            $purchase->totalitems ++;
            $tax2 = Tax::find($purchase->tax_id);
            //$expence = Expence::find($purchase->purchase_order);
            $expence = Expence::find('first', array('conditions' => array('reference = ? ', $purchase->purchase_order)));
             
            
            $purchase->subtot+=$subtot;   

            $total=$subtot;

            if($tax2)
                $total=$subtot*$tax2->value/100+$subtot;
             
            $purchase->total+=$total;
            $purchase->save(); 
            if($expence)
            {
                $expence->amount+=$total;
                $expence->save(); 
            }

        }
        if($item = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $store_id, $product_id))))
        {
            $item->quantity += $qt;
            $item->save();
        } else 
        {
            $store_new['product_id'] = $product_id;
            $store_new['store_id'] = $store_id;
            $store_new['quantity'] = $qt;

            Stock::create($store_new);
         }

        
        $dataBD = array(
                "product_id" => $product_id,
                "purchase_id" => $purchase_id,
                "cost" => $cost,
                "qt" => $qt,
                "tax_id" => $tax_id,
                "lote" => $lote,
                "date_exp" => $date_exp,
                "date_ven" => $date_ven,
                "subtot" => $subtot
        );
        
        $purchase_item = Purchase_item::create($dataBD);
       // redirect("purchases/itemsview/".$purchase_id);
        
    }

    public function edit($id = FALSE)
    {
        if ($_POST) {
            $purchase = Purchase::find($id);
            $expence = Expence::find('first', array('conditions' => array('reference = ? ', $purchase->purchase_order)));
            
            $status=0;
            $array_tax=explode('|',$this->input->post('tax_id'));
            $tax_id=$array_tax[0];

            $subtot=$this->input->post('subtot');
            $total=$this->input->post('total');
            $difference=$this->input->post('difference');
            $discount=$this->input->post('discount');
            $retention=$this->input->post('retention');
            $total_tax=$this->input->post('total_tax');


            $paid=$this->input->post('paid');
            if($paid < $total)$status=2;//Parcialmente pagado
            if($paid == 0)$status=1;//No pagado
            
            $config['upload_path'] = './files/purchases/';
            $config['encrypt_name'] = TRUE;
            $config['overwrite'] = FALSE;
            $config['allowed_types'] = 'gif|jpg|jpeg|png|pdf|doc|docx|xls|xlsx|zip';
            $config['max_size'] = '2048';
            $subtot = str_replace('.', '', $subtot);
            $total = str_replace('.', '', $total);
            $total_tax = str_replace('.', '', $total_tax);

            $dataBD = array(
                    "date" => $this->input->post('date'),
                    "supplier_id" => $this->input->post('supplier_id'),
                    "purchase_order" => $this->input->post('purchase_order'),
                    //"register_id" => $this->register,
                    "store_id" => $this->input->post('store_id'),
                    "paidmethod" => $this->input->post('paidmethod'),
                    "tax_id" => $tax_id,
                    "typedoc" => $this->input->post('typedoc'),
                    "numdoc" => $this->input->post('numdoc'),
                    "subtot" => $subtot, 
                    "discount" => $discount,
                    "retention" => $retention, 
                    "total" => $total, 
                    "paid" => $paid, 
                    "difference" => $difference, 
                    "total_tax" => $total_tax, 
                    "status" => $status,
                    "attachment" => ''
            );
            //Actualizar gastos
            $dataBD2 = array(
                "amount" => $total,
                "attachment" => '',
                "store_id" => $this->input->post('store_id'),
                "register_id" => $this->register
            );

            $this->load->library('upload', $config);

            if ($this->upload->do_upload()) {
                $data = array(
                    'upload_data' => $this->upload->data()
                );
                $attachment = $data['upload_data']['file_name'];            
           
                $dataBD['attachment']=$attachment;
                $dataBD2['attachment']=$attachment;
              
            } 
            //print_r($dataBD);
            //die();
            //print_r($dataBD2);
            $purchase->update_attributes($dataBD);
            if($expence)
                $expence->update_attributes($dataBD2);

            $purchase = Purchase::find($id);
            $this->view_data['storeName'] = $store ? $store->name : 'Store';
            $this->view_data['stores'] = Store::all();
            $this->view_data['suppliers'] = Supplier::all();
            $this->view_data['taxes'] = Tax::all();
            $this->view_data['purchase'] = $purchase;

            redirect("purchases/itemsview/".$id);

        } 
    }

    public function delete()
    {
        $id=$this->input->post('purchase_id');

        /*Purchase_item::delete_all(array(
            'conditions' => array(
                'purchase_id = ?',
                $id
            )
        ));*/
        
        $purchase = Purchase::find($id);

        $expence = Expence::find('first', array('conditions' => array('reference = ? ', $purchase->purchase_order)));
        if($expence)
            $expence->delete();
        $purchase->status=3;
        $purchase->save();
        //redirect("purchases");

    }
    public function deleteItemPurchase()
    {
        $id=$this->input->post('purchase_id');
        $product_id=$this->input->post('product_id');
        $subtot=$this->input->post('subtot');
        $store_id=$this->input->post('store_id');

        $purchase = Purchase::find($id);

        
        if($purchase)
        {            
            $tax = Tax::find($purchase->tax_id);
            
            $subtotOld = $purchase->subtot;
            $subtotNew = $subtotOld-$subtot;
            
            $purchase->totalitems --;
            
            $purchase->subtot = $subtotNew;
            
            if($tax)
                $totalNew = $subtotNew*$tax->value/100+$subtotNew;
            
            
            $purchase->total = $totalNew;
            $expence = Expence::find('first', array('conditions' => array('reference = ? ', $purchase->purchase_order)));
            
            $purchase->save();
            if($expence)
            {
                $expence->amount-=$subtot;
                $expence->save();           
            }
        }
        
        $purchase = Purchase_item::find($product_id);
        
        if($item = Stock::find('first', 
        array('conditions' => array('store_id = ? AND product_id = ?', $store_id, $product_id))))
        {
            $item->quantity -= $purchase->qt;
            $item->save();
        }

        
        $purchase->delete();
        //redirect("purchases/itemsview/".$id);

    }
    public function edititem($id = FALSE, $store_id = FALSE)
    {
        if ($_POST) {
            $item_purchase = Purchase_item::find($id);
            $purchase_id=$item_purchase->purchase_id;
            
            $purchase = Purchase::find($purchase_id);

            $product_id=$item_purchase->product_id;
            
            $tax_id=$this->input->post('tax_id');
            $tax = Tax::find($tax_id);
            
            $lote=$this->input->post('lote');
            $date_exp=$this->input->post('date_exp');
            $date_ven=$this->input->post('date_ven');
            $cost=$this->input->post('cost');
            $qt=$this->input->post('qt');


            if($tax)
                $subtot=$qt*$cost*$tax->value/100+$qt*$cost;
            else
                $subtot=$qt*$cost;
            
            if($item = Stock::find('first', 
            array('conditions' => array('store_id = ? AND product_id = ?', $store_id, $product_id))))
            {
                $item->quantity -= $item_purchase->qt;
                $item->save();
                $item->quantity += $qt;
                $item->save();
            }
            
            $expence = Expence::find('first', array('conditions' => array('reference = ? ', $purchase->purchase_order)));            

            $purchase->total-=$item_purchase->subtot;
            $purchase->save();

            $expence->amount-=$item_purchase->subtot;
            $expence->save();

            $purchase->total-=$subtot;
            $purchase->save();
           
            $expence->amount-=$subtot;
            $expence->save();

            $item_purchase->lote=$lote;
            $item_purchase->date_exp=$date_exp;
            $item_purchase->date_ven=$date_ven;
            $item_purchase->tax_id=$tax_id;
            $item_purchase->cost=$cost;
            $item_purchase->qt=$qt;
            $item_purchase->subtot=$subtot;
            $item_purchase->save(); 

            
            redirect("purchases/itemsview/".$purchase_id, "refresh");

        } else {
            $this->view_data['store_id'] = $store_id;
            $this->view_data['taxes'] = Tax::all();
            $this->view_data['item_purchase'] = Purchase_item::find($id);
            $this->content_view = 'purchase/edititem';
        }
    }
    public function printInvoice($purchase_id)
    {
        date_default_timezone_set($this->setting->timezone);
        $date = date("Y-m-d H:i:s");
        $purchase = Purchase::find($purchase_id);
        $supplier = Supplier::find($purchase->supplier_id);
        $purchase_item = Purchase_item::find('all', array('conditions' => array('purchase_id = ? ', $purchase_id)));            

        $PayMethode = label("Cash");
        if($purchase->paidmethod==2)
            $PayMethode = label("CreditSale");

        $ticket = ' <table cellspacing="0" border="0" width="100%">
                            <tr style="font-size: smaller;">
                                <td style="text-align:center;">'.$this->setting->receiptheader.'</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;"><h4>'.label("PurchaseOrder") . ': ' . $purchase->purchase_order. '</h4></td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;">'.label("Date").': '.$purchase->date->format('d/m/Y') . '</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;">'.label("numdoc").': '.$purchase->numdoc.'</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;">'.label("Supplier").': '.$supplier->name.'</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;">'.label("paymentMethod").': '.$PayMethode. '</td>
                            </tr>
                            <tr><td style="text-align:center;"><em></em></td></tr>
                    </table>
                    <div style="border-top:1px solid #000; border-bottom:1px solid #000;">
                    <table class="table" cellspacing="0" border="0">
                                    <tr style="font-size: smaller; border-top:1px solid #000;">
                                        <td style="text-align:left; width:30%;">' . label("Product") . '</td>
                                        <td style="text-align:center; width:15%;">' . label("Vence") . '</td>
                                        <td style="text-align:center; width:20%;">' . label("Lote") . '</td>
                                        <td style="text-align:center; width:10%;">' . label("Cost") . '</td>
                                        <td style="text-align:center; width:10%;">' . label("Quantity") . '</td>
                                        <td style="text-align:right; width:15%;">' . label("SubTotal") . '</td>
                                    </tr>
                                    
                                    ';
        $i = 1;

        foreach ($purchase_item as $row) {
            $product = Product::find($row->product_id);

            $ticket .= '<tr style="font-size: smaller;">
                            <td style="text-align:left; width:30%;">'.$product->name.'</td>
                            <td style="text-align:center; width:15%;">'.$row->date_ven->format('d/m/Y').'</td>                           
                            <td style="text-align:center; width:20%;">' .$row->lote. '</td>
                            <td style="text-align:center; width:10%;">' .number_format($row->cost, 0, ",", "."). '</td>
                            <td style="text-align:center; width:10%;">' .$row->qt. '</td>
                            <td style="text-align:right; width:15%;">' . number_format($row->subtot, 0, ",", "."). '</td>
                        </tr>';
            $i ++;
        }

        $ticket .= '</table></div>';
        $porcDiscount=$purchase->discount/$purchase->subtot*100;
                $sql="SELECT DISTINCT a.name, a.value, SUM(c.cost/(1+a.value/100)*c.qt) as base 
              FROM taxes a, products b, purchase_items c
              WHERE a.id=b.tax_sale_id and b.id=c.product_id and c.purchase_id=".$purchase_id;
        $sql.=" GROUP BY a.name";
        //die($sql);
        $diftax = Purchase::find_by_sql($sql);   

        $ticket .= '<table class="table" cellspacing="0" border="0" width="50%">
                        <tr style="font-size: smaller;">
                        <td style="text-align:left;">'.label("SubTotal").': </td>
                        <td style="text-align:left;">'.number_format($purchase->subtot, 0, ",", ".").'</td>
                    </tr>
                    <tr style="font-size: smaller;">
                        <td style="text-align:left;">' . label("Discount") . ' ('.$porcDiscount.'%): </td>
                        <td style="text-align:left;">' . number_format($purchase->discount, 0, ",", ".") . '</td>
                    </tr>';
                        $totalIvaDiscount=0;
            foreach ($diftax as $row) {
                  $taxamount=$row->value*$row->base/100;
                  $total=$row->base+$taxamount;
                  $ivaDiscount=$total-$total*$porcDiscount/100;
                  $ivaDiscount=$ivaDiscount*$row->value/100;
                  $totalIvaDiscount+=$ivaDiscount;
            
                    $ticket .= '
                    <tr style="font-size: smaller;">
                        <td style="text-align:left;">' . label("Tax") . ' ' . $row->name.'</td>
                        <td style="text-align:left;">'.number_format($ivaDiscount, 0, ",", ".") . '</td>
                    </tr>';
            }
                    $ticket .= ' 
                    <tr style="font-size: smaller;">
                        <td style="text-align:left;">'.label("Retention") . ': </td>
                        <td style="text-align:left;">'.number_format($purchase->retention, 0, ",", ".").'</td>
                    </tr></table>
                        <h4 class="text-center">' . label("Total") . '.: ' . number_format($purchase->subtot-$purchase->discount+$totalIvaDiscount-$purchase->retention, 0, ",", "."). '</h4>

                    ';

/*
        $ticket .= '<h4 style="text-align:center;">' . label("Resúmen IVA") . '</h4>
              <table class="table" cellspacing="0" border="0"><thead><tr><th style="text-align:center;">' . label("Tax") . '</th><th style="text-align:center;">' . label("Base") . '</th><th style="text-align:center;">' . label("IVA") . '</th><th style="text-align:center;">' . label("Total") . '</th></tr></thead>
              <tbody>';
            foreach ($diftax as $row) {
              $taxamount=$row->value*$row->base/100;
              $total=$row->base+$taxamount;
              

              $ticket .= '<tr style="font-size: smaller;"><td style="text-align:center;">'.$row->name.'</td><td style="text-align:center;">'.number_format($row->base, $this->setting->decimals, ',', '.').'</td><td style="text-align:center;">'.number_format($taxamount, $this->setting->decimals, ',', '.').'</td><td style="text-align:center;">'.number_format($total, $this->setting->decimals, ',', '.').'</td></tr>';
            }
              $ticket .= '</tbody></table>';*/
       
        
        die($ticket);
        //echo $ticket;

    }
     public function pdfreceipt()
    {
        $content = $this->input->post('content');
        $this->load->library('Pdf');
        $pdf = new Pdf('P', 'mm', 'A4', true, 'UTF-8', false);
        $pdf->SetTitle('Pdf');
        $pdf->SetHeaderMargin(10);
        $pdf->SetTopMargin(10);
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

        $arreglo='<label for="supplier_id">'.label("Supplier").'</label>
                  <select class="form-control" name="supplier_id" id="supplier_id" Required>
                      <option value="" >Proveedor</option>';
                      foreach ($items as $row):
                      $arreglo.='<option value="'.$row->id.'">'.$row->name.'</option>';
                      endforeach;
        $arreglo.='</select>'; 
        //die();
        echo $arreglo;
        die();
      
        //redirect("products", "refresh");
    }


}
