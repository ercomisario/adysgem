<script type="text/javascript">
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
      var gain=$("#gain").val();

      if(utility.length===0)
        utility=0;
      
      if(filter>=0 && value>0)
      {
        var cost_yt   =  (filter*value/100)+parseFloat(filter);
        $("#cost_yt").val(cost_yt);        

        var price   =  parseFloat(gain)+parseFloat(cost_yt);
        $("#price").val(price);        
        
      }
      if(filter=='')
      {
        var price=0;
        $("#price").val(price);
        $("#cost_yt").val(price);
      }

      gain   =  price*utility/100;
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
   if( <?=$product->type !== null ? $product->type : 1;?> == 1 ) //if service
   {
     $("#pushaceP").slideUp();
     $("#supply").slideUp();
     $("#alertqty").slideUp();
     $("#UnitP").slideUp();
  } else if ( <?=$product->type?> == 2 ) {
     $("#pushaceP").slideUp();
     $("#alertqty").slideUp();
     $("#supply").slideUp();
     $("#UnitP").slideUp();
   } else {
     $("#pushaceP").slideDown();
     $("#supply").slideDown();
     $("#alertqty").slideDown();
     $("#UnitP").slideDown();
   }
<?php if(isset($texterror)){?>
  swal('Ooops!', 'CÓDIGO DE PRODUCTO YA REGISTRADO', 'error');
<?php }?>
});

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
<style>
  .form-control {

    padding: 4px 5px;    
    height: 28px;
}
.well {
    padding: 5px;
    margin-bottom: 10px;
}
hr {
    border-top: 1px solid #333;
}
</style>
<div class="container">
   <div class="row" style="margin-top:30px;">
      <a class="btn btn-default float-right" href="#" onclick="history.back(-1)"style="margin-bottom:10px;">
         <i class="fa fa-arrow-left"></i> <?=label("Back");?></a>
      <?php echo form_open_multipart('products/edit/'.$product->id); ?>

        <div class="col-md-12">
            <div class="col-md-9" style="border: solid #CCCCCC 0px; padding-top: 8px;" >

                <!-- FILA 1 -->
           
                    <div class="row">
                        <div class="col-md-9">
                            <div class="row">
                                <!-- FILA 2 --> 
                                <div class="col-md-12">
                                    <label class="col-sm-2 control-label" for="reference"><?=label("Reference");?></label>
                                    <div class="col-sm-4 form-group">  
                                      <input type="text" name="reference" id="reference" maxlength="50" class="form-control" value="<?=$product->reference;?>">
                                      <input type="hidden" name="type" id="type" value="<?=$product->type;?>">
                                    </div> 
                                  
                                  <label class="col-sm-1 control-label" for="user_file"><?=label("Imageinput");?></label>
                                    <div class="col-sm-5 form-group">  
                                      <input type="file" name="user_file" value="<?=$product->photo;?>">
                                    </div>                                  
                                </div>

                              <!-- FILA 3 -->
                              <div class="col-md-12">
                                  <label class="col-sm-3 control-label" for="name"><?=label("ProductName");?></label>
                                    <div class="col-sm-9 form-group">  
                                      <input type="text" name="name" id="name" maxlength="50" class="form-control" value="<?=$product->name;?>">
                                    </div>   
                                   
                                </div>
                              <!-- FILA 3 -->
                              <div class="col-md-12">
                                  <label class="col-sm-3 control-label" for="description"><?=label("Description");?></label>
                                  <div class="col-sm-9 form-group">  
                                      <input type="text" name="description" id="description" maxlength="50" class="form-control" value="<?=$product->description;?>">
                                  </div>   
                              </div>
                              <!-- FILA 3 -->
                              
                            </div>
                        </div>
                        <div id="idImagen" class="col-md-3"> 
                          
                          <?php if($product->photo){ ?><img src="<?=base_url()?>files/products/<?=$product->photo;?>" alt="" class="float-left" heigth="110px" width="150px"/><?php } else {?>
                          <label class="col-sm-10 control-label" style="border: solid #666666 1px; padding-top: 8px; text-align: center; height: 110px;">Imagen<br><br>120 x 120</label>
                          <?php }?>
                           
                        </div>
                    </div>
                
          
                 <!-- FILA 4 -->
                 
                 <div class="form-group">
                     <label class="col-sm-2 control-label" for="supplier_id"><?=label("Supplier");?></label>
                      <div id="supplier" class="col-sm-9 form-group">  
                         <select class="form-control" name="supplier_id" id="supplier_id">
                          <?php foreach ($suppliers as $row):?>
                                <option value="<?=$row->id;?>" <?=$product->supplier_id===$row->id ? 'selected' : '';?> >
                                  <?=$row->name;?>
                                </option>
                          <?php endforeach;?>
                        </select>
                      </div>                       
                      <div class="col-sm-1"><a class="btn btn-primary" data-toggle="modal" data-target="#modalAddSupplier">
                          <i class="fa fa-plus fa-fw"></i></a>
                      </div> 
                       


                </div> 
                <!-- FILA 5 -->
                 
                 <div class="form-group">
                    
                    <label class="col-sm-2 control-label" for="brand_id"><?=label("Brand");?></label>
                      <div id="brand" class="col-sm-3 form-group">  
                        <select class="form-control" name="brand_id" id="brand_id">
                          <?php foreach ($brands as $row):?>
                                <option value="<?=$row->id;?>" <?=$product->brand_id===$row->id ? 'selected' : '';?> ><?=$row->name;?></option>

                          <?php endforeach;?>
                        </select> 
                      </div>
                      <div class="col-sm-1"><a class="btn btn-primary" href="javascript:void(0)" onclick="selectAddCategory('brand')">
                          <i class="fa fa-plus fa-fw"></i></a>
                      </div>        
                      <label class="col-sm-2 control-label" for="code"><?=label("ProductCode");?></label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="code" id="code" maxlength="50" class="form-control" value="<?=$product->code;?>" readonly>
                      </div>                     
                </div> 
                <!-- FILA 6 -->
                 <div class="form-group">
                      <label class="col-sm-2 control-label" for="category_id"><?=label("Category");?></label>
                      <div id="category" class="col-sm-3 form-group">
                        <select class="form-control" name="category_id" id="category_id">
                          <?php foreach ($categories as $row):?>
                                <option value="<?=$row->id;?>" <?=$product->category_id===$row->id ? 'selected' : '';?> >
                                  <?=$row->name;?>
                                </option>
                          <?php endforeach;?>
                        </select> 
                      </div>
                      <div class="col-sm-1"><a class="btn btn-primary" href="javascript:void(0)" onclick="selectAddCategory('category')">
                          <i class="fa fa-plus fa-fw"></i></a>
                      </div>
                      <label class="col-sm-2 control-label" for="tax_sale_id"><?=label("TaxSale");?></label>
                      <div class="col-sm-4 form-group">  
                         <select class="form-control" name="tax_sale_id" id="tax_sale_id">
                          <?php foreach ($taxes as $row):?>
                                <option value="<?=$row->id;?>|<?=$row->value;?>" <?=$product->tax_sale_id===$row->id ? 'selected' : '';?> >
                                  <?=$row->name;?>
                                </option>
                          <?php endforeach;?>
                        </select>
                      </div>      
                </div> 
        
            <!-- FILA 8 -->
           
             <div class="form-group">
                      <label class="col-sm-2 control-label" for="area_id"><?=label("Segment");?></label>                     
                      <div id="area" class="col-sm-3 form-group">
                        <select class="form-control" name="area_id" id="area_id">
                          <?php foreach ($areas as $row):?>
                                <option value="<?=$row->id;?>" <?=$product->area_id===$row->id ? 'selected' : '';?> >
                                  <?=$row->name;?>
                                </option>
                          <?php endforeach;?>
                        </select> 
                      </div>
                      <div class="col-sm-1"><a class="btn btn-primary" href="javascript:void(0)" onclick="selectAddCategory('area')">
                          <i class="fa fa-plus fa-fw"></i></a>
                      </div>
                      <label class="col-sm-2 control-label" for="presentacion"><?=label("Pesentation");?></label>
                      <div class="col-sm-4 form-group">  
                        <select class="form-control" name="presentation_id" id="presentation_id">                       
                          <?php foreach ($presentations as $row):?>
                                <option value="<?=$row->id;?>" <?=$product->presentation_id===$row->name ? 'selected' : '';?> >
                                  <?=$row->name;?>
                                </option>
                          <?php endforeach;?>
                          </select>         
                      </div>                     
                </div> 
            <!-- FILA 11 -->

               <div class="form-group">
                      <label class="col-sm-2 control-label" for="combo_id"><?=label("Combo");?></label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="combo_id" id="combo_id" maxlength="50" class="form-control" placeholder="Combo">
                      </div> 
                      <label class="col-sm-2 control-label" for="st_max"><?=label("StockMax");?></label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="st_max" id="st_max" maxlength="50" class="form-control" value="<?=$product->st_max;?>">
                      </div>                                  
                </div> 

            <!-- FILA 12 -->
            <div class="form-group">
                      <label class="col-sm-2 control-label" for="alertqt"><?=label("AlertQt");?></label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="alertqt" id="alertqt" maxlength="50" class="form-control" value="<?=$product->alertqt;?>">
                      </div> 
                      <label class="col-sm-2 control-label" for="st_min"><?=label("StockMin");?></label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="st_min" id="st_min" maxlength="50" class="form-control" value="<?=$product->st_min;?>">
                      </div>                                  
                </div> 

            <!-- FILA 12 -->
            
               <div class="row">
                 <div class="form-group col-sm-12">
                  <hr style="margin-top: 5px; margin-bottom: 5px; border-top: 1px solid #eee;">         
                  </div>                 
                </div> 

            <!-- FILA 12 -->
           
             <div class="form-group">
                      <label class="col-sm-2 control-label" for="cost_nt"><?=label("CostNoTax");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="cost_nt" id="cost_nt" maxlength="50" class="form-control" value="<?=$product->cost_nt;?>">
                      </div>  
                      <label class="col-sm-2 control-label" for="cost_yt"><?=label("CostYesTax");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="cost_yt" id="cost_yt" maxlength="50" class="form-control" value="<?=$product->cost_yt;?>">
                      </div> 
                      <label class="col-sm-2 control-label" for="cost_yt"><?=label("Base");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="base" id="base" maxlength="50" class="form-control" value="<?=$product->base;?>">
                      </div> 
                                      
                </div> 
                  <!-- FILA 11 -->
               <div class="form-group">
                       <label class="col-sm-2 control-label" for="price"><?=label("Price");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="price" id="price" maxlength="50" class="form-control" value="<?=$product->price;?>">
                      </div>
                      <label class="col-sm-2 control-label" for="price_major"><?=label("PriceMajor");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="price_major" id="price_major" maxlength="50" class="form-control" value="<?=$product->price_major;?>">
                      </div> 
                      <label class="col-sm-2 control-label" for="price_credit"><?=label("PriceCredit");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="price_credit" id="price_credit" maxlength="50" class="form-control" value="<?=$product->price_credit;?>">
                      </div>                                  
                </div> 
               <!-- FILA 11 -->
               <div class="form-group">
                      <label class="col-sm-2 control-label" for="utility"><?=label("Utility");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="utility" id="utility" maxlength="50" class="form-control" value="<?=$product->utility;?>">
                      </div>
                      <label class="col-sm-2 control-label" for="utility_major"><?=label("UtilityMajor");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="utility_major" id="utility_major" maxlength="50" class="form-control" value="<?=$product->utility_major;?>">
                      </div> 
                      <label class="col-sm-2 control-label" for="utility_credit"><?=label("UtilityCredit");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="utility_credit" id="utility_credit" maxlength="50" class="form-control" value="<?=$product->utility_credit;?>">
                      </div>                                  
                </div> 
              <!-- FILA 11 -->
              <?php
              if($product->cost_yt>0)
                $gain=$product->price-$product->cost_nt;
              else
                $gain=$product->price-$product->base;

              $gain_major=$product->price_major*$product->utility_major/100;
              $gain_credit=$product->price_credit*$product->utility_credit/100;
              ?>
               <div class="form-group">
                      <label class="col-sm-2 control-label" for="gain"><?=label("Gain");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="gain" id="gain" maxlength="50" class="form-control" value="<?=$gain?>">
                      </div>
                      <label class="col-sm-2 control-label" for="gain_major"><?=label("GainMajor");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="gain_major" id="gain_major" maxlength="50" class="form-control" value="<?=$gain_major?>" >
                      </div> 
                      <label class="col-sm-2 control-label" for="gain_credit"><?=label("GainCredit");?></label>
                      <div class="col-sm-2 form-group">  
                        <input type="text" name="gain_credit" id="gain_credit" maxlength="50" class="form-control" value="<?=$gain_credit?>">
                      </div>                                  
                </div> 
              
            <!-- FILA 9 -->
                <div class="col-sm-9  btn-group white" data-toggle="buttons">
                  <p class="help-block"><?=label("ProductColor");?></p>
                  <label class="btn color01">
                     <input type="radio" name="color" id="option1" value="color01" autocomplete="off" <?php if($product->color == 'color01'){echo 'checked'; } ?>> C1
                  </label>
                  <label class="btn color02">
                     <input type="radio" name="color" id="option2" value="color02" autocomplete="off" <?php if($product->color == 'color02'){echo 'checked'; } ?>> C2
                  </label>
                  <label class="btn color03">
                     <input type="radio" name="color" id="option3" value="color03" autocomplete="off" <?php if($product->color == 'color03'){echo 'checked'; } ?>> C3
                  </label>
                  <label class="btn color04">
                     <input type="radio" name="color" id="option4" value="color04" autocomplete="off" <?php if($product->color == 'color04'){echo 'checked'; } ?>> C4
                  </label>
                  <label class="btn color05">
                     <input type="radio" name="color" id="option5" value="color05" autocomplete="off" <?php if($product->color == 'color05'){echo 'checked'; } ?>> C5
                  </label>
                  <label class="btn color06">
                     <input type="radio" name="color" id="option6" value="color06" autocomplete="off" <?php if($product->color == 'color06'){echo 'checked'; } ?>> C6
                  </label>
                  <label class="btn color07">
                     <input type="radio" name="color" id="option7" value="color07" autocomplete="off" <?php if($product->color == 'color07'){echo 'checked'; } ?>> C7
                  </label>
               </div>
                

              </div>
              <div class="col-md-3" style="border: solid #CCCCCC 1px; padding-top: 8px; padding-bottom: 8px; margin-bottom: 8px">

              <!-- FILA 1 -->                
                   <!-- <label class="col-sm-4 control-label" for="created_at">Creación</label>
                      <div class="col-sm-8 form-group">  
                        <?php $created_at=$product->created_at->format('d/m/Y');?>
                        <input type="text" value="<?=$created_at?>" name="created_at" id="created_at" maxlength="50" class="form-control" placeholder="Creación">
                      </div>-->
              <!-- FILA 2 --> 

                     <label class="col-sm-6 control-label" for="identifier"><?=label("Identifier");?></label>
                      <div class="col-sm-6 form-group">  
                        <select class="form-control" name="identifier" id="identifier">
                          <option value="1" <?=$product->identifier === 1 ? 'selected' : '';?>>Si</option>
                          <option value="2" <?=$product->identifier === 2 ? 'selected' : '';?>>No</option>
                        </select>
                      </div> 
              <!-- FILA 3 --> 
                    <label class="col-sm-6 control-label" for="fractional"><?=label("Fractional");?></label>
                      <div class="col-sm-6 form-group">  
                        <select class="form-control" name="fractional" id="fractional">
                          <option value="1" <?=$product->fractional === 1 ? 'selected' : '';?>>Si</option>
                          <option value="2" <?=$product->fractional === 2 ? 'selected' : '';?>>No</option>
                        </select>
                      </div>  
           
              <!-- FILA 6 --> 
                   <!-- <label class="col-sm-5 control-label" for="fe_ult_in">Ult Entrada</label>
                      <div class="col-sm-7 form-group">  
                        <input type="text" name="fe_ult_in" id="fe_ult_in" maxlength="50" class="form-control" value="<?=$created_at?>">
                      </div>-->
              <!-- FILA 7 --> 
                    <!--<label class="col-sm-5 control-label" for="fe_ult_out">Ult Salida</label>
                      <div class="col-sm-7 form-group">  
                        <input type="text" name="fe_ult_out" id="fe_ult_out" maxlength="50" class="form-control" value="<?=$created_at?>">
                      </div>-->
              <!-- FILA 8 --> 
                    
              
              <!-- FILA 9 Cuadro descuento --> 
                      <?php
                      $desc_prog=$product->desc_prog;
                      $display='block';
                      
                      if(!$desc_prog)$desc_prog=2;
                      
                      if($desc_prog==2)$display='none';       

                      ?>
              
                      <div class="col-sm-12 well" style="border: solid #666666 1px; padding-top: 10px">
                          <label class="col-sm-7 control-label" for="desc_prog"><?=label("DescProg");?></label>
                          <div class="col-sm-5 form-group"> 
                            <select class="form-control" name="desc_prog" id="desc_prog" onchange="viewTabPrice(1)">
                              <option value="1" <?=$desc_prog == 1 ? 'selected' : '';?>>Si</option>
                              <option value="2" <?=$desc_prog == 2 ? 'selected' : '';?>>No</option>
                            </select>
                          </div>

                      <div id="progContent" style="display: <?=$display;?>;">
                          <label class="col-sm-3 control-label" for="start_date_desc"><?=label("StartDate");?></label>
                            <?php 
                                  $start_date_desc=$product->start_date_desc;
                                  if($start_date_desc)
                                      $start_date_desc=$product->start_date_desc->format('Y-m-d');
                                  else
                                      $start_date_desc=''; 
                            ?>
                          <div class="col-sm-9 form-group">  
                            <input type="date" value="<?=$start_date_desc?>" name="start_date_desc" id="start_date_desc" maxlength="50" class="form-control">
                          </div>

                          <label class="col-sm-3 control-label" for="end_date_desc"><?=label("EndDate");?></label>
                            <?php 
                                  $end_date_desc=$product->end_date_desc;
                                  if($end_date_desc)
                                      $end_date_desc=$product->end_date_desc->format('Y-m-d');
                                  else
                                      $end_date_desc=''; 
                            ?>

                          <div class="col-sm-9 form-group"> 
                            <input type="date" value="<?=$end_date_desc?>" name="end_date_desc" id="end_date_desc" maxlength="50" class="form-control form-control-sm">
                          </div>
                          
                          <label class="col-sm-3  control-label" for="commission_desc"><?=label("CommissionDesc");?></label>
                          <div class="col-sm-9 form-group"> 
                            <input type="text" name="commission_desc" id="commission_desc" maxlength="50" class="form-control" value="<?=$product->commission_desc;?>">
                          </div>
                        </div>
                      </div><!-- fin de well-->
                      <?php
                      $sale_by_quantity=$product->sale_by_quantity;
                      $display='block';
                      
                      if(!$sale_by_quantity)$sale_by_quantity=2;

                      if($sale_by_quantity==2)$display='none';      
                                         

                      ?>
                      <div class="col-sm-12 well" style="border: solid #666666 1px; padding-top: 10px">

                          <label class="col-sm-7 control-label" for="sale_by_quantity"><?=label("SaleByQuantity");?></label>
                          <div class="col-sm-5 form-group"> 
                            <select class="form-control" name="sale_by_quantity" id="sale_by_quantity" onchange="viewTabPrice(2)">
                              <option value="1" <?=$sale_by_quantity === 1 ? 'selected' : '';?>>Si</option>
                              <option value="2" <?=$sale_by_quantity === 2 ? 'selected' : '';?>>No</option>
                            </select>
                          </div>
                     
                      
                          <ul class="nav nav-tabs" id="tabPrice" style="display: <?=$display;?>;">
                            <li class="active"><a href="#P1" data-toggle="tab"><i class="fa fa-cog" aria-hidden="true"></i> <?=label("P1");?></a></li>
                            <li class=""><a href="#P2" data-toggle="tab"><i class="fa fa-cog" aria-hidden="true"></i> <?=label("P2");?></a></li>
                            <li class=""><a href="#P3" data-toggle="tab"><i class="fa fa-cog" aria-hidden="true"></i> <?=label("P3");?></a></li>
                         </ul>
                          <div class="tab-content none" id="tabPriceContent" style="display: <?=$display;?>;">
                          <!-- General setting tab -->
                           <?php
                            $margin_1=$product->price_1*$product->utility_1/100;
                            $margin_2=$product->price_2*$product->utility_2/100;
                            $margin_3=$product->price_3*$product->utility_3/100;
                            ?>
                            <div class="tab-pane fade in active" id="P1">
                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="min_1"><?=label("Min1");?></label>
                                  <input type="text" name="min_1" id="min_1" maxlength="50" class="form-control" value="<?=$product->min_1;?>">
                                </div>
                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="max_1"><?=label("Max1");?></label>
                                  <input type="text" name="max_1" id="max_1" maxlength="50" class="form-control" value="<?=$product->max_1;?>">
                                </div>
                                 <label class="col-sm-3 control-label" for="price_1"><?=label("Pr1");?></label>
                                 <div class="col-sm-9 form-group"> 
                                  <input type="text" name="price_1" id="price_1" maxlength="50" class="form-control" value="<?=$product->price_1;?>">
                                </div>
                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="utility_1"><?=label("U1");?></label>
                                  <input type="text" name="utility_1" id="utility_1" maxlength="50" class="form-control" value="<?=$product->utility_1;?>">
                                </div>

                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="margin_1"><?=label("M1");?></label>
                                  <p class="help-block" id="margin_1"><?=$margin_1;?></p>
                                  
                                </div>
                            </div>
                            <!-- General setting tab -->
                            <div class="tab-pane fade in" id="P2">
                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="min_2"><?=label("Min2");?></label>
                                  <input type="text" name="min_2" id="min_2" maxlength="50" class="form-control" value="<?=$product->min_2;?>">
                                </div>
                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="max_2"><?=label("Max2");?></label>
                                  <input type="text" name="max_2" id="max_2" maxlength="50" class="form-control" value="<?=$product->max_2;?>">
                                </div>
                                 <label class="col-sm-3 control-label" for="price_2"><?=label("Pr2");?></label>
                                 <div class="col-sm-9 form-group"> 
                                  <input type="text" name="price_2" id="price_2" maxlength="50" class="form-control" value="<?=$product->price_2;?>">
                                </div>
                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="utility_2"><?=label("Ut2");?></label>
                                  <input type="text" name="utility_2" id="utility_2" maxlength="50" class="form-control" value="<?=$product->utility_2;?>">
                                </div>
                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="margin_2"><?=label("Ga2");?></label>
                                  <p class="help-block" id="margin_2"><?=$margin_2;?></p>
                                </div>
                            </div>
                            <!-- General setting tab -->
                            <div class="tab-pane fade in" id="P3">
                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="min_3"><?=label("Min3");?></label>
                                  <input type="text" name="min_3" id="min_3" maxlength="50" class="form-control" value="<?=$product->min_3;?>">
                                </div>
                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="max_3"><?=label("Max3");?></label>
                                  <input type="text" name="max_3" id="max_3" maxlength="50" class="form-control" value="<?=$product->max_3;?>">
                                </div>
                                 <label class="col-sm-3 control-label" for="price_3"><?=label("Pr3");?></label>
                                 <div class="col-sm-9 form-group"> 
                                  <input type="text" name="price_3" id="price_3" maxlength="50" class="form-control" value="<?=$product->price_3;?>">
                                </div>
                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="utility_3"><?=label("Ut3");?></label>
                                  <input type="text" name="utility_3" id="utility_3" maxlength="50" class="form-control" value="<?=$product->utility_3;?>">
                                </div>
                                <div class="col-sm-6 form-group"> 
                                  <label class="control-label" for="margin_3"><?=label("Ga3");?></label>
                                  <p class="help-block" id="margin_3"><?=$margin_3;?></p>
                                </div>
                            </div>

                          </div><!--//fin de tab coontent-->

                      </div><!--//fin de well-->

                      <div class="form-group">
                         <button type="submit" class="btn btn-green col-md-12 flat-box-btn"><?=label("Submit");?></button>
                      </div>


             </div>

        </div> 

        
        
<?php echo form_close(); ?>
   </div>
</div>
<br><br>

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