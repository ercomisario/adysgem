  <link href="<?=base_url();?>assets/css/bootstrap-combobox.css" rel="stylesheet">
  <link href="<?=base_url()?>assets/css/buttons.dataTables.min.css" type='text/css' rel="stylesheet" >
  <style>

 .input-group {
    display: flex;
  }
 #modalAddTransfer {

    width: 80%;
  }
  
  </style>
  <div class="container">

    <h3><?=label('Remisiones');?></h3>
     <div class="float-right hidden-xs hidden-sm" style="margin-bottom:30px;">
        <a class="btn btn-success" data-toggle="modal" data-target="#AddPlantilla" title="<?=label('Crear de plantilla');?>"><?=label('Crear de plantilla');?></a>
     </div>      
     <div class="float-right hidden-xs hidden-sm" style="margin-bottom:30px;">
        <a class="btn btn-primary" data-toggle="modal" data-target="#AddTransfer" title="<?=label('Remisiones');?>"><?=label('Crear remisión');?></a>
     </div>      
    <table id="table" class="table table-striped table-bordered dataTable no-footer" cellspacing="0" width="100%">

      <thead class="thead-inverse">
        <tr>
          <th><?=label('Code');?></th>
          <th><?=label('Date');?></th>
          <th><?=label('StoreOut');?></th>
          <th><?=label('Customer');?></th>
          <th><?=label('Total');?></th>
          <th><?=label('Createdby');?></th>
          <th><?=label('Tipo');?></th>
          <th><?=label('Action');?></th>
        </tr>
      </thead>
      <tbody>
            <?php foreach ($remisions as $row):
          
            $type="Nota de crédito";
            if($row->type==2)
              $type="Nota de débito";
            if($row->type==3)
              $type="Nota de entrega";
            if($row->customer_firstname || $row->customer_lastname)
                $nameCustomer=$row->customer_firstname.' '.$row->customer_lastname;
            else
                $nameCustomer= 'Público General';
            
            ?>
              <tr>
                 <td><?=sprintf("%08d", $row->id);?></td>
                 <td><?=$row->created_at->format('d/m/Y');?></td>
                 <td><?=$row->store_name_out;?></td>
                 <td><?=$nameCustomer?></td>
                 <td><?=number_format($row->total, $this->setting->decimals, ',', '.');?></td>
                 <td class="hidden-xs"><?=$row->created_name;?></td>
                 <td><?=$type;?></td>

                 <td>
                  <div class="btn-group">
                          <a class="btn btn-primary dropdown-toggle" href="javascript:void(0)" data-toggle="dropdown" >
                          <i class="fa fa-cog fa-fw"></i> <?=label("Action")?></a>
                          <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#">
                             <span class="fa fa-caret-down" title="Toggle dropdown menu"></span></a>
                          <ul class="dropdown-menu">
                             <li><a href="remisions/edit/<?=$row->id;?>">
                                 <i class="fa fa-pencil fa-fw" aria-hidden="true"></i> <?=label("Edit")?></a></li>
                             <li><a href="javascript:void(0)" onclick="javascript:viewInvoice(<?=$row->id;?>);">
                               <i class="fa fa-sticky-note" aria-hidden="true"></i> <?=label("invoice")?></a></li>
                             <li class="divider"></li><li>
                                 <a href="javascript:void(0)" onclick="deleteTransfer(<?=$row->id;?>)">
                                 <i class="fa fa-trash-o fa-fw" aria-hidden="true"></i><?=label("Delete")?></a></li>
                          </ul>
                      </div>

                  </td>
              </tr>
           <?php endforeach;?>

      </tbody>
    </table>
 </div>


      <script src="<?=base_url()?>assets/js/jquery.dataTables.min.js"></script>
      <script src="<?=base_url()?>assets/js/dataTables.buttons.min.js"></script>
      <script src="<?=base_url()?>assets/js/jszip.min.js"></script>
      <script src="<?=base_url()?>assets/js/pdfmake.min.js"></script>
      <script src="<?=base_url()?>assets/js/vfs_fonts.js"></script>
      <script src="<?=base_url()?>assets/js/buttons.html5.min.js"></script>

  <script type="text/javascript">
  
function deleteProduct(indice)
{  
  
  var node = document.getElementById("row_"+indice);
  node.parentNode.removeChild(node);
  hideShowIcon();
 
}

