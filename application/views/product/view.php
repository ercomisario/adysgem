<!-- Page Content -->
<div class="container">
   <div class="row" style="margin-top:80px;">
      <form action="products" method="post" class="form-inline float-right hidden-xs hidden-sm" style="margin-bottom:-50px;">

        <label for="Supplier"><?=label("Supplier");?></label>
         <select class="form-control" id="Supplier" name="filtersupp">
            <option value=''><?=label("All");?></option>
            <?php foreach ($suppliers as $supplier):?>
               <option value="<?=$supplier->name;?>" <?=$supplierF === $supplier->name ? 'selected' : ''; ?>><?=$supplier->name;?></option>
            <?php endforeach;?>
         </select>
         <button type="submit" class="btn btn-primary"><?=label("ApplyFilter");?></button>
         <button type="button" class="btn btn-success" onclick="Addproduct();"><?=label("AddProduct");?></button>
         <button type="button" class="btn btn-info" onclick="javascript:location.href='products/csv/1';"><?=label("DownloadCSV");?></button>
         <button type="button" class="btn btn-warning" onclick="ImportProducts();"><?=label("UploadCSVfile");?></button>
   
     </form>
      <table id="Table" class="table table-striped table-bordered" cellspacing="0" width="100%">
          <thead>
              <tr>
                  <th class="hidden-xs"><?=label("ProductCode");?></th>
                  <th><?=label("ProductName");?></th>
                 <!-- <th><?=label("Quantity");?></th>-->
                  <th class="hidden-xs"><?=label("ProductDescription");?></th>
                  <th class="hidden-xs"><?=label("Cost");?></th>
                  <th class="hidden-xs"><?=label("Tax");?></th>
                  <th><?=label("Price");?></th>
                  <th><?=label("Status");?></th>
                  <th style="width: 130px;"><?=label("Action");?></th>
              </tr>
          </thead>


          <tbody>
             <?php foreach ($products as $product):
              $status="Activo";
              if($product->in_activo==2)
                $status="Inactivo";
              ?>
              <tr>
                 <td class="hidden-xs productcode"><?=$product->reference;?></td>
                 <td><?=$product->name;?></td>
                 <!--<td><?=$product->quantity;?></td>-->
                 <td class="hidden-xs"><?=character_limiter($product->description, 40);?></td>
                 <td data-order="<?=$product->cost_yt;?>"><?=number_format((float)$product->base, $this->setting->decimals, ',', '.');?></td>
                 <td data-order="<?=$product->tax_name;?>"><?=$product->tax_name;?></td>
                 <td data-order="<?=$product->price;?>"><?=number_format((float)$product->price, $this->setting->decimals, ',', '.');?></td>
                 <td data-order="<?=$product->in_activo;?>"><?=$status;?></td>
                 <td><div class="btn-group">
                          <a class="btn btn-primary dropdown-toggle" href="javascript:void(0)" data-toggle="dropdown" >
                          <i class="fa fa-cog fa-fw"></i> <?=label("Action")?></a>
                          <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#">
                             <span class="fa fa-caret-down" title="Toggle dropdown menu"></span></a>
                          <ul class="dropdown-menu">
                             <li><a href="products/edit/<?=$product->id;?>">
                                 <i class="fa fa-pencil fa-fw" aria-hidden="true"></i> <?=label("Edit")?></a></li>
                             <li><a href="javascript:void(0)" onclick="javascript:Viewproduct(<?=$product->id;?>);">
                               <i class="fa fa-sticky-note" aria-hidden="true"></i> <?=label("Viewproduct")?></a></li>
                             <li><a href="javascript:void(0)" onclick="javascript:modifystock(<?=$product->id;?>);">
                               <i class="fa fa-tasks" aria-hidden="true"></i> <?=label("ModifyStock")?></a></li>
                             <li>
                                 <a href="javascript:void(0)" onclick="deleteProduct(<?=$product->id;?>)">
                                 <i class="fa fa-trash-o fa-fw" aria-hidden="true"></i><?=label("Delete")?></a></li>
                              <?php if($product->photo){ ?>
                              <li>
                                 <a class="btn <?=$product->color;?> white open-modalimage" data-id="<?=$product->photo;?>" href="" data-toggle="modal" data-target="#ImageModal">
                                 <i class="fa fa-sticky-note" aria-hidden="true"></i> <?=label("ViewImage")?></a></li>
                              <?php } ?>
                              <li>
                                 <a href="javascript:void(0)" onclick="openMakeBarcode('<?=$product->id;?>','<?=$product->reference;?>','<?=$product->name;?>','<?=$product->price;?>','<?=$product->description;?>')">
                                 <i class="fa fa-barcode" aria-hidden="true"></i> <?=label("BarCode")?></a></li>
                          </ul>
                      </div>

                  </td>
              </tr>
           <?php endforeach;?>
          </tbody>
      </table>
   </div>
   <!-- Button trigger modal -->
  
   
</div>
<script type="text/javascript">

$(document).ready(function() {

$('#modalAddCategories').on('shown.bs.modal', function() {
    $('#name_category').trigger('focus');
});

<?php 
if($band>-1){ ?>

  var error;
  <?php if($band==1){ ?>
    error='Categoria <?=$textcampo;?> de la linea <?=$line;?> no registrada.';
  <?php } ?>
  <?php if($band==2){ ?>
    error='Marca <?=$textcampo;?> de la linea <?=$line;?> no registrada.';
  <?php } ?>
  <?php if($band==3){ ?>
    error='Segmento <?=$textcampo;?> de la linea <?=$line;?> no registrada.';
  <?php } ?>
  <?php if($band==4){ ?>
    error='Proveedor <?=$textcampo;?> de la linea <?=$line;?> no registrado.';
  <?php } ?>
  <?php if($band==5){ ?>
    error='Impuesto <?=$textcampo;?> de la linea <?=$line;?> no registrado.';
  <?php } ?>
  <?php if($band==6){ ?>
    error='Nombre de producto <?=$textcampo;?> de la linea <?=$line;?> ya registrado.';
  <?php } ?>
  <?php if($band==7){ ?>
    error='Código de barras o referencia <?=$textcampo;?> de la linea <?=$line;?> ya registrado.';
  <?php } ?>
  error+=' Verifique archivo o consulte al administrador del sistema';
  
          swal({   
              title: '<?=label("Aviso");?>',
              text: error,
              type: "error",
              showCancelButton: false,
              confirmButtonColor: "#DD6B55",
              confirmButtonText: '<?=label("Aceptar");?>',
              closeOnConfirm: true },
              function(){
                   location.href="<?=base_url()?>products";
                }           
             );
          


<?php }else if($band==-1){ ?>
          swal({   
              title: '<?=label("Aviso");?>',
              text: 'Importación de productos realizado con éxito',
              type: "info",
              showCancelButton: false,
              confirmButtonColor: "#DD6B55",
              confirmButtonText: '<?=label("Aceptar");?>',
              closeOnConfirm: true },
              function(){
                   location.href="<?=base_url()?>products";
                }           
             );

<?php } ?>
});

  </script>

