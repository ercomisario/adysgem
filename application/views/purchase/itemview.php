
  <link href="<?=base_url();?>assets/css/bootstrap-combobox.css" rel="stylesheet">
  <style>
 .input-group {
    display: flex;
  }  
  #dialogSearchProduct{
    width: 100%;
  }
  </style>
<script type="text/javascript">

  $(document).ready(function() {

    $('#SearchProductModal').on('shown.bs.modal', function() {
          
          $('#searchProduct').trigger('focus');

    });
   //
     //  search product modal
   $("#searchProduct").keyup(function(){
      // Retrieve the input field text
      var id = $('#idPurchase').val();
      var store_id = $('#store_id').val();
      var filter = $(this).val();
      console.log(id, filter);
      // Loop through the list
      $.ajax({
          url : "<?php echo site_url('productcontroller/searchProduct')?>",
          type: "POST",
          data: {
            id: id,
            store_id: store_id,
            term: filter
          },
          success: function(data)
          {
             $('#resultProduct').html(data);
          },
          error: function (jqXHR, textStatus, errorThrown)
          {
              alert("error");
          }
       });
   });
   $("#discount").keyup(function(){
      // Retrieve the input field text
      var discount = $(this).val();

      var subtot = $('#subtot').val();
      subtot = subtot.split('.').join('');

      var paid = $('#paid').val();
      paid = paid.split('.').join('');
      
      var retention = $('#retention').val();
      retention = retention.split('.').join('');
      
      var total_tax = $('#total_tax').val()
      total_tax = total_tax.split('.').join('');
   
      var total=parseFloat(total_tax)+parseFloat(subtot-discount-retention);
      $('#total').val(Math.round(total*100)/100);

      var difference = total- paid; 

      $('#difference').val(Math.round(difference*100)/100);

      $('#porcDiscount').val(discount/subtot*100);
      
      // Loop through the list
      
   });
   $("#paid").keyup(function(){
      // Retrieve the input field text
      var paid = $(this).val();
      var total = $('#total').val();
      total = total.split('.').join('');
      
      var difference = total-paid; 

      $('#difference').val(Math.round(difference*100)/100);
      // Loop through the list
      
   });
   $("#retention").keyup(function(){
      // Retrieve the input field text
      var retention = $(this).val();

      var paid = $('#paid').val();
      var total = $('#totalHdn').val();
      total = total.split('.').join('');
      total=total-retention;
      $('#total').val(Math.round(total*100)/100);

      var difference = total-paid; 
      $('#difference').val(Math.round(difference*100)/100);
   
      // Loop through the list
      
   });

  });//fin de document ready

function gotoPurchase()
{
  location.href = "<?php echo site_url('purchases')?>";
      

}

