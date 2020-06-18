<!-- Page Content -->
<div class="container" style="width: 98%;">
   <h3><?=label("Control de calidad");?></h3>
      <table id="Table" class="table table-striped table-bordered" cellspacing="0" width="100%">
          <thead>
              <tr>
                  <th><?=label("Reference");?></th>
                  <th><?=label("Name");?></th>
                  <th><?=label("Proveedor - Factura");?></th>
                  <th><?=label("Orden compra");?></th>
                  <th><?=label("Fecha vencimiento");?></th>
                  <th><?=label("Lote");?></th>
                  <th><?=label("Status");?></th>
                  <th><?=label("Action");?></th>
              </tr>
          </thead>

          <tbody>
             <?php 
             $date_hoy=date('Y-m-d');
             foreach ($calidads as $row){
                  $date_ven_10=date("Y-m-d",strtotime($date_hoy."+ 15 days")); 
                  $date_ven='';
                  if($row->date_ven)
                      $date_ven=$row->date_ven->format('Y-m-d');
           
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

                  if($row->in_status==2)
                  {
                      $status='Atendido';
                      $classstatus = 'vencido';
                  }

                  
                  ?>
              <tr>
                 <td><?=$row->reference;?></td>
                 <td><?=substr($row->productname,0,30);?></td>
                 <td><?=$row->supplier;?>-<?=$row->numdoc;?></td>
                 <td><?=$row->purchase_order;?></td>
                 <td><?=$date_ven;?></td>
                 <td><?=$row->lote;?></td>
                 <td><span class="<?=$classstatus?>"><?=label($status)?><span></td>
                 <td><div class="btn-group">
                          <a class="btn btn-primary dropdown-toggle" href="javascript:void(0)" data-toggle="dropdown" >
                          <i class="fa fa-cog fa-fw"></i> <?=label("Action")?></a>
                          <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#">
                             <span class="fa fa-caret-down" title="Toggle dropdown menu"></span></a>
                          <ul class="dropdown-menu">
                             <li><a href="calidads/edit/<?=$row->id;?>">
                               <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i> <?=label("Atender")?></a></li>
                          </ul>
                      </div>

                  </td>
              </tr>
           <?php }?>
          </tbody>
      </table>

</div>
<!-- /.container -->
<script type="text/javascript">
var pedidoID;

function pdfreceipt(){

   var content = $('#printSection').html();
   $.redirect('<?php echo site_url('pos/pdfreceipt')?>/', { content: content });

}

function PrintTicket() {
   $('.modal-body').removeAttr('id');
   window.print();
   $('.modal-body').attr('id', 'modal-body');
   $("#ticket").modal('hide');

}

function viewDevolucion(id){

      $('#printSection').load("<?php echo site_url('devolucions/showTicket')?>/"+id);
      $('#ticket').modal('show');  
}

</script>

<!-- Modal ticket -->
<div class="modal fade" id="ticket" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document" id="ticketModal">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="ticket"><?=label("Devolución");?></h4>
      </div>
        
      <div class="modal-body" id="modal-body">
         <div id="printSection">
            <!-- Ticket goes here -->
            <center><h1 style="color:#34495E"><?=label("empty");?></h1></center>
         </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default hiddenpr" data-dismiss="modal"><?=label("Close");?></button>
        <button type="button" class="btn btn-add hiddenpr" href="javascript:void(0)" onClick="pdfreceipt()">PDF</button>
        <button type="button" id="btnTicket" class="btn btn-add hiddenpr" onclick="PrintTicket()"><?=label("print");?></button>
      </div>

    </div>
 </div>
</div>
<!-- /.Modal -->

  <!-- Modal stock -->
  <div class="modal fade" id="stock" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document" id="stockModal">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="stock"><?=label("Stock");?></h4>
        </div>
      <?php
        $attributes = array('id' => 'updatestockForm');
        echo form_open_multipart('', $attributes);
        ?>
        <div class="modal-body" id="modal-body">
           <div id="stockcontent">
              <!-- stock goes here -->
           </div>
        </div>
       <?php echo form_close(); ?>
         <div class="modal-footer">
          <button type="button" class="btn btn-default hiddenpr" data-dismiss="modal"><?=label("Close");?></button>
          <button type="button" class="btn btn-add hiddenpr" onclick="updatestock()"><?=label("Guardar");?></button>
        </div>
     
      </div>
  </div>
  </div>
  <!-- /.Modal -->