function addProduct()
{  
  //var elem = $(".modal-body");
  var products = document.getElementsByName('product_id[]');
  var n=products.length;

  var elem = document.getElementById("divModalBody");
  var row = document.createElement('div');
  $(row).addClass("row");
  row.setAttribute('id','row_'+n); 

  var div = document.createElement('div');
  $(div).addClass("form-group col-sm-5");
  var select = document.createElement('select');
  $(select).addClass("form-control product_id_"+n);
  select.setAttribute('id','product_id[]');
  select.setAttribute('name','product_id[]');
  select.setAttribute("onchange", 'searchStocks('+n+')');

  var option = document.createElement('option');
  option.setAttribute('value','');
  option.innerHTML = '<?=label("Product");?>';
  select.appendChild(option);
  <?php foreach ($products as $row):?>
  var option = document.createElement('option');
  option.setAttribute('value','<?=$row->id;?>');
  option.innerHTML = '<?=$row->name;?> <?=$row->reference;?>';
  select.appendChild(option);
  <?php endforeach;?>   
  div.appendChild(select);
  row.appendChild(div);
  elem.appendChild(row);
 
  var div = document.createElement('div');
  $(div).addClass("form-group col-sm-2");
  var input = document.createElement('input');
  $(input).addClass("form-control");
  input.setAttribute('id','base_'+n);
  input.setAttribute('type','text');
  input.setAttribute('readonly','readonly');
  div.appendChild(input);
  row.appendChild(div);
  elem.appendChild(row);

  var div = document.createElement('div');
  $(div).addClass("form-group col-sm-2");
  var input = document.createElement('input');
  $(input).addClass("form-control");
  input.setAttribute('id','price_'+n);
  input.setAttribute('name','price_'+n);
  input.setAttribute('type','text');
  input.setAttribute("onkeyup", 'doPorcentaje('+n+')');
  div.appendChild(input);
  row.appendChild(div);
  elem.appendChild(row);
 
  var div = document.createElement('div');
  $(div).addClass("form-group col-sm-1");
  var input = document.createElement('input');
  $(input).addClass("form-control");
  input.setAttribute('id','inc_'+n);
  input.setAttribute('type','text');
  input.setAttribute("onkeyup", 'doPrice('+n+')');
  div.appendChild(input); 
  row.appendChild(div);
  elem.appendChild(row);
  
  var div = document.createElement('div');
  $(div).addClass("form-group col-sm-1");
  var input = document.createElement('input');
  $(input).addClass("form-control");
  input.setAttribute('id','qt[]');
  input.setAttribute('name','qt[]');
  input.setAttribute('type','text');
  div.appendChild(input);
  row.appendChild(div);
  elem.appendChild(row); 

  var div = document.createElement('div');
  $(div).addClass("form-group col-sm-1");
  var a = document.createElement('a');
  $(a).addClass("btn btn-danger");
  a.setAttribute("onclick", 'deleteProduct('+n+')');
  a.setAttribute('id','trash_'+n);
  var icon = document.createElement('i');
  $(icon).addClass("fa fa-trash");

  a.appendChild(icon);
  div.appendChild(a);
  row.appendChild(div);
  elem.appendChild(row); 
  hideShowIcon();
  doCombobox(n);
}
function hideShowIcon()
{
  var products = document.getElementsByName('product_id[]');
  var n=products.length;

  for(var i=0;i<n;++i)
  {

      $('#trash_'+i).css("display","none");

  }
    
  if(n>1)
     $('#trash_'+(n-1)).css("display","block");

}
function addTransfer()
{  
  var type=$("#type").val();
  var customer_id=$("#customer_id").val();
  var store_id_out=$("#store_id_out").val();
//  var stock_1=$("#stock_1").val();
  var quantity = document.getElementsByName('qt[]');
  var products = document.getElementsByName('product_id[]');
   
  var n=quantity.length;
  for(var i=0;i<n;i++)
  {
    var qt=quantity[i].value;
    var product_id=products[i].value;
    var price=$("#price_"+i).val();

    if(store_id_out.length===0){
        swal('Oops...', 'Debe seleccionar almacen de salida', 'error'); 
        return;
    }
    if(customer_id.length===0){
        swal('Oops...', 'Debe seleccionar cliente', 'error'); 
        return;
    }
    if(type.length===0){
        swal('Oops...', 'Debe seleccionar tipo de remisión', 'error'); 
        return;
    }
    if(qt.length===0 || qt<=0){
        swal('Oops...', 'Debe agregar una cantidad a transferir válida', 'error'); 
        return;
    }
    if(price.length===0 || price<=0){
        swal('Oops...', 'Debe agregar un valor de precio válido', 'error'); 
        return;
    }
    
  }

  $("#addformtransfer").submit();
  
}
function deleteTransfer(id)
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
             url : "<?php echo site_url('remisions/delete')?>/"+id,
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
function searchStocks(id)
{
  var products = document.getElementsByName('product_id[]');
  //var option = e.options[e.selectedIndex];

  var n=products.length;
  //for(var i=0;i<n;++i)
  //{
    var product_id=products[id].value;

      if(product_id.length>0)
      {
          //alert(product_id);

          $.ajax({
             url : "<?php echo site_url('remisions/searchStocks')?>",
             type: "POST",     
             data:{product_id:product_id},    
             success: function(data)
             {   
                  var valor  = data;
              
                  $("#base_"+id).val(valor);
                  var porc=$("#inc_all").val();
                  valor =parseFloat(valor)+valor*porc/100;
                  $("#price_"+id).val(valor);
                  $("#inc_"+id).val(porc);
              },
             error: function (jqXHR, textStatus, errorThrown)
             {
                alert("error");
             }
          });
        }
        if(product_id.length===0 )
        {
            $("#price_"+id).val('');

        }
  //}//fin de for
    

}