function setAmount()
{

    //var valor = $('#tax_id').val();
    var valor  = $("#tax_id").val().split('|')[1];

    var discount = $('#discount').val();
    var paid = $('#paid').val();
    var subtot = $('#subtotHdn').val();
    subtot = subtot.split('.').join('');

    var total_tax=(subtot-discount)*valor/100;
    $('#total_tax').val(Math.round(total_tax*100)/100);
    var total=parseFloat(total_tax)+parseFloat(subtot-discount);
    $('#total').val(Math.round(total*100)/100);
    var difference = paid-total; 
    $('#difference').val(Math.round(difference*100)/100);
      

}
function openSearchItem()
{

   var store_idHdn = $('#store_idHdn').val();

   if(store_idHdn.length==0)
   {
        swal('Oops...', 'Debe primero guardar la compra', 'error'); 
        return;

   }

   $('#SearchProductModal').modal('show');

}
function addItemPurchase(id, itemId)
{

   var cost = $('#idcost_'+itemId).val();
   var qt = $('#idqt_'+itemId).val();
   var tax_id = $('#tax_id_'+itemId).val();
   var lote = $('#lote_'+itemId).val();
   var date_exp = $('#date_exp_'+itemId).val();
   var date_ven = $('#date_ven_'+itemId).val();
   if(tax_id.length==0)
   {
        swal('Oops...', 'Debe elegir impuesto del producto a agregar', 'error'); 
        return;

   }
   var store_id = $('#store_id').val();
   //console.log(id, itemId, cost, qt);
   $.ajax({
         url : "<?php echo site_url('purchases/addItemPurchase')?>/",
         type: "POST",
         data: {product_id: itemId, purchase_id:id, cost:cost, qt:qt, tax_id:tax_id, store_id:store_id, lote:lote, date_exp:date_exp, date_ven:date_ven},         
         success: function(data)
         {   
              $('#SearchProductModal').modal('hide');
              location.reload();
         },
         error: function (jqXHR, textStatus, errorThrown)
         {
            alert("error");
         }
    });

}
function deleteItemPurchase(id, itemId, subtot)
{

   var store_id = $('#store_id').val();
   
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
               url : "<?php echo site_url('purchases/deleteItemPurchase')?>/",
               type: "POST",
               data: {product_id: itemId, purchase_id:id, subtot:subtot, store_id:store_id},         
               success: function(data)
               {   
                    location.reload();
               },
               error: function (jqXHR, textStatus, errorThrown)
               {
                  alert("error");
               }
          });
        swal.close(); 
      });
         

}
function deletePurchase()
{
   var purchase_id = $('#idPurchase').val();
   if(purchase_id.length>0) {
      swal({   
        title: '<?=label("Areyousure");?>',
        text: '<?=label("Deletemessage");?>',
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: '<?=label("yesiam");?>',
        closeOnConfirm: false },
        function(){
          // ajax delete data to database
          //console.log("Aqui");
          $.ajax({
              url : "<?php echo site_url('purchases/delete')?>",
              type: "POST",   
              data: {purchase_id:purchase_id},       
              success: function(data)
              {
                 window.location.href = "<?php echo site_url('purchases')?>";

              }, 
              error: function (jqXHR, textStatus, errorThrown)
              {
                 alert("error");
              }
          });
       swal('<?=label("Deleted");?>', '<?=label("Deletedmessage");?>', "success"); });

   }

}

function addSupplier() {
  
  var name=$("#namesupplier").val();
  var typedoc=$("#typedoc").val();
  var type=$("#typesupplier").val();
  var numdoc=$("#numdocSupplier").val();
  var regime=$("#regime").val();
  $("#modalAddSupplier").modal('hide');

  $.ajax({
       url : "<?php echo site_url('purchases/addSupplier')?>",
       type: "POST",
       data:{type: type, name: name, typedoc: typedoc, numdoc: numdoc, regime: regime},
       success: function(data){

          $('#supplier').html(data);          

       },
       error: function (jqXHR, textStatus, errorThrown)
       {
          alert("error");
       }
  });
}


</script>