<!-- /.container -->
<?php echo $this->load->view('modals/_imageViewer'); ?>

<script src="<?=base_url()?>assets/js/jquery-ui.min.js"></script>
<script type="text/javascript">
var items = [];
$(function() {
   $("#utility").keyup(function(){
      var filter = $(this).val();
      var cost_yt  = $("#cost_yt").val();
      //var price  = $("#price").val();

      if(filter>=0)
      {
        var gain   =  cost_yt*filter/100;
        $("#gain").val(gain);
        var price   =  parseFloat(gain)+parseFloat(cost_yt);
        $("#price").val(price);
      }
   });
  
  $("#gain").keyup(function(){
      var filter = $(this).val();
      var cost_yt  = $("#cost_yt").val();
      //var price  = $("#price").val();

      if(filter>=0 && cost_yt>0)
      {
        var price   =  parseFloat(filter)+parseFloat(cost_yt);
        $("#price").val(price);

        var utility   =  filter*100/cost_yt;
        $("#utility").val(utility);
        
      }
   });

   $("#utility_major").keyup(function(){
      var filter = $(this).val();
      var price  = $("#price_major").val();
      if(filter>=0)
      {
        var gain   =  price*filter/100;
        $("#gain_major").val(gain);
      }
   });
  
  $("#gain_major").keyup(function(){
      var filter = $(this).val();
      var price  = $("#price_major").val();
      if(filter>=0)
      {
        var utility   =  filter*100/price;
        $("#utility_major").val(utility);
      }
   });

   $("#utility_credit").keyup(function(){
      var filter = $(this).val();
      var price  = $("#price_credit").val();
      if(filter>=0)
      {
        var gain   =  price*filter/100;
        $("#gain_credit").val(gain);
      }
   });

  $("#gain_credit").keyup(function(){
      var filter = $(this).val();
      var price  = $("#price_credit").val();
      if(filter>=0)
      {
        var utility   =  filter*100/price;
        $("#utility_credit").val(utility);
      }
   });

      $("#utility_1").keyup(function(){
      var filter = $(this).val();
      var price  = $("#price_1").val();
      if(filter>=0)
      {
        var gain   =  price*filter/100;
        $("#margin_1").html(gain);
      }
   });

   $("#utility_2").keyup(function(){
      var filter = $(this).val();
      var price  = $("#price_2").val();
      if(filter>=0)
      {
        var gain   =  price*filter/100;
        $("#margin_2").html(gain);
      }
   });

   $("#utility_3").keyup(function(){
      var filter = $(this).val();
      var price  = $("#price_3").val();
      if(filter>=0)
      {
        var gain   =  price*filter/100;
        $("#margin_3").html(gain);
      }
   });
 
 $("#cost_nt").keyup(function(){
      var filter = $(this).val();
      var value  = $("#tax_sale_id").val().split('|')[1];
      var utility=$("#utility").val();
      if(utility.length===0)
        utility=0;
      
      if(filter>=0 && value>0)
      {
        var price   =  (filter*value/100)+parseFloat(filter);
        $("#price").val(price);        
        $("#cost_yt").val(price);        
        $("#base").val(filter);        
      }
      if(filter=='')
      {
        var price=0;
        $("#price").val(price);
        $("#cost_yt").val(price);
        $("#base").val(filter);        
      }

      var gain   =  price*utility/100;
      $("#utility").val(utility);
      $("#gain").val(gain);

     });

 $("#price").keyup(function(){
      var filter = $(this).val();
      var cost_yt  = $("#cost_yt").val();
      var value  = $("#tax_sale_id").val().split('|')[1];

      if(filter>=0)
      {
        var base   =  filter/(1+value/100);

        if(cost_yt>0)
        {
          var gain   =  filter-cost_yt;
          var utility   =  gain*100/cost_yt;
        }
        else
        {
          var gain   =  filter-base;
          var utility   =  gain*100/base;
        }

        $("#utility").val(utility);
        $("#gain").val(gain);
        $("#base").val(base);

      }
   });
   $("#base").keyup(function(){
      var filter = $(this).val();
      var price  = $("#price").val();
      var value  = $("#tax_sale_id").val().split('|')[1];

      if(filter>=0)
      {
        var price   =  parseFloat(filter)+filter*value/100;
        var gain   =  price-filter;
        var utility   =  gain*100/filter;
        

        $("#utility").val(utility);
        $("#gain").val(gain);
        $("#price").val(price);

      }
     });
   $('#tax_sale_id').on('change', function() {

       var value  = this.value.split('|')[1];
       var price  = $("#price").val();
       if(price>0){
          var base   =  price/(1+value/100);
          $("#base").val(base);
       }


   });
 
  



   $('#Type').on('change', function() {
     if( this.value == 1 ) //if service
     {
        $("#pushaceP").slideUp();
        $("#alertqty").slideUp();
        $("#supply").slideUp();
        $("#UnitP").slideUp();
     } else if ( this.value == 2 ) {
        $("#pushaceP").slideUp();
        $("#alertqty").slideUp();
        $("#supply").slideUp();
        $("#UnitP").slideUp();
     } else {
        $("#pushaceP").slideDown();
        $("#alertqty").slideDown();
        $("#supply").slideDown();
        $("#UnitP").slideDown();
     }
   });
});


$(document).on("click", ".open-modalimage", function () {
  var myId = $(this).data('id');
  $(".modal-body #image").attr("src","<?php echo site_url()?>/files/products/"+myId);
});


