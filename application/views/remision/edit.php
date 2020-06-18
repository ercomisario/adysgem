  <link href="<?=base_url();?>assets/css/bootstrap-combobox.css" rel="stylesheet">
  <style>
 .input-group {
    display: flex;
  }
 .white {
    background: white;
  }
 .red {
    background: pink;
  }
  </style>

  <div class="container">
  <div class="row"   style="margin-top:60px;">
    <div class="row">  
         <a class="btn btn-default float-right" href="#" onclick="history.back(-1)" style="margin-bottom:20px;">
         <i class="fa fa-arrow-left"></i> <?=label("Back");?></a>
     </div>
  
    <?php
         $attributes = array('id' => 'addformtransfer');
         echo form_open_multipart('remisions/edit/'.$remision->id, $attributes);
         ?>
      <div class="modal-body" id="divModalBody">
         <div class="row">
            <div class="form-group col-sm-4">
              <label for="store_id_out"><?=label("StoreOut");?></label>
                <select class="form-control" name="store_id_out" id="store_id_out" onchange="searchStocks();">
                  <?php foreach ($stores as $row):?>
                  <option value="<?=$row->id;?>" <?=$remision->store_id_out===$row->id ? 'selected' : '';?>><?=$row->name;?></option>             
                  <?php endforeach;?>
                </select>
            </div>
            <div class="form-group col-sm-4">
              <label for="customer_id"><?=label("Curtomer");?></label>
                <select class="form-control" name="customer_id" id="customer_id" onchange="searchStocks();">
                  <?php foreach ($customers as $row):?>
                  <option value="<?=$row->id;?>" <?=$remision->customer_id===$row->id ? 'selected' : '';?>><?=$row->firstname1;?> <?=$row->lastname1;?></option>             
                  <?php endforeach;?>
                </select>                  
            </div>
            <div class="form-group col-sm-4">
              <label for="type"><?=label("Tipo de remisión");?></label>
                <select class="form-control" name="type" id="type">
                  <option value="1" <?=$remision->type==1 ? 'selected' : '';?>>Nota de Crédito</option>
                  <option value="2" <?=$remision->type==2 ? 'selected' : '';?>>Nota de Débito</option>
                  <option value="3" <?=$remision->type==3 ? 'selected' : '';?>>Nota de Entrega</option>
                </select>                  
            </div>
         </div>
         <div class="row">

             <div class="form-group col-sm-5">
              <label for="product_id"><?=label("Product");?></label>               
            </div>
             <div class="form-group col-sm-2">
              <label for="base">Base</label>              
            </div>
             <div class="form-group col-sm-2">
              <label for="price">Precio</label>              
            </div>
            <div class="form-group col-sm-1">
              <label for="inc[]">% Inc.</label>
            </div>
            <div class="form-group col-sm-1">
              <label for="qt[]">Cantidad</label>
            </div>
            <div class="form-group col-sm-1">
              <label for="del[]">Eliminar</label>
            </div>
          </div>
            <?php 
            $i=-1;
            foreach ($remisions as $item):
          
            $i++;
            $price=$item->price;
            $base=$item->base;
            $porc=($price-$base)/$base*100;
            $qt=$item->qt;
            
            ?>
           <div id="row_<?=$i?>" class="row">
            <div class="form-group col-sm-5">              
                <select class="form-control" name="product_id[]" id="product_id_<?=$i?>" onchange="searchStocks(<?=$i?>);">
                  <option value=""><?=label("Product");?></option>
                  <?php foreach ($products as $row):?>
                  <option value="<?=$row->id;?>" <?=$item->product_id===$row->id ? 'selected' : '';?>><?=$row->name;?> <?=$row->reference;?></option>             
                  <?php endforeach;?>
                </select>                  
            </div>
             <div class="form-group col-sm-2">
              <input type="text" name="base_<?=$i?>" class="form-control" id="base_<?=$i?>" value="<?=number_format($base, $this->setting->decimals, ',', '');?>" readonly>
            </div>
             <div class="form-group col-sm-2">
              <input type="text" name="price_<?=$i?>" class="form-control" id="price_<?=$i?>" value="<?=number_format($price, $this->setting->decimals, ',', '');?>" onkeyup="doPorcentaje(<?=$i?>)">
            </div>
            <div class="form-group col-sm-1">
              <input type="text" class="form-control" id="inc_<?=$i?>" value="<?=$porc?>" onkeyup="doPrice(<?=$i?>)">
            </div>
            <div class="form-group col-sm-1">
              <input type="hidden" name="item_id[]" id="item_id[]" value="<?=$item->id?>">
              <input type="text" name="qt[]"  class="form-control" id="qt[]" value="<?=$qt?>">
            </div>
            <div class="form-group col-sm-1">
              <a id="trash_<?=$i?>" onclick="deleteProduct(<?=$i?>)" class="btn btn-danger" ><i class="fa fa-trash"></i></a>         
            </div>
          </div> 
        <?php endforeach;?>

        </div>

     <div class="row">
       <button type="button" class="btn btn-success col-sm-3" onclick="addProduct()"><?=label("AddProduct");?></button>         
       <button type="button" class="btn btn-add col-sm-3" onclick="editTransfer()"><?=label("Guardar");?></button>
     </div>

     <?php echo form_close(); ?>
   </div>
</div>

<script src="<?=base_url()?>assets/js/bootstrap-combobox.js"></script>

<script type="text/javascript">
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
  $(select).addClass("form-control");
  select.setAttribute('id','product_id_'+n);
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
  input.setAttribute('id','item_id[]');
  input.setAttribute('name','item_id[]');
  input.setAttribute('type','hidden');
  input.setAttribute('value','0');
  div.appendChild(input);
  
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
  //hideShowIcon();
  doCombobox(n);
}

function deleteProduct(indice)
{  
  
  var node = document.getElementById("row_"+indice);
  console.log(node);
  var node = document.getElementById("row_"+indice);
  var products = document.getElementsByName('product_id[]');
  var n=products.length;
  var ini=parseInt(indice)+1;
  //console.log(n, ini);
  for(i=ini;i<n;++i)
  {
       console.log(i);
       $('#base_'+i).attr('id', 'base_'+(i-1));
       $('#price_'+i).attr('name', 'price_'+(i-1));
       $('#price_'+i).attr('id', 'price_'+(i-1));
       $('#row_'+i).attr('id', 'row_'+(i-1));
       $('#product_id_'+i).attr('onchange', 'searchStocks('+(i-1)+')');
       $('#product_id_'+i).attr('id', 'product_id_'+(i-1));
       $('#trash_'+i).attr('onclick', 'deleteProduct('+(i-1)+')');
       $('#trash_'+i).attr('id', 'trash_'+(i-1));  

  }
  node.parentNode.removeChild(node);
   
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

function doCombobox(id)
{
  var products = document.getElementsByName('product_id[]');
  var n=products.length;
  if(id=='all')
  {    
    for(i=0;i<n;++i)
    {
      $('#product_id_'+i).combobox();
    }
  }
  else
    $('#product_id_'+id).combobox();

}

function editTransfer()
{  

      $("#addformtransfer").submit();
    
  }

 
function searchStocks(id)
{
  var products = document.getElementsByName('product_id[]');
  
  var product_id=products[id].value;
  //console.log(product_id, id);

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
                  //console.log(valor, id);
                  $("#price_"+id).val(valor);    
                  $("#base_"+id).val(valor);    
                  $("#inc_"+id).val(0);
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
  
    

}

$(document).ready(function() {
 
doCombobox('all');

});

</script>

