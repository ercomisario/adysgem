<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Calidads extends MY_Controller
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
        $sql="SELECT a.id, c.reference, c.name as productname, d.name as supplier, b.purchase_order, 
                     a.date_ven, a.lote, a.date_exp, b.numdoc, a.in_status

              FROM   purchase_items a, purchases b, products c, suppliers d

              WHERE  a.product_id = c.id AND a.purchase_id=b.id 
              AND    b.supplier_id=d.id AND a.in_status=1
              ORDER BY a.date_ven 
              ";
    // $sql;
      
        //$this->view_data['purchases'] = Purchase::find_by_sql($sql);
        $this->view_data['calidads'] = Purchase_item::find_by_sql($sql);
        //$this->view_data['purchases'] = Purchase::all();
        $this->content_view = 'calidad/view';
    }
    public function viewCalidads()
    {
        $sql="SELECT c.reference, c.name as productname, d.name as supplier, b.purchase_order, 
                     a.date_ven, a.lote, a.date_exp, b.numdoc, a.in_status

              FROM   purchase_items a, purchases b, products c, suppliers d

              WHERE  a.product_id = c.id AND a.purchase_id=b.id 
              AND    b.supplier_id=d.id AND a.in_status=1
              ORDER BY a.date_ven 
              ";
    // $sql;
      
        //$this->view_data['purchases'] = Purchase::find_by_sql($sql);
        $rows = Purchase_item::find_by_sql($sql);
        $data='';

        $row = '<table id="Table" class="table table-striped table-bordered" cellspacing="0" width="100%">
          <thead>
              <tr>
                  <th>'.label("Reference").'</th>
                  <th>'.label("Name").'</th>
                  <th>'.label("Proveedor - Factura").'</th>
                  <th>'.label("Orden compra").'</th>
                  <th>'.label("Fecha vencimiento").'</th>
                  <th>'.label("Lote").'</th>
                  <th>'.label("Status").'</th>
              </tr>
          </thead>

          <tbody>
      ';

        $data .= $row;
        $date_hoy=date('Y-m-d');
        $date_ven_10=date("Y-m-d",strtotime($date_hoy."+ 15 days")); 
        foreach ($rows as $row_rec) {
                  $date_ven='';
                  if($row_rec->date_ven)
                      $date_ven=$row_rec->date_ven->format('Y-m-d');
           
                  $status='Vigente';
                  $classstatus = 'paid';


                  if($date_ven<=$date_ven_10)
                  {
                      $status='Por vencerse';
                      $classstatus = 'Partiallypaid';
                  }
                  if($date_ven<=$date_hoy)
                  {
                      $status='Vencido';
                      $classstatus = 'unpaid';
                  }

                  if($row_rec->in_status==2)
                  {
                      $status='Atendido';
                      $classstatus = 'vencido';
                  }
                
                  if($status!='Vigente')
                  {
                      $row = '<tr>
                           <td>'.$row_rec->reference.'</td>
                           <td>'.substr($row_rec->productname,0,30).'</td>
                           <td>'.$row_rec->supplier.'-'.$row_rec->numdoc.'</td>
                           <td>'.$row_rec->purchase_order.'</td>
                           <td>'.$date_ven.'</td>
                           <td>'.$row_rec->lote.'</td>
                           <td><span class="'.$classstatus.'">'.label($status).'<span></td>                 
                        </tr>';

                    $data .= $row;
                  }

        }
        $data.='
          </tbody>
      </table>';
      die($data);

    }
    public function totalVencidos()
    {
        $sql="SELECT c.reference, c.name as pŕoduct_name, d.name as supplier, b.purchase_order, 
                     a.date_ven, a.lote, a.date_exp, b.numdoc, a.in_status

              FROM   purchase_items a, purchases b, products c, suppliers d

              WHERE  a.product_id = c.id AND a.purchase_id=b.id 
              AND    b.supplier_id=d.id AND a.in_status=1
              ORDER BY a.date_ven 
              ";
    // $sql;
      
        //$this->view_data['purchases'] = Purchase::find_by_sql($sql);
        $rows = Purchase_item::find_by_sql($sql);
       
        $date_hoy=date('Y-m-d');
        $total=0;
        foreach ($rows as $row_rec) {
            $date_ven='';
            if($row_rec->date_ven)
                $date_ven=$row_rec->date_ven->format('Y-m-d');
           
            if($date_ven<=$date_hoy)
            {
                $total+=1;
            }
            
            


        }
      echo $total;
      die();

    }

    public function totalPorVencer()
    {
        $sql="SELECT c.reference, c.name as pŕoduct_name, d.name as supplier, b.purchase_order, 
                     a.date_ven, a.lote, a.date_exp, b.numdoc, a.in_status

              FROM   purchase_items a, purchases b, products c, suppliers d

              WHERE  a.product_id = c.id AND a.purchase_id=b.id 
              AND    b.supplier_id=d.id AND a.in_status=1
              ORDER BY a.date_ven 
              ";
    // $sql;
      
        //$this->view_data['purchases'] = Purchase::find_by_sql($sql);
        $rows = Purchase_item::find_by_sql($sql);
       
        $date_hoy=date('Y-m-d');
        $date_ven_10=date("Y-m-d",strtotime($date_hoy."+ 15 days")); 
        $date_tomorrow=date("Y-m-d",strtotime($date_hoy."+ 1 days")); 
        $total=0;
        foreach ($rows as $row_rec) {
            $date_ven='';
            if($row_rec->date_ven)
                $date_ven=$row_rec->date_ven->format('Y-m-d');
           
            if($date_ven>=$date_tomorrow && $date_ven<=$date_ven_10)
            {
                $total+=1;
            }
            
            


        }
      echo $total;
      die();

    }
    public function edit($id = FALSE)
    {
        $item_purchase = Purchase_item::find($id);
        $item_purchase->in_status=2;
        $item_purchase->save(); 

        redirect("calidads", "refresh");

    }

}
