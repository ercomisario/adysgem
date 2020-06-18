<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Cashmovements extends MY_Controller
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
        $this->view_data['store_id'] = '';
        $this->view_data['data'] = '';

        $this->view_data['user_id'] = '';
        $this->view_data['dateBegin'] = '';
        $this->view_data['dateEnd'] = '';
        $this->view_data['type'] = '';
        $this->view_data['register_id'] = '';
        $this->view_data['document'] = '';

        $this->view_data['users'] = User::all();   
        $sql="SELECT  a.id, a.date, b.username, b.firstname, b.lastname, a.status
              FROM    registers a, users b
              WHERE   a.user_id = b.id
              ORDER BY a.id desc";
       $registers = Register::find_by_sql($sql);


        $this->view_data['registers'] = $registers;
        $this->view_data['stores'] = Store::all();

        $data='';
          


        if($_POST)
        {
          $dateBegin = $this->input->post('dateBegin');
          $dateEnd = $this->input->post('dateEnd');
          $store_id = $this->input->post('store_id');
          $type = $this->input->post('type');
          $register_id = $this->input->post('register_id');
          $user_id = $this->input->post('user_id');
          $document = $this->input->post('document');

          $fromwhere='';
          $fromwhere.=" FROM sales a, registers b, stores c
                        WHERE a.register_id = b.id  AND b.store_id=c.id AND a.in_activo=1";
          $fromwhere2='';
          $fromwhere2.=" FROM sales a, registers b, stores c
                        WHERE a.register_id = b.id AND b.store_id=c.id";

          $condicion='';
          if($user_id)
            $condicion.=" AND b.user_id='".$user_id."'";
          if($register_id)
            $condicion.=" AND a.register_id=".$register_id;
          if($store_id)
            $condicion.=" AND b.store_id=".$store_id;
          if($dateBegin)
            $condicion.=" AND DATE_FORMAT(a.created_at, '%Y-%m-%d')>='".$dateBegin."'";
          if($dateEnd)
            $condicion.=" AND DATE_FORMAT(a.created_at, '%Y-%m-%d')<='".$dateEnd."'";

          if($type==5)
          {


              $sql="SELECT DISTINCT 
                      a.id, a.purchase_order, 
                      a.date, 
                      a.retention,
                      a.total,
                      d.name as supplier,
                      c.firstname,
                      c.lastname

                    FROM purchases a, registers b, users c, suppliers d
                    WHERE a.register_id = b.id AND a.created_by=c.id 
                    AND a.supplier_id=d.id AND a.retention>0 ";

              //$sql.=$condicion;
              if($dateBegin)
                $sql.=" AND a.date>='".$dateBegin."'";
              
              if($dateEnd)
                $sql.=" AND a.date<='".$dateEnd."'";
              
              

              $sql.=" ORDER BY a.id";
              //die($sql); 

              $this->view_data['purchases'] = Purchase::find_by_sql($sql);   

          }

          if($type==4)
          {

              $sql="SELECT DISTINCT 
                           a.name, a.value, SUM(c.subtotal) as base,
                           MIN(d.invoice) AS invoicebegin,
                           MAX(d.invoice) AS invoiceend
             
                    FROM taxes a, products b, sale_items c, sales d
                    WHERE a.id=b.tax_sale_id AND b.id=c.product_id AND c.sale_id=d.id AND d.in_activo=1";

              if($dateBegin)
                $sql.=" AND c.date>='".$dateBegin."'";
              
              if($dateEnd)
                $sql.=" AND c.date<='".$dateEnd."'";
              
              
              $sql.=" GROUP BY a.name";
              //die($sql);
              $this->view_data['sales'] = Sale::find_by_sql($sql);   
                 ///////////////////////////////////////////////////////////////7
              $sql="SELECT COUNT(*) AS qt,
                           MIN(a.invoice) AS invoicebegin,
                           MAX(a.invoice) AS invoiceend,
                           MIN(a.created_at) AS datebegin,
                           MAX(a.created_at) AS dateend ";
              $sql.=$fromwhere2;
              $sql.=$condicion;
              $this->view_data['invoices'] = Sale::find_by_sql($sql);   

          }

          if($type==2)
          {

              $sql="SELECT DISTINCT a.id, a.invoice, 
                      (SELECT SUM(price*qt-discount) FROM sale_items WHERE sale_id=a.id) AS base,
                      (SELECT SUM(taxamount) FROM sale_items WHERE sale_id=a.id) AS taxamount,
                      (SELECT SUM(subtotal) FROM sale_items WHERE sale_id=a.id) AS total,
                      a.created_at, 
                      a.subtotal, 
                      a.paidmethod,
                      a.in_activo
                    FROM sales a , registers b
                    WHERE a.register_id = b.id ";

              $sql.=$condicion;

              $sql.=" ORDER BY a.id";
              //die($sql); 

              $this->view_data['sales'] = Sale::find_by_sql($sql);   

          }

          if($type==1)
          {
              $createdBy='';
              $user=null;
              if($register_id)
              {
                  $register = Register::find($register_id);
                  $user = User::find($register->user_id);              
              }
              if($user_id)
              {
                  $user = User::find($user_id);
              } 
              if($user)
                  $createdBy = $user->firstname . ' ' . $user->lastname;

              ///////////////////////////////////////////////////////////////7
              $sql="SELECT SUM(subtotal) AS total ";
              $sql.=$fromwhere;
              $sql.=$condicion;
              $this->view_data['totales'] = Sale::find_by_sql($sql);   
               ///////////////////////////////////////////////////////////////7
              $sql="SELECT COUNT(*) AS qt,
                           MIN(a.invoice) AS invoicebegin,
                           MAX(a.invoice) AS invoiceend,
                           MIN(a.created_at) AS datebegin,
                           MAX(a.created_at) AS dateend ";
              $sql.=$fromwhere2;
              $sql.=$condicion;
              $this->view_data['invoices'] = Sale::find_by_sql($sql);   
              /////////////////////////////////////////////////////////7
              $sql="SELECT count(a.id) AS anuladas
                    FROM sales a , registers b
                    WHERE a.in_activo=2 AND a.register_id = b.id ";

              $sql.=$condicion;

              $this->view_data['invoiceAnuladas'] = Sale::find_by_sql($sql);   

              /////////////////////////////////////////////////////////7
              $sql="SELECT count(a.id) AS devoluciones, SUM((a.price+a.price*a.taxvalue/100)*a.qt) AS total
                    FROM return_sales a , registers b
                    WHERE a.register_id = b.id ";

              $sql.=$condicion;
              //$sql.=" GROUP BY 1 ";
              //echo $sql;
              $this->view_data['devoluciones'] = Return_sale::find_by_sql($sql);   

              ///////////////////////////////////////////////////////////////7
              $sql="SELECT SUBSTRING(`paidmethod`,1,1) as paidmethod, sum(subtotal) as amount ";
              $sql.=$fromwhere;
              $sql.=$condicion;
              $sql.=" GROUP BY 1 ";
              //echo $sql;     
              $this->view_data['paidmethods'] = Sale::find_by_sql($sql);   

              ///////////////////////////////////////////////////////////////7
              $sql="SELECT DISTINCT d.name AS name,  
                    SUM((c.price*c.qt)-c.discount) as base, 
                    SUM(c.taxamount) as taxamount , 
                    SUM(c.subtotal) as total 
                    FROM sales a, registers b, sale_items c, taxes d, products e
                    WHERE d.id=e.tax_sale_id AND e.id=c.product_id 
                    AND c.sale_id=a.id AND a.register_id=b.id AND a.in_activo=1";

              $sql.=$condicion;

              $sql.=" GROUP BY d.name";

              $this->view_data['sales'] = Sale::find_by_sql($sql);   
              ///////////////////////////////////////////////////////////////7
              $sql="SELECT DISTINCT d.name AS name,  
                    SUM(a.price*a.qt) as base, 
                    SUM(a.price*a.taxvalue/100*a.qt) as taxamount , 
                    SUM((a.price+a.price*a.taxvalue/100)*a.qt) as total 
                    FROM return_sales a, registers c, taxes d, products e
                    WHERE d.id=e.tax_sale_id AND e.id=a.product_id 
                    AND a.register_id=c.id ";

              if($register_id)
                 $sql.=" AND c.id = ".$register_id;
              else
              {
                if($user_id)
                    $sql.=" AND c.user_id = ".$user_id;
                if($dateBegin)
                    $sql.=" AND DATE_FORMAT(a.created_at, '%Y-%m-%d')>='".$dateBegin."'";
                if($dateEnd)
                    $sql.=" AND DATE_FORMAT(a.created_at, '%Y-%m-%d')<='".$dateEnd."'";
              }
              
              $sql.=" GROUP BY d.name";
              //echo $sql;
              $this->view_data['taxDevoluciones'] = Return_sale::find_by_sql($sql);   
              ///////////////////////////////////////////////////////////////7
              $sql="SELECT DISTINCT
                          SUM((c.price*c.qt)-c.discount) as base, 
                          SUM(c.taxamount) as taxamount, 
                          SUM(c.subtotal) as total, 
                          SUM(c.discount) AS discountamount
                          FROM sales a, registers b, sale_items c, taxes d, products e
                          WHERE d.id=e.tax_sale_id AND e.id=c.product_id 
                          AND c.sale_id=a.id AND a.register_id=b.id AND a.in_activo=1";

              $sql.=$condicion;

              //die($sql);
              $this->view_data['engravins'] = Sale::find_by_sql($sql);   
              ////////////////////////////////////////////////////////////77
              $sql="SELECT  a.category_id, a.note, 
                           a.amount, b.name AS category_name

                    FROM   expences a, catalog_expences b, registers c 

                    WHERE  a.category_id = b.id AND a.category_id <> 9
                    AND    a.register_id = c.id ";
              if($register_id)
                 $sql.=" AND c.id = ".$register_id;
              else
              {
                if($user_id)
                    $sql.=" AND c.user_id = ".$user_id;
                if($dateBegin)
                    $sql.=" AND DATE_FORMAT(a.date, '%Y-%m-%d')>='".$dateBegin."'";
                if($dateEnd)
                    $sql.=" AND DATE_FORMAT(a.date, '%Y-%m-%d')<='".$dateEnd."'";
              }
              
              $this->view_data['expences'] = Expence::find_by_sql($sql);
              //////////////////////////////////////////////////////////
              $sql="SELECT DISTINCT a.name, SUM(c.subtotal) as total 
                    FROM areas a, products b, sale_items c, sales d, registers e
                    WHERE a.id=b.area_id AND b.id=c.product_id AND d.id=c.sale_id AND d.in_activo=1 AND d.register_id = e.id ";
                   
              if($register_id)
                 $sql.=" AND d.register_id = ".$register_id;
              else
              {
                if($user_id)
                    $sql.=" AND e.user_id = ".$user_id;
                if($dateBegin)
                    $sql.=" AND DATE_FORMAT(c.date, '%Y-%m-%d')>='".$dateBegin."'";
                if($dateEnd)
                    $sql.=" AND DATE_FORMAT(c.date, '%Y-%m-%d')<='".$dateEnd."'";
              }
            
              $sql.=" GROUP BY a.name";
                    //echo $sql;
              $this->view_data['areas'] = Area::find_by_sql($sql);   
              /////////////////////////////////////7////////////
              $sql="  SELECT a.paid, b.invoice, b.created_at
                      FROM   payements a, sales b, registers c
                      WHERE  a.sale_id = b.id AND a.register_id=c.id 
                      AND    b.in_activo=1 ";

              if($register_id)
                 $sql.=" AND a.register_id = ".$register_id;
              else
              {
                if($user_id)
                   $sql.=" AND c.user_id = ".$user_id;
                if($dateBegin)
                    $sql.=" AND DATE_FORMAT(a.date, '%Y-%m-%d')>='".$dateBegin."'";
                if($dateEnd)
                    $sql.=" AND DATE_FORMAT(a.date, '%Y-%m-%d')<='".$dateEnd."'";
              }
              //echo $sql;
              $this->view_data['payaments'] = Payement::find_by_sql($sql);
              ///////////////////////////////////////////////////////////7
              if($createdBy=='')
                  $createdBy = 'todos';
              $this->view_data['createdBy'] = $createdBy;

            //echo $sql;
          }

          if($type==3)
          {
            $cash = 0;
            $cash_sub = 0;
            $credit = 0;
            $credit_sub = 0;
            $cheque = 0;
            $cheque_sub = 0;
            $cc = 0;
            $cc_sub = 0;
            $totalIngresos = 0;
            $totalSales = 0;
            $discount = 0;

            if($register_id)
            {

               $sql="SELECT  a.cash_total, a.cash_sub, a.cheque_total, a.cheque_sub,
                             a.cc_total, a.cc_sub, a.user_id
                     FROM   registers a
                     WHERE  a.id = ".$register_id;

               $register = Register::find($register_id);

               $user = User::find($register->user_id);

               $sales = Sale::find('all', array(
                   'conditions' => array(
                       'register_id = ?',
                       $register_id
                   )
               ));
               $cash = $register->cash_total;
               $cash_sub = $register->cash_sub;
               
               $cheque = $register->cheque_total;
               $cheque_sub = $register->cheque_sub;
               
               $cc = $register->cc_total;
               $cc_sub = $register->cc_sub;
               
               $payaments = Payement::find('all', array(
                   'conditions' => array(
                       'register_id = ?',
                       $register_id
                   )
               ));
               $sql="SELECT  a.category_id, a.note, 
                             a.amount, b.name AS category_name
                     FROM    expences a, catalog_expences b 
                     WHERE   a.category_id = b.id 
                     AND     a.register_id = ".$register_id;
               
               $expences = Expence::find_by_sql($sql);

               $createdBy = $user->firstname . ' ' . $user->lastname;
             
               $sql="SELECT DISTINCT a.name, a.value, SUM(c.price*c.qt-c.discount) as base 
                     FROM   taxes a, products b, sale_items c, sales d
                     WHERE  a.id=b.tax_sale_id AND b.id=c.product_id AND c.sale_id=d.id 
                     AND    d.in_activo = 1 AND d.register_id = ".$register_id;

                $sql.=" GROUP BY a.name";
                $diftax = Tax::find_by_sql($sql);   

                $sql="SELECT DISTINCT a.name, ROUND(SUM(c.subtotal)) as total 
                     FROM areas a, products b, sale_items c, sales d
                     WHERE a.id=b.area_id AND b.id=c.product_id AND d.id=c.sale_id AND d.in_activo=1 AND d.register_id = ".$register_id;
                    if($dateBegin)
                      $sql.=" AND DATE_FORMAT(c.date, '%Y-%m-%d')>='".$dateBegin."'";
                    if($dateEnd)
                      $sql.=" AND DATE_FORMAT(c.date, '%Y-%m-%d')<='".$dateEnd."'";

                    $sql.=" GROUP BY a.name";
                    //echo $sql;
                    $areas = Area::find_by_sql($sql);   

            }
            else
            {
              if($user_id)
              {    
                   
                   $sql="  SELECT  *
                           FROM   registers a
                           WHERE  a.user_id = ".$user_id;

                    if($dateBegin)
                      $sql.=" AND DATE_FORMAT(a.closed_at, '%Y-%m-%d')>='".$dateBegin."'";
                    if($dateEnd)
                      $sql.=" AND DATE_FORMAT(a.closed_at, '%Y-%m-%d')<='".$dateEnd."'";

                   $registers = Register::find_by_sql($sql);

                   foreach ($registers as $register) {
                
                         $cash += $register->cash_total;
                         $cash_sub += $register->cash_sub;
                         
                         $cheque += $register->cheque_total;
                         $cheque_sub += $register->cheque_sub;
                         
                         $cc += $register->cc_total;
                         $cc_sub += $register->cc_sub;
                    }
                     

                   $user = User::find($user_id);

                   $sql="SELECT  *
                    FROM   sales a, registers b 
                    WHERE  a.register_id = b.id 
                    AND    b.user_id = ".$user_id;
                    if($dateBegin)
                      $sql.=" AND DATE_FORMAT(a.created_at, '%Y-%m-%d')>='".$dateBegin."'";
                    if($dateEnd)
                      $sql.=" AND DATE_FORMAT(a.created_at, '%Y-%m-%d')<='".$dateEnd."'";

                   $sales = Sale::find_by_sql($sql);

                   $sql="SELECT  *
                    FROM   payements a, registers b 

                    WHERE  a.register_id = b.id 
                    AND    b.user_id = ".$user_id;
                   if($dateBegin)
                      $sql.=" AND DATE_FORMAT(a.date, '%Y-%m-%d')>='".$dateBegin."'";
                   if($dateEnd)
                      $sql.=" AND DATE_FORMAT(a.date, '%Y-%m-%d')<='".$dateEnd."'";

                   $payaments = Payement::find_by_sql($sql);
                   
                   $sql="SELECT  a.category_id, a.note, 
                           a.amount, b.name AS category_name

                    FROM   expences a, catalog_expences b, registers c 

                    WHERE  a.category_id = b.id 
                    AND    a.register_id = c.id AND c.user_id = ".$user_id;
                    if($dateBegin)
                      $sql.=" AND DATE_FORMAT(a.date, '%Y-%m-%d')>='".$dateBegin."'";
                    if($dateEnd)
                      $sql.=" AND DATE_FORMAT(a.date, '%Y-%m-%d')<='".$dateEnd."'";

                    $expences = Expence::find_by_sql($sql);
                    
                    $createdBy = $user->firstname . ' ' . $user->lastname;

                    $sql="SELECT DISTINCT a.name, a.value, SUM(c.price*c.qt-c.discount) as base 
                     FROM taxes a, products b, sale_items c, sales d, registers e
                     WHERE a.id=b.tax_sale_id AND b.id=c.product_id AND c.sale_id=d.id AND d.register_id = e.id AND d.in_activo=1 AND e.user_id=".$user_id;

                    if($dateBegin)
                      $sql.=" AND DATE_FORMAT(c.date, '%Y-%m-%d')>='".$dateBegin."'";
                    if($dateEnd)
                      $sql.=" AND DATE_FORMAT(c.date, '%Y-%m-%d')<='".$dateEnd."'";

                    $sql.=" GROUP BY a.name";
                    $diftax = Tax::find_by_sql($sql);  

                    $sql="SELECT DISTINCT a.name, SUM(c.subtotal) as total 
                    FROM areas a, products b, sale_items c, sales d, registers e
                    WHERE a.id=b.area_id AND b.id=c.product_id AND d.id=c.sale_id AND d.in_activo=1 AND d.register_id = e.id AND e.user_id=".$user_id;

                    if($dateBegin)
                      $sql.=" AND DATE_FORMAT(c.date, '%Y-%m-%d')>='".$dateBegin."'";
                    if($dateEnd)
                      $sql.=" AND DATE_FORMAT(c.date, '%Y-%m-%d')<='".$dateEnd."'";

                    $sql.=" GROUP BY a.name";
                    //echo $sql;
                    $areas = Area::find_by_sql($sql);   
                    


              }
              else
              {     
                  $sql="SELECT  *

                    FROM   registers a

                    WHERE  a.id > 0 ";
                  if($dateBegin)
                    $sql.=" AND DATE_FORMAT(a.closed_at, '%Y-%m-%d')>='".$dateBegin."'";
                  if($dateEnd)
                    $sql.=" AND DATE_FORMAT(a.closed_at, '%Y-%m-%d')<='".$dateEnd."'";

                   $registers = Register::find_by_sql($sql);
                   

                   foreach ($registers as $register) {
                
                         $cash += $register->cash_total;
                         $cash_sub += $register->cash_sub;
                         
                         $cheque += $register->cheque_total;
                         $cheque_sub += $register->cheque_sub;
                         
                         $cc += $register->cc_total;
                         $cc_sub += $register->cc_sub;
                    }

                    //$sales = Sale::all();
                    $sql="SELECT  *
                    FROM   sales a
                    WHERE  a.register_id > 0 ";
                    if($dateBegin)
                      $sql.=" AND DATE_FORMAT(a.created_at, '%Y-%m-%d')>='".$dateBegin."'";
                    if($dateEnd)
                      $sql.=" AND DATE_FORMAT(a.created_at, '%Y-%m-%d')<='".$dateEnd."'";

                    $sales = Sale::find_by_sql($sql);



                    $sql="  SELECT *
                            FROM   payements a
                            WHERE  a.register_id >0 ";
                    if($dateBegin)
                      $sql.=" AND DATE_FORMAT(a.date, '%Y-%m-%d')>='".$dateBegin."'";
                    if($dateEnd)
                      $sql.=" AND DATE_FORMAT(a.date, '%Y-%m-%d')<='".$dateEnd."'";

                    $payaments = Payement::find_by_sql($sql);
                   
                    $sql="SELECT  a.category_id, a.note, 
                                 a.amount, b.name AS category_name

                          FROM   expences a, catalog_expences b 

                          WHERE  a.category_id = b.id ";
                    if($dateBegin)
                      $sql.=" AND DATE_FORMAT(a.date, '%Y-%m-%d')>='".$dateBegin."'";
                    if($dateEnd)
                      $sql.=" AND DATE_FORMAT(a.date, '%Y-%m-%d')<='".$dateEnd."'";

                    $expences = Expence::find_by_sql($sql);

                    $createdBy = 'todos';

                    $sql="SELECT DISTINCT a.name, a.value, SUM(c.price*c.qt-c.discount) as base 
                     FROM taxes a, products b, sale_items c, sales d
                     WHERE a.id=b.tax_sale_id AND b.id=c.product_id AND d.id=c.sale_id AND d.in_activo=1 ";
                    if($dateBegin)
                      $sql.=" AND DATE_FORMAT(c.date, '%Y-%m-%d')>='".$dateBegin."'";
                    if($dateEnd)
                      $sql.=" AND DATE_FORMAT(c.date, '%Y-%m-%d')<='".$dateEnd."'";

                    $sql.=" GROUP BY a.name";
                    $diftax = Tax::find_by_sql($sql);   

                    $sql="SELECT DISTINCT a.name, SUM(c.subtotal) as total 
                     FROM areas a, products b, sale_items c, sales d
                     WHERE a.id=b.area_id AND b.id=c.product_id AND d.id=c.sale_id AND d.in_activo=1 ";
                    if($dateBegin)
                      $sql.=" AND DATE_FORMAT(c.date, '%Y-%m-%d')>='".$dateBegin."'";
                    if($dateEnd)
                      $sql.=" AND DATE_FORMAT(c.date, '%Y-%m-%d')<='".$dateEnd."'";

                    $sql.=" GROUP BY a.name";
                    //echo $sql;
                    $areas = Area::find_by_sql($sql);   

              }

            }        
              //$this->view_data['categories'] = Categorie_menor::find_by_sql($sql);

               
                foreach ($payaments as $payament) {
                
                        $totalIngresos += $payament->paid;
                
                }
                $totalSales = $cheque + $cash + $cc;
                $totalSalesSub = $cheque_sub + $cash_sub + $cc_sub;

                foreach ($sales as $sale) {
                    $PayMethode = explode('~', $sale->paidmethod);
                       //$paystatus = $sale->paid - $sale->total;
                    if($PayMethode[0]==3) 
                          $credit += $sale->total;

                    $discount += $sale->discountamount;
                           
                 }
                $totalSales += $credit;

                 $data = '
               <table class="table">
                 <tr style="font-size: smaller;">
                   <td >' . label("Openedby") . ' ' . $createdBy . '</td>
                 </tr>
                 <tr style="font-size: smaller;">
                   <td >Del '.$dateBegin.' al '.$dateEnd.'</td>
                 </tr>
               </table>
               <h4 style="margin-top: -10px;">' . label("Sales") . '</h4>               

               <table class="table">
               <tr style="font-size: smaller;">
               <th width="25%">' . label("Método") . '</th>
               <th width="25%">' . label("EXPECTED") . '</th>
               <th width="25%">' . label("COUNTED") . ' </th>
               <th width="25%">' . label("DIFFERENCES") . '</th></tr>
               
               <tr style="font-size: smaller;">
                 <td >'.label("Cash").'</td>
                 <td>'.number_format((float)$cash, $this->setting->decimals, ',', '.').'</td>
                 <td>'.number_format((float)$cash_sub, $this->setting->decimals, ',', '.') .'</td>
                 <td>'.number_format((float)$cash-$cash_sub, $this->setting->decimals, ',', '.') . '</td>
               </tr>               
               <tr style="font-size: smaller;">
                   <td>Descuentos</td>
                   <td>'.number_format((float)$discount, $this->setting->decimals, ',', '.').'</td>
                   <td>0</td>
                   <td>0</td>
               </tr>
               <tr style="font-size: smaller;">
                 <td>'.label("Tarjeta de Crédito").'</td>
                 <td>'.number_format((float)$cc, $this->setting->decimals, ',', '.').'</td>
                 <td>'.number_format((float)$cc_sub, $this->setting->decimals, ',', '.') .'</td>
                 <td>'.number_format((float)$cc-$cc_sub, $this->setting->decimals, ',', '.') . '</td>
                 </tr>
               <tr style="font-size: smaller;">
                 <td>'.label("Cheque").'</td>
                 <td>'.number_format((float)$cheque, $this->setting->decimals, ',', '.').'</td>
                 <td>'.number_format((float)$cheque_sub, $this->setting->decimals, ',', '.') .'</td>
                 <td>'.number_format((float)$cheque-$cheque_sub, $this->setting->decimals, ',', '.') . '</td>
               </tr>
               <tr style="font-size: smaller;">
                 <td>'.label("Ventas a crédito").'</td>
                 <td>'.number_format((float)$credit, $this->setting->decimals, ',', '.').'</td>
                 <td>0</td>
                 <td>0</td>
               </tr>
               <tr style="font-size: smaller;">
                 <td>'.label("Total").'</td>
                 <td>'.number_format((float)($totalSales), $this->setting->decimals, ',', '.').'</td>
                 <td>'.number_format((float)($totalSalesSub), $this->setting->decimals, ',', '.').'</td>
                 <td>'.number_format((float)($totalSales-$totalSalesSub), $this->setting->decimals, ',', '.').'</td>
                </tr>
               </table>';
               $data .= '<h4>' . label("Expenses") . '</h4>         
               <table class="table"><tr style="font-size: smaller;"><th width="25%">' . label("Category") . '</th>
               <th width="50%">' . label("Note") . '</th>
               <th width="50%">' . label("Amount") . ' </th></tr>';
               $totalExpenses=0;
            foreach ($expences as $row) {
               $data .= '<tr style="font-size: smaller;"><td>' . $row->category_name . '</td><td><span>' . $row->note . '</span></td>
               <td><span>' . number_format((float)$row->amount, $this->setting->decimals, ',', '.') . '</span></td>
               </tr>';
               $totalExpenses+=$row->amount;
              }
               $data .= '<tr style="font-size: smaller;"><td>' . label("Total") . '</td><td></td>
               <td><span>' . number_format((float)$totalExpenses, $this->setting->decimals, ',', '.') . '</span></td>
               </tr>';
        
               $data .= '</table>';

           
                $data .= '<h4>' . label("Resúmen IVA") . '</h4>
                      <table class="table" cellspacing="0" border="0"><thead><tr><th style="text-align:center;">' . label("Tax") . '</th><th style="text-align:center;">' . label("Base") . '</th><th style="text-align:center;">' . label("IVA") . '</th><th style="text-align:center;">' . label("Total") . '</th></tr></thead>
                      <tbody>';
                    foreach ($diftax as $row) {
                      $taxamount=$row->value*$row->base/100;
                      $total=$row->base+$taxamount;
                      

                      $data .= '<tr style="font-size: smaller;"><td style="text-align:center;">'.$row->name.'</td><td style="text-align:center;">'.number_format($row->base, $this->setting->decimals, ',', '.').'</td><td style="text-align:center;">'.number_format($taxamount, $this->setting->decimals, ',', '.').'</td><td style="text-align:center;">'.number_format($total, $this->setting->decimals, ',', '.').'</td></tr>';
                    }
                    $data .= '</tbody></table>';
                    $data .= '<h4>' . label("Total por Segmentos") . '</h4>
                      <table class="table" cellspacing="0" border="0">
                      <tbody>';
                      $totalArea=0;
                    foreach ($areas as $row) {
                     $totalArea+=$row->total;


                      $data .= '<tr style="font-size: smaller;">
                        <td style="text-align:left;">'.$row->name.'</td>
                        <td style="text-align:center;">'.number_format($row->total, $this->setting->decimals, ',', '.').'</td>
                      </tr>';
                    }
                      $data .= '
                      <tr style="font-size: smaller;">
                        <td style="text-align:left;">TOTAL : </td>
                        <td style="text-align:center;">'.number_format($totalArea, $this->setting->decimals, ',', '.').'</td>
                      </tr></tbody></table>';
                      $totalTaxAnulado=0;
                /*   foreach ($diftax2 as $row) {
                      $taxamount=$row->value*$row->base/100;
                      $totalTaxAnulado+=$taxamount;
                    }
                  */  
                    $ventas=$totalSales-$totalIngresos-$credit;
              $data .= '
                   <h4>' . label("Totales") . '</h4>
                    <table class="table">
                  <tr style="font-size:small;">
                       <td>' . label("Ventas") . '</td>
                       <td>' . number_format((float)( $ventas), $this->setting->decimals, ',', '.') . '</td></tr>
                  <tr style="font-size:small;">
                       <td>' . label("Ingreso cuentas por cobrar") . '</td>
                       <td>' . number_format((float)($totalIngresos ), $this->setting->decimals, ',', '.') . '</td></tr>
                  <tr style="font-size:small;">
                       <td>' . label("Ventas a créditos") . '</td>
                       <td>' . number_format((float)($credit ), $this->setting->decimals, ',', '.') . '</td></tr>
                  <tr style="font-size:small;">
                       <td>' . label("Egresos o gastos") . '</td>
                       <td>-' . number_format((float)($totalExpenses ), $this->setting->decimals, ',', '.') . '</td></tr>
                  <tr style="font-size:small;">
                       <td>' . label("Total monto esperado") . '</td>
                       <td>' . number_format((float)($ventas + $credit - $totalExpenses ), $this->setting->decimals, ',', '.') . '</td></tr>
                  <tr style="font-size:small;">
                       <td>' . label("Total monto contado") . '</td>
                       <td>' . number_format((float)($cc_sub + $cash_sub + $cheque_sub ), $this->setting->decimals, ',', '.') . '</td></tr>
                  <tr style="font-size:small;">
                       <td>' . label("Diferencia") . '</td>
                       <td>' . number_format((float)($cc_sub + $cash_sub + $cheque_sub - $totalSales -$credit + $totalExpenses + $totalIngresos), $this->setting->decimals, ',', '.') . '</td></tr>
                       </table>';
                                 //echo $data;

          }

          $this->view_data['data'] = $data;
          $this->view_data['register_id'] = $register_id;
          $this->view_data['store_id'] = $store_id;
          $this->view_data['dateBegin'] = $dateBegin;
          $this->view_data['dateEnd'] = $dateEnd;
          $this->view_data['type'] = $type;
          $this->view_data['user_id'] = $user_id;
          $this->view_data['document'] = $document;

          $this->content_view = 'cashmovement/view';


        }
        else
        {
          $this->content_view = 'cashmovement/view';
        }
    }
}