var quant = [];
var quantw = [];
var pricestore = [];
var productID;
$(document).ready(function() {

   $('#addform').ajaxForm({ //FormID - id of the form.

         success: function (data) {
          //console.log($('#type').val());
            if(data == "CÓDIGO" || data == 'NOMBRE')
            {               
//              console.log(data);
              swal('Ooops!', data+' DE PRODUCTO YA REGISTRADO', 'error');

            }else if($('#type').val() == 0) {
               $('#stockcontent').html(data);
               $('#stock').modal('show');
               $('#Addproduct').modal('hide');

               $( "[id='quantity']" ).on('change', function() {
                  var storeID = $(this).attr("store-id");
                  quant.push({
                     'store_id': storeID,
                     'quantity': $(this).val()
                  });
               });

               $( "[id='quantityw']" ).on('change', function() {
                  var warehouseID = $(this).attr("warehouse-id");
                  quantw.push({
                     'warehouse_id': warehouseID,
                     'quantity': $(this).val()
                  });
               });

               $( "[id='pricestr']" ).on('change', function() {
                  var storeID = $(this).attr("store-id");
                  pricestore.push({
                     'store_id': storeID,
                     'price': $(this).val()
                  });
               });

               productID = $('#id_product').val();
            } else {
              alert(data);

               //productID = $('#prodctID').val();
               $('#combocontent').html(data);
               $('#combo').modal('show');
               $('#Addproduct').modal('hide');

               $("#add_item").autocomplete({
                  source: '<?= site_url('productcontroller/suggest'); ?>',
                  minLength: 1,
                  autoFocus: false,
                  delay: 200,
                  select: function( event, ui ) {

                           event.preventDefault();
                           if (ui.item.id !== 0) {
                              var row = add_product_item(ui.item);
                              if (row) {
                                 $(this).val('');
                              }
                           } else {
                              alert('<?= label('NoProduct') ?>');
                              return false;
                           }
                        },
                  response: function (event, ui) {
                       if ($(this).val().length >= 16 && ui.content[0].id == 0) {
                           alert('<?= label('NoProduct') ?>');
                           $('#add_item').focus();
                           $(this).val('');
                       }
                       else if (ui.content.length == 1 && ui.content[0].id != 0) {
                           ui.item = ui.content[0];
                           $(this).data('ui-autocomplete')._trigger('select', 'autocompleteselect', ui);
                           $(this).autocomplete('close');
                           $(this).removeClass('ui-autocomplete-loading');
                       }
                       else if (ui.content.length == 1 && ui.content[0].id == 0) {
                           alert('<?= label('NoProduct') ?>');
                           $('#add_item').focus();
                           $(this).val('');

                       }
                  }
               });

            }
      }
   });
});

function ImportProducts()
{
<?php if($store){?>
  $("#ImportProducts").modal('show'); 
<?php }else{?>
  $("#modalSelectStore").modal('show'); 

<?php }?>
}

function Addproduct()
{
<?php if($store){?>
  $("#Addproduct").modal('show'); 
<?php }else{?>
  $("#modalSelectStore").modal('show'); 
<?php }?>
}