function viewInvoice(id) {


  $('#printSection').load("<?php echo site_url('remisions/printInvoice')?>/"+id);
  $('#ticket').modal('show');

 
}

function pdfreceipt(){

   var content = $('#printSection').html();
   $.redirect('<?php echo site_url('remisions/pdfreceipt')?>/', { content: content });

}

function PrintTicket() {
   $('.modal-body').removeAttr('id');
   $('.dt-buttons').hide();
   $('#cabecera').css('display','block');
   $('#capDT').hide();
   
   window.print();

   $('.modal-body').attr('id', 'modal-body');
   $('.dt-buttons').show();
   $('#cabecera').css('display','none');
   $('#capDT').show();
   $("#ticket").modal('hide');

}

function doCombobox(i){

  $('.product_id_'+i).combobox({
    // Bootstrap version
    bsVersion: '4' 
    // Default templates
  
  });
 
}

function doPorcentajeAll()
{
    var porc=$('#inc_all').val();    
    var products = document.getElementsByName('product_id[]');
    var n=products.length;
  //console.log(n, ini);
    for(i=0;i<n;++i)
    {
        var base=$('#base_'+i).val();
        if(base>0)
           var price = parseFloat(base)+(porc*base/100);
        else
           var price = 0; 
        $('#price_'+i).val(price);
        $('#inc_'+i).val(porc);
    }
}

function doPorcentaje(id)
{
    var price=$('#price_'+id).val();
    var base=$('#base_'+id).val();
    //if(price>=base)
      //var porc = (price-base)/price*100;
    //else
      var porc = (price-base)/base*100;
    $('#inc_'+id).val(porc);
}

function doPrice(id)
{
    var porc=$('#inc_'+id).val();
    var base=$('#base_'+id).val();
    var price = parseFloat(base)+(porc*base/100);
    $('#price_'+id).val(price);
}

