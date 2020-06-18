<?php
defined('BASEPATH') or exit('No direct script access allowed');
require_once (APPPATH . 'third_party/Stripe/Stripe.php');

class Invoices extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('invoice_model', 'invoice');
        $this->user = $this->session->userdata('user_id') ? User::find_by_id($this->session->userdata('user_id')) : FALSE;
        $lang = $this->session->userdata("lang") == null ? "english" : $this->session->userdata("lang");
        $this->lang->load($lang, $lang);
        $this->register = $this->session->userdata('register') ? $this->session->userdata('register') : FALSE;

        $this->setting = Setting::find(1);
    }

    public function ajax_list()
    {
        //echo "Aqui".$tiposale;
        $list = $this->invoice->get_datatables();
        $data = array();
        $no = $_POST['start'];
      foreach ($list as $invoice) {
       // if($invoice->status==1){
            $no ++;
            $row = array();
            $tiposale = $this->input->post("tiposale");

            $row[] = sprintf("%08d", $invoice->invoice);
            $row[] = $invoice->clientname;
            $row[] = $invoice->created_at;
            $row[] = $invoice->discount;
            $row[] = number_format((float)$invoice->subtotal, $this->setting->decimals, ',', '.');
            $row[] = $invoice->created_by;
            $row[] = $invoice->totalitems;

            switch ($invoice->status) {
                case 1: // case Credit Card
                    $classstatus = 'unpaid';
                    break;
                case 2: // case ckeck
                    $classstatus = 'Partiallypaid';
                    break;
                default:
                    $classstatus = 'paid';
            }
            if($invoice->in_activo==2)
                $classstatus = 'Cancelada';

            $row[] = '<span class="' . $classstatus . '">' . label($classstatus) . '<span>';

            // add html for action
        
            if ($this->user->role === "admin"){

                     $idd=$invoice->id;
                     if($invoice->in_activo==2)
                     $idd=$invoice->id.'NIT'.$invoice->in_activo;

                $cadena = '<div class="btn-group"><a class="btn btn-primary" href="javascript:void(0)" dropdown-toggle" data-toggle="dropdown" ><i class="fa fa-cog fa-fw"></i> ' . label("Action") . '</a><a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="fa fa-caret-down" title="Toggle dropdown menu"></span></a><ul class="dropdown-menu">
                     <li><a href="javascript:void(0)" onclick="Edit_Sale(' . "'" . $invoice->id . "'" . ')"><i class="fa fa-pencil fa-fw" aria-hidden="true"></i> ' . label("Edit") . '</a></li>
                     <li><a href="javascript:void(0)" onclick="payaments(' . "'" . $invoice->id . "'" . ')"><i class="fa fa-credit-card-alt fa-fw" aria-hidden="true"></i> ' . label("Payements") . '</a></li>
                     <li><a href="javascript:void(0)" onclick="showTicket(' . "'" . $idd . "'" . ')"><i class="fa fa-ticket fa-fw" aria-hidden="true"></i> ' . label("Receipt").'</a></li>
                     <li class="divider"></li>';
                    if($this->register){
                     $cadena .= '
                     <li><a href="javascript:void(0)" onclick="delete_invoice(' . "'" .$invoice->id. "'" . ')"><i class="fa fa-trash-o fa-fw" aria-hidden="true"></i> ' . label("Delete") . '</a></li>
                     </ul></div>';
                    }
                
                $row[]=$cadena;
            }
            
            if ($this->user->role !== "admin")        
                $row[] = '<div class="btn-group"><a class="btn btn-primary" href="javascript:void(0)" dropdown-toggle" data-toggle="dropdown" ><i class="fa fa-cog fa-fw"></i> ' . label("Action") . '</a><a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="fa fa-caret-down" title="Toggle dropdown menu"></span></a><ul class="dropdown-menu">
                    <li><a href="javascript:void(0)" onclick="Edit_Sale(' . "'" . $invoice->id . "'" . ')"><i class="fa fa-pencil fa-fw" aria-hidden="true"></i> ' . label("Edit") . '</a></li>
                    <li><a href="javascript:void(0)" onclick="payaments(' . "'" . $invoice->id . "'" . ')"><i class="fa fa-credit-card-alt fa-fw" aria-hidden="true"></i> ' . label("Payements") . '</a></li>
                    <li><a href="javascript:void(0)" onclick="showTicket(' . "'" . $invoice->id . "'" . ')"><i class="fa fa-ticket fa-fw" aria-hidden="true"></i> ' . label("Receipt") . '</a></li></ul></div>';
        
            $data[] = $row;
        //}
      }

        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->invoice->count_all(),
            "recordsFiltered" => $this->invoice->count_filtered(),
            "data" => $data
        );
        // output to json format
        echo json_encode($output);
    }

    public function ajax_delete($id)
    {
        date_default_timezone_set($this->setting->timezone);
        $date = date("Y-m-d");

        $sale=Sale::find($id);
        //$user_id=Register::find($sale->register_id)->user_id;
        $register=Register::find($this->register);

        $invoice=str_pad($sale->invoice, 8, "0", STR_PAD_LEFT);
               
        $dataBD = array(
                "date" => $date,
                "reference" => $invoice,
                "category_id" => 9,
                "register_id" => $sale->register_id,
                "store_id" => $register->store_id,
                "amount" => $sale->subtotal,
                "note" => "Factura ".$invoice,
                "attachment" => '',
                "created_by" => $this->session->userdata('user_id')
        );

        $expence = Expence::create($dataBD);
        $posales = Sale_item::find('all', array(
            'conditions' => array(
                'sale_id = ?',
                $id
            )
        ));
        foreach ($posales as $row) {
            $product_id=$row->product_id;
            $qt=$row->qt;
            $stocks = Stock::find('first', array(
                'conditions' => array(
                    'product_id = ? AND store_id = ?',
                    $product_id,
                    $register->store_id
                )
            ));
            if($stocks)
            {
                $stocks->quantity+=$qt;
                $stocks->save();
            }           

        }
        $sale->in_activo=2;
        $sale->save();

        ///Traza de seguridad
        $userTraza = User::find($this->session->userdata('user_id'));
        $action = "Se anuló factura N° ".$invoice;
        $dataDB = array(
                   "action" => $action,
                   "created_by" => $userTraza->username.' '.$userTraza->firstname.' '.$userTraza->lastname
                );   
        Traza::create($dataDB);
        ///////////////////////////////        

        echo json_encode(array(
            "status" => TRUE
        ));
    }

    public function ShowTicket($id)
    {
        $arreglo = explode('NIT', $id);
        $in_activo=1;
        $status='';
        if(count($arreglo)>1)
        {
            $id=$arreglo[0];
            $in_activo=$arreglo[1];  
            $status='ANULADA';  
        }
        
        $user = User::find($this->session->userdata('user_id'));
        $sale = Sale::find($id);
        $register = Register::find($sale->register_id);
        $store = Store::find($register->store_id);
        $typeCustomer='';
        if($sale->client_id>0)
        {
              $customer = Customer::find($sale->client_id);
              $type=$customer->regime;
              $typedoc=$customer->typedoc;
              $movil=$customer->movil;
              $adresse=$customer->adresse;
              $numdoc=$customer->numdoc;
              $phone=$customer->phone;
              $city=$customer->city;
              if($type==1)$typeCustomer='Común';
              if($type==2)$typeCustomer='Simplificado';
              
              if($typedoc==1)$typeDoc='Cédula';
              if($typedoc==2)$typeDoc='Pasaporte';
              if($typedoc==3)$typeDoc='NIT';
             
        }
    
        $posales = Sale_item::find('all', array(
            'conditions' => array(
                'sale_id = ?',
                $id
            )
        ));
        $ticket = ' <table cellspacing="0" border="0" width="100%">
                            <tr style="font-size: small;">
                                <td style="text-align:center;">'.$this->setting->receiptheader.'</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;">'.label("Date").': '.$sale->created_at->format('d/m/Y H:i:s') . '</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;">' . label("invoice").' # ' . sprintf("%08d", $sale->invoice) . '</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:left;">' . label("Cliente") . ' ' . $sale->clientname.'</td>
                            </tr>';
                if($sale->client_id>0)
                {
                $ticket .= ' <tr style="font-size: smaller; ">
                                <td style="text-align:left;">'.$typeDoc. ' '.$numdoc.'</td>
                            </tr>';
                $ticket .= ' <tr style="font-size: smaller; ">
                                <td style="text-align:left;">Teléfono : '.$movil.' '.$phone.'</td>
                            </tr>';
                $ticket .= ' <tr style="font-size: smaller; ">
                                <td style="text-align:left;">Régimen : '.$typeCustomer.'</td>
                            </tr>';
                $ticket .= ' <tr style="font-size: smaller; ">
                                <td style="text-align:left;">Dirección : '.$city.' - '.$adresse.'</td>
                            </tr>';
                }
                $ticket .= ' <tr style="font-size: smaller; ">
                                <td style="text-align:left;">' . label("Cajero") . ': ' . $sale->created_by . '</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:left;">' . label("Caja") . ': '.$user->username.'</td>
                            </tr>
                            <tr><td style="text-align:center;color:red"><em>'.$status.'</em></td></tr>
                    </table>';

        $ticket .= '
        <table class="table" cellspacing="0" border="0"><thead>
            <tr style="font-size: smaller;">
                <th style="border-top:1px dashed #000;text-align:left; width:50%;">' . label("Product") . '</th>
                <th style="border-top:1px dashed #000;text-align:center; width:20%;">' . label("P/U") . '</th>
                <th style="border-top:1px dashed #000;text-align:center; width:10%;">' . label("Cant.") . '</th>
                <th style="border-top:1px dashed #000;text-align:right; width:20%;">' . label("Total") . '  </th>
            </tr></thead><tbody>';

        $i = 1;
        $sumaSubTotal=0;
        $totalDiscount=0;
        $sumaTotal=0;
        foreach ($posales as $posale) {

            $subtotal = $posale->subtotal;
            $discount = $posale->discount;
            $total = $posale->total;
            $price = $posale->price+($posale->price*$posale->taxvalue/100);

            $totalDiscount += $discount;
            $sumaSubTotal += $subtotal;
            $sumaTotal += $total;
            
            $ticket .= '
            <tr style="font-size: smaller;">
                <td style="text-align:left;width:50%;">' .substr($posale->name, 0, 19).'</td>
                <td style="text-align:right; width:20%; ">' . number_format($price, $this->setting->decimals, ',', '.') . '  </td>
                <td style="text-align:center; width:10%;">' . $posale->qt . '</td>
                <td style="text-align:right; width:20%; ">' . number_format($total, $this->setting->decimals, ',', '.') . '  </td>
            </tr>';
            $i ++;
        }
        $ticket .= '<tr><td colspan="4"><em></em></td></tr>';        

        $bcs = 'code128';
        $height = 20;
        $width = 3;
        //if (intval($sale->discount))
          $ticket .= '
            <tr style="font-size: smaller;">
                <td colspan="2" style="text-align:left; font-weight:bold; padding-top:5px;border-top:1px dashed #000;">' . label("Subtotal") . '</td>
                <td colspan="2" style="padding-top:5px; text-align:right; font-weight:bold;border-top:1px dashed #000;">' . number_format($sumaTotal, $this->setting->decimals, ',', '.') . '</td>
            </tr>';         
          $ticket .= '
            <tr style="font-size: smaller;">
                <td colspan="2" style="text-align:left; font-weight:bold; padding-top:5px;">' . label("Discount") . '</td>
                <td colspan="2" style="padding-top:5px; text-align:right; font-weight:bold;">' . number_format($totalDiscount, $this->setting->decimals, ',', '.') . '</td>
            </tr>';         
          $ticket .= '
            <tr style="font-size: smaller;">
                <td colspan="2" style="border-top:1px dashed #000;text-align:left; font-weight:bold; padding-top:5px;">' . label("Total") . '</td>
                <td colspan="2" style="border-top:1px dashed #000; padding-top:5px; text-align:right; font-weight:bold;">' . number_format($sumaSubTotal, $this->setting->decimals, ',', '.') . '</td>
            </tr>
            <tr style="font-size: smaller;">'; 
          
        $PayMethode = explode('~', $sale->paidmethod);

        switch ($PayMethode[0]) {
            case '1': // case Credit Card
                $ticket .= '
                        <td colspan="2" style="text-align:left; font-weight:bold; padding-top:5px;">' . label("CreditCard") . '</td>
                        <td colspan="2" style="padding-top:5px; text-align:right; font-weight:bold;">xxxx xxxx xxxx ' . substr($PayMethode[1], - 4) . '</td>
                    </tr>
                    <tr style="font-size: smaller;">
                        <td colspan="2" style="text-align:left; font-weight:bold; padding-top:5px;">' . label("Tipo tarjeta") . '</td>
                        <td colspan="2" style="padding-top:5px; text-align:right; font-weight:bold;">' . $PayMethode[2] . '</td>
                    </tr></tbody></table>';
                break;
            case '2': // case ckeck
                $ticket .= '
                        <td colspan="2" style="text-align:left; font-weight:bold; padding-top:5px;">' . label("ChequeNum") . '</td>
                        <td colspan="2" style="padding-top:5px; text-align:right; font-weight:bold;">' . $PayMethode[1] . '</td>
                    </tr></tbody></table>';
                break;
            case '3': // case credito
                $ticket .= '
                        <td colspan="2" style="text-align:left; font-weight:bold; padding-top:5px;">' . label("CreditSale") . '</td>
                        <td colspan="2" style="padding-top:5px; text-align:right; font-weight:bold;"></td>
                    </tr></tbody></table>';
                break;
            default:
                $ticket .= '
                        <td colspan="2" style="text-align:left; font-weight:bold; padding-top:5px;">' . label("Paid") . '</td>
                        <td colspan="2" style="padding-top:5px; text-align:right; font-weight:bold;">'.number_format((float)$sale->paid, $this->setting->decimals, ',', '.').'</td>
                    </tr>
                    <tr style="font-size: smaller;">
                        <td colspan="2" style="border-top:1px dashed #000;text-align:left; font-weight:bold; padding-top:5px;">' . label("Change") . '</td>
                        <td colspan="2" style="border-top:1px dashed #000;padding-top:5px; text-align:right; font-weight:bold;">' . number_format((float)(floatval($sale->paid) - floatval($sale->subtotal)), $this->setting->decimals, ',', '.') . '</td>
                    </tr>
                    <tr><td colspan="4"><em></em></td></tr>

                    </tbody></table>';
        }
        
            $sql="SELECT DISTINCT a.name, a.value, SUM(c.price*c.qt-c.discount) as base 
                  FROM taxes a, products b, sale_items c
                  WHERE a.id=b.tax_sale_id AND b.id=c.product_id 
                  AND c.sale_id=".$id;

            $sql.=" GROUP BY a.name";
            $diftax = Sale_item::find_by_sql($sql);   

        $ticket .= '
              <table class="table" cellspacing="0" border="0"><thead>
                <tr style="font-size: smaller;">
                    <th style="text-align:center;">' . label("Tax").'  </th>
                    <th style="text-align:center;">' . label("Base").'  </th>
                    <th style="text-align:center;">' . label("IVA").'  </th>
                    <th style="text-align:center;">' . label("Total").'  </th>
                </tr></thead>
              <tbody>';
            foreach ($diftax as $row) {
              $taxamount=$row->value*$row->base/100;
              $total=$row->base+$taxamount;
              

              $ticket .= '
                <tr style="font-size: smaller;">
                    <td style="text-align:center;">'.$row->name.'</td>
                    <td style="text-align:center;">'.number_format($row->base, $this->setting->decimals, ',', '.').'</td>
                    <td style="text-align:center;">'.number_format($taxamount, $this->setting->decimals, ',', '.').'</td>
                    <td style="text-align:center;">'.number_format($total, $this->setting->decimals, ',', '.').'</td>
                </tr>';
            }
            $ticket .= '<tr><td colspan="4"><em></em></td></tr>
                </tbody></table>';
       
            $ticket .= '<img style="margin-top:30px;display:block;width:100%;margin:auto;" src="' . site_url('pos/GenerateBarcode/' . sprintf("%05d", $sale->id) . '/' . $bcs . '/' . $height . '/' . $width) . '" alt="' . $sale->id . '" />
            <p style="margin:0 auto;margin-top:10px;text-align: center;">' . $store->footer_text . '</p>
            <div style="background-color:#000;padding:5px;width:100%;color:#fff;margin:0 auto;border-radius:3px;margin-top:20px;text-align: center;">' . $this->setting->receiptfooter . '</div>';
          if($PayMethode[0]==3)
          {
            $ticket .= '<br><div style="clear:both;"><span class="text-center">' . label("Firma Cliente") . ': ______________________________</span></div>';
          }
          $ticket .='<input type="hidden" id="hdnTicketInvoice" name="hdnTicketInvoice" value="'.$id.'">';

        
        echo $ticket;
    }

    public function Edit_Ajax($id)
    {
        $customers = Customer::find('all');
        $sale = Sale::find($id);
        switch ($sale->status) {
            case 1: // case Credit Card
                $satus = 'unpaid';
                break;
            case 2: // case ckeck
                $satus = 'Partiallypaid';
                break;
            default:
                $satus = 'paid';
        }
        $change = ($sale->total - $sale->paid) > 0 ? ($sale->total - $sale->paid) : '';
        $content = '<div class="row"><div class="col-md-12"><h4><b>' . label("Total") . '</b> ' . $sale->total . ' ' . $this->setting->currency . ' <b>&emsp;' . label("Paid") . ' :</b> ' . $sale->paid . ' ' . $this->setting->currency . '<b> &emsp;' . label("change") . ' :</b> ' . ($sale->total - $sale->paid). '</h4><div class="form-group"><label for="customerSelect">' . label("changeClient") . '</label><select class="form-control" id="customerSelect"><option value="0" >' . label("WalkinCustomer") . '</option>';

        foreach ($customers as $customer) {
            $Selected = $customer->id == $sale->client_id ? 'selected' : '';
            $content .= '<option value="' . $customer->id . '" ' . $Selected . '>' . $customer->firstname1 . ' ' . $customer->lastname1 . '</option>';
        }

        $content .= '</select></div><div class="form-group"><label for="changeStatus">' . label("changeStatus") . ' <span class="' . $satus . '">' . label($satus) . '<span></label><select class="form-control" id="changeStatus"><option value="' . $sale->status . '" >' . label("changeStatus") . '</option><option value="0" >' . label("paid") . '</option><option value="1" >' . label("unpaid") . '</option><option value="2" >' . label("Partiallypaid") . '</option></select></div></div><input type="hidden" id="ClientId" value="' . $id . '" />';

        echo $content;
    }

    public function Update_Sale($id)
    {
        $sale = Sale::find($id);
        date_default_timezone_set($this->setting->timezone);
        $date = date("Y-m-d H:i:s");
         $sale->update_attributes(array(
             'client_id' => $this->input->post('customerId'),
             'clientname' => $this->input->post('customer'),
             'status' => $this->input->post('Status'),
             'modified_at' => $date
         ));
    }

    public function payaments($id) {

      $sale = Sale::find($id);
      $change = ($sale->total - $sale->paid) > 0 ? ($sale->total - $sale->paid) : '';
      $register = Register::find($sale->register_id);
      $user = User::find($register->user_id);

      $typeCustomer='';
      if($sale->client_id>0)
      {
          $customer = Customer::find($sale->client_id);
          $type=$customer->regime;
          if($type==1)$typeCustomer='Común';
          if($type==2)$typeCustomer='Simplificado';
      }
      $posales = Sale_item::find('all', array(
            'conditions' => array(
                'sale_id = ?',
                $id
            )
       ));
     $content = ' <table cellspacing="0" border="0" width="100%">
                            <tr style="font-size: smaller;">
                                <td style="text-align:center;">'.$this->setting->receiptheader.'</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;">' . label("invoice").' # ' . sprintf("%08d", $sale->invoice) . ' - '.label("Date").': '.$sale->created_at->format('d/m/Y') . '</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;">' . label("Cliente") . '</b> ' . $sale->clientname. ' - ' . $typeCustomer. '</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;">' . label("Cajero") . ': ' . $sale->created_by . '</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;">' . label("Caja") . ': '.$user->username.'</td>
                            </tr>
                            <tr><td style="text-align:center;"><em></em></td></tr>
                    </table>';
        

      $content .= '
                <table class="table" cellspacing="0" border="0">
                <thead>
                    <tr style="font-size: smaller;">
                        <th style="text-align:left; width:10%;"><em>#</em></th>
                        <th style="text-align:left; width:40%;">' . label("Product") . '</th>
                        <th style="text-align:center; width:25%;">' . label("Quantity") . '</th>
                        <th style="text-align:right; width:25%;">' . label("Total") . '</th>
                    </tr>
                </thead>
                <tbody>';

        $i = 1;
        $sumaTotal=0;
        $totalDiscount=0;
        $granTotal=0;
        foreach ($posales as $posale) {

            $subtotal = $posale->subtotal;
            $discount = $posale->discount;
            $total = $posale->total;

            $totalDiscount += $discount;
            $sumaTotal += $subtotal;
            $granTotal += $total;
            
            $content .= '<tr style="font-size: smaller;">
                            <td style="text-align:left; width:10%;">' . $i . '</td>
                            <td style="text-align:left; width:40%;">' . $posale->name . '</td>
                            <td style="text-align:center; width:25%;">' . $posale->qt . '</td>
                            <td style="text-align:right; width:25%; ">' . number_format($total, $this->setting->decimals, ',', '.') . '</td>
                        </tr>';
            $i ++;
        }
        
        $bcs = 'code128';
        $height = 20;
        $width = 3;
        //if (intval($sale->discount))
          $content .= '<tr style="font-size: smaller;">
                       <td colspan="2" style="text-align:left; font-weight:bold; padding-top:5px;border-top:1px dashed #000;">' . label("Subtotal") . '</td>
                       <td colspan="2" style="border-top:1px dashed #000; padding-top:5px; text-align:right; font-weight:bold;">' . number_format($granTotal, $this->setting->decimals, ',', '.') . '</td>
                       </tr>';         
          $content .= '<tr style="font-size: smaller;">
                       <td colspan="2" style="text-align:left; font-weight:bold; padding-top:5px;">' . label("Discount") . '</td>
                       <td colspan="2" style="padding-top:5px; text-align:right; font-weight:bold;">' . number_format($totalDiscount, $this->setting->decimals, ',', '.') . '</td>
                       </tr>';         
          $content .= '<tr style="font-size: smaller;">
                       <td colspan="2" style="text-align:left; font-weight:bold; padding-top:5px;border-top:1px dashed #000;">' . label("Total") . '</td>
                       <td colspan="2" style="border-top:1px dashed #000; padding-top:5px; text-align:right; font-weight:bold;">' . number_format($sumaTotal, $this->setting->decimals, ',', '.') . '</td>
                       </tr>
                       '; 

          $content .= '</tbody></table>';

        $sql="SELECT DISTINCT a.name, a.value, SUM(c.price*c.qt-c.discount) as base 
                  FROM taxes a, products b, sale_items c
                  WHERE a.id=b.tax_sale_id and b.id=c.product_id and c.sale_id=".$id;

        $sql.=" GROUP BY a.name";
        $diftax = Sale_item::find_by_sql($sql);   

        $content .= '
              <table class="table" cellspacing="0" border="0"><thead>
                  <tr style="font-size: smaller;">
                      <th style="text-align:center;">' . label("Tax") . '</th>
                      <th style="text-align:center;">' . label("Base") . '</th>
                      <th style="text-align:center;">' . label("IVA") . '</th>
                      <th style="text-align:center;">' . label("Total") . '</th>
                  </tr>
              </thead>
              <tbody>';
            foreach ($diftax as $row) {
              $taxamount=$row->value*$row->base/100;
              $total=$row->base+$taxamount;
              

              $content .= '<tr style="font-size: smaller;"><td style="text-align:center;">'.$row->name.'</td><td style="text-align:center;">'.number_format($row->base, $this->setting->decimals, ',', '.').'</td><td style="text-align:center;">'.number_format($taxamount, $this->setting->decimals, ',', '.').'</td><td style="text-align:center;">'.number_format($total, $this->setting->decimals, ',', '.').'</td></tr>';
            }
            $content .= '</tbody></table>';
            $content .= '<h5 style="text-align: center;"><b>' . label("Resumen") . '</b></h5>';   
            $content .= '
              <table class="table" cellspacing="0" border="0"><thead>
                  <tr style="font-size: smaller;">
                      <th style="text-align:center;width:33%;">' . label("Crédito") . '</th>
                      <th style="text-align:center;width:33%;">' . label("Paid") . '</th>
                      <th style="text-align:center;width:33%;">' . label("Debe") . '</th>
                  </tr>
              </thead>
              <tbody>';
             $content .= '<tr style="font-size: smaller;">
                           <td style="text-align:center;">'.number_format((float)$sale->total, $this->setting->decimals, ',', '.').'</td>
                           <td style="text-align:center;">'.number_format((float)$sale->paid, $this->setting->decimals, ',', '.').'</td>
                           <td style="text-align:center;">'.number_format((float)($sale->total - $sale->paid), $this->setting->decimals, ',', '.').'</td></tr>';
             $content .= '</tbody></table>';
       
        
       
     $content .= '<h5 style="text-align: center;"><b>' . label("Historial del Crédito") . '</b></h5>';


      $content .= '<table class="table">
          <thead>
             <tr style="font-size: smaller;">
                <th style="text-align:center;width:20%;">'.label("Date").'</th>
                <th style="text-align:center;width:38%;">'.label("Cajero").'</th>
                <th style="text-align:center;width:20%;">'.label("Abono").'</th>
                <th style="text-align:center;width:20%;">'.label("Método").'</th>                
                <th style="text-align:center;width:2%;"></th>                
             </tr>
          </thead>
          <tbody class="itemslist">';

      $PayMethode = explode('~', $sale->paidmethod);
      $content .= '<tr style="font-size: smaller;">
          <td style="text-align:center;width:20%;">'.$sale->created_at->format('d/m/Y').'</td>
          <td style="text-align:center;width:38%;">'.$sale->created_by.'</td>
          <td style="text-align:center;width:20%;">'.number_format((float)$sale->firstpayement, $this->setting->decimals, ',', '.').'</td>
          <td style="text-align:center;width:20%;">'.($PayMethode[0] !== '1' ? ($PayMethode[0] !== '2' ? label("Cash") : label("Cheque")) : label("CreditCard")).'</td>
          <td style="text-align:center;width:2%;"></td>
      </tr>';
      $payements = Payement::find('all', array('conditions' => array('sale_id = ?', $id)));
      if($payements){
         foreach ($payements as $pay) {
            $PayMethode = explode('~', $pay->paidmethod);
            $content .= '<tr  style="font-size: smaller;">
                <td style="text-align:center;width:20%;">'.$pay->date->format('d/m/Y').'</td>
                <td style="text-align:center;width:38%;">'.$pay->created_by.'</td>
                <td style="text-align:center;width:20%;">'.number_format((float)$pay->paid, $this->setting->decimals, ',', '.').'</td>
                <td style="text-align:center;width:20%;">'.($PayMethode[0] !== '1' ? ($PayMethode[0] !== '2' ? label("Cash") : label("Cheque")) : label("CreditCard")).'</td>
                <td style="text-align:center;width:2%;"><a class="btnDeletePaid" href="javascript:void(0)" onclick="deletepayement('.$pay->id.')"><i class="fa fa-trash" aria-hidden="true"></i></a></td>
            </tr>';
         }
      }
      $content .= '  </tbody>
        </table>
        <button id="btnAddPaid" class="btn btn-add col-md-12" onclick="addpymntBtn()" style="margin-bottom:0">'.label("AddPayement").'</button>';
       $content .='<input type="hidden" id="hdnTicketInvoice" name="hdnTicketInvoice" value="'.$id.'">';

      




      echo $content;
   }

   public function Addpayament($type){

      date_default_timezone_set($this->setting->timezone);
      $date = date("Y-m-d H:i:s");
      $_POST['date'] = $date;
      $_POST['register_id'] = $this->register;
      $register = Register::find($this->register);
      $store = Store::find($register->store_id);
      if ($type == 2) {
          try {
             Stripe::setApiKey($this->setting->stripe_secret_key);
             $myCard = array(
                  'number' => $this->input->post('ccnum'),
                  'exp_month' => $this->input->post('ccmonth'),
                  'exp_year' => $this->input->post('ccyear'),
                  "cvc" => $this->input->post('ccv')
             );
             $charge = Stripe_Charge::create(array(
                  'card' => $myCard,
                  'amount' => (floatval($this->input->post('paid')) * 100),
                  'currency' => $this->setting->currency
             ));
             echo "<p class='bg-success text-center'>" . label('saleStripesccess') . '</p>';
          } catch (Stripe_CardError $e) {
             // Since it's a decline, Stripe_CardError will be caught
             $body = $e->getJsonBody();
             $err = $body['error'];
             echo "<p class='bg-danger text-center'>" . $err['message'] . '</p>';
          }
      }
      unset($_POST['ccnum']);
      unset($_POST['ccmonth']);
      unset($_POST['ccyear']);
      unset($_POST['ccv']);
      Payement::create($_POST);
      $sale = Sale::find($this->input->post('sale_id'));

      $sale->paid = $sale->paid + $this->input->post('paid');
      $statu = $sale->paid - $sale->total;
      $sale->status = $statu >= 0 ? '0' : '2';
      $sale->save();

      echo json_encode(array(
          "status" => TRUE
      ));

   }

   public function deletepayement($id, $sale_id)
   {
      $payement = Payement::find($id);

      $sale = Sale::find($sale_id);
      $sale->paid = $sale->paid - $payement->paid;
      $statu = $sale->paid - $sale->total;
      $sale->status = $statu === -floatval($sale->total) ? '1' : '2';
      $sale->save();

      $payement->delete();
   }
   public function getInvoice($term) {
    //echo substr($term, 0, 2);
    $arreglo=explode('+',$term);
    //print_r($arreglo);
        if(substr($term, 0, 2)=='A+')
        {
            //echo count($arreglo);
            if(count($arreglo)>1)
            {
                $term=$arreglo[1];
                //echo $term;
                $res = Sale::find('all', array('select' => 'invoice', 'select' => 'clientname', 'select' => 'created_at', 'select' => 'subtotal', 'select' => 'paid'),array('conditions' => "(clientname LIKE '%" . $term . "%'  OR invoice LIKE '%" . $term . "%' OR created_at LIKE '%" . $term . "%' OR subtotal LIKE '%" . $term . "%') AND paidmethod = 3 order by created_at desc"));
            }
            else
            {
                $res = Sale::find('all', array('select' => 'invoice', 'select' => 'clientname', 'select' => 'created_at', 'select' => 'subtotal', 'select' => 'paid'),array('conditions' => "paidmethod = 3 order by created_at desc"));   
            }
        }
        else
        {
            $res = Sale::find('all', array('select' => 'invoice', 'select' => 'clientname', 'select' => 'created_at', 'select' => 'subtotal', 'select' => 'paid'),array('conditions' => "clientname LIKE '%" . $term . "%'  OR invoice LIKE '%" . $term . "%' OR created_at LIKE '%" . $term . "%' OR subtotal LIKE '%" . $term . "%' order by created_at desc"));
        }
      
      if ($res) {
           return $res;
      }
      return FALSE;
   }
   public function searchInvoice($term=NULL)
   {
        $data = '';
        $rows = '';
        $i=-1;

        date_default_timezone_set($this->setting->timezone);
       
        if(strlen($term)>=2)
        {
            $p=1;
            $rows = $this->getInvoice($term);
        }
        //echo $term;      
        if ($rows) {
                $row = '<div class="col-sm-12" id="rowInvoice">
                            <div class="col-xs-1 nopadding">
                              <span class="text-left">Factura N°</span> 
                            </div>
                            <div class="col-xs-4 nopadding">
                              <p class="text-left">' . label('Customer') . '</p>
                            </div>
                            <div class="col-xs-2 nopadding">
                              <p class="text-left">' . label('Date') . '</p>
                            </div>   
                            <div class="col-xs-1 nopadding">
                              <p class="text-center">' . label('Status') . '</p>
                            </div>                              
                            <div class="col-xs-2 nopadding">
                              <p class="text-center">' . label('Total') . '</p>
                            </div>                              
                            <div class="col-xs-2 nopadding">
                              <p class="text-center">' . label('Paid') . '</p>
                            </div>
                        </div>';

                $data .= $row;

            foreach ($rows as $row) {

                $color='gray';
                $status ='Valida';
                if($row->paidmethod==3)
                {
                    $color='crimson';
                    $status='A crédito';
                }
               if($row->in_activo==2)
               {
                    $color='green';
                    $status='Anulada';
               }
               
              $i++;
                $row = '<div class="col-sm-12" id="rowInvoice_'.$i.'" style="background-color: white;color: '.$color.';">
                            <div class="col-xs-1 nopadding">
                                <span id="codeInvoice_'.$i.'" class="text-left">' .sprintf("%08d", $row->invoice) . '</span> 
                                <input type="hidden" id="hdnIdInvoice_'.$i.'" value="'.$row->id.'">
                                <input type="hidden" id="hdnInvoiceStatus_'.$i.'" value="'.$row->paidmethod.'">
                                <input type="hidden" id="hdnInvoiceInActivo_'.$i.'" value="'.$row->in_activo.'">
                            </div>
                            <div class="col-xs-4 nopadding">
                                <p class="text-left">' .substr($row->clientname,0, 35). '</p>
                            </div>   
                            <div class="col-xs-2 nopadding">
                                <p class="text-left">' . $row->created_at->format('Y-m-d H:m:s') . '</p>
                            </div>                               
                            <div class="col-xs-1 nopadding">
                                <p class="text-center">' . $status . '</p>
                            </div>                            
                            <div class="col-xs-2">
                              <p class="text-center">' . number_format((float)$row->subtotal, $this->setting->decimals, ',', '.').'</p>
                            </div>                            
                            <div class="col-xs-2">
                              <p class="text-center">' . number_format((float)$row->paid, $this->setting->decimals, ',', '.').'</p>
                            </div>
                        </div>';

                $data .= $row;

            }
            $data.='<input type="hidden" id="hdnSearchInvoice" value="'.($i+1).'">';

        } 
        echo $data;

   }

}