<div class="container">
    <h3><?=label('DetailsPurchase');?></h3>
    <?php 

      $id=$purchase->id;
      $purchase_order=$purchase->purchase_order;
      $supplier_id=$purchase->supplier_id;
      $typedoc=$purchase->typedoc;      
      $numdoc=$purchase->numdoc;
      $store_id=$purchase->store_id;
      $tax_id=$purchase->tax_id;
      $tax_value=$tax_value;
      $paidmethod=$purchase->paidmethod;
      $date=$purchase->date->format('Y-m-d');
      $subtot=$purchase->subtot;
      $total=$purchase->total;
      $paid=$purchase->paid;
      $retention=$purchase->retention;
      $discount=$purchase->discount;
      
      if($tax_id==0)$tax_id=3;
      if($subtot>0)
        $porcDiscount=$discount/$subtot*100;
      else
        $porcDiscount=0;

  ?>
 
 <?php
         $attributes = array('id' => 'addform');
         echo form_open_multipart('purchases/edit/'.$id, $attributes);
         ?>
  <div class="row">  
         <a class="btn btn-default float-right" href="#" onclick="history.back(-1)" style="margin-bottom:10px;">
         <i class="fa fa-arrow-left"></i> <?=label("Back");?></a>
     </div>
     <div class="form-group controls col-sm-4 ">
               <label for="date"><?=label("Date");?> *</label>
               <input type="hidden" name="idPurchase" id="idPurchase" value="<?=$id?>">
               <input type="hidden" name="store_idHdn" id="store_idHdn" value="<?=$store_id?>">
               <input type="text" maxlength="30" Required name="date" class="form-control" id="date" value="<?=$date?>">
             </div>
             <div class="form-group col-sm-4">
               <label for="purchase_order"><?=label("PurchaseOrder");?> *</label>
               <input type="text" name="purchase_order" maxlength="25" readonly class="form-control" id="purchase_order" value="<?=$purchase_order?>">
             </div>

             <div id="supplier" class="form-group col-sm-3">
               <label for="supplier_id"><?=label("Supplier");?></label>
               <select class="form-control" name="supplier_id" id="supplier_id" Required>
                 <option value=""><?=label("Supplier");?></option>
                 <?php foreach ($suppliers as $row):?>
                        <option value="<?=$row->id;?>" <?=$supplier_id===$row->id ? 'selected' : '';?> ><?=$row->name;?></option>
                 <?php endforeach;?>
              </select>
             </div>
             <div class="col-sm-1"><a class="btn btn-primary" data-toggle="modal" data-target="#modalAddSupplier" style="margin-top: 25px;">
                <i class="fa fa-plus fa-fw"></i></a>
              </div>          

             <div class="form-group col-sm-4">
               <label for="store_id"><?=label("Store");?></label>
                  <?php if(isset($storeId)):?>
                     <input type="text" value="<?=$storeName;?>" class="form-control" id="store_id" disabled>
                     <input type="hidden" value="<?=$storeId;?>" name="store_id">
                     <?php else:?>
                     <select class="form-control" name="store_id" id="store_id" Required>
                       <option value=""><?=label("Store");?></option>
                       <?php foreach ($stores as $row):?>
                          <option value="<?=$row->id;?>" <?=$store_id===$row->id ? 'selected' : '';?> >
                                <?=$row->name;?>
                          </option>
                       <?php endforeach;?>
                       </select>
                   <?php endif;?>

             </div>

            <div class="form-group controls col-sm-4 ">
                <label for="typedoc"><?=label("TypeDocument");?></label>
                <select class="form-control" id="typedoc" name="typedoc" Required>
                    <option value="1"<?php if($typedoc==1){?> selected <?php }?>>Factura</option>
                    <option value="2"<?php if($typedoc==2){?> selected <?php }?>>Remisión</option>
                </select>
            </div>
 
            <div class="form-group controls col-sm-4 ">
               <label for="numdoc"><?=label("NumberDocument");?></label>
               <input type="text" name="numdoc" id="numdoc" maxlength="50" class="form-control" value="<?=$numdoc?>" Required>
             </div>

             <div class="form-group col-sm-2">
               <label for="store_id"><?=label("Tax");?></label>
                    <select class="form-control" name="tax_id" id="tax_id" Required onchange="setAmount()">
                       <option value=""><?=label("Tax");?></option>
                       <?php foreach ($taxes as $row):?>
                          <option value="<?=$row->id;?>|<?=$row->value;?>" <?=$tax_id===$row->id ? 'selected' : '';?> >
                                <?=$row->name;?>
                          </option>
                       <?php endforeach;?>
                       </select>
             </div>
             <div class="form-group col-sm-2">
               <label for="paidmethod" ><?=label("paymentMethod");?></label>
               <select class="form-control" id="paidmethod" name="paidmethod" Required>
                 <option value="1" <?php if($paidmethod==1){?> selected <?php }?>><?=label("Cash");?></option>
                 <option value="2" <?php if($paidmethod==2){?> selected <?php }?>><?=label("CreditSale");?></option>
              </select>
             </div>

          <div class="form-group controls col-sm-2 ">
               <label for="paid"><?=label("Paid");?></label>
               <input type="text" name="paid" id="paid" maxlength="50" class="form-control" value="<?=$paid?>">
          </div>
          <div class="form-group controls col-sm-2 ">
               <label for="discount"><?=label("Discount");?></label>
               <input type="text" name="discount" id="discount" maxlength="50" class="form-control" value="<?=$discount?>">
          </div>
          <div class="form-group controls col-sm-2 ">
               <label for="porcDiscount"><?=label("% Descuento");?></label>
               <input type="text" name="porcDiscount" id="porcDiscount" maxlength="50" class="form-control" value="<?=$porcDiscount?>">
          </div>
          <div class="form-group controls col-sm-2 ">
               <label for="retention"><?=label("Retention");?></label>
               <input type="text" name="retention" id="retention" maxlength="50" class="form-control" value="<?=$retention?>">
          </div>

           
   
    <br />
    <br />
    <table class="table able-striped" cellspacing="0" width="100%">
       <thead>
              <tr>
                  <th><?=label("ProductName");?></th>
                  <th><?=label("Reference");?></th>
                  <th><?=label("Fecha vencimiento");?></th>
                  <th><?=label("Lote");?></th>
                  <th><?=label("Cost");?></th>
                  <th><?=label("Tax");?></th>
                  <th><?=label("Quantity");?></th>
                  <th><?=label("Subtotal");?></th>
                  <th><?=label("Action");?></th>
              </tr>
          </thead>


          <tbody>
             <?php 
              $subtotHdn=0;
              foreach ($products as $product):
              $subtotHdn+=$product->subtot;
              ?>
              <tr>
                 <td><?=substr($product->name, 0, 30);?></td>
                 <td><?=$product->reference;?></td>
                 <td><?=$product->date_ven;?></td>
                 <td><?=$product->lote;?></td>
                 <td data-order="<?=$product->cost_yt;?>"><?=number_format((float)$product->cost, $this->setting->decimals, ',', '.');?></td>
                 <td><?=$product->tax_name;?></td>
                 <td><?=$product->qt;?></td>
                 <td data-order="<?=$product->price;?>"><?=number_format((float)$product->subtot, $this->setting->decimals, ',', '.');?></td>
                 <td><div class="btn-group">
                    <a class="btn btn-default" href="javascript:void(0)" onclick="deleteItemPurchase(<?=$id;?>,<?=$product->id;?>,<?=$product->subtot;?>)" data-toggle="tooltip" data-placement="top" title="<?=label('Delete');?>"><i class="fa fa-times"></i></a>
                    <a class="btn btn-default" href="<?php echo site_url('purchases/edititem')?>/<?=$product->id;?>/<?=$store_id;?>" data-toggle="tooltip" data-placement="top" title="<?=label('Edit');?>"><i class="fa fa-pencil"></i></a>
                  </div>
                  </td>
              </tr>
           <?php endforeach;?>
          </tbody>    </table>
          <?php
         $totalIvaDiscount=0;
          foreach ($diftax as $row) {
                  $taxamount=$row->value*$row->base/100;
                  $total=$row->base+$taxamount;
                  $ivaDiscount=$total-$total*$porcDiscount/100;
                  $ivaDiscount=$ivaDiscount*$row->value/100;
                  $totalIvaDiscount+=$ivaDiscount;
          }
          $base=$subtotHdn-$discount;
          $total=$base+$totalIvaDiscount-$retention;
          //$total_tax=$total-$base;
          $difference=$paid-$total;
        

          ?>
          <div class="form-group controls col-sm-3 ">
               <label for="subtot"><?=label("SubTotal");?></label>
               <input type="hidden" name="subtotHdn" id="subtotHdn" value="<?=number_format($subtotHdn, $this->setting->decimals, ',', '.');?>">
               <input type="text" name="subtot" id="subtot" maxlength="50" class="form-control" value="<?=number_format($subtotHdn, $this->setting->decimals, ',', '.');?>" readonly>
          </div>
          <div class="form-group controls col-sm-3 ">
               <label for="total_tax"><?=label("Tax");?></label>
               <input type="text" name="total_tax" id="total_tax" maxlength="50" class="form-control" value="<?=number_format($totalIvaDiscount, $this->setting->decimals, ',', '.');?>" readonly>
          </div>
          <div class="form-group controls col-sm-3 ">
               <label for="total"><?=label("Total");?></label>
               <input type="hidden" name="totalHdn" id="totalHdn" value="<?=number_format($total, $this->setting->decimals, ',', '.');?>"><input type="text" name="total" id="total" maxlength="50" class="form-control" value="<?=number_format($total, $this->setting->decimals, ',', '.');?>" readonly>
          </div>
          <div class="form-group controls col-sm-3 ">
               <label for="difference"><?=label("Difference");?></label>
               
               <input type="text" name="difference" id="difference" maxlength="50" class="form-control" value="<?=number_format($difference, $this->setting->decimals, ',', '.');?>" readonly>
          </div>
            

    <!-- Button trigger modal -->
   <button type="button" class="btn btn-primary btn-lg col-sm-3" onclick="openSearchItem();">
     <?=label("AddProduct");?>
   </button>
   <button type="submit" class="btn btn-success btn-lg col-sm-3">
     <?=label("SavePurchase");?>
   </button>
   <button type="button" class="btn btn-warning btn-lg col-sm-3" onclick="gotoPurchase()">
     <?=label("GoBackToPurchases");?>
   </button>
   <button type="button" class="btn btn-danger btn-lg col-sm-3" onclick="deletePurchase();">
     <?=label("CancelPurchase");?>
   </button>
   

     <?php echo form_close(); ?>
     </div>
  </div>

