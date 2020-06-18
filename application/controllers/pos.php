<?php
defined('BASEPATH') or exit('No direct script access allowed');

require_once (APPPATH . 'third_party/Stripe/Stripe.php');

class Pos extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->helper('file');
        
        $lang = $this->session->userdata("lang") == null ? "english" : $this->session->userdata("lang");
        $this->lang->load($lang, $lang);
        $this->register = $this->session->userdata('register') ? $this->session->userdata('register') : FALSE;
        $this->store = $this->session->userdata('store') ? $this->session->userdata('store') : FALSE;
        //$this->user = $this->session->userdata('user') ? $this->session->userdata('user') : FALSE;

        $this->setting = Setting::find(1);
        date_default_timezone_set($this->setting->timezone);
    }
    public function ReporteZ()
    {
         $register = Register::find($this->register);
         $user = User::find($register->user_id);
         $sales = Sale::find('all', array(
             'conditions' => array(
                 'register_id = ? AND in_activo = ?',
                 $this->register,
                 1
             )
         ));
         /*
         $payaments = Payement::find('all', array(
             'conditions' => array(
                 'register_id = ?',
                 $this->register
             )
         ));*/

       $sql="SELECT a.paid, a.paidmethod
             FROM payements a, sales b, registers c 
             WHERE a.sale_id = b.id AND a.register_id=c.id AND b.in_activo=1 
             AND a.register_id = ".$this->register;

       $payaments = Payement::find_by_sql($sql);
       ///////////////////////////////////////////7
       $sql="SELECT  a.category_id, a.note, 
                     a.amount, b.name AS category_name

              FROM   expences a, catalog_expences b 

              WHERE  a.category_id = b.id AND a.category_id<> 9
              AND    a.register_id = ".$this->register;
              
        //$this->view_data['categories'] = Categorie_menor::find_by_sql($sql);
         $expences = Expence::find_by_sql($sql);

         $cash = 0;
         $cheque = 0;
         $cc = 0;
         $discount = 0;
         $credit = 0;
         $totalIngresos = 0;
         $totalSales = 0;
         $CashinHand = $register->cash_inhand;
         $date = $register->date;
         $createdBy = $user->firstname . ' ' . $user->lastname;


         foreach ($payaments as $payament) {
            $PayMethode = explode('~', $payament->paidmethod);
           /* switch ($PayMethode[0]) {
                case '1': // case Credit Card
                    $cc += $payament->paid;
                    break;
                case '2': // case ckeck
                    $cheque += $payament->paid;
                    break;
                default:
                    $cash += $payament->paid;
            }*/
            $totalIngresos += $payament->paid;
        }

         foreach ($sales as $sale) {
             $PayMethode = explode('~', $sale->paidmethod);
             $paystatus = $sale->subtotal;
             //$paystatus = $sale->paid - $sale->total;
             switch ($PayMethode[0]) {
                 case '1': // case Credit Card
                     $cc += $paystatus > 0 ? $sale->subtotal : $sale->firstpayement;
                     $totalSales += $paystatus > 0 ? $sale->subtotal : $sale->firstpayement;
                     break;
                 case '2': // case ckeck
                     $cheque += $paystatus > 0 ? $sale->subtotal : $sale->firstpayement;
                     $totalSales += $paystatus > 0 ? $sale->subtotal : $sale->firstpayement;
                     break;
                 case '3': // case ckeck
                     $credit += $sale->subtotal;
                     $totalSales += $paystatus > 0 ? $sale->subtotal : $sale->firstpayement;
                     break;
                 default:
                     $cash += $paystatus > 0 ? $sale->subtotal : $sale->firstpayement;
                     $totalSales += $paystatus > 0 ? $sale->subtotal : $sale->firstpayement;
             }
             $discount += $sale->discountamount;

         }
         $data = '
         <table cellspacing="0" border="0" width="100%">
             <tr style="font-size: smaller;">
                 <td style="text-align:center;">'.$this->setting->receiptheader.'</td>
             </tr>
             <tr style="font-size: smaller;">
                 <td style="text-align:center;">Reporte Z - '.label("Caja").' '.$user->username.'</td>
             </tr>
             <tr style="font-size: smaller;">
                 <td style="text-align:center;">'.label("Cajero").' '.$createdBy.'</td>
             </tr>
             <tr style="font-size: smaller;">
                 <td style="text-align:center;">'.label("Fecha de Apertura: ").' '.$date->format('Y-m-d h:i:s').'</td>
             </tr>
            </table>

         <h5>' . label("Sales") . '</h5>         
         <table class="table">
         <tr style="font-size: smaller;">
             <th style="text-align:left; width:40%;">' . label("Método") . '</th>
             <th style="text-align:center; width:20%;">' . label("Esperados") . ' </th>
             <th style="text-align:center; width:20%;">' . label("Contados") . ' </th>
             <th style="text-align:center; width:20%;">' . label("Diferencia") . '</th>
         </tr>
         <tr style="font-size: smaller;">
             <td style="text-align:left; width:40%;">' . label("Cash") . '</td>
             <td style="text-align:center; width:20%;">' . number_format((float)$cash, $this->setting->decimals, ',', '.') . '</td>
             <td style="text-align:center; width:20%;">0</td>
             <td style="text-align:center; width:20%;">0</td>
         </tr>
         <tr style="font-size: smaller;">
             <td style="text-align:left; width:40%;">' . label("Tarjeta de Crédito") . '</td>
             <td style="text-align:center; width:20%;">'.number_format((float)$cc, $this->setting->decimals, ',', '.').'</td>
             <td style="text-align:center; width:20%;">0</td>
             <td style="text-align:center; width:20%;">0</td>
         </tr>
         <tr style="font-size: smaller;">
             <td style="text-align:left; width:40%;">' . label("Cheque") . '</td>
             <td style="text-align:center; width:20%;">'.number_format((float)$cheque, $this->setting->decimals, ',', '.').'</td>
             <td style="text-align:center; width:20%;">0</td>
             <td style="text-align:center; width:20%;">0</td>
         </tr>
         <tr style="font-size: smaller;">
             <td style="text-align:left; width:40%;">'.label("Ventas a Crédito") . '</td>
             <td style="text-align:center; width:20%;">'.number_format((float)$credit, $this->setting->decimals, ',', '.').'</td>
             <td style="text-align:center; width:20%;">0</td>
             <td style="text-align:center; width:20%;">0</td>
         </tr>
         <tr style="font-size: smaller;">
             <td style="text-align:left; width:40%;">' . label("Discount") . '</td>
             <td style="text-align:center; width:20%;">'.number_format((float)$discount, $this->setting->decimals, ',', '.').'</td>
             <td style="text-align:center; width:20%;">0</td>
             <td style="text-align:center; width:20%;">0</td>
         </tr>
         </table>';
         $data .= '<h5>' . label("Expenses") . '</h5>         
         <table class="table"><tr style="font-size: smaller;"><th width="25%">' . label("Category") . '</th>
         <th width="50%">' . label("Note") . '</th>
         <th width="25%">' . label("Amount") . ' </th></tr>';
         $totalExpenses=0;
      foreach ($expences as $row) {
         $data .= '<tr style="font-size: smaller;"><td>' . $row->category_name . '</td><td><span>' . $row->note . '</span></td>
         <td><span>' . number_format((float)$row->amount, $this->setting->decimals, ',', '.') . '</span></td>
         </tr>';
         $totalExpenses+=$row->amount;
        }
        /* $data .= '<tr style="font-size: smaller;"><td>' . label("Total") . ' </td><td></td>
         <td><span>' . number_format((float)$totalExpenses, $this->setting->decimals, ',', '.') . '</span></td>
         </tr>';*/
  
         $data .= '</table>';

         $sql="SELECT DISTINCT a.name, a.value, SUM(c.price*c.qt-c.discount) as base 
              FROM taxes a, products b, sale_items c, sales d
              WHERE a.id=b.tax_sale_id and b.id=c.product_id and c.sale_id=d.id 
              AND d.in_activo=1 and d.register_id = ".$this->register;
        $sql.=" GROUP BY a.name";
        $diftax = Posale::find_by_sql($sql);   

        $data .= '<h5>' . label("Resúmen IVA") . '</h5>
              <table class="table" cellspacing="0" border="0"><thead>
              <tr style="font-size: smaller;">
                  <th style="text-align:center;">' . label("Tax") . '</th>
                  <th style="text-align:center;">' . label("Base") . '</th>
                  <th style="text-align:center;">' . label("IVA") . '</th>
                  <th style="text-align:center;">' . label("Total") . '</th>
              </tr></thead>
              <tbody>';
            foreach ($diftax as $row) {
              $taxamount=$row->value*$row->base/100;
              $total=$row->base+$taxamount;
              

              $data .= '
              <tr style="font-size: smaller;">
                  <td style="text-align:center;">'.$row->name.'</td>
                  <td style="text-align:center;">'.number_format($row->base, $this->setting->decimals, ',', '.').'</td>
                  <td style="text-align:center;">'.number_format($taxamount, $this->setting->decimals, ',', '.').'</td>
                  <td style="text-align:center;">'.number_format($total, $this->setting->decimals, ',', '.').'</td>
              </tr>';
            }
              $data .= '</tbody></table>';
         $data .= '
                   <h5>' . label("Totales") . '</h5>
                    <table class="table">
                  <tr style="font-size:smaller;">
                       <td>' . label("Total Facturado") . '</td>
                       <td>' . number_format((float)($totalSales ), $this->setting->decimals, ',', '.') . '</td></tr>
                  <tr style="font-size:smaller;">
                       <td>' . label("Ingreso por Créditos") . '</td>
                       <td>' . number_format((float)($totalIngresos ), $this->setting->decimals, ',', '.') . '</td></tr>
                  <tr style="font-size:smaller;">
                       <td>' . label("Total Egresos") . '</td>
                       <td>-' . number_format((float)($totalExpenses ), $this->setting->decimals, ',', '.') . '</td></tr>
                  <tr style="font-size:small;">
                       <td style="border-top:1px dashed #000;">'.label("Total Caja") . '</td>
                       <td style="border-top:1px dashed #000;">'.number_format((float)($totalSales+$totalIngresos-$totalExpenses), $this->setting->decimals, ',', '.').'</td></tr>
                  ';
              

         echo $data;
    }
    
    public function ReporteZClose($id)
    {
         $register = Register::find($id);
         $user = User::find($register->user_id);
         $sales = Sale::find('all', array(
             'conditions' => array(
                 'register_id = ?',
                 $id
             )
         ));
         $payaments = Payement::find('all', array(
             'conditions' => array(
                 'register_id = ?',
                 $id
             )
         ));
       $sql="SELECT  a.category_id, a.note, 
                     a.amount, b.name AS category_name

              FROM   expences a, catalog_expences b 

              WHERE  a.category_id = b.id 
              AND    a.register_id = ".$id;
              
        //$this->view_data['categories'] = Categorie_menor::find_by_sql($sql);
         $expences = Expence::find_by_sql($sql);

         $cash = 0;
         $cheque = 0;
         $cc = 0;
         $discount = 0;
         $credit = 0;
         $totalIngresos = 0;
         $CashinHand = $register->cash_inhand;
         $date = $register->date;
         $createdBy = $user->firstname . ' ' . $user->lastname;


         foreach ($payaments as $payament) {
            $PayMethode = explode('~', $payament->paidmethod);
            switch ($PayMethode[0]) {
                case '1': // case Credit Card
                    $cc += $payament->paid;
                    break;
                case '2': // case ckeck
                    $cheque += $payament->paid;
                    break;
                default:
                    $cash += $payament->paid;
            }
            $totalIngresos += $payament->paid;
        }

         foreach ($sales as $sale) {
             $PayMethode = explode('~', $sale->paidmethod);
             $paystatus = $sale->total;
             //$paystatus = $sale->paid - $sale->total;
             switch ($PayMethode[0]) {
                 case '1': // case Credit Card
                     $cc += $paystatus > 0 ? $sale->total : $sale->firstpayement;
                     break;
                 case '2': // case ckeck
                     $cheque += $paystatus > 0 ? $sale->total : $sale->firstpayement;
                     break;
                 case '2': // case ckeck
                     $credit += $sale->total;
                     break;
                 default:
                     $cash += $paystatus > 0 ? $sale->total : $sale->firstpayement;
             }
             $discount += $sale->discountamount;

         }
         $data = '

         <div class="col-md-12">
            <div class="text-center">' . $this->setting->receiptheader . '</div>
            <div class="text-center">' . label("Cajero") . ' '.$createdBy .'</div>
            <div class="text-center">' . label("Caja") . ' '.$user->username .'</div>
            <div class="text-center">' . label("Openingtime") .' '.$date->format('Y-m-d h:i:s').' </div>
                    

         <h4>' . label("Sales") . '</h4>         
         <table class="table"><tr style="font-size: smaller;">
         <th width="45%">' . label("Método") . '</th>
         <th width="20%">' . label("Esperados") . ' </th>
         <th width="20%">' . label("Contados") . ' </th>
         <th width="15%">' . label("Diferencia") . '</th>
         </tr>
         <tr style="font-size: smaller;"><td>' . label("Cash") . '</td><td><span id="expectedcash">' . number_format((float)$cash, $this->setting->decimals, ',', '.') . '</span></td>
         <td>0</td>
         <td><span id="diffcash">0</span></td></tr>
         <tr style="font-size: smaller;"><td>' . label("Tarjeta a crédito") . '</td>
         <td><span id="expectedcc">' . number_format((float)$cc, $this->setting->decimals, ',', '.') . '</span></td>
         <td>0</td>
         <td><span id="diffcc">0</span></td></tr>
         <tr style="font-size: smaller;"><td>' . label("Cheque") . '</td>
         <td>0</td>
         <td>0</td>
         <td><span id="diffcheque">0</span></td></tr>
         <tr style="font-size: smaller;"><td>' . label("Discount") . '</td>
         <td>0</td>
         <td>0</td>
         <td><span id="difffiscount">0</span></td></tr>
         <tr style="font-size: smaller;"><td>' . label("Ventas a crédito") . '</td>
         <td><span id="expectedcredit">' . number_format((float)$credit, $this->setting->decimals, ',', '.') . '</span></td>
         <td>0</td>
         <td><span id="difffiscrefit">0</span></td></tr>
         <tr style="font-size: smaller;"><td>' . label("Total") . '</td>
         <td><span id="total">' . number_format((float)($cheque + $cash + $cc), $this->setting->decimals, ',', '.') . '</span></td>
         <td>0</td>
         <td><span id="difftotal">0</span></td></tr>
         </table>';
         $data .= '<h4>' . label("Expenses") . '</h4>         
         <table class="table"><tr style="font-size: smaller;"><th width="25%">' . label("Category") . '</th>
         <th width="50%">' . label("Note") . '</th>
         <th width="25%">' . label("Amount") . ' </th></tr>';
         $totalExpenses=0;
      foreach ($expences as $row) {
         $data .= '<tr style="font-size: smaller;"><td>' . $row->category_name . '</td><td><span>' . $row->note . '</span></td>
         <td><span>' . number_format((float)$row->amount, $this->setting->decimals, ',', '.') . '</span></td>
         </tr>';
         $totalExpenses+=$row->amount;
        }
         $data .= '<tr style="font-size: smaller;"><td>' . label("Total") . ' </td><td></td>
         <td><span>' . number_format((float)$totalExpenses, $this->setting->decimals, ',', '.') . '</span></td>
         </tr>';
  
         $data .= '</table>';

         $sql="SELECT DISTINCT a.name, a.value, SUM(c.price*c.qt) as base 
              FROM taxes a, products b, sale_items c, sales d
              WHERE a.id=b.tax_sale_id and b.id=c.product_id and c.sale_id=d.id and d.register_id = ".$id;
        $sql.=" GROUP BY a.name";
        $diftax = Posale::find_by_sql($sql);   

        $data .= '<h4>' . label("Resúmen IVA") . '</h4>
          <div style="clear:both;">
            <div style="clear:both;">
              <table class="table" cellspacing="0" border="0"><thead><tr><th style="text-align:center;">' . label("Tax") . '</th><th style="text-align:center;">' . label("Base") . '</th><th style="text-align:center;">' . label("IVA") . '</th><th style="text-align:center;">' . label("Total") . '</th></tr></thead>
              <tbody>';
            foreach ($diftax as $row) {
              $taxamount=$row->value*$row->base/100;
              $total=$row->base+$taxamount;
              

              $data .= '<tr style="font-size: smaller;"><td style="text-align:center;">'.$row->name.'</td><td style="text-align:center;">'.number_format($row->base, $this->setting->decimals, ',', '.').'</td><td style="text-align:center;">'.number_format($taxamount, $this->setting->decimals, ',', '.').'</td><td style="text-align:center;">'.number_format($total, $this->setting->decimals, ',', '.').'</td></tr>';
            }
              $data .= '</tbody></table>';
         $data .= '
                   <h4>' . label("Totales") . '</h4>
                    <table class="table">
                  <tr style="font-size:small;">
                       <td>' . label("Ventas") . '</td>
                       <td>' . number_format((float)($cc + $cash + $cheque - $totalIngresos ), $this->setting->decimals, ',', '.') . '</td></tr>
                  <tr style="font-size:small;">
                       <td>' . label("Ingreso ventas a créditos") . '</td>
                       <td>' . number_format((float)($totalIngresos ), $this->setting->decimals, ',', '.') . '</td></tr>
                  <tr style="font-size:small;">
                       <td>' . label("Egresos o gastos") . '</td>
                       <td>-' . number_format((float)($totalExpenses ), $this->setting->decimals, ',', '.') . '</td></tr>
                  <tr style="font-size:small;">
                       <td>' . label("Total caja") . '</td>
                       <td>' . number_format((float)($cc+$cash+$cheque-$totalExpenses ), $this->setting->decimals, ',', '.') . '</td></tr>
                  <tr style="font-size:small;">
                       </table>';
              

         echo $data;
     }

   
    
    public function doReturnSales()
    {
         date_default_timezone_set($this->setting->timezone);
         $date = date("d/m/Y H:i:s");
         
         $user_id=$this->session->userdata('user_id');

         $user = User::find($user_id);

         $posale = Posale::find('all', array(
            'conditions' => array(
                'status = ? AND register_id = ? AND user_id = ?',
                1,
                $this->register,
                $user_id

            )
          ));
         $ticket = '<table class="table" cellspacing="0" border="0">
                    <thead>
                        <tr>
                            <th style="text-align:center; width:5%;"><em>#</em></th>
                            <th style="text-align:left; width:45%;">' . label("Product") . '</th>
                            <th style="text-align:center; width:25%;">' . label("Quantity") . '</th>
                            <th style="text-align:center; width:25%;">' . label("Total") . '</th>
                        </tr>
                    </thead>
                    <tbody>';
        $i = 1;
        
        foreach ($posale as $row) {
            //$product = Product::find($row->product_id);            
             
            $total=($row->price+$row->price*$row->taxvalue/100)*$row->qt;
            $ticket .= '<tr>
                            <td style="text-align:center; width:5%;">'.$i.'</td>
                            <td style="text-align:left; width:45%;">'.$row->name.'</td>
                            <td style="text-align:center; width:25%;">'.$row->qt.'</td>
                            <td style="text-align:center; width:25%;">'.number_format($total, 0, ",", ".").'</td>
                        </tr>';
            $i ++;
        }

        $ticket .= '</tbody></table>';
        
        die($ticket);   

       
    }
    public function pedido()
    {
         date_default_timezone_set($this->setting->timezone);
         $date = date("d/m/Y H:i:s");
         
         $user_id=$this->session->userdata('user_id');

         $user = User::find($user_id);

         $posale = Posale::find('all', array(
            'conditions' => array(
                'status = ? AND register_id = ? AND user_id = ?',
                1,
                $this->register,
                $this->session->userdata('user_id')

            )
          ));
         //print_r($posale);
         $arreglo=explode("%", $this->setting->tax);
         $tax=$arreglo[0];
         $ticket = '<table cellspacing="0" border="0" width="100%">
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;"><h4>'.label("Pedido").': '.$date.'</h4></td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;">'.label("Caja").': '.$user->username.'</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;">'.label("Cajero").': '.$user->firstname." ".$user->lastname.'</td>
                            </tr>
                            <tr><td style="text-align:center;"><em></em></td></tr>
                    </table>
                        <div style="clear:both;">
                                <table class="table" cellspacing="0" border="0">
                                    <thead>
                                    <tr>
                                        <th style="text-align:center; width:5%;"><em>#</em></th>
                                        <th style="text-align:left; width:45%;">' . label("Product") . '</th>
                                        <th style="text-align:center; width:25%;">' . label("Disponible") . '</th>
                                        <th style="text-align:center; width:25%;">' . label("Quantity") . '</th>
                                    </tr>
                                    </thead>
                                    <tbody>';
        $i = 1;
        
        foreach ($posale as $row) {
            //$product = Product::find($row->product_id);            
            $disponible=0;
            $stocks = Stock::find('all', array(
            'conditions' => array(
                'product_id = ? AND store_id = ?',                
                $row->product_id,
                $this->store

                )
              ));
            
            foreach ($stocks as $stock) {
                $disponible=$stock->quantity;
            }
             
            $subtot=$row->price*$row->qt;
            $ticket .= '<tr>
                            <td style="text-align:center; width:5%;">' . $i . '</td>
                            <td style="text-align:left; width:45%;">' . $row->name . '</td>
                            <td style="text-align:center; width:25%;">' . $disponible . '</td>
                            <td style="text-align:center; width:25%;">' . $row->qt . '</td>
                        </tr>';
            $i ++;
            

        }

        $ticket .= '</tbody></table></div>';
        
        die($ticket);   

       
    }
    
    public function cotizar()
    {
         date_default_timezone_set($this->setting->timezone);
         $date = date("d/m/Y H:i:s");
         
         $user_id=$this->session->userdata('user_id');

         $user = User::find($user_id);

         $posale = Posale::find('all', array(
            'conditions' => array(
                'status = ? AND register_id = ? AND user_id = ?',
                1,
                $this->register,
                $this->session->userdata('user_id')

            )
          ));
         //print_r($posale);
         $arreglo=explode("%", $this->setting->tax);
         $tax=$arreglo[0];
         $ticket = '<table cellspacing="0" border="0" width="100%">
                            <tr style="font-size: smaller;">
                                <td style="text-align:center;">'.$this->setting->receiptheader.'</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;">' .label("Cotización").': '.$date. '</td>
                            </tr>
                       
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;">' . label("Cajero") . ': ' .$user->firstname." ".$user->lastname. '</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;">' . label("Caja") . ': '.$user->username.'</td>
                            </tr>
                            <tr><td style="text-align:center;"><em></em></td></tr>
                    </table>
                    <table cellspacing="0" border="0" width="100%">
                                    <thead>
                                    <tr style="font-size: smaller;">
                                        <th style="text-align:left; width:5%;"><em>#</em></th>
                                        <th style="text-align:left; width:35%;">' . label("Product") . '</th>
                                        <th style="text-align:center; width:15%;">' . label("Price") . '</th>
                                        <th style="text-align:center; width:15%;">' . label("Quantity") . '</th>
                                        <th style="text-align:center; width:15%;">' . label("Tax") . '</th>
                                        <th style="text-align:center; width:15%;">' . label("Total") . '</th>
                                    </tr>
                                    </thead>
                                    <tbody>';
        $i = 1;
        $suma=0;
        foreach ($posale as $row) {
            //$product = Product::find($row->product_id);
            $prod = Product::find($row->product_id);
            $tax = Tax::find($prod->tax_sale_id);
            $base = $row->qt * $row->price;
            $discount = $base * $row->discount/100;            
            $baseNew = $base - $discount;

            $taxamount = $baseNew * $tax->value/100;
            $taxamount2 = $base * $tax->value/100;
            $subtot = $baseNew + $taxamount;
            $total = $base + $taxamount2;
            
            $ticket .= '<tr style="font-size: smaller;">
                            <td style="text-align:left; width:5%;">' . $i . '</td>
                            <td style="text-align:left; width:35%;">' . $row->name . '</td>
                            <td style="text-align:center; width:15%;">' . number_format($row->price, 0, ",", "."). '</td>
                            <td style="text-align:center; width:15%">' . $row->qt . '</td> 
                            <td style="text-align:center; width:15%;">' . $tax->name. '</td>
                            <td style="text-align:center; width:15%;">' . number_format($total, 0, ",", "."). '</td>
                        </tr>';
            $i ++;
            $suma+=$total;

        }

        $ticket .= '</tbody></table>';

        
        $ticket .= '<div style="border-top:1px solid #000; padding-top:10px;">
                        <div style="clear:both;"><h4 class="text-center">' . label("Total") . ': ' . number_format($suma, 0, ",", "."). '</h4> </div>

                    </div>';
        
        die($ticket);   

       
    }

    public function findproduct($code)
    {
          $product = Product::find('first', array(
            'conditions' => array(
                'reference = ? AND in_activo = ?',
                $code, '1'
            )
          ));
          if($product)
          {
               $cheked = false;
               $invis = $product->h_stores;
               $invis = trim($invis, ",");
               $array = explode(',', $invis); //split string into array seperated by ', '
               foreach($array as $value) //loop over values
               {
                  if($value == $this->store)
                    $cheked = true;
               }
               if($cheked)
                    echo $product->id;
                else
                    echo 0;

          }
          else
            echo 0;
        
    }
    public function lastInvoice()
    {
          $register = Register::find($this->register);
          $store = Store::find($register->store_id);
          $sql="SELECT MAX(a.invoice) as invoice FROM sales a, registers b WHERE a.register_id=b.id 
              AND b.store_id=".$register->store_id;
          $invoices = Sale::find_by_sql($sql);           
       
          if($invoices)
            foreach ($invoices as $row) {
                if($row->invoice>0)
                    echo str_pad($row->invoice, 8, "0", STR_PAD_LEFT);
                else
                    echo str_pad($store->invoice_begin, 8, "0", STR_PAD_LEFT);
            }
          else
            echo 00000001;
        
    }

    public function openregister($id = 0)
    {

       
        if ($_POST) {

            $cash = $this->input->post('cash');
            $id = $this->input->post('store');
            $data = array(
                "status" => 1,
                "user_id" => $this->session->userdata('user_id'),
                "cash_inhand" => $cash,
                "store_id" => $id
            );
            $register = Register::create($data);

            $attributes = array(
                'number' => 1,
                'time' => date("H:i"),
                'register_id' => $register->id,
                'user_id' => $this->session->userdata('user_id'),
                "store_id" => $id
            );
            Hold::create($attributes);

            $store = Store::find($id);
            $store->status = 1;
            $store->save();
            $CI = & get_instance();
            $CI->session->set_userdata('register', $register->id);
            $CI->session->set_userdata('store', $id);
            redirect("", "location");
        }
        $open_reg = Register::find('first', array(
            'conditions' => array(
                'store_id = ? AND status= ? AND user_id = ?',
                $id,
                1,
                $this->session->userdata('user_id')
            )
        ));
        $CI = & get_instance();
        $CI->session->set_userdata('register', $open_reg->id);
        $CI->session->set_userdata('store', $id);
        redirect("", "location");
    }

    public function switshregister()
    {
        $CI = & get_instance();
        $CI->session->set_userdata('register', 0);
        $CI->session->set_userdata('store', 0);
        redirect("", "location");
    }

    public function addpdc()
    {
      $product = Product::find($this->input->post('product_id'));
      //$PostPrice = $this->input->post('price');
      $tax_id = $this->input->post('tax_id');
      $qtposale = $this->input->post('qtposale');
      $discount = $this->input->post('discount');
      //$price = !$product->taxmethod || $product->taxmethod == '0' ? floatval($PostPrice) : floatval($PostPrice)*(1 + $product->tax / 100);
      $tax=Tax::find($tax_id);
      $price = $product->price;
      $base = $product->base;
      //if($base <= 0)
        $base = $price/(1+$tax->value/100);

      


      /******************************************* sock version *************************************************************/
      if($product->type == '0')
      {
         $register = Register::find($this->register);
         $stock = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $register->store_id, $this->input->post('product_id'))));
         $quantity = $stock ? $stock->quantity : 0;
        $posale = Posale::find('first', array(
            'conditions' => array(
                'status = ? AND register_id = ? AND product_id = ?',
                1,
                $this->register,
                $this->input->post('product_id')
            )
        ));
        if ($posale) 
        {
            if($qtposale > 0) 
            {
                $posale->qt = $qtposale;
                $posale->save();
                
            }
            else 
            {
               // echo 'stock';
              $posale->delete();
            }
            echo json_encode(array(
               "status" => TRUE
            ));
      } 
      else
      { 
          if($qtposale > 0)
          {
             $data = array(
                    
                    "product_id" => $this->input->post('product_id'),
                    "name" => $this->input->post('name'),
                    "price" => $base,
                    "discount" => $discount,
                    "taxvalue" => $tax->value,
                    "number" => $this->input->post('number'),
                    "user_id" => $this->session->userdata('user_id'),
                    "register_id" => $this->input->post('registerid'),
                    "qt" => $qtposale,
                    "status" => 1
                );
                //die(print_r($data));
                Posale::create($data);
          }
          echo json_encode(array(
             "status" => TRUE
          ));
        }
        //else {
          // echo 'stock';
        //}
       /******************************************* combo version *************************************************************/
     }
     /*elseif ($product->type == '2') {
        $posale = Posale::find('first', array(
           'conditions' => array(
             'status = ? AND register_id = ? AND product_id = ?',
             1,
             $this->register,
             $this->input->post('product_id')
          )
       ));
        $register = Register::find($this->register);
        $quantity = 1;
        $combos = Combo_item::find('all', array('conditions' => array('product_id = ?', $this->input->post('product_id'))));
        foreach ($combos as $combo) {
           $prd = Product::find($combo->item_id);
           if($prd->type == '0'){
               $stock = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $register->store_id, $combo->item_id)));
               if ($posale)
                  $diff = $stock ? ($stock->quantity - $combo->quantity*($posale->qt+1)) : 1;
               else
                 $diff = $stock ? ($stock->quantity - $combo->quantity) : 1;
              $quantity = $stock ? ($diff >= 0 ? 1 : 0) : $quantity;
           }
        }
      if ($posale) {
          if($quantity > 0) {
           $posale->qt ++;
           $posale->save();
           echo json_encode(array(
               "status" => TRUE
           ));
        }else {
           echo 'stock';
        }
     } elseif($quantity > 0){
           $data = array(
               "product_id" => $this->input->post('product_id'),
               "name" => $this->input->post('name'),
               "price" => $price,                
               "taxvalue" => $tax->value,
               "number" => $this->input->post('number'),
               "register_id" => $this->input->post('registerid'),
               "qt" => 1,
               "status" => 1
           );
           Posale::create($data);
           echo json_encode(array(
               "status" => TRUE
           ));
      }else {
          echo 'stock';
      }
     }*/
     /******************************************* service version *************************************************************/
     /*else {
        $posale = Posale::find('first', array(
            'conditions' => array(
                'status = ? AND register_id = ? AND product_id = ?',
                1,
                $this->register,
                $this->input->post('product_id')
            )
        ));
        if ($posale) {
            $posale->qt ++;
            $posale->save();
            echo json_encode(array(
                "status" => TRUE
            ));
        } else {
            $data = array(
                "product_id" => $this->input->post('product_id'),
                "name" => $this->input->post('name'),
                "price" => $price,
                "taxvalue" => $tax->value,
                "number" => $this->input->post('number'),
                "register_id" => $this->input->post('registerid'),
                "qt" => 1,
                "status" => 1
            );
            Posale::create($data);
            echo json_encode(array(
                "status" => TRUE
            ));
        }
     }*/
    }

    public function load_posales($idposale=NULL)
    {

        $setting = Setting::find(1, array(
            'select' => 'currency'
        ));
        $user = User::find($this->session->userdata('user_id'));
         
        $posales = Posale::find('all', array(
            'conditions' => array(
                'status = ? AND register_id = ? AND user_id = ?',
                1,
                $this->register,
                $this->session->userdata('user_id')
            ),
            'order' => 'id asc'
        ));
        $data = '';
        //die($idposale);
        $i=-1;
        if ($posales) {
            foreach ($posales as $posale) {
              $i++;
               $price_uni=$posale->price+($posale->price*$posale->taxvalue/100);
               $price_uni=number_format((float)$price_uni, 0, '.', '');
               $base=$posale->price*$posale->qt;
               $discount=$base*$posale->discount/100;      
               $base=$base-$discount;         
               $taxamount=$base*$posale->taxvalue/100;
               $subtotal=$base+$taxamount;
               //$subtotal=$price_uni*$posale->qt;
               //echo $subtotal.':'.$price_uni.':'.$posale->qt;
               
               $alertqt = Product::find($posale->product_id)->alertqt;
               $product = Product::find($posale->product_id);
               $type = $product->type;
               $storeid = Register::find($this->register)->store_id;
               $disp= Stock::find('first', array('conditions' => array('product_id = ? AND store_id = ?', $posale->product_id, $storeid)));
               $alert="background-color:pink" ;

               if($disp)
               {
                  if($disp->quantity - $posale->qt > $alertqt)
                    $alert="background-color:white" ;                      

               }               
               //$alert = $type == '0' ? ()->quantity - $posale->qt <= $alertqt ? 'background-color:pink' : '') : '';


               if($idposale==$posale->id)
                  $alert="background-color:rgb(162, 226, 232)" ;
                //die($alert);
               $row = '<div class="col-xs-12">
                          <div class="panel panel-default product-details product-details_pos_list">
                            <div id="rowItem_'.$i.'" class="panel-body panel-body_pos_list" style="'.$alert.'">
                              
                              <div class="col-xs-6 nopadding">
                                <div id="'.$posale->id.'" name="'.$i.'" class="col-xs-1 nopadding">
                                  <a href="javascript:void(0)" onclick="delete_posale(' . "'" . $posale->id . "'" . ')" id="itemposale_'.$i.'">
                                    <span class="fa-stack fa-sm productD">
                                      <i class="fa fa-circle fa-stack-2x delete-product"></i>
                                      <i class="fa fa-times fa-stack-1x fa-fw fa-inverse"></i>
                                    </span>
                                  </a>
                                </div>
                                <div class="col-xs-2 nopadding">
                                  <span id="posale_id_'.$i.'" class="text-center" style="display:none;">' . $posale->id . '</span> 
                                  <span class="text-center" style = "  padding-top:2px; font-size: smaller;">' . $product->reference . '</span> 
                                </div>

                                <div class="col-xs-9 nopadding">
                                  <p class="text-center" style = " padding-left:10px; padding-top:2px; font-size:smaller;">' . $posale->name . '</p>
                                </div>
                              </div>
                              
                              <div class="col-xs-1">
                               <input type="text" id="price-' . $posale->id . '" onchange="edit_posale(' . $posale->id . ')" class="form-control" value="' . number_format((float)$price_uni, 0, ',', '.') . '" placeholder="0" style=" width: 5.1em; padding:5px; text-align: end;"';
                               if($user->role!='admin' )
                                    $row .= ' readonly ';
                               $row .=' >
                               <input type="hidden" id="priceHdn-' . $posale->id . '" value="' . number_format((float)$posale->price, 2, ',', '.') . '" >
                               
                               
                               
                               </div>                              
                              <div class="col-xs-2 productNum text-center" style="display: flex;align-items: center;">
                                <a href="javascript:void(0)">
                                  <span class="fa-stack fa-sm decbutton">
                                    <i class="fa fa-square fa-stack-2x light-grey"></i>
                                    <i class="fa fa-minus fa-stack-1x fa-inverse white"></i>
                                  </span>
                                </a>
                                <input type="number" step="0.01" id="qt-' . $posale->id . '" onchange="edit_posale(' . $posale->id . ')" class="form-control" value="' . $posale->qt . '" placeholder="0" style="width: 5.2em;height: 27px; padding:5px;">
                                <input type="hidden" id="product_id_'. $i.'" value="'.$posale->product_id.'">
                                <a href="javascript:void(0)">
                                  <span class="fa-stack fa-sm incbutton">
                                    <i class="fa fa-square fa-stack-2x light-grey"></i>
                                    <i class="fa fa-plus fa-stack-1x fa-inverse white"></i>
                                  </span>
                                </a>
                              </div>                              
                              <div class="col-xs-1 nopadding ">
                                <p style="text-align: right;">' . number_format((float)$posale->discount, $this->setting->decimals, ',', '.') . '%</p>
                              </div>                              
                              <div class="col-xs-1 nopadding ">
                                <p style="text-align: right;">' . number_format((float)$posale->taxvalue, $this->setting->decimals, ',', '.') . '%</p>
                              </div>                              
                              <div class="col-xs-1 nopadding ">
                                <p style="text-align: right;">' . number_format((float)$subtotal, $this->setting->decimals, ',', '.') . '</p>
                              </div>
                            </div>
                          </div>
                        </div>';

                $data .= $row;
                $data .= '<script type="text/javascript">
                  cliente_especial();
                  $(document).ready(function(){';
                  if($idposale==$posale->id){
                    $data .= '
                    $("#qt-' . $posale->id . '").select();';
                  }
                  $data .= '
                  });
                  </script>';
            }
            // adding script for the +/- buttons
            $data .= '<script type="text/javascript">$(".incbutton").on("click", function() {var $button = $(this);var oldValue = $button.parent().parent().find("input").val();var newVal = parseFloat(oldValue) + 1;$button.parent().parent().find("input").val(newVal);edit_posale($button.parent().parent().find("input").attr("id").slice(3));});$(".decbutton").on("click", function() {var $button = $(this);var oldValue = $button.parent().parent().find("input").val();if (oldValue > 1) {var newVal = parseFloat(oldValue) - 1;} else {newVal = 1;}$button.parent().parent().find("input").val(newVal);edit_posale($button.parent().parent().find("input").attr("id").slice(3));});
                </script><input type="hidden" id="hdnItem" value="'.($i+1).'">';
        } else {

            $data = '<div class="messageVide">' . label("EmptyList") . '<br><span>(' . label("SelectProduct") . ')<br><br></span></div>';
        }
        echo $data;
    }

    public function delete($id)
    {
        $posale = Posale::find($id);
        $posale->delete();
        echo json_encode(array(
            "status" => TRUE
        ));
    }

    public function edit($id)
    {
        $posale = Posale::find($id);
        $product = Product::find($posale->product_id);
       if($product->type == '0'){
          $register = Register::find($this->register);
          $stock = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $register->store_id, $posale->product_id)));
          $quantity = $stock ? $stock->quantity : 0;
          //if(intval($this->input->post('qt')) <= intval($quantity)) {
          //die($this->input->post('price'));
          //$base=$this->input->post('base');
          $price=$this->input->post('price');
          $base=$price/(1+$posale->taxvalue/100);

             $data = array(
                 "qt" => $this->input->post('qt'),
                 "price" => $base,
                 "discount" => $this->input->post('discount')
             );
             $posale->update_attributes($data);
             echo json_encode(array(
                 "status" => TRUE
             ));

        //}else {
          // echo 'stock';
        //}
    /******************************************* combo version *************************************************************/
   }
   /*elseif ($product->type == '2') {
     $register = Register::find($this->register);
     $quantity = 1;
     $combos = Combo_item::find('all', array('conditions' => array('product_id = ?', $posale->product_id)));
     foreach ($combos as $combo) {
         $prd = Product::find($combo->item_id);
         if($prd->type == '0'){
             $stock = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $register->store_id, $combo->item_id)));
            $diff = $stock ? ($stock->quantity - $combo->quantity*($this->input->post('qt'))) : 1;
            $quantity = $stock ? ($diff >= 0 ? 1 : 0) : $quantity;
         }
     }
        if($quantity > 0) {
           $data = array(
              "qt" => $this->input->post('qt')
          );
          $posale->update_attributes($data);
          echo json_encode(array(
              "status" => TRUE
          ));
     }else {
         echo 'stock';
     }
   }else {
        $data = array(
            "qt" => $this->input->post('qt')
        );
        $posale->update_attributes($data);
        echo json_encode(array(
            "status" => TRUE
        ));
     }*/

    }

    public function subtot()
    {
        $posales = Posale::find('all', array(
            'conditions' => array(
                'status = ? AND register_id = ? AND user_id = ?',
                1,
                $this->register,
                $this->session->userdata('user_id')

            )
        ));
        $sub = 0;
        //$discount = 0;
        foreach ($posales as $posale) {
            $base=$posale->price*$posale->qt;

            $discount=$base*$posale->discount/100;      
            $base=$base-$discount;         
            $taxamount=$base*$posale->taxvalue/100;
              
            $sub += $taxamount+$base;
            //echo $sub.'<br>';
        }
        echo number_format($sub, 0, '.', '');
    }

    public function totiems()
    {
        $posales = Posale::find('all', array(
            'conditions' => array(
                'status = ? AND register_id = ? AND user_id = ?',
                1,
                $this->register,
                $this->session->userdata('user_id')
            )
        ));
        $sub = 0;
        foreach ($posales as $posale) {
            $sub += $posale->qt;
        }
        echo $sub;
    }

    public function GetDiscount($id)
    {
        $number= $this->input->post('number');

        if($id==0)
        {
           $Discount=0;
           $firstname='Público ';
           $lastname='General';

        } 
        else
        {
           $customer = Customer::find($id);
           $Discount = stripos($customer->discount, '%') > 0 ? $customer->discount : number_format((float)$customer->discount, $this->setting->decimals, ',', '.');
           $firstname = $customer->firstname1;
           $lastname = $customer->lastname1;
        }
        $posales = Posale::find('all', array(
            'conditions' => array(
                'status = ? AND register_id = ? AND user_id = ?',
                1,
                $this->register,
                $this->session->userdata('user_id')
            )
        ));
        $amountDiscount=0;
        foreach ($posales as $posale) {
            
            $amountDiscount += $posale->price * $posale->qt * $Discount/100;
            $posale->discount = $Discount;
            $posale->save();
        }

        $hold = Hold::find('first', array(
            'conditions' => array(
                'number = ? AND register_id = ? ',
                $number,
                $this->register
            )
        ));
        $hold->customer_id = $id;
        $hold->save();
        

        
        echo $Discount . '~' . $firstname. ' ' . $lastname. '~' . number_format((float)$amountDiscount, $this->setting->decimals, '.', '');
    }

    public function PushDiscount($id)
    {
        /*if($id==0)
        {
           $Discount=0;
           //$firstname='Cliente ';
           //$lastname='sin Registrar';

        } 
        else
        { */   
            $Discount=$this->input->post('discount');
            $posales = Posale::find('all', array(
                'conditions' => array(
                    'status = ? AND register_id = ? AND user_id = ?',
                1,
                $this->register,
                $this->session->userdata('user_id')
                )
            ));

            $amountDiscount=0;
            foreach ($posales as $posale) {
               $amountDiscount += $posale->price * $posale->qt * $Discount/100;            
                $posale->discount=$Discount;
                $posale->save();
            }
          
        //}
        
        echo $Discount . '~' . number_format((float)$amountDiscount, $this->setting->decimals, '.', '');
    }

    public function ResetPos()
    {
        Posale::delete_all(array(
            'conditions' => array(
                'status = ? AND register_id = ? AND user_id = ?',
                1,
                $this->register,
                $this->session->userdata('user_id')
            )
        ));
        echo json_encode(array(
            "status" => TRUE
        ));
    }

    public function AddNewSale($type)
    {
        date_default_timezone_set($this->setting->timezone);
        $date = date("Y-m-d H:i:s");
        $_POST['created_at'] = $date;
        $_POST['register_id'] = $this->register;
        //$customer = Customer::find($this->input->post('cliente_id'));
        //$discount=0;
        //if($customer)
          //$discount=$customer->discount;
        $user = User::find($this->session->userdata('user_id'));
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
        $paystatus = $_POST['paid'] - $_POST['total'];
        $_POST['firstpayement'] = $paystatus > 0 ? $_POST['total'] : $_POST['paid'];
                $p=0;
        $sql="SELECT MAX(a.invoice) as invoice 
              FROM sales a, registers b
              WHERE a.register_id=b.id AND b.store_id = ".$register->store_id;
        $reg = Sale::find_by_sql($sql);  

        foreach ($reg as $row) {
            if($row->invoice>0)
            {
                $numInvoice=$row->invoice;
            }
            else
            {
                $numInvoice=$store->invoice_begin;      
            }
        }
            //Codigo para segurar que no se repita numero de factura en una tienda
        do{
                $numInvoice=$numInvoice+1;      
               
                $sql="SELECT a.invoice as invoice FROM sales a, registers b 
                      WHERE a.register_id=b.id 
                      AND a.invoice=$numInvoice AND b.store_id=".$register->store_id;

                $reg = Sale::find_by_sql($sql);  

                $existeInvoice=null;
                foreach ($reg as $row) {
                    $existeInvoice=$row->invoice;
                }        
        
                if($existeInvoice)
                {
                    $p=0;
                }
                else
                {
                    $p=1;
                    //$sale->invoice=$numInvoice;
                    $_POST['invoice']=$numInvoice;
                    try{
                        //$sale->save();
                         $sale = Sale::create($_POST);

                    } catch (Exception $e) {
                        $body = $e->getJsonBody();
                        $err = $body['error'];
                        echo "<p class='bg-danger text-center'>" . $err['message'] . '</p>';
                    }
                }
                
        }while($p==0);

        

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
    
        $posales = Posale::find('all', array(
            'conditions' => array(
                'status = ? AND register_id = ? AND user_id = ?',
                1,
                $register->id,
                $user->id

            )
        ));

        
        foreach ($posales as $posale) {
            $prod = Product::find($posale->product_id);
            //$tax = Tax::find($prod->tax_sale_id);
            $base = $posale->qt * $posale->price;
            $discount = $base * $posale->discount/100;            
            $baseNew = $base - $discount;

            $taxamount = $baseNew * $posale->taxvalue/100;
            $taxamount2 = $base * $posale->taxvalue/100;
            $subtotal = $baseNew + $taxamount;
            $total = $base + $taxamount2;
            
                    
            $data = array(
                "product_id" => $posale->product_id,
                "name" => $posale->name,
                "price" => $posale->price,
                "qt" => $posale->qt,
                "subtotal" => $subtotal,
                "taxvalue" => $posale->taxvalue,
                "taxamount" => $taxamount,
                "discount" => $discount,
                "total" => $total,
                "sale_id" => $sale->id,
                "date" => $date
            );
            $number = $posale->number;
            $register = Register::find($this->register);

            if($prod->type == "2"){
            /****************************************** combo case *************************************************************/
            $combos = Combo_item::find('all', array('conditions' => array('product_id = ?', $posale->product_id)));
            foreach ($combos as $combo) {
               $prd = Product::find($combo->item_id);
               if($prd->type == '0'){
                  $stock = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $register->store_id, $combo->item_id)));
                  $stock->quantity = $stock->quantity - ($combo->quantity*$posale->qt);
                  $stock->save();
               }
            }
            /*******************************************************************************************************/
         }else if($prod->type == "0"){
            $stock = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $register->store_id, $posale->product_id)));
            
            if($stock)
            {
                $stock->quantity = $stock->quantity - $posale->qt;
                //echo ($stock->quantity.'<br>');
                $stock->save();
            } 
            else 
            {
                $stock_new['product_id'] = $posale->product_id;
                $stock_new['store_id'] = $register->store_id;
                $stock_new['quantity'] = -$posale->qt;

                Stock::create($stock_new);
            }

            
         }
            $pos = Sale_item::create($data);
        }

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
                            <tr><td style="text-align:center;color:red"><em></em></td></tr>
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
            $prod = Product::find($posale->product_id);
            //$tax = Tax::find($prod->tax_sale_id);
            
            $base = $posale->qt * $posale->price;
            $discount = $base * $posale->discount/100;            
            //echo $posale->discount;
            $totalDiscount += $discount;
            $baseNew = $base - $discount;

            $taxamount = $baseNew * $posale->taxvalue/100;
            $subtotal = $baseNew + $taxamount;

            $taxamount2 = $base * $posale->taxvalue/100;
            $total = $base + $taxamount2;

            
            $sumaSubTotal += $subtotal;
            $sumaTotal += $total;
            $price = $posale->price+($posale->price*$posale->taxvalue/100);


            
            $ticket .= '
            <tr style="font-size: smaller;">
                <td style="text-align:left;width:50%;">' .substr($posale->name, 0, 19).'</td>
                <td style="text-align:right; width:20%; ">' . number_format($price, $this->setting->decimals, ',', '.') . '  </td>
                <td style="text-align:center; width:10%;">' . $posale->qt . '</td>
                <td style="text-align:right; width:25%; ">' . number_format($total, $this->setting->decimals, ',', '.') . '</td>
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
                        <td colspan="2" style="border-top:1px dashed #000;padding-top:5px; text-align:right; font-weight:bold;">' . number_format((float)(floatval($sale->paid) - floatval($sumaSubTotal)), $this->setting->decimals, ',', '.') . '</td>
                    </tr>
                    <tr><td colspan="4"><em></em></td></tr>

                    </tbody></table>';
        }

        $sql="SELECT DISTINCT a.name, a.value, SUM((c.price-c.price*c.discount/100)*c.qt) as base 
              FROM taxes a, products b, posales c
              WHERE a.id=b.tax_sale_id and b.id=c.product_id and c.register_id = ".$this->register;
        $sql.=" GROUP BY a.name";
        $diftax = Posale::find_by_sql($sql);   


        $ticket .= '
              <table class="table" cellspacing="0" border="0"><thead>
                <tr style="font-size: smaller;">
                    <th style="text-align:center;">' . label("Tax") . '</th>
                    <th style="text-align:center;">' . label("Base") . '</th>
                    <th style="text-align:center;">' . label("IVA") . '</th>
                    <th style="text-align:center;">' . label("Total") . '</th>
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
       
            $ticket .= '<img style="margin-top:30px;display:block;margin:auto;width:100%;" src="' . site_url('pos/GenerateBarcode/' . sprintf("%05d", $sale->id) . '/' . $bcs . '/' . $height . '/' . $width) . '" alt="' . $sale->id . '" />
            <p style="margin:0 auto;margin-top:10px;text-align: center;">' . $store->footer_text . '</p>
            <div style="background-color:#000;padding:5px;width:100%;color:#fff;margin:0 auto;border-radius:3px;margin-top:20px;text-align: center;">' . $this->setting->receiptfooter . '</div>';
          if($PayMethode[0]==3)
          {
            $ticket .= '<br><div style="clear:both;"><span class="text-center">' . label("Firma Cliente") . ': ______________________________</span></div>';
          }
          $ticket .='<input type="hidden" id="hdnTicketInvoice" name="hdnTicketInvoice" value="'.$sale->id.'">';


        $sale->total=$sumaTotal;
        $sale->discountamount=$totalDiscount;
        $sale->save();
        
        Posale::delete_all(array(
            'conditions' => array(
                'status = ? AND register_id = ? AND user_id = ?',
                1,
                $this->register,
                $this->session->userdata('user_id')

            )
        ));
        if (isset($number)) {
            if ($number != 1)
                Hold::delete_all(array(
                    'conditions' => array(
                        'number = ? AND register_id = ? AND user_id = ?',
                        $number,
                        $this->register,
                        $this->session->userdata('user_id')

                    )
                ));
        }
        $hold = Hold::find('last', array(
            'conditions' => array(
                'register_id = ? AND user_id = ?',
                $this->register,
                $this->session->userdata('user_id')
            )
        ));
        if ($hold) {
            Posale::update_all(array(
                'set' => array(
                    'status' => 1
                ),
                'conditions' => array(
                    'number = ? AND register_id = ? AND user_id = ?',
                    $hold->number,
                    $this->register,
                    $this->session->userdata('user_id')

                )
            ));
        }
        //die();
        echo $ticket;
    }

    function GenerateBarcode($code = NULL, $bcs = 'code128', $height = 60, $width = 1)
    {
        $this->load->library('zend');
        $this->zend->load('Zend/Barcode');
        $barcodeOptions = array(
            'text' => $code,
            'barHeight' => $height,
            'barThinWidth' => $width,
            'drawText' => FALSE
        );
        $rendererOptions = array(
            'imageType' => 'png',
            'horizontalPosition' => 'center',
            'verticalPosition' => 'middle'
        );
        
        $imageResource = Zend_Barcode::render($bcs, 'image', $barcodeOptions, $rendererOptions);

        return $imageResource;
    }

    // ******************************************************** hold functions
    public function holdList($registerid)
    {
        $holds = Hold::find('all', array(
            'conditions' => array(
                'register_id = ? AND user_id = ?',
                $registerid,
                $this->session->userdata('user_id')
            ),
            'order' => 'number asc'
        ));
        $posale = Posale::find('last', array(
            'conditions' => array(
                'status = ? AND register_id = ? AND user_id = ?',
                1,
                $this->register,
                $this->session->userdata('user_id')

            )
        ));
        $Tholds = '';
        if (empty($holds))
            $Tholds = '<span class="Hold selectedHold">1<span id="Time">' . date("H:i") . '</span></span>';
        else {
            if (empty($posale)) {
                $numItems = count($holds);
                $i = 0;
                foreach ($holds as $hold) {
                    if (++ $i === $numItems)
                        $Tholds .= '<span class="Hold selectedHold" id="' . $hold->number . '"  onclick="SelectHold(' . $hold->number . ')">' . $hold->number . '<span id="Time">' . $hold->time . '</span></span>';
                    else
                        $Tholds .= '<span class="Hold" id="' . $hold->number . '"  onclick="SelectHold(' . $hold->number . ')">' . $hold->number . '<span id="Time">' . $hold->time . '</span></span>';
                }
            } else {
                foreach ($holds as $hold) {
                    if ($hold->number == $posale->number)
                        $selected = 'selectedHold';
                    else
                        $selected = '';
                    $Tholds .= '<span class="Hold ' . $selected . '" id="' . $hold->number . '" onclick="SelectHold(' . $hold->number . ')">' . $hold->number . '<span id="Time">' . $hold->time . '</span></span>';
                }
            }
        }
        echo $Tholds;
    }

    public function AddHold($registerid)
    {
        $hold = Hold::find('last', array(
            'conditions' => array(
                'register_id = ? AND user_id = ?',
                $registerid,
                $this->session->userdata('user_id')
            )
        ));
        $number = ! empty($hold) ? intval($hold->number) + 1 : 1;
        Posale::update_all(array(
            'set' => array(
                'status' => 0
            ),
            'conditions' => array(
                'status = ? AND register_id = ? AND user_id = ?',
                1,
                $this->register,
                $this->session->userdata('user_id')

            )
        ));
        $attributes = array(
            'number' => $number,
            'time' => date("H:i"),
            'register_id' => $registerid,
            'user_id' => $this->session->userdata('user_id'),
            'store_id' => $this->store
        );
        Hold::create($attributes);
        echo json_encode(array(
            "status" => TRUE
        ));
    }

    public function RemoveHold($number, $registerid)
    {
        $hold = Hold::find('first', array(
            'conditions' => array(
                'number = ? AND register_id = ? AND user_id=?',
                $number,
                $registerid,
                $this->session->userdata('user_id')
            )
        ));
        $hold->delete();
        Posale::delete_all(array(
            'conditions' => array(
                'number = ? AND register_id = ? AND user_id = ?',
                $number,
                $registerid,
                $this->session->userdata('user_id')

            )
        ));
        $hold = Hold::find('last', array(
            'conditions' => array(
                'register_id = ? AND user_id = ?',
                $registerid,
                $this->session->userdata('user_id')
            )
        ));
        Posale::update_all(array(
            'set' => array(
                'status' => 1
            ),
            'conditions' => array(
                'number = ? AND register_id = ? AND user_id = ?',
                $hold->number,
                $registerid,
                $this->session->userdata('user_id')

            )
        ));
        echo json_encode(array(
            "status" => TRUE
        ));
    }

    public function SelectHold($number)
    {
        Posale::update_all(array(
            'set' => array(
                'status' => 0
            ),
            'conditions' => array(
                'status = ? AND register_id = ? AND user_id = ?',
                1,
                $this->register,
                $this->session->userdata('user_id')
            )
        ));
        Posale::update_all(array(
            'set' => array(
                'status' => 1
            ),
            'conditions' => array(
                'number = ? AND register_id = ? AND user_id = ?',
                $number,
                $this->register,
                $this->session->userdata('user_id')

            )
        ));
        $hold = Hold::find('first', array(
             'conditions' => array(
                 'register_id = ? AND number = ?',
                 $this->register,
                 $number
                 
             )
         ));

        /*echo json_encode(array(
            "status" => TRUE
        ));*/
        echo $hold->customer_id;
    }

    /**
     * ****************** register functions ***************
     */
     public function CloseRegister()
     {
         $register = Register::find($this->register);
         $user = User::find($register->user_id);
         $sales = Sale::find('all', array(
             'conditions' => array(
                 'register_id = ? AND in_activo = ?',
                 $this->register,
                 1
                 
             )
         ));

       /*$payaments = Payement::find('all', array(
             'conditions' => array(
                 'register_id = ?',
                 $this->register
             )
         ));*/
       $sql="SELECT a.paid, a.paidmethod
             FROM payements a, sales b, registers c 
             WHERE a.sale_id = b.id AND a.register_id=c.id AND b.in_activo=1 
             AND a.register_id = ".$this->register;

       $payaments = Payement::find_by_sql($sql);
       ////////////////////////////////////////////
       $sql="SELECT  a.category_id, a.note, 
                     a.amount, b.name AS category_name

              FROM   expences a, catalog_expences b 

              WHERE  a.category_id = b.id AND a.category_id <> 9
              AND    a.register_id = ".$this->register;
              
        //$this->view_data['categories'] = Categorie_menor::find_by_sql($sql);
         //die($sql);
         $expences = Expence::find_by_sql($sql);

         $cash = 0;
         $cheque = 0;
         $credit = 0;
         $cc = 0;
         $discount = 0;
         $totalIngresos=0;
         $totalSales=0;
         $CashinHand = $register->cash_inhand;
         $date = $register->date;
         $createdBy = $user->firstname . ' ' . $user->lastname;

         foreach ($payaments as $payament) {
            $PayMethode = explode('~', $payament->paidmethod);
            /*switch ($PayMethode[0]) {
                case '1': // case Credit Card
                    $cc += $payament->paid;
                    break;
                case '2': // case ckeck
                    $cheque += $payament->paid;
                    break;
                default:
                    $cash += $payament->paid;
            }*/
            $totalIngresos+= $payament->paid;
            //echo  $payament->paid.'<br>';
        }

         foreach ($sales as $sale) {
             $PayMethode = explode('~', $sale->paidmethod);
             //$paystatus = $sale->paid - $sale->total;
             $paystatus = $sale->subtotal;
             switch ($PayMethode[0]) {
                case '1': // case Credit Card
                    $cc += $paystatus > 0 ? $sale->subtotal : $sale->firstpayement;
                    $totalSales+= $paystatus > 0 ? $sale->subtotal : $sale->firstpayement;

                    break;
                case '2': // case ckeck
                    $cheque += $paystatus > 0 ? $sale->subtotal : $sale->firstpayement;
                    $totalSales+= $paystatus > 0 ? $sale->subtotal : $sale->firstpayement;
                    break;
                case '3': // case ckeck
                    $credit += $sale->subtotal;
                    $totalSales+= $paystatus > 0 ? $sale->subtotal : $sale->firstpayement;
                break;
                case '0': // case ckeck                                  
                    $cash += $sale->subtotal;
                    //echo $sale->subtotal.' '.$sale->in_activo.' '.$cash.'<br>';

                    $totalSales+= $paystatus > 0 ? $sale->subtotal : $sale->firstpayement;
                break;
             }

             $discount += $sale->discountamount;

         }
         $cheked=false;
         
         if($this->setting->keyboard==1 || $user->role=='admin')
            $cheked=true;

         $data = '<div class="col-md-3"><blockquote><footer>' . label("Openedby") . '</footer><p style="font-size:medium;">' . $createdBy . '</p></blockquote></div>
         <div class="col-md-3"><blockquote><footer>' . label("CashinHand") . '</footer><p style="font-size:medium;">' . number_format((float)$CashinHand, $this->setting->decimals, ',', '.') . '</p>
         </blockquote></div><div class="col-md-4"><blockquote><footer>' . label("Fecha de Apertura") . '</footer>
         <p style="font-size:medium;">' . $date->format('Y-m-d h:i:s') . '</p></blockquote></div><div class="col-md-2">
         <img src="' . site_url() . '/assets/img/register.svg" height="85" alt=""></div>
         <div><h4>' . label("Sales") . '</h4></div>
         
         <table class="table table-sm table-striped">
         <tr style="font-size:small;"><th width="25%">' . label("PayementType") . '</th>';
    if($cheked)
        $data .=' <th width="25%">' . label("EXPECTED") . ' </th>';

        $data .=' <th width="25%">' . label("COUNTED") . ' </th>';
    if($cheked)
        $data .=' <th width="25%">' . label("DIFFERENCES") . '</th>';
    
        $data .='</tr>
         <tr style="font-size:small;">
         <td>' . label("Cash") . '</td>';
    if($cheked)
         $data .='<td><span id="expectedcash">' . number_format((float)$cash, $this->setting->decimals, ',', '.') . '</span></td>';
         $data .='<td><input type="text" class="total-input" value="0" placeholder="0"  maxlength="11" id="countedcash"></td>';
    if($cheked)
         $data .='<td><span id="diffcash">-' . number_format((float)$cash, $this->setting->decimals, ',', '.') . '</span></td>';

         $data .='</tr>
         <tr style="font-size:small;"><td>' . label("CreditCard") . '</td>';
    if($cheked)
        $data .=' <td><span id="expectedcc">' . number_format((float)$cc, $this->setting->decimals, ',', '.') . '</span></td>';
         $data .='<td><input type="text" class="total-input" value="0" placeholder="0"  maxlength="11" id="countedcc"></td>';
    if($cheked)
         $data .='<td><span id="diffcc">-' . number_format((float)$cc, $this->setting->decimals, ',', '.') . '</span></td>';
         
         $data .='</tr><tr style="font-size:small;">
         <td>' . label("Cheque") . '</td>';

    if($cheked)
         $data .='<td><span id="expectedcheque">' . number_format((float)$cheque, $this->setting->decimals, ',', '.') . '</span></td>';
         $data .='<td><input type="text" class="total-input" value="0" placeholder="0"  maxlength="11" id="countedcheque"></td>';
    if($cheked)
         $data .='<td><span id="diffcheque">-' . number_format((float)$cheque, $this->setting->decimals, ',', '.') . '</span></td>';
         
         $data .='</tr>         
         <tr style="font-size:small;">
         <td>' . label("Ventas a Crédito") . '</td>';

    if($cheked)
         $data .='<td><span id="expectedcredit">' . number_format((float)$credit, $this->setting->decimals, ',', '.') . '</span></td>';
         $data .='<td><input type="text" class="total-input" value="' . number_format((float)$credit, $this->setting->decimals, ',', '.') . '" placeholder="0"  maxlength="11" id="countedcredit"></td>';
    if($cheked)
         $data .='<td><span id="diffcredit">0</span></td>';
         
         $data .='</tr>
         
         <tr style="font-size:small;">
         <td>' . label("Discount") . '</td>';

    if($cheked)
         $data .='<td><span id="expecteddiscount">' . number_format((float)$discount, $this->setting->decimals, ',', '.') . '</span></td>';
         $data .='<td><span id="expecteddiscount">' . number_format((float)$discount, $this->setting->decimals, ',', '.') . '</span></td>';
    if($cheked)
         $data .='<td><span id="diffcheque">0</span></td>';
         $data .='</tr>';


       /* $data .='<tr class="warning" style="font-size:small;">
         <td>' . label("Total") . '</td>';

    if($cheked)
         $data .='<td><span id="total">' . number_format((float)($cheque + $cash + $cc  + $credit - $totalIngresos), $this->setting->decimals, ',', '.') . '</span></td>';

        $data .='<td><span id="countedtotal">0</span></td>';
    if($cheked)
         $data .='<td><span id="difftotal">0</span></td>';
         
         $data .='</tr>';*/
         $data .='</table>';
         $data .= '<div class="row" style="margin-top: -25px;"><div class="col-md-6"><h4>' . label("Expenses") . '</h4>         
         <table class="table table-sm table-striped">
         <tr style="font-size:small;"><th width="25%">' . label("Category") . '</th>
         <th width="50%">' . label("Descripción") . '</th>
         <th width="25%">' . label("Amount") . ' </th></tr>';
         $totalExpenses=0;
      foreach ($expences as $row) {
         $data .= '<tr style="font-size:small;"><td>' . $row->category_name . '</td><td><span>' . $row->note . '</span></td>
         <td><span>' . number_format((float)$row->amount, $this->setting->decimals, ',', '.') . '</span></td>
         </tr>';
         $totalExpenses+=$row->amount;
        }
        /*$data .= '<tr class="warning" style="font-size:small;"><td>' . label("Total") . ' ' . label("Expenses") . '</td><td></td>
         <td><span>' . number_format((float)$totalExpenses, $this->setting->decimals, ',', '.') . '</span></td>
         </tr>';*/
         $data .= '</table></div>';

       if($cheked)
        {
         $data .= '<div class="col-md-3">
         <h4>' . label("Totales") . '</h4>
          <table class="table table-sm table-striped">
         <tr style="font-size:small;">
             <td>' . label("Total Facturado") . '</td>
             <td>' . number_format((float)($totalSales), $this->setting->decimals, ',', '.') . '</td></tr>
         <tr style="font-size:small;">
             <td>' . label("Ingreso Crédito") . '</td>
             <td>' . number_format((float)($totalIngresos ), $this->setting->decimals, ',', '.') . '</td></tr>
         <tr style="font-size:small;">
             <td>' . label("Total Egresos") . '</td>
             <td>' . number_format((float)(-$totalExpenses ), $this->setting->decimals, ',', '.') . '</td></tr>
         <tr style="font-size:small;">
             <td style="border-top:1px dashed #000;">' . label("Total Caja") . '</td>
             <td style="border-top:1px dashed #000;">' . number_format((float)($totalSales + $totalIngresos - $totalExpenses ), $this->setting->decimals, ',', '.') . '</td></tr>
       </table></div>';
        }
         
         $data .= '<div class="col-md-3"><div  class="form-group"><h4>' . label("note") . '</h4><textarea id="RegisterNote" class="form-control" rows="4"></textarea></div></div>';
         $data .= '
         </div><div class="row" style="display:flex">';
    if($cheked)
         $data .= ' <a href="javascript:void(0)" onclick="ReporteZ();" class="btn btn-blue col-md-6 flat-box-btn">'.label("Reporte Z") . '</a>';
         $data .= '<a href="javascript:void(0)" onclick="SubmitRegister()" class="btn btn-red col-md-6 flat-box-btn" style="margin-left:5px">'.label("CloseRegister") . '</a></div>
         </div>
         ';

         echo $data;
     }

    public function SubmitRegister()
    {
        date_default_timezone_set($this->setting->timezone);
        $date = date("Y-m-d H:i:s");
        $data = array(
            "cash_total" => $this->input->post('expectedcash'),
            "cash_sub" => $this->input->post('countedcash'),
            "cc_total" => $this->input->post('expectedcc'),
            "cc_sub" => $this->input->post('countedcc'),
            "cheque_total" => $this->input->post('expectedcheque'),
            "cheque_sub" => $this->input->post('countedcheque'),
            "note" => $this->input->post('RegisterNote'),
            "closed_by" => $this->session->userdata('user_id'),
            "closed_at" => $date,
            "status" => 0
        );

        $Register = Register::find($this->register);

        $store = Store::find($Register->store_id);
        $store->status = 0;
        $store->save();

        $Register->update_attributes($data);

        Hold::delete_all(array(
            'conditions' => array(
                'register_id = ? ',
                $Register->id
            )
        ));
        Posale::delete_all(array(
            'conditions' => array(
                'register_id = ? ',
                $Register->id

            )
        ));

        $CI = & get_instance();
        $CI->session->set_userdata('register', 0);

        /*echo json_encode(array(
            "status" => TRUE
        ))*/;
        echo $Register->id;
    }

    public function enviarPedido()
    {
        $user=User::find($this->session->userdata('user_id'));

        $email = $this->input->post('email_admin');
        //$cajero = $this->input->post('cajero');
        $content = $this->input->post('msg');
        $this->load->library('email');
        $config = array(
         'protocol'  => 'smtp',
         'smtp_host' => 'smtp.hostinger.co',
        //'smtp_host' => 'smtp.gmail.com',
        //'username' => $username,
         //'password' => $password,
         'smtp_port' => '587',
         'mailtype'  => 'html',
         'charset'   => 'utf-8',
         'newline'   => "\r\n"
        );    
        
        $this->email->initialize($config);
        $recipientArr = array($email);
        
        $this->email->set_mailtype("html");
        $this->email->from('jesusb.sacs@gmail.com', $this->setting->companyname);
        $this->email->to($recipientArr);

        $this->email->subject('Pedido de ' . $this->setting->companyname );
        $this->email->message($content);
        //echo $email;
        //die($content);
        //$this->email->send();
        if($this->email->send()){
            $status=1;            
            echo "envio, Email enviado correctamente";
            echo $this->email->print_debugger();
        
        }else{
            $status=0;
            echo "No envio, Email no pude ser enviado correctamente";
            echo $this->email->print_debugger();
        
        }
        $dataBD = array(
         'caja'  => $user->username,
         'cajero' => $user->firstname.' '.$user->lastname,
         'texto' => $content,
         'email'  => $email,
         'status'   => $status
        );
        $pedido = Pedido::create($dataBD);
        $posale = Posale::find('all', array(
            'conditions' => array(
                'status = ? AND register_id = ? AND user_id = ?',
                1,
                $this->register,
                $this->session->userdata('user_id')

            )
        ));
         //print_r($posale);
         
        foreach ($posale as $row) {
            $product = Product::find($row->product_id);            
            $disponible=0;
            $stocks = Stock::find('all', array(
            'conditions' => array(
                'product_id = ? AND store_id = ?',                
                $row->product_id,
                $this->store

                )
              ));
            
            foreach ($stocks as $stock) {
                $disponible=$stock->quantity;
            }

            $dataBD = array(
             'pedido_id'  => $pedido->id,
             'product_id' => $row->product_id,
             'qt' => $row->qt,
             'price' => $product->price,
             'store_id' => $this->store

            );
            
            $pedido_item = Pedido_item::create($dataBD);

        }
        die();
        
        /*echo json_encode(array(
            "status" => TRUE
        ));*/
    }
    public function EnviarRemision()
    {
        $type = $this->input->post('typeRemision');
        $customer_id = $this->input->post('customer');

        $store_id_out=$this->store;
        $total=0;
        $totalQt=0;
        $dataBD = array(
                "store_id_out" => $store_id_out,
                "customer_id" => $customer_id,
                "total" => $total,
                "type" => $type,
                "created_by" => $this->session->userdata('user_id')
        );
        $remision = Remision::create($dataBD);

        $posale = Posale::find('all', array(
            'conditions' => array(
                'status = ? AND register_id = ?',
                1,
                $this->register

            )
        ));
         
        foreach ($posale as $row) {
            $product = Product::find($row->product_id);            
            $disponible=0;
            $stocks = Stock::find('first', array(
            'conditions' => array(
                'product_id = ? AND store_id = ?',                
                $row->product_id,
                $this->store

                )
              ));
            
            if($stocks)
            {
                $stocks->quantity-=$row->qt;
                $stocks->save();
            }
            else
            {
                $dataBD = array(
                 'product_id' => $row->product_id,
                 'quantity' => $row->qt,
                 'store_id' => $this->store
                );
                Stock::create($dataBD);
            
            }

            $qt=$row->qt;
            $price = $row->price+$row->price*$row->taxvalue/100;
            $total+=$price*$qt;

            $dataBD2 = array(
                    "remision_id" => $remision->id,
                    "product_id" => $row->product_id,
                    "price" => $price,
                    "qt" => $qt
            );
            $totalQt+=$qt;
            Remision_item::create($dataBD2);
            /////////////////////////////////////////////////////////

        }

        $remision->total=$total;
        $remision->save();
        ////////////////////////////////////////////////////////
        $textype="Nota de crédito";
        if($type==2)
           $textype="Nota de débito";
        if($type==3)
           $textype="Nota de entrega";
            
        $userTraza = User::find($this->session->userdata('user_id'));
                  
        $action = "Se realizó una remisión ".$textype." desde el POS de ".$totalQt." producto(s), para un total de ".number_format($total, $this->setting->decimals, ',', '.');
        $trazaDB = array(
                "action" => $action,
                    "created_by" => $userTraza->username.' '.$userTraza->firstname.' '.$userTraza->lastname
        );   
        Traza::create($trazaDB);
        /////////////////////////////////////////////////////////

           
        die();
        
        /*echo json_encode(array(
            "status" => TRUE
        ));*/
    }
    public function enviarReturnSales()
    {

        $posale = Posale::find('all', array(
            'conditions' => array(
                'status = ? AND register_id = ?',
                1,
                $this->register

            )
        ));
         
        foreach ($posale as $row) {
            $product = Product::find($row->product_id);            
            $disponible=0;
            $stocks = Stock::find('first', array(
            'conditions' => array(
                'product_id = ? AND store_id = ?',                
                $row->product_id,
                $this->store

                )
              ));
            
            if($stocks)
            {
                $stocks->quantity+=$row->qt;
                $stocks->save();
            }
            else
            {
                $dataBD = array(
                 'product_id' => $row->product_id,
                 'quantity' => $row->qt,
                 'store_id' => $this->store
                );
                Stock::create($dataBD);
            
            }

            $dataBD = array(
             'product_id' => $row->product_id,
             'qt' => $row->qt,
             'price' => $row->price,
             'taxvalue'  => $row->taxvalue,
             'register_id' => $this->register

            );
            Return_sale::create($dataBD);
            ////////////////////////////////////////////////////////
            $total=($row->price+$row->price*$row->taxvalue/100)*$row->qt;
            $userTraza = User::find($this->session->userdata('user_id'));
                  
            $action = "Se devolvió ".$row->qt." cantidad(es) del producto ".$product->reference." ".$product->name.", para un total de ".number_format($total, $this->setting->decimals, ',', '.');
            $trazaDB = array(
                    "action" => $action,
                    "created_by" => $userTraza->username.' '.$userTraza->firstname.' '.$userTraza->lastname
            );   
            Traza::create($trazaDB);
            /////////////////////////////////////////////////////////

        }
        die();
        
        /*echo json_encode(array(
            "status" => TRUE
        ));*/
    }
    public function email()
    {
        $email = $this->input->post('email');
        $content = $this->input->post('content');
        $this->load->library('email');

        $this->email->set_mailtype("html");
        $this->email->from('no-reply@' . $this->setting->companyname . '.com', $this->setting->companyname);
        $this->email->to('$email');

        $this->email->subject('your Receipt');
        $this->email->message($content);

        $this->email->send();

        echo json_encode(array(
            "status" => TRUE
        ));
    }

    public function pdfreceipt()
    {
        $content = $this->input->post('content');
        $date = date("YmdHis");

        $this->load->library('Pdf');
        $medidas = array(45, 350);
        //$pdf = new Pdf('P', 'mm', 'A7', true, 'UTF-8', false);
        $pdf = new Pdf('P', 'mm', $medidas);
        $pdf->SetTitle('Pdf');
        $pdf->SetHeaderMargin(30);
        $pdf->SetTopMargin(20);
        $pdf->setFooterMargin(20);
        $pdf->SetAutoPageBreak(true);
        $pdf->SetAuthor('Author');
       // $pdf->SetDisplayMode('real', 'default');
        // add a page
        $pdf->AddPage();

        $pdf->writeHTMLCell(0, 0, '', '', $content, 0, 1, 0, true, '', true);
        ob_end_clean();
        $pdf->Output('pos'.$date.'.pdf', 'D');
    }
    public function addExpense()
    {
        $config['upload_path'] = './files/expences/';
        $config['encrypt_name'] = TRUE;
        $config['overwrite'] = FALSE;
        $config['allowed_types'] = 'gif|jpg|jpeg|png|pdf|doc|docx|xls|xlsx|zip';
        $config['max_size'] = '2048';
        $dataBD = array(
                "date" => $this->input->post('dateexpense'),
                "reference" => $this->input->post('reference'),
                "category_id" => $this->input->post('category'),
                "register_id" => $this->register,
                "store_id" => $this->input->post('store_id'),
                "amount" => $this->input->post('amount'),
                "note" => $this->input->post('note'),
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
          
        } 
        //print_r($dataBD);
        $expence = Expence::create($dataBD);
        //die($expence->id);
        echo $expence->id;
        //redirect("/pos?expence_id=".$expence->id, "location");
        
    }
    public function addCustomer()
    {
        date_default_timezone_set($this->setting->timezone);
        
        $customer = Customer::create($_POST);

        redirect("", "");
    }

    public function tazaPetros($subtot)
    {
        //$subtot=123456;
        $taza=$this->setting->petros;
        $total=$subtot/$taza;
        echo number_format($total, 6, ',', '.');
    }
    public function tazaDolares($subtot)
    {
        //$subtot=123456;
        $taza=$this->setting->dollars;
        $total=$subtot/$taza;
        $arreglo=explode('.', $total);
        $entero=$arreglo[0];
        echo $entero;
    }
    public function restoTaza($subtot)
    {
        //$subtot=123456;
        $taza=$this->setting->dollars;
        $total=$subtot / $taza;
        $arreglo=explode('.', $total);
        $entero=$arreglo[0];
        $resto=$total-$entero;
        $totalResto=$resto*$taza;
        echo number_format($totalResto, 2, ',', '.');
    }

    

}