function deleteProduct(id)
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
             url : "<?php echo site_url('products/delete')?>/"+id,
             type: "POST",         
             success: function(data)
             {   

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

function add_product_item(item, noitem) {
   if (item == null && noitem == null) {
      return false;
   }
   if(noitem != 1) {
      var item_id = 0;
      $.each(items, function(i){
         if(items[i].item_id == item.id) {
            items[i].quantity = (parseFloat(items[i].quantity) + 1);
            item_id = item.id;
            return false;
         }
      });
      if(item_id == 0) {
         item.qty = 1;
         items.push({
            'item_id': item.id,
            'quantity': item.qty,
            'code': item.code,
            'name': item.name
         });
      }
   }


   $("#Comboprd tbody").empty();
   items.forEach(function(item) {
      var Tr = $('<tr id="rowid_' + item.item_id + '" class="item_' + item.item_id + '"></tr>');
      td = '<td>' + item.name + ' (' + item.code + ')</td>';
      td += '<td><input class="form-control text-center" name="quantity" type="text" value="' + item.quantity + '" item-id="' + item.item_id + '" id="quantit"></td>';
      td += '<td class="text-center"><i class="fa fa-times tip delt" id="' + item.item_id + '" title="Remove" style="cursor:pointer;"></i></td>';
      Tr.html(td);
      Tr.prependTo("#Comboprd");
   });
   //console.log(items);
   $( "[id='quantit']" ).on('change', function() {
      var itemID = $(this).attr("item-id");
      var val = $(this).val();
      items.forEach(function(e) {
         if(e.item_id == itemID) {
            e.quantity = val;
         }
      });
      console.log(items);
   });
   return true;

}

function addStoreSession(){
   var store_id = $('#store_id').val();
   if(store_id.length>0)
   {
     $.ajax({
            url : "<?php echo site_url('productcontroller/addStoreSession')?>/",
            type: "POST",
            data: {store_id: store_id},
            success: function(data)
            {
               location.reload();
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
               alert("error");
            }
       });
    }
    else
    {
        swal('Ooops!', ' Debe seleccionar Tienda', 'error');

    }
}

function addcombo(){
   var productID = $('#prodctID').val();
   $.ajax({
          url : "<?php echo site_url('productcontroller/addcombo')?>/",
          type: "POST",
          data: {items: items, productID: productID},
          success: function(data)
          {
             location.reload();
          },
          error: function (jqXHR, textStatus, errorThrown)
          {
             alert("error");
          }
     });
}

function updatestock(){
      $.ajax({
          url : "<?php echo site_url('products/updatestock')?>/",
          data: {quant: quant, quantw: quantw, productID: productID, pricest: pricestore},
          type: "POST",
          success: function(data)
          {
            location.reload();
          },
          error: function (jqXHR, textStatus, errorThrown)
          {
             alert("error");
          }
     });
    };
function modifystock(id){
   $.ajax({
       url : "<?php echo site_url('productcontroller/modifystock')?>/"+id,
       type: "POST",
       success: function(data)
       {
          $('#stockcontent').html(data);
          $('#stock').modal('show');

          $( "[id='quantity']" ).on('change', function() {
            var storeID = $(this).attr("store-id");
            quant.push({
               'store_id': storeID,
               'quantity': $(this).val()
           });
           });

           $( "[id='quantityw']" ).on('change', function() {
            var warehouseID = $(this).attr("warehouse-id");
            quantw.push({
               'warehouse_id': warehouseID,
               'quantity': $(this).val()
           });
           });

           $( "[id='pricestr']" ).on('change', function() {
            var storeID = $(this).attr("store-id");
            pricestore.push({
               'store_id': storeID,
               'price': $(this).val()
           });
           });

           productID = $('#prodctID').val();
       },
       error: function (jqXHR, textStatus, errorThrown)
       {
          alert("error");
       }
  });
}


function Viewproduct(id){

   $.ajax({
       url : "<?php echo site_url('productcontroller/Viewproduct')?>/"+id,
       type: "POST",
       success: function(data)
       {
          $('#viewSectionProduct').html(data);
          $('#ViewproductModal').modal('show');
       },
       error: function (jqXHR, textStatus, errorThrown)
       {
          alert("error");
       }
  });
}

$(document).on('click', '.delt', function () {
    var id = $(this).attr('id');
    $.each(items, function(i){
       if(items[i].item_id == id) {
           items.splice(i,1);
           return false;
       }
   });
    $(this).closest('#rowid_' + id).remove();
    console.log(items);
});

function modifycombo(id){
   $.ajax({
       url : "<?php echo site_url('productcontroller/modifycombo')?>/"+id,
       type: "POST",
       success: function(data)
       {
          $('#combocontent').html(data);
          $('#Viewproduct').modal('hide');
          $('#combo').modal('show');
          $.ajax({
              url : "<?php echo site_url('productcontroller/getcombos')?>/"+id,
              type: "POST",
              success: function(data){
                 dataitems = JSON.parse(data);
                 dataitems.forEach(function(e) {
                    items.push({
                       'item_id': e.item_id,
                       'quantity': e.quantity,
                       'code': e.code,
                       'name': e.name
                    });
                  });
            },
              error: function (jqXHR, textStatus, errorThrown){alert("error");}
         });
          console.log(items);
          $("#add_item").autocomplete({
             source: '<?= site_url('productcontroller/suggest'); ?>',
             minLength: 1,
             autoFocus: false,
             delay: 200,
             select: function( event, ui ) {

                      event.preventDefault();
                      if (ui.item.id !== 0) {
                         var row = add_product_item(ui.item);
                         if (row) {
                            $(this).val('');
                         }
                      } else {
                         alert('<?= label('NoProduct') ?>');
                         return false;
                      }
                   },
             response: function (event, ui) {
                  if ($(this).val().length >= 16 && ui.content[0].id == 0) {
                      alert('<?= label('NoProduct') ?>');
                      $('#add_item').focus();
                      $(this).val('');
                  }
                  else if (ui.content.length == 1 && ui.content[0].id != 0) {
                      ui.item = ui.content[0];
                      $(this).data('ui-autocomplete')._trigger('select', 'autocompleteselect', ui);
                      $(this).autocomplete('close');
                      $(this).removeClass('ui-autocomplete-loading');
                  }
                  else if (ui.content.length == 1 && ui.content[0].id == 0) {
                      alert('<?= label('NoProduct') ?>');
                      $('#add_item').focus();
                      $(this).val('');

                  }
             }
          });
       },
       error: function (jqXHR, textStatus, errorThrown)
       {
          alert("error");
       }
  });
}


function openMakeBarcode(ProductCode, Reference, Name, Price, Description){
   $('#hdnReference').val(Reference);
   $('#hdnProductCode').val(ProductCode);
   $('#hdnProductName').val(Name);
   $('#hdnProductDescription').val(Description);
   $('#hdnProductPrice').val(Price);
   $('#makeBarcode').modal('show');

}

function barcode(){
   var row = $('#Brrows').val();
   var num = $('#Brnum').val();
   var reference = $('#hdnReference').val();
   var productBcode = $('#hdnProductCode').val();
   var productDescription = $('#hdnProductDescription').val();
   var productName = $('#hdnProductName').val();
   var productPrice = $('#hdnProductPrice').val();
   if(reference.length==0)
      reference=0;
   //console.log(row+"/"+num+"/"+productBcode);
   
   $.ajax({
       url : "<?php echo site_url('productcontroller/barcode')?>/"+row+"/"+num+"/"+productBcode+"/"+productName+"/"+productPrice+"/"+productDescription+"/"+reference,
       type: "POST",
       success: function(data)
       {
          $('#printSection').html(data);
          $('#barcodeP').modal('show');
       },
       error: function (jqXHR, textStatus, errorThrown)
       {
          alert("error");
       }
  });
}

function Printbarcode() {
   $('.modal-body').removeAttr('id');
   window.print();
   $('.modal-body').attr('id', 'modal-body');
}

function makePrdInvis(id, prd) {
   $.ajax({
       url : "<?php echo site_url('productcontroller/makePrdInvis')?>/"+id+"/"+prd,
       type: "POST",
       success: function(data){},
       error: function (jqXHR, textStatus, errorThrown)
       {
          alert("error");
       }
  });
}

function selectAddCategory(category) {

   var titulo;
   $("#hdnCategory").val(category);
   if(category=='area')
      titulo="Crear Segmento";
   if(category=='category')
      titulo="Crear Categoria";
   if(category=='brand')
      titulo="Crear Marca";

   $("#tituloAddCategory").html(titulo);
   $("#modalAddCategories").modal('show');

}

function addCategory() {
  
  var category=$("#hdnCategory").val();
  var name=$("#name_category").val();
  $("#modalAddCategories").modal('hide');

  $.ajax({
       url : "<?php echo site_url('products/addCategory')?>",
       type: "POST",
       data:{category: category, name: name},
       success: function(data){
          $('#'+category).html(data);
          $("#name_category").val('');

       },
       error: function (jqXHR, textStatus, errorThrown)
       {
          alert("error");
       }
  });
}
/*
function addCategory() {
  
  var category=$("#hdnCategory").val();
  var name=$("#name_category").val();
  $("#modalAddCategories").modal('hide');

  $.ajax({
       url : "<?php echo site_url('products/addCategory')?>",
       type: "POST",
       data:{category: category, name: name},
       success: function(data){
          $('#'+category).html(data);
          $("#name_category").val('');

       },
       error: function (jqXHR, textStatus, errorThrown)
       {
          alert("error");
       }
  });
}*/
function addSupplier() {
  
  var name=$("#namesupplier").val();
  var typedoc=$("#typedoc").val();
  var type=$("#typesupplier").val();
  var numdoc=$("#numdoc").val();
  var regime=$("#regime").val();
  $("#modalAddSupplier").modal('hide');

  $.ajax({
       url : "<?php echo site_url('products/addSupplier')?>",
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

<script type="text/javascript">
function viewTabPrice(valor)
{
 
    if(valor==1)
    {
          opt = $("#desc_prog").val();
          
          if(opt==1)   
          {
              $("#progContent").show();
          }
          
          if(opt==2)
          {
            $("#progContent").hide();
          }
    }
    if(valor==2)
    {
          opt = $("#sale_by_quantity").val();
          
          if(opt==1)   
          {
              $("#tabPrice").show();
              $("#tabPriceContent").show();
          }
          
          if(opt==2)
          {
            $("#tabPrice").hide();
            $("#tabPriceContent").hide();
          }
    }

}

</script>  
<style>
    .form-control {

        padding: 4px 5px;    
        height: 28px;
    }
    .well {
        padding: 5px;
        margin-bottom: 10px;
    }
    .form-group {
        margin-bottom: 8px;
    }
    body {
        padding-top: 20px;
    }
    #viewModal
    {
      width: 80%;
}
</style>
<!-- Modal -->
<div class="modal fade" id="Addproduct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div id="modal_addproduct" class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="padding: 8px;">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?=label("AddProduct");?></h4>
      </div>
       <?php
      $attributes = array('id' => 'addform');
      echo form_open_multipart('productcontroller/add', $attributes);
      ?>
      <div class="modal-body" style="padding: 5px;">
        <fieldset>

        <!-- 
         ___  __   __                        __     __
        |__  /  \ |__)  |\/| |  | |     /\  |__) | /  \
        |    \__/ |  \  |  | \__/ |___ /~~\ |  \ | \__/ 
        -->


       <div class="col-md-12">
            <div class="col-md-9" style="border: solid #CCCCCC 0px; padding-top: 8px;" >

                <!-- FILA 1 -->
                <div class="row">
                  <div class="form-group">
                    <input type="hidden" name="type" id="type" value="0">
                     <label class="col-sm-2 control-label" for="reference"><?=label("Reference");?></label>
                     <div class="col-sm-4 form-group">  
                        <input type="text" name="reference" id="reference" maxlength="50" class="form-control" Required>
                      </div> 
                     <label class="col-sm-1 control-label" for="user_file"><?=label("Imageinput");?></label>
                     <div class="col-sm-5 form-group">  
                        <input type="file" name="user_file" id="user_file">
                     </div>
                  </div>
                </div>
                   <!-- FILA 3 -->
                <div class="row">  
                  <div class="form-group">
                       <label class="col-sm-2 control-label" for="name"><?=label("ProductName");?></label>
                        <div class="col-sm-10 form-group">  
                          <input type="text" name="name" id="name" maxlength="50" class="form-control" Required>
                        </div>     
                  </div>        
                </div>   
                    <!-- FILA 2 -->
                <div class="row">   
                  <div class="form-group">
                  
                    <label class="col-sm-2 control-label" for="description"><?=label("Description");?></label>
                    <div class="col-sm-10 form-group">  
                        <input type="text" name="description" id="description" maxlength="50" class="form-control" Required>
                    </div>                       
                  </div>                         
                </div>                       
          
                 <!-- FILA 4 -->
                <div class="row"> 
                  <div class="form-group">
                     <label class="col-sm-2 control-label" for="supplier_id"><?=label("Supplier");?></label>
                      <div id="supplier" class="col-sm-9 form-group">  
                         <select class="form-control" name="supplier_id" id="supplier_id">
                          <option value="" ><?=label("Supplier");?></option>
                          <?php foreach ($suppliers as $row):?>
                                <option value="<?=$row->id;?>" >
                                  <?=$row->name;?>
                                </option>
                          <?php endforeach;?>
                        </select>
                      </div> 
                      <div class="col-sm-1"><a class="btn btn-primary" data-toggle="modal" data-target="#modalAddSupplier">
                          <i class="fa fa-plus fa-fw"></i></a>
                      </div>          

                  
                    </div> 
                  </div> 
                   <!-- FILA 4 -->
                <div class="row"> 
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="brand_id"><?=label("Brand");?></label>
                      <div id="brand" class="col-sm-3 form-group">  
                        <select class="form-control" name="brand_id" id="brand_id" Required>
                          <option value="" ><?=label("Brand");?></option>
                          <?php foreach ($brands as $row):?>
                                <option value="<?=$row->id;?>"><?=$row->name;?></option>
                          <?php endforeach;?>
                        </select> 
                      </div>
                      <div class="col-sm-1"><a class="btn btn-primary" href="javascript:void(0)" onclick="selectAddCategory('brand')">
                          <i class="fa fa-plus fa-fw"></i></a>
                      </div>          

                      <label class="col-sm-2 control-label" for="category_id"><?=label("Category");?></label>
                      <div id="category" class="col-sm-3 form-group">
                        <select class="form-control" name="category_id" id="category_id" Required>
                          <option value="" ><?=label("Category");?></option>
                          <?php foreach ($categories as $row):?>
                                <option value="<?=$row->id;?>" >
                                  <?=$row->name;?>
                                </option>
                          <?php endforeach;?>
                        </select> 
                      </div>
                      <div class="col-sm-1"><a class="btn btn-primary" href="javascript:void(0)" onclick="selectAddCategory('category')">
                          <i class="fa fa-plus fa-fw"></i></a>
                      </div>                      
                    
                  </div>
                </div> 
                 <!-- FILA 4 -->
                <div class="row">
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="combo_id"><?=label("Combo");?></label>
                      <div class="col-sm-4 form-group">  
                        <select class="form-control" name="combo" id="combo" Required>
                          <option value="" ><?=label("Combo");?></option>
                          <option value="1" >Si</option>
                          <option value="2" selected >No</option>
                        </select>
                      </div> 
                      <label class="col-sm-2 control-label" for="tax_sale_id"><?=label("Tax");?></label>
                      <div class="col-sm-4 form-group">  
                         <select class="form-control" name="tax_sale_id" id="tax_sale_id">
                          <?php foreach ($taxes as $row):?>
                                <option value="<?=$row->id;?>|<?=$row->value;?>" <?php if($row->id==3){?> selected <?php }?>>
                                  <?=$row->name;?>
                                </option>
                          <?php endforeach;?>
                        </select>
                      </div> 
                  </div> 
                </div> 
                <!-- FILA 5 -->
                <div class="row">
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="area_id"><?=label("Segment");?></label>                    
                      <div id="area" class="col-sm-3 form-group">
                        <select class="form-control" name="area_id" id="area_id" Required>
                          <option value="" ><?=label("Segment");?></option>
                          <?php foreach ($areas as $row):?>
                                <option value="<?=$row->id;?>">
                                  <?=$row->name;?>
                                </option>
                          <?php endforeach;?>
                        </select> 
                      </div>
                      <div class="col-sm-1"><a class="btn btn-primary" href="javascript:void(0)" onclick="selectAddCategory('area')">
                          <i class="fa fa-plus fa-fw"></i></a>
                      </div>
                      <label class="col-sm-2 control-label" for="presentacion"><?=label("Presentation");?></label>
                      <div class="col-sm-4 form-group">  
                        <select class="form-control" name="presentation_id" id="presentation_id">   
                        <option value="" ><?=label("Presentation");?></option>                    
                          <?php foreach ($presentations as $row):?>
                                <option value="<?=$row->id;?>">
                                  <?=$row->name;?>
                                </option>
                          <?php endforeach;?>
                          </select>         
                      </div>                         
                  </div> 
                </div> 
       
               <!-- FILA 11 -->

               <div class="row">
                 <div class="form-group">
                      <label class="col-sm-2 control-label" for="st_min"><?=label("StockMin");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="st_max" id="st_max" maxlength="50" class="form-control" >
                      </div>     
                       <label class="col-sm-2 control-label" for="st_max"><?=label("StockMax");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="st_max" id="st_max" maxlength="50" class="form-control" >
                      </div>  
                      <label class="col-sm-2 control-label" for="alertqt"><?=label("AlertQt");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="alertqt" id="alertqt" maxlength="50" class="form-control">
                      </div>                       
                                                
                  </div>                 
                </div>   <!-- FILA 11 -->

               <div class="row">
                 <div class="form-group col-sm-12">
                  <hr style="margin-top:5px; margin-bottom: 5px;">         
                  </div>                 
                </div> 

            <!-- FILA 12 -->
            
               <div class="row">
                 <div class="form-group">
                      <label class="col-sm-2 control-label" for="cost_nt"><?=label("CostNoTax");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="cost_nt" id="cost_nt" maxlength="50" class="form-control">
                      </div> 
                      <label class="col-sm-2 control-label" for="cost_yt"><?=label("CostYesTax");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="cost_yt" id="cost_yt" maxlength="50" class="form-control">
                      </div> 
                      <label class="col-sm-2 control-label" for="alertqt"><?=label("Base");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="base" id="base" maxlength="50" class="form-control">
                      </div>                       
                  
                     
                                      
                  </div> 
                </div> 
                  <!-- FILA 11 -->
                <div class="row">
                  <div class="form-group">
                       <label class="col-sm-2 control-label" for="price"><?=label("Price");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="price" id="price" maxlength="50" class="form-control" >
                      </div>
                      <label class="col-sm-2 control-label" for="price_major"><?=label("PriceMajor");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="price_major" id="price_major" maxlength="50" class="form-control">
                      </div> 
                      <label class="col-sm-2 control-label" for="price_credit"><?=label("PriceCredit");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="price_credit" id="price_credit" maxlength="50" class="form-control" >
                      </div>                                  
                  </div> 
               </div> 
                <!-- FILA 11 -->
               <div class="row">               
                  <div class="form-group">
                       <label class="col-sm-2 control-label" for="utility"><?=label("Utility");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="utility" id="utility" maxlength="50" class="form-control" >
                      </div>
                      <label class="col-sm-2 control-label" for="utility_major"><?=label("UtilityMajor");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="utility_major" id="utility_major" maxlength="50" class="form-control" >
                      </div> 
                      <label class="col-sm-2 control-label" for="utility_credit"><?=label("UtilityCredit");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="utility_credit" id="utility_credit" maxlength="50" class="form-control">
                      </div>                                  
                  </div> 
                </div> 
                 <!-- FILA 6 -->
                <div class="row">
                  <div class="form-group">
                      <label class="col-sm-2 control-label" for="gain"><?=label("Gain");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="gain" id="gain" maxlength="50" class="form-control">
                      </div>
                      <label class="col-sm-2 control-label" for="gain_major"><?=label("GainMajor");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="gain_major" id="gain_major" maxlength="50" class="form-control">
                      </div> 
                      <label class="col-sm-2 control-label" for="gain_credit"><?=label("GainCredit");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="gain_credit" id="gain_credit" maxlength="50" class="form-control">
                      </div>                                  
                  </div>
                </div> 
                
        
            <!-- FILA 9 -->
                <div class="col-md-6  btn-group white" data-toggle="buttons">
                  <label class="btn color01">
                     <input type="radio" name="color" id="option1" value="color01" autocomplete="off" > C1
                  </label>
                  <label class="btn color02">
                     <input type="radio" name="color" id="option2" value="color02" autocomplete="off" > C2
                  </label>
                  <label class="btn color03">
                     <input type="radio" name="color" id="option3" value="color03" autocomplete="off" > C3
                  </label>
                  <label class="btn color04">
                     <input type="radio" name="color" id="option4" value="color04" autocomplete="off" > C4
                  </label>
                  <label class="btn color05">
                     <input type="radio" name="color" id="option5" value="color05" autocomplete="off" > C5
                  </label>
                  <label class="btn color06">
                     <input type="radio" name="color" id="option6" value="color06" autocomplete="off" > C6
                  </label>
                  <label class="btn color07">
                     <input type="radio" name="color" id="option7" value="color07" autocomplete="off" > C7
                  </label>
               </div>
               <p class="help-block"><?=label("ProductColor");?></p>


              </div>
              <div class="col-md-3" style="border: solid #CCCCCC 1px; padding-top: 8px; padding-bottom: 8px; margin-bottom: 8px">
             
           
              
                     <label class="col-sm-6 control-label" for="identifier"><?=label("Identifier");?></label>
                      <div class="col-sm-6 form-group">  
                        <select class="form-control" name="identifier" id="identifier">
                          <option value="" ><?=label("Choose");?></option>
                          <option value="1">Si</option>
                          <option value="2">No</option>
                        </select>
                      </div> 
              <!-- FILA 3 --> 
                    <label class="col-sm-6 control-label" for="fractional"><?=label("Fractional");?></label>
                      <div class="col-sm-6 form-group">  
                        <select class="form-control" name="fractional" id="fractional">
                          <option value="" ><?=label("Choose");?></option>
                          <option value="1">Si</option>
                          <option value="2">No</option>
                        </select>
                      </div>  

<!-- FILA 8 --> 
                  <div class="col-sm-12 well" style="border: solid #666666 1px; padding-top: 10px">
                          <label class="col-sm-7 control-label" for="desc_prog"><?=label("DescProg");?></label>
                          <div class="col-sm-5 form-group"> 
                            <select class="form-control" name="desc_prog" id="desc_prog" onchange="viewTabPrice(1)">
                              <option value="1">Si</option>
                              <option value="2" selected="selected">No</option>
                            </select>
                          </div>

                      <div id="progContent" style="display: none;">
                          <label class="col-sm-3 control-label" for="start_date_desc"><?=label("StartDate");?></label>
                            
                          <div class="col-sm-9 form-group">  
                            <input type="date" name="start_date_desc" id="start_date_desc" maxlength="50" class="form-control">
                          </div>

                          <label class="col-sm-3 control-label" for="end_date_desc"><?=label("EndDate");?></label>
                            
                          <div class="col-sm-9 form-group"> 
                            <input type="date" name="end_date_desc" id="end_date_desc" maxlength="50" class="form-control form-control-sm">
                          </div>
                          
                          <label class="col-sm-3  control-label" for="commission_desc"><?=label("CommissionDesc");?></label>
                          <div class="col-sm-9 form-group"> 
                            <input type="text" name="commission_desc" id="commission_desc" maxlength="50" class="form-control">
                          </div>
                        </div>
                      </div>
                      <!-- fin de well-->
                      <div class="col-sm-12 well" style="border: solid #666666 1px; padding-top: 10px">

                          <label class="col-sm-7 control-label" for="sale_by_quantity"><?=label("SaleByQuantity");?></label>
                          <div class="col-sm-5 form-group"> 
                            <select class="form-control" name="sale_by_quantity" id="sale_by_quantity" onchange="viewTabPrice(2)">
                              <option value="1" >Si</option>
                              <option value="2" selected="selected" >No</option>
                            </select>
                          </div>
                     
                      
                          <ul class="nav nav-tabs" id="tabPrice" style="display: none;">
                            <li class="active"><a href="#P1" data-toggle="tab"><i class="fa fa-cog" aria-hidden="true"></i> <?=label("P1");?></a></li>
                            <li class=""><a href="#P2" data-toggle="tab"><i class="fa fa-cog" aria-hidden="true"></i> <?=label("P2");?></a></li>
                            <li class=""><a href="#P3" data-toggle="tab"><i class="fa fa-cog" aria-hidden="true"></i> <?=label("P3");?></a></li>
                         </ul>
                          <div class="tab-content none" id="tabPriceContent" style="padding: 5px; display: none;">
                          <!-- General setting tab -->
                       
                            <div class="tab-pane fade in active" id="P1">
                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="min_1"><?=label("Min1");?></label>
                                  <input type="text" name="min_1" id="min_1" maxlength="50" class="form-control" >
                                </div>
                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="max_1"><?=label("Max1");?></label>
                                  <input type="text" name="max_1" id="max_1" maxlength="50" class="form-control" >
                                </div>
                                 <label class="col-sm-3 control-label" for="price_1"><?=label("Pr1");?></label>
                                 <div class="col-sm-9 form-group"> 
                                  <input type="text" name="price_1" id="price_1" maxlength="50" class="form-control">
                                </div>
                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="utility_1"><?=label("U1");?></label>
                                  <input type="text" name="utility_1" id="utility_1" maxlength="50" class="form-control" >
                                </div>

                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="margin_1"><?=label("M1");?></label>
                                  <p class="help-block" id="margin_1"></p>
                                  
                                </div>
                            </div>
                            <!-- General setting tab -->
                            <div class="tab-pane fade in" id="P2">
                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="min_2"><?=label("Min2");?></label>
                                  <input type="text" name="min_2" id="min_2" maxlength="50" class="form-control">
                                </div>
                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="max_2"><?=label("Max2");?></label>
                                  <input type="text" name="max_2" id="max_2" maxlength="50" class="form-control">
                                </div>
                                 <label class="col-sm-3 control-label" for="price_2"><?=label("Pr2");?></label>
                                 <div class="col-sm-9 form-group"> 
                                  <input type="text" name="price_2" id="price_2" maxlength="50" class="form-control">
                                </div>
                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="utility_2"><?=label("Ut2");?></label>
                                  <input type="text" name="utility_2" id="utility_2" maxlength="50" class="form-control">
                                </div>
                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="margin_2"><?=label("Ga2");?></label>
                                  <p class="help-block" id="margin_2"></p>
                                </div>
                            </div>
                            <!-- General setting tab -->
                            <div class="tab-pane fade in" id="P3">
                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="min_3"><?=label("Min3");?></label>
                                  <input type="text" name="min_3" id="min_3" maxlength="50" class="form-control" >
                                </div>
                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="max_3"><?=label("Max3");?></label>
                                  <input type="text" name="max_3" id="max_3" maxlength="50" class="form-control" >
                                </div>
                                 <label class="col-sm-3 control-label" for="price_3"><?=label("Pr3");?></label>
                                 <div class="col-sm-9 form-group"> 
                                  <input type="text" name="price_3" id="price_3" maxlength="50" class="form-control">
                                </div>
                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="utility_3"><?=label("Ut3");?></label>
                                  <input type="text" name="utility_3" id="utility_3" maxlength="50" class="form-control">
                                </div>
                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="margin_3"><?=label("Ga3");?></label>
                                  <p class="help-block" id="margin_3"></p>
                                </div>
                            </div>

                          </div><!--//fin de tab coontent-->

                      </div><!--//fin de well-->

                    

             </div>

        </div>
       </fieldset>
      </div>
      <!-- FIN-modal-body -->
      <!-- *************************************************** -->

      <div class="modal-footer">
        <!--
        *************************************************************************************************
         __        __   __           __   __  ___  __        ___  __
        |__)  /\  |__) |__)  /\     |__) /  \  |  /  \ |\ | |__  /__`
        |__) /~~\ |  \ |  \ /~~\    |__) \__/  |  \__/ | \| |___ .__/
        
        -->

        <button type="submit" class="btn btn-primary"><?=label("save");?></button>
        <button type="button" class="btn btn-warning" data-dismiss="modal"><?=label("Close");?></button>
        
      </div>
      <!-- FIN BARRA BOTONES -->
      <?php echo form_close(); ?>
    </div>
  </div>
</div>
</div>
<!-- /.Modal -->

<!-- Modal -->
<div class="modal fade" id="ImportProducts" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?=label("AddProduct");?></h4>
      </div>
      <?php
      $attributes = array('id' => 'addform');
      echo form_open_multipart('products/importcsv', $attributes);
      ?>
      <div class="modal-body">
         <div class="form-group">
           <label for="user_file_import"><?=label("UploadCSVfile");?></label>
           <input type="file" name="user_file_import" id="user_file_import">
           <p class="help-block"><a href="<?=site_url('products/csv/2');?>"><?=label('DownloadSample');?></a></p>
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


  <!-- Modal combo -->
  <div class="modal fade" id="combo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
   <div class="modal-dialog" role="document" id="comboModal">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="combo"><?=label("combinations");?></h4>
        </div>
        <div class="modal-body" id="modal-body">
           <div id="combocontent">
              <!-- combo goes here -->
           </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default hiddenpr" onclick="location.reload();"><?=label("Close");?></button>
          <button type="button" class="btn btn-add hiddenpr" onclick="addcombo()"><?=label("submit");?></button>
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
        <div class="modal-body" id="modal-body">
           <div id="stockcontent">
              <!-- stock goes here -->
           </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default hiddenpr" data-dismiss="modal"><?=label("Close");?></button>
          <button type="button" class="btn btn-add hiddenpr" onclick="updatestock()"><?=label("submit");?></button>
        </div>
      </div>
  </div>
  </div>
  <!-- /.Modal -->


  <!-- Modal view -->
  <div class="modal fade" id="ViewproductModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
   <div class="modal-dialog" role="document" id="viewModal">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="view"><?=label("Viewproduct");?></h4>
        </div>
        <div class="modal-body" id="modal-body">
           <div id="viewSectionProduct">
              <!-- view goes here -->
           </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default hiddenpr" data-dismiss="modal"><?=label("Close");?></button>
        </div>
      </div>
   </div>
  </div>
  <!-- /.Modal -->


  <!-- Modal barcode -->
  <div class="modal fade" id="makeBarcode" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
   <div class="modal-dialog" role="document" id="stockModal">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="barcode"><?=label("Stock");?></h4>
        </div>
        <div class="modal-body" id="modal-body">
           <div class="form-group col-md-6">
             <label for="Brrows"><?=label("RowsNumber");?></label>
             <select Required class="form-control" id="Brrows">
                <option value="12">1</option>
                <option value="6">2</option>
                
             </select>
           </div>
           <div class="form-group col-md-6">
             <label for="Brnum"><?=label("Number");?></label>
             <input type="number" Required name="Brnum" class="form-control" id="Brnum" placeholder="<?=label("Number");?>" value="10">
             <input type="hidden" id="hdnReference" name="hdnReference">
             <input type="hidden" id="hdnProductCode" name="hdnProductCode">
             <input type="hidden" id="hdnProductName" name="hdnProductName">
             <input type="hidden" id="hdnProductDescription" name="hdnProductDescription">
             <input type="hidden" id="hdnProductPrice" name="hdnProductPrice">
           </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default hiddenpr" data-dismiss="modal"><?=label("Close");?></button>
          <button type="button" class="btn btn-add hiddenpr" onclick="barcode()"><?=label("submit");?></button>
        </div>
      </div>
   </div>
  </div>
  <!-- /.Modal -->


  <!-- Modal barcode -->
  <div class="modal fade" id="barcodeP" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
   <div class="modal-dialog" role="document" id="stockModal">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="barcodeP"><?=label("Stock");?></h4>
        </div>
        <div class="modal-body" id="modal-body" style="background: #fff;">
           <div id="printSection" style="text-align: center;">
             <!-- content -->
           </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default hiddenpr" data-dismiss="modal"><?=label("Close");?></button>
          <button type="button" class="btn btn-add hiddenpr" onclick="Printbarcode()"><?=label("print");?></button>
        </div>
      </div>
   </div>
  </div>
  <!-- /.Modal -->
<!-- Modal addcstegoriesO -->
<div class="modal fade" id="modalAddCategories" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
          <h4 class="modal-title" id="tituloAddCategory"></h4>
      </div>
      <div class="modal-body">
         <div id="demos">

              <fieldset>
              <!-- Text input-->
                <label class="col-md-12 control-label" for="name_category">Descripción</label>  
                <div class="col-md-12">
                <input id="name_category" name="name_category" type="text" placeholder="Ingrese descripción" class="form-control input-md">
                <input id="hdnCategory" name="hdnCategory" type="hidden">
                </div>
              
              </fieldset>


         </div>
      </div>
      <div class="modal-footer">     
          <button type="button" class="btn btn-default" data-dismiss="modal"><?=label("Close");?></button>
          <button type="button" class="btn btn-add" onclick="addCategory()"><?=label("Submit");?></button>   
      </div>
    </div>
 </div>
</div>
<!-- /.Modal -->
<!-- Modal addcstegoriesO -->
<div class="modal fade" id="modalSelectStore" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
          <h4 class="modal-title" id="tituloStores">Debe seleccionar tienda</h4>
      </div>
      <div class="modal-body">
         <div id="demos">

              <fieldset>
              <!-- Text input-->
               <div class="form-group">
                 <label for="store_id"><?=label("Stores");?></label>
                 <select class="form-control" name="store_id" id="store_id">
                   <option value=""><?=label("Elija tienda");?></option>
                   <?php foreach ($stores as $row):?>
                      <option value="<?=$row->id;?>"><?=$row->name;?></option>
                   <?php endforeach;?>
                </select>
               </div>   
              </fieldset>


         </div>
      </div>
      <div class="modal-footer">     
          <button type="button" class="btn btn-default" data-dismiss="modal"><?=label("Close");?></button>
          <button type="button" class="btn btn-add" onclick="addStoreSession()"><?=label("Submit");?></button>   
      </div>
    </div>
 </div>
</div>
<!-- /.Modal -->

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
                        <input type="text" name="numdoc" id="numdoc" maxlength="50" Required class="form-control" placeholder="<?=label("Number");?>">
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