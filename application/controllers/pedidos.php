<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Pedidos extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        if (! $this->user) {
            redirect('login');
        }
        $this->setting = Setting::find(1);

    }

    public function index()
    {
        $user=User::find($this->session->userdata('user_id'));
        if($user->role=='admin')
            $pedido = Pedido::all();
        else
        {
            $pedido = Pedido::find('all', array(
             'conditions' => array(
                 'caja = ?',
                 $user->username
             )
            ));
        }
        $this->view_data['pedidos'] = $pedido;

        $this->content_view = 'pedido/view';
    }
    public function showTicket($id)
    {
         
        $pedido = Pedido::find($id);
        
        $ticket = '<table cellspacing="0" border="0" width="100%">
                            <tr style="font-size: smaller;">
                                <td style="text-align:center;">'.$this->setting->receiptheader.'</td>
                            </tr>
                   </table>';
        $ticket.=$pedido->texto;
            

                
        die($ticket);   

       
    }
    public function modifystock($id)
    {
      $stores = Store::find('all');
      $pedidos = Pedido_item::find('all', array('conditions' => 
                          array('pedido_id = ?', $id)));
      $content = '
       <div class="col-md-12">
       <table class="table table-striped">
          <thead>
             <tr>
                <th width="40%">'.label("Store").'</th>
                <th width="30%">'.label("Product").'</th>
                <th width="30%">'.label("Disponible").'</th>
                <th width="30%">'.label("Solicitado").'</th>
             </tr>
          </thead>
          <tbody class="itemslist">';
           foreach ($stores as $store) {
               foreach ($pedidos as $pedido) {

                  $product=Product::find($pedido->product_id);

                  $stock = Stock::find('first', array('conditions' => 
                          array('store_id = ? AND product_id = ?', $store->id, $pedido->product_id)));

                  $quantity = $stock ? $stock->quantity : '0';
                  $solicitado=0;
                  $cheked = false;
                  $invis = $product->h_stores;
                  $invis = trim($invis, ",");
                  $array = explode(',', $invis); //split string into array seperated by ', '
                  foreach($array as $value) //loop over values
                  {
                      if($value == $store->id)
                        $cheked=true;
                  }
                  
                  if($pedido->store_id==$store->id)
                    $solicitado=$pedido->qt;
                  
                  if($cheked)
                  {
                      $content .= '
                      <tr>
                         <td>'.$store->name.'</td>
                         <td>'.$product->name.'</td>
                         <td>'.$quantity.'</td>
                         <td><input type="number" id="solicitado_'.$store->id.'_'.$product->id.'" name="solicitado_'.$store->id.'_'.$product->id.'" value="'.$solicitado.'" style="color: black;width: 6.1em;"></td>
                      </tr>';
                  }
           }
        }
        $content .= '  </tbody>
       </table></div>';
        $content .= '<input type="hidden" id="pedidoID" name="pedidoID" value="'.$id.'">';

        die($content);
    }
    function updatestock()
    {
      $id = $this->input->post('pedidoID');
      $stores = Store::find('all');

      $pedidos = Pedido_item::find('all', array('conditions' => 
                          array('pedido_id = ?', $id)));
      foreach ($stores as $store) {
          foreach ($pedidos as $pedido) {
//            echo $store->id.' '.$pedido->product_id;
            $solicitado = $this->input->post('solicitado_'.$store->id.'_'.$pedido->product_id);
            if($item = Stock::find('first', array('conditions' => array('store_id = ? AND product_id = ?', $store->id, $pedido->product_id))))
            {
                //echo $store->id.' '.$pedido->product_id.' '.$solicitado.'<br>';

                if($solicitado>0)
                {
                    $item->quantity += $solicitado;
                    $item->save();
                }  
            } 
            else {

               $qt['product_id'] = $pedido->product_id;
               $qt['store_id'] = $store->id;
               $qt['quantity'] = $solicitado;
               if($solicitado>0)                
                    Stock::create($qt);
            }
         }
      }
      $pedido = Pedido::find($id);
      $pedido->status = 1;
      $pedido->save();
      echo json_encode(array(
          "status" => TRUE
      ));

   }

    public function notaEntrega($id)
    {
      $pedido = Pedido::find($id);
      $orden = str_pad($pedido->id, 8, "0", STR_PAD_LEFT);
      $fecha= $pedido->date->format('d/m/Y');

      $pedidos = Pedido_item::find('all', array('conditions' => 
                          array('pedido_id = ?', $id)));
      
       $content = '<table cellspacing="0" border="0" width="100%">
                            <tr style="font-size: smaller;">
                                <td style="text-align:center;">'.$this->setting->receiptheader.'</td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;"><h4>'.label("Orden").': '.$orden.'</h4></td>
                            </tr>
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;">'.label("Date").': '.$fecha.'</td>
                            </tr>
                            <tr><td style="text-align:center;"><em></em></td></tr>
                    </table>';
       $content .= '       
       <div><table cellspacing="0" border="1" width="100%">
             <tr style="font-size: smaller;">
                
                <td width="40%">'.label("Product").'</td>
                <td width="20%">'.label("Quantity").'</td>
                <td width="20%">'.label("Price").'</td>
                <td width="20%">'.label("Total").'</td>
             </tr>';
          foreach ($pedidos as $row) {

                  $product=Product::find($row->product_id);

                  $content .= '
                      <tr style="font-size: smaller;">
                         <td width="40%">'.$product->name.'</td>
                         <td width="20%">'.$row->qt.'</td>
                         <td width="20%">'.$row->price.'</td>
                         <td width="20%">'.$row->price*$row->qt.'</td>                         
                      </tr>';
            
        }
        $content .= '</table></div>';

        die($content);
    }

}
