<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Ingresos extends MY_Controller
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
       /* $sql="SELECT a.id, a.date, a.paid, a.paidmethod, a.created_by,
                     b.clientname, b.invoice, DATE_FORMAT(b.created_at, '%Y-%m-%d') AS created_at, 
                     b.status, b.total, b.firstpayement, d.username, a.sale_id
              FROM payements a, sales b, registers c, users d
              WHERE a.sale_id=b.id AND b.register_id=c.id AND c.user_id = d.id
              ORDER BY b.invoice, a.id asc";*/

        $sql="SELECT b.clientname, b.invoice, DATE_FORMAT(b.created_at, '%Y-%m-%d') AS created_at, 
                     b.status, b.total, b.firstpayement, d.username, b.id,
                     (SELECT DATE_FORMAT(date, '%Y-%m-%d') FROM payements WHERE sale_id=b.id ORDER BY id DESC LIMIT 1) AS fecha_abono,
                     (SELECT paid FROM payements WHERE sale_id=b.id ORDER BY id DESC LIMIT 1) AS pago,
                     (SELECT SUM(paid) FROM payements WHERE sale_id=b.id GROUP BY sale_id) AS pagado
              FROM   sales b, registers c, users d
              WHERE  b.register_id=c.id AND c.user_id = d.id AND b.paidmethod=3 AND b.in_activo=1
              ORDER BY b.invoice asc";

        //$ingresos = Payement::find_by_sql($sql);   
        $ingresos = Sale::find_by_sql($sql);   

        $this->view_data['ingresos'] = $ingresos;

        $this->content_view = 'ingreso/view';
    }
    public function pdfreceipt()
    {
        $id = $this->input->post('id');
        $content = $this->setting->receiptheader;
        $pedido = Pedido::find($id);
        $content .= ''.$pedido->texto;
        //echo $content;
        //die();
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
        $pdf->Output('pedido'.$date.'.pdf', 'D');
    }

}
