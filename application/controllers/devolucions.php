<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Devolucions extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        if (! $this->user) {
            redirect('login');
        }
        $this->setting = Setting::find(1);
        
        $lang = $this->session->userdata("lang") == null ? "english" : $this->session->userdata("lang");
        $this->lang->load($lang, $lang);
        $this->register = $this->session->userdata('register') ? $this->session->userdata('register') : FALSE;
        $this->store = $this->session->userdata('store') ? $this->session->userdata('store') : FALSE;


    }

    public function index()
    {
        $user=User::find($this->session->userdata('user_id'));
        if($user->role=='admin')
            $devolucion = Devolucion::all();
        else
        {
            $devolucion = Devolucion::find('all', array(
             'conditions' => array(
                 'caja = ?',
                 $user->username
             )
            ));
        }
        $this->view_data['devolucions'] = $devolucion;

        $this->content_view = 'devolucion/view';
    }
    public function listar()
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
         $ticket = '<table cellspacing="0" border="0" width="100%">
                            <tr style="font-size: smaller; ">
                                <td style="text-align:center;"><h4>'.label("Devolución").': '.$date.'</h4></td>
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
                                        <th style="text-align:left; width:70%;">' . label("Product") . '</th>
                                        <th style="text-align:center; width:25%;">' . label("Disponible") . '</th>
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
                            <td style="text-align:left; width:70%;">' . $row->name . '</td>
                            <td style="text-align:center; width:25%;">' . $disponible . '</td>
                        </tr>';
            $i ++;
            

        }

        $ticket .= '</tbody></table></div>';
        
        die($ticket);   

       
    }
    public function showTicket($id)
    {
         
        $devolucion = Devolucion::find($id);
        
        $ticket = '<table cellspacing="0" border="0" width="100%">
                            <tr style="font-size: smaller;">
                                <td style="text-align:center;">'.$this->setting->receiptheader.'</td>
                            </tr>
                   </table>';
        $ticket.=$devolucion->texto;
            

                
        die($ticket);   

       
    }

    public function enviarDevolucion()
    {
        $user=User::find($this->session->userdata('user_id'));
        $store=Store::find($this->store);

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

        $this->email->subject('Devolucion de ' . $this->setting->companyname );
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
         'store' => $store->name,
         'status'   => $status
        );
        $devolucion = Devolucion::create($dataBD);
        $posale = Posale::find('all', array(
            'conditions' => array(
                'status = ? AND register_id = ? AND user_id = ?',
                1,
                $this->register,
                $this->session->userdata('user_id')

            )
        ));
         //print_r($posale);
        die();
        
        /*echo json_encode(array(
            "status" => TRUE
        ));*/
    }


}