<!-- Modal DEMO -->
<div class="modal fade" id="SearchProductModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" id="dialogSearchProduct" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
          <h4 class="modal-title"><?=label("Buscar Producto");?></h4>
      </div>
      <div class="modal-body" style="overflow: scroll; height: 340px">
         <div id="demos">

            <form class="form-horizontal">
              <fieldset>
              <!-- Form Name -->
              <legend><?=label("SearchOption");?></legend>

              <!-- Text input-->
              <div class="form-group">
                <label class="col-md-2 control-label" for="textinput"><?=label("ProductName");?></label>  
                <div class="col-md-4">
                <input id="searchProduct" name="searchProduct" type="search" placeholder="<?=label("ProductName");?>" class="form-control input-md">
                <!-- <span class="help-block">help</span>   -->
                </div>
              </div>

              </fieldset>
              </form>
       
              <div id="resultProduct">

              </div>
             


         </div>
      </div>
    
    </div>
 </div>
</div>

  <!-- Modal -->
  <div class="modal fade" id="editItemPurchase" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="edit"><?=label("EditProduct");?></h4>
        </div>
        <div class="modal-body" id="modal-body">
           <div id="itemPurchaseSection">
             <!-- payements goes here -->
           </div>
        </div>
        <div class="modal-footer">
      
        </div>
      </div>
   </div>
  </div>
  <!-- Modal -->