function crearPlantilla(id)
{
      swal({   title: '<?=label("Areyousure");?>',
      text: 'Desea crear una Remisión a partir de este Registro??',
      type: "warning",
      showCancelButton: true,
      confirmButtonColor: "#DD6B55",
      confirmButtonText: '<?=label("yesiam");?>',
      closeOnConfirm: false },
      function(){
        // ajax delete data to database
        $.ajax({
            url : "<?php echo site_url('remisions/crearPlantilla')?>/"+id,
            type: "POST",
            dataType: "JSON",
            success: function(data)
            {
                location.reload();
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
               alert("error 2");
            }
        });
      swal.close(); 
    });
   
}
  </script>


  <!-- Modal -->
  <div class="modal fade" id="AddTransfer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
   <div id="modalAddTransfer" class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel"><?=label("Añadir remisión");?></h4>
        </div>
        <?php
        $attributes = array('id' => 'addformtransfer');
        echo form_open_multipart('remisions/add', $attributes);
        ?>
        <div class="modal-body" id="divModalBody">
         <div class="row">
            <div class="form-group col-sm-4">
              <label for="store_id_out"><?=label("StoreOut");?></label>
                <select class="form-control" name="store_id_out" id="store_id_out">
                  <option value=""><?=label("Store");?></option>
                  <?php foreach ($stores as $store):?>
                  <option value="<?=$store->id;?>"><?=$store->name;?></option>
                  <?php endforeach;?>
                </select>
            </div>
            <div class="form-group col-sm-4">
              <label for="customer_id"><?=label("Customer");?></label>
                <select class="form-control" name="customer_id" id="customer_id">
                  <option value=""><?=label("Customer");?></option>
                  <?php foreach ($customers as $customer):?>
                  <option value="<?=$customer->id;?>"><?=$customer->firstname1;?> <?=$customer->lastname1;?></option>
                  <?php endforeach;?>
                </select>                  
            </div>
            <div class="form-group col-sm-2">
              <label for="type"><?=label("Tipo de remisión");?></label>
                <select class="form-control" name="type" id="type">
                  <option value=""><?=label("Tipo de remisión");?></option>
                  <option value="1">Nota de Crédito</option>
                  <option value="2">Nota de Débito</option>
                  <option value="3">Nota de Entrega</option>
                </select>                  
            </div>
            <div class="form-group col-sm-2">
              <label for="type"><?=label("% Inc/Desc");?></label>
              <input type="text" class="form-control" id="inc_all" value="0" onkeyup="doPorcentajeAll()">
            </div>
          </div>
          <div id="row_0" class="row">
              <div class="form-group col-sm-5">
                <label for="product_id"><?=label("Product");?></label>
                  <select class="form-control product_id_0" name="product_id[]" id="product_id[]" onchange="searchStocks(0);">
                    <option value=""><?=label("Product");?></option>
                    <?php foreach ($products as $row):?>
                    <option value="<?=$row->id;?>"><?=$row->name;?> <?=$row->reference;?></option>
                    <?php endforeach;?>
                  </select>                  
              </div>         
              <div class="form-group col-sm-2">
                <label for="base_0"><?=label("Base");?></label>
                <input type="text" readonly class="form-control" id="base_0" >
              </div>
              <div class="form-group col-sm-2">
                <label for="price_0"><?=label("Price");?></label>
                <input type="text" name="price_0" class="form-control" id="price_0" onkeyup="doPorcentaje(0)">
              </div>
              <div class="form-group col-sm-1">
                <label for="inc_0"><?=label("%Inc/Desc");?></label>
                <input type="text" name="inc_0" class="form-control" id="inc_0" onkeyup="doPrice(0)" >
              </div>
              <div class="form-group col-sm-1">
                <label for="qt"><?=label("Quantity");?></label>
                <input type="text" name="qt[]" class="form-control" id="qt[]" >
              </div>
              <div class="form-group col-sm-1">
                <label for="action"><?=label("Action");?></label>
                <a id="trash_0" class="btn btn-danger" style="display :none;"><i class="fa fa-trash"></i></a>
              </div>
            </div>
           
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal"><?=label("Close");?></button>
          <button type="button" class="btn btn-success" onclick="addProduct()"><?=label("AddProduct");?></button>
          <button type="button" class="btn btn-add" onclick="addTransfer()"><?=label("Submit");?></button>
        </div>
     <?php echo form_close(); ?>
      </div>
   </div>
  </div>
  <!-- /.Modal -->
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
        <button type="button" id="btnTransfers" class="btn btn-add hiddenpr" onClick="PrintTicket()"><?=label("print");?></button>

      </div>
    </div>
 </div>
</div>
<!-- /.Modal -->

<!-- Modal DEMO -->
<div class="modal fade" id="AddPlantilla" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
          <h4 class="modal-title" id="modalAuthAnularCtrD">Crear de Plantilla</h4>
      </div>
      <div class="modal-body">
         <div id="demos">

              <fieldset>
              <!-- Text input-->
                <label class="col-md-12 control-label" for="textinput">Código de Remisión</label>  
                <div class="col-md-12">
                <input id="codePlantilla" name="codePlantilla" type="text" placeholder="Ingrese código" class="form-control input-md">
                </div>              
              </fieldset>
         </div>
      </div>
      <div class="modal-footer">        
      </div>
    </div>
 </div>
</div>
<!-- /.Modal -->


<script src="<?=base_url()?>assets/js/bootstrap-combobox.js"></script>

<script type="text/javascript">
var table;

$(document).ready(function() {
 
  table = $('#table').DataTable();
  doCombobox(0);


$('#AddPlantilla').on('shown.bs.modal', function() {
      $('#codePlantilla').trigger('focus');
});

$("#codePlantilla").keyup(function(e){
      // Retrieve the input field text
      var tecla=e.keyCode;
      
      if(tecla==13)
      {
          var code = $(this).val();
          // Loop through the list
          $.ajax({
              url : "<?php echo site_url('remisions/searchPlantilla')?>/"+code,
              type: "POST",
              data:{type:1},
              success: function(data)
              {
                  $('#AddPlantilla').modal('hide');

                  if(data==0)
                  {
                      swal('Oops...', 'Código no registrado', 'error'); 
                  }
                  else       
                  {
                      crearPlantilla(data);
                     
                  }    

              },
              error: function (jqXHR, textStatus, errorThrown)
              {
                  alert("error 1");
              }
           });

      }
   });


});


</script>

