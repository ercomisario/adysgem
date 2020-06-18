<style>
  #ticket .modal-dialog {
    width: 500px;
}
</style>
  <div class="container" style="width: 90%;">

    <h3><?=label('Purchases');?></h3>
     <div class="float-right hidden-xs hidden-sm" style="margin-bottom:30px;">
               <a class="btn btn-primary" href="purchases/add" data-toggle="tooltip" data-placement="top" title="<?=label('AddPurchase');?>"><?=label('AddPurchase');?></a>
     </div>      
    <table id="table" class="table table-striped table-bordered dataTable no-footer" cellspacing="0" width="100%">

      <thead class="thead-inverse">
        <tr>
          <th><?=label('Date');?></th>
          <th><?=label('PurchaseOrder');?></th>
          <th><?=label('Supplier');?></th>
          <th><?=label('totalitems');?></th>
          <th><?=label('Tax');?></th>
          <th><?=label('Total');?></th>
          <th><?=label('Paid');?></th>
          <th><?=label('Createdby');?></th>
          <th><?=label('Status');?></th>
          <th style="width: 96px;"><?=label('Action');?></th>
        </tr>
      </thead>
      <tbody>
            <?php foreach ($purchases as $row):
              switch ($row->status) {
                case 1: // case Credit Card
                    $classstatus = 'unpaid';
                    break;
                case 2: // case ckeck
                    $classstatus = 'Partiallypaid';
                    break;
                case 3: // case ckeck
                    $classstatus = 'Cancelada';
                    break;
                default:
                    $classstatus = 'paid';
             

            }
            $rowPaid = '<span class="' . $classstatus . '">' . label($classstatus) . '<span>';
            ?>
              <tr>
                 <td><?=$row->date->format('d/m/Y');?></td>
                 <td><?=$row->purchase_order;?></td>  
                 <td><?=$row->supplier_name;?></td>
                 <td><?=$row->totalitems;?></td>
                 <td><?=$row->tax_name;?></td>
                 <td><?=number_format($row->total, $this->setting->decimals, ',', '.');?></td>
                 <td><?=number_format($row->paid, $this->setting->decimals, ',', '.');?></td>
                 <td class="hidden-xs"><?=$row->created_name;?></td>
                 <td><?=$rowPaid;?></td>

                 <td><div class="btn-group">
                          <a class="btn btn-primary dropdown-toggle" href="javascript:void(0)" data-toggle="dropdown" >
                          <i class="fa fa-cog fa-fw"></i> <?=label("Action")?></a>
                          <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#">
                             <span class="fa fa-caret-down" title="Toggle dropdown menu"></span></a>
                          <ul class="dropdown-menu">
                             <li><a href="purchases/itemsview/<?=$row->id;?>">
                                 <i class="fa fa-pencil fa-fw" aria-hidden="true"></i> <?=label("Edit")?></a></li>
                             <li><a href="javascript:void(0)" onclick="javascript:viewInvoice(<?=$row->id;?>);">
                               <i class="fa fa-sticky-note" aria-hidden="true"></i> <?=label("invoice")?></a></li>
                             <li class="divider"></li><li>
                                 <a href="javascript:void(0)" onclick="deletePurchase(<?=$row->id;?>)">
                                 <i class="fa fa-trash-o fa-fw" aria-hidden="true"></i><?=label("Delete")?></a></li>
                          </ul>
                      </div>
                  </td>
              </tr>
           <?php endforeach;?>


      </tbody>
    </table>
  </div>


  <script type="text/javascript">

    var save_method; //for save method string
    var table;


    $(document).ready(function() {

      $('#summernote').summernote({
         height: 100,
         toolbar: [
          // [groupName, [list of button]]
          ['style', ['bold', 'italic', 'underline', 'clear']],
          ['font', []],
          ['fontsize', ['fontsize']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['height', ['height']]
        ]
      });
      table = $('#table').DataTable();
    
});

  

function deletePurchase(id)
{

    swal({   title: '<?=label("Areyousure");?>',
      text: '<?=label("Deletemessage");?>',
      type: "warning",
      showCancelButton: true,
      confirmButtonColor: "#DD6B55",
      confirmButtonText: '<?=label("yesiam");?>',
      closeOnConfirm: false },
      function(){
         // ajax delete data to database
        $.ajax({
         url : "<?php echo site_url('purchases/delete')?>/",
         type: "POST",
         data: {purchase_id:id},         
         success: function(data)
         {   
             // $('#SearchProductModal').modal('hide');
              location.reload();
         },
         error: function (jqXHR, textStatus, errorThrown)
         {
            alert("error");
         }
        });
        swal('<?=label("Deleted");?>', '<?=label("Deletedmessage");?>', "success"); 
      });



        

}
  </script>


  <!-- Modal -->
  <div class="modal fade" id="AddPurchase" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel"><?=label("AddPurchase");?></h4>
        </div>
        <?php
        $attributes = array('id' => 'addform');
        echo form_open_multipart('purchases/add', $attributes);
        ?>
        <div class="modal-body">
              <div class="form-group controls col-sm-6 ">
               <label for="date"><?=label("Date");?> *</label>
               <input type="text" Required name="date" class="form-control" id="date" placeholder="<?=label("Date");?>">
             </div>
             <div class="form-group col-sm-6">
               <label for="purchase_order"><?=label("PurchaseOrder");?> *</label>
               <input type="text" name="purchase_order" maxlength="25" Required class="form-control" id="purchase_order" placeholder="<?=label("PurchaseOrder");?>">
             </div>

             <div class="form-group col-sm-6">
               <label for="supplier_id"><?=label("Supplier");?></label>
               <select class="form-control" name="supplier_id" id="supplier_id" Required>
                 <option value=""><?=label("Supplier");?></option>
                 <?php foreach ($suppliers as $row):?>
                    <option value="<?=$row->id;?>"><?=$row->name;?></option>
                 <?php endforeach;?>
              </select>
             </div>
             <div class="form-group col-sm-6">
               <label for="store_id"><?=label("Store");?></label>
                  <?php if(isset($storeId)):?>
                     <input type="text" value="<?=$storeName;?>" class="form-control" id="store_id" disabled>
                     <input type="hidden" value="<?=$storeId;?>" name="store_id">
                     <?php else:?>
                     <select class="form-control" name="store_id" id="store_id">
                       <option value=""><?=label("Store");?></option>
                       <?php foreach ($stores as $store):?>
                          <option value="<?=$store->id;?>"><?=$store->name;?></option>
                       <?php endforeach;?>
                       </select>
                   <?php endif;?>

             </div>
            <div class="form-group controls col-sm-6 ">
               <label for="typedoc"><?=label("TypeDocument");?></label>
               <select class="form-control" id="typedoc" name="typedoc" Required>
                  <option value="">Seleccione</option>
                  <option value="1" selected>Cédula</option>
                  <option value="2">Pasaporte</option>
                  <option value="3">Rif</option>
               </select>
            </div>
 
            <div class="form-group controls col-sm-6 ">
               <label for="numdoc"><?=label("NumberDocument");?></label>
               <input type="text" name="numdoc" id="numdoc" Required maxlength="50" class="form-control" placeholder="<?=label("NumberDocument");?>">
             </div>

            <div class="form-group col-sm-6">
               <label for="store_id"><?=label("Tax");?></label>
                    <select class="form-control" name="tax_id" id="tax_id" Required>
                       <option value=""><?=label("Tax");?></option>
                       <?php foreach ($taxes as $row):?>
                          <option value="<?=$row->id;?>"><?=$row->name;?></option>
                       <?php endforeach;?>
                       </select>
             </div>

            <div class="form-group col-sm-6">
                <label for="exampleInputFile"><?=label("Attachment");?></label>
                <input type="file" name="userfile" id="attachment">
            </div>
             <div class="form-group col-sm-12">
               <p class="help-block"><?=label("AttachmentInfos");?></p>
             </div>
           
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal"><?=label("Close");?></button>
          <button type="submit" class="btn btn-add"><?=label("Submit");?></button>
        </div>
     <?php echo form_close(); ?>
      </div>
   </div>
  </div>
  <!-- /.Modal -->

<script type="text/javascript">

$(document).ready(function() {

      $('#date').datepicker({
          todayHighlight: true,
          format:'yyyy-mm-dd'
      }).datepicker("setDate",'now');

  });

function viewInvoice(id) {


  $('#printSection').load("<?php echo site_url('purchases/printInvoice')?>/"+id);
  $('#ticket').modal('show');

 
}

function pdfreceipt(){

   var content = $('#printSection').html();
   $.redirect('<?php echo site_url('purchases/pdfreceipt')?>/', { content: content });

}

function PrintPurchase() {
   $('.modal-body').removeAttr('id');
   window.print();
   $('.modal-body').attr('id', 'modal-body');
   $("#ticket").modal('hide');

}

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
         </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default hiddenpr" data-dismiss="modal"><?=label("Close");?></button>
        <button type="button" class="btn btn-add hiddenpr" href="javascript:void(0)" onClick="pdfreceipt()">PDF</button>
        <button type="button" id="btnPurchase" class="btn btn-add hiddenpr" onClick="PrintPurchase()"><?=label("print");?></button>


      </div>
    </div>
 </div>
</div>
<!-- /.Modal -->
