<!-- Page Content -->
<div class="container">
   <h3><?=label("Pedidos");?></h3>
      <table id="Table" class="table table-striped table-bordered" cellspacing="0" width="100%">
          <thead>
              <tr>
                  <th><?=label("Orden");?></th>
                  <th><?=label("Date");?></th>
                  <th><?=label("Caja");?></th>
                  <th><?=label("Cajero");?></th>
                  <th><?=label("Email");?></th>
                  <th><?=label("Status");?></th>
                  <th><?=label("Action");?></th>
              </tr>
          </thead>

          <tbody>
             <?php foreach ($pedidos as $row){
                    $classstatus = 'unpaid';
                    $status ='Pendiente';
                    $orden = str_pad($row->id, 8, "0", STR_PAD_LEFT);

                  if($row->status==1) 
                  {
                    $classstatus = 'paid';
                    $status='Atendido';
                    
                  }
                  ?>
              <tr>
                 <td><?=$orden;?></td>
                 <td><?=$row->date->format('d/m/Y');?></td>
                 <td><?=$row->caja;?></td>
                 <td><?=$row->cajero;?></td>
                 <td><?=$row->email;?></td>
                 <td><?='<span class="' . $classstatus . '">'.$status.'<span>';?></td>
                 <td><div class="btn-group">
                          <a class="btn btn-primary dropdown-toggle" href="javascript:void(0)" data-toggle="dropdown" >
                          <i class="fa fa-cog fa-fw"></i> <?=label("Action")?></a>
                          <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#">
                             <span class="fa fa-caret-down" title="Toggle dropdown menu"></span></a>
                          <ul class="dropdown-menu">
                             <li><a href="javascript:void(0)" onclick="viewPedido(<?=$row->id;?>);">
                               <i class="fa fa-sticky-note" aria-hidden="true"></i> <?=label("Ticket")?></a></li>
                          <?php if($row->status==0){?>
                              <li><a href="javascript:void(0)" onclick="modifystock(<?=$row->id;?>);">
                               <i class="fa fa-tasks" aria-hidden="true"></i> <?=label("ModifyStock")?></a></li>
                          <?php }?>
                          <?php if($row->status==1){?>
                              <li><a href="javascript:void(0)" onclick="notaEntrega(<?=$row->id;?>);">
                               <i class="fa fa-tasks" aria-hidden="true"></i> <?=label("Nota de entrega")?></a></li>
                          <?php }?>
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

function viewPedido(id){

      $('#printSection').load("<?php echo site_url('pedidos/showTicket')?>/"+id);
      $('#ticket').modal('show');  
}
function notaEntrega(id){

      $('#printSection').load("<?php echo site_url('pedidos/notaEntrega')?>/"+id);
      $('#ticket').modal('show');  
}
function modifystock(id){

   $.ajax({
       url : "<?php echo site_url('pedidos/modifystock')?>/"+id,
       type: "POST",
       success: function(data)
       {
          $('#stockcontent').html(data);
          $('#stock').modal('show');       
          var pedidoID = $('#pedidoID').val();

       },
       error: function (jqXHR, textStatus, errorThrown)
       {
          alert("error");
       }
  });
}

function updatestock(){
    
    console.log($("#updatestockForm").serialize());
    $.post("pedidos/updatestock",$("#updatestockForm").serialize(),function(data){
         $("#stock").modal('hide');
          location.reload();
    });

 };
</script>

<!-- Modal ticket -->
<div class="modal fade" id="ticket" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document" id="ticketModal">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="ticket"><?=label("Receipt");?></h4>
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