<!-- Modal -->
<div class="modal fade" id="modalAddSupplier" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?=label("AddSupplier");?></h4>
      </div>
     <?php echo form_open_multipart('suppliers/add'); ?>
      <div class="modal-body">

        <!-- 
         ___  __   __                        __     __
        |__  /  \ |__)  |\/| |  | |     /\  |__) | /  \
        |    \__/ |  \  |  | \__/ |___ /~~\ |  \ | \__/ 
        -->


        <div class="row"  id="form_addcustomer">   
            <div class="col-md-12">

                 <div class="form-group">
                      <label class="col-md-3 control-label" for="numdoc"><?=label("Document");?> </label>
                        <div class="col-md-3 form-group">  
                           <select class="form-control" id="typedoc" name="typedoc">
                             <option value="">Seleccione</option>
                             <option value="1">Cédula</option>
                             <option value="2">Pasaporte</option>
                             <option value="3" selected>NIT</option>
                          </select>
                        </div>
                      <div class="col-md-6 form-group">  
                        <input type="text" name="numdocSupplier" id="numdocSupplier" maxlength="50" Required class="form-control" placeholder="<?=label("Number");?>">
                      </div>    
                    </div>     
      
                <!-- FILA 5 -->
                 
                 <div class="form-group">
                      <label class="col-sm-3 control-label" for="namesupplier"><?=label("Nombre");?></label>
                      <div class="col-sm-9 form-group">  
                        <input type="text" name="namesupplier" id="namesupplier" maxlength="50" class="form-control" placeholder="<?=label("SupplierName");?>" Required>
                      </div> 
                      <label class="col-md-3 control-label" for="regime"><?=label("Regime");?></label>
                      <div class="col-md-9 form-group">  
                         <select class="form-control" id="regime" name="regime">
                           <option value="">Seleccione</option>
                           <option value="1" selected>Común</option>
                           <option value="2">Simplificado</option>
                        </select>
                      </div>               
                </div>      
             </div>

        </div> 
        <!-- FIN-form_addcustomer --> 
      </div>
      <!-- FIN-modal-body -->
      <!-- *************************************************** -->
    
      <div class="modal-footer">     
          <button type="button" class="btn btn-default" data-dismiss="modal"><?=label("Close");?></button>
          <button type="button" class="btn btn-add" onclick="addSupplier()"><?=label("Submit");?></button>   
      </div>
      <!-- FIN BARRA BOTONES -->
      <?php echo form_close(); ?>
    </div>
  </div>
</div>

<script src="<?=base_url()?>assets/js/bootstrap-combobox.js"></script>

<script type="text/javascript">

$(document).ready(function() {
 
  $('#supplier_id').combobox();

  $('#date').datepicker({
          todayHighlight: true,
          format:'yyyy-mm-dd'
   });
});

</script>

