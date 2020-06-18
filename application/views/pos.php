<!-- Page Content -->
<style>

.left-side {
   border-radius: 10px;
}
.right-side {
   border-radius: 10px;
}
#columna_left_pos {
  height: auto;
}
.Hold {
    margin: 0px; 
    padding: 0px 10px;
    padding-bottom: 5px;
}
#searchContaner {
    margin-top: 5px;
}
.categories{
    margin: 0px; 
    padding: 7px;  
}
.product {
    height: 102px;
    width: 128px;
    font-size: x-small;
    text-align: center;
    margin: 5px;
    padding: 5px;
    background: whitesmoke;
    color: black;
    
}
.product2 {
    height: 112px;
    width: 138px;
    margin-top: 5px;

    
}
.row {
   margin-right: 0px; 
   margin-left: 0px; 
}
.table_pos_subtotal_text_total{
      font-size: 32px;
      text-align: right;
}
.note-editor.note-frame .note-editing-area .note-editable{
 height: 130px;

}
.campanita{
  -webkit-animation: tiembla 0.5s infinite;
}
@-webkit-keyframes tiembla{
  0%  { -webkit-transform:rotateZ(-5deg); }
  50% { -webkit-transform:rotateZ( 0deg) scale(.8); }
  100%{ -webkit-transform:rotateZ( 5deg); }
}
#cambioticket{

   -webkit-animation-name: cambia_color;
   -webkit-animation-iteration-count: infinite;
   -webkit-animation-timing-function: ease-out;
   -webkit-animation-duration: 2s;
}
@-webkit-keyframes cambia_color {
    0% {color: #fff;}
    59% {color: #ff0;}
    100% {color: #f80;}
}



</style>
<script type="text/javascript">

var saleID;


document.onkeydown = function(e) {    

    var valor=$('#hdnItem').val();

    var valorProd=$('#hdnSearchProduct').val();
    var valorInvoice=$('#hdnSearchInvoice').val();
    var tecla=e.keyCode;
    //console.log(tecla);
    if(valor>0)
    {
      var pos=-1;
      var posale_id;
      for(i=0;i<valor;++i)
      {
        var val=$("#hdnItemSeleted").val();

          if(val==i)
          {
              pos=i;

              posale_id=$("#posale_id_"+pos).html();
          }
      }
      if(pos>-1)
      {  
        var oldValue = $("#qt-"+posale_id).val();
        if(tecla==37)
        {
           
            if (oldValue > 1) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                var newVal = 1;
            }
            $("#qt-"+posale_id).val(newVal);
            edit_posale(posale_id);
        }
        if(tecla==39)
        {

            var newVal = parseFloat(oldValue) + 1;
            $("#qt-"+posale_id).val(newVal);
            
            edit_posale(posale_id);

        }
        if(tecla==33)
        {
              $("#rowItem_"+val).css("background-color", "white");
         
              if(val==0)
                val=valor-1;
              else
                val=parseInt(val)-1;

              $("#hdnItemSeleted").val(val);
              posale_id=$("#posale_id_"+val).html();
              product_id=$("#product_id_"+val).val();
              $("#qt-"+posale_id).select();
              $("#rowItem_"+val).css("background-color", "rgb(162, 226, 232)");
              product_view(product_id);

        }
        if(tecla==34)
        {
              $("#rowItem_"+val).css("background-color", "white");
              posale_id=$("#posale_id_"+val).html();
              $("#qt-"+posale_id).blur();
              // $(".barcode").blur();

         
              if(val==valor-1)
                val=0;
              else
                val=parseInt(val)+1;

              $("#hdnItemSeleted").val(val);
              posale_id=$("#posale_id_"+val).html();
              product_id=$("#product_id_"+val).val();
              $("#qt-"+posale_id).select();
              $("#rowItem_"+val).css("background-color", "rgb(162, 226, 232)");
              product_view(product_id);
        }
        if(tecla==46)
        {
              var fondo=$("#rowItem_"+val).css("background-color");          
              posale_id=$("#posale_id_"+val).html();          
              if(fondo=='rgb(162, 226, 232)')
              {
                delete_posale(posale_id);
              }  
        }
      }
    }
    if(valorProd>-1)
    {
        var val=$("#hdnProductSeleted").val();
        if(tecla==40)
        {              
            if(val==-1 || val==valorProd-1)
            {
              $("#hdnProductSeleted").val(0);
              $("#rowProduct_0").css("background-color", "rgb(162, 226, 232)");
              document.getElementById("rowProduct").scrollIntoView();

              if(val==valorProd-1 && valorProd>1)
                  $("#rowProduct_"+val).css("background-color", "white");

            } 
            else
            {
              if(val>10)
              {              
                    var pos=val-10;
                    if(pos<=0)
                      document.getElementById("rowProduct").scrollIntoView();
                    else
                      document.getElementById("rowProduct_"+pos).scrollIntoView();

              }

              $("#rowProduct_"+val).css("background-color", "white");
              val=parseInt(val)+1;
              $("#hdnProductSeleted").val(val);
              $("#rowProduct_"+val).css("background-color", "rgb(162, 226, 232)");

            }

        }
        if(tecla==38)
        {
              
            if(val==-1 || val==0)
            {
              $("#hdnProductSeleted").val(valorProd-1);
              $("#rowProduct_"+(valorProd-1)).css("background-color", "rgb(162, 226, 232)");
              //$("#resultPrice").scrollTop(1000);
              document.getElementById("rowProduct_"+(valorProd-1)).scrollIntoView();

              if(val==0 && valorProd>1)
                  $("#rowProduct_0").css("background-color", "white");

            } 
            else
            {
              
              if(val>10)          
              {
                var pos=val-10;
                document.getElementById("rowProduct_"+pos).scrollIntoView();

              }
              else
                  document.getElementById("rowProduct").scrollIntoView();

              $("#rowProduct_"+val).css("background-color", "white");
              val=parseInt(val)-1;
              $("#hdnProductSeleted").val(val);
              $("#rowProduct_"+val).css("background-color", "rgb(162, 226, 232)");

            }

        }
        $("#searchPrice").focus();

    }
    //////////////facturas buscar
    if(valorInvoice>-1)
    {
        var val=$("#hdnInvoiceSeleted").val();
        if(tecla==40)
        {
                if(val==-1 || val==valorInvoice-1)
                {
                  $("#hdnInvoiceSeleted").val(0);
                  $("#rowInvoice_0").css("background-color", "rgb(162, 226, 232)");
                  document.getElementById("rowInvoice").scrollIntoView();

                  if(val==valorInvoice-1 && valorInvoice>1)
                      $("#rowInvoice_"+val).css("background-color", "white");

                } 
                else
                {
                  if(val>10)
                  {

                      var pos=val-10;
                      if(pos<=0)
                        document.getElementById("rowInvoice").scrollIntoView();
                      else
                      document.getElementById("rowInvoice_"+pos).scrollIntoView();

                  }

                  $("#rowInvoice_"+val).css("background-color", "white");
                  val=parseInt(val)+1;
                  $("#hdnInvoiceSeleted").val(val);
                  $("#rowInvoice_"+val).css("background-color", "rgb(162, 226, 232)");

                }

        }
        if(tecla==38)
        {
              
            if(val==-1 || val==0)
            {

              $("#hdnInvoiceSeleted").val(valorInvoice-1);
              $("#rowInvoice_"+(valorInvoice-1)).css("background-color", "rgb(162, 226, 232)");

              document.getElementById("rowInvoice_"+(valorInvoice-1)).scrollIntoView();

              if(val==0 && valorInvoice>1)
                  $("#rowInvoice_0").css("background-color", "white");

            } 
            else
            {
              
              if(val>10)          
              {
                var pos=val-10;

                document.getElementById("rowInvoice_"+pos).scrollIntoView();

              }
              else
                  document.getElementById("rowInvoice").scrollIntoView();

              $("#rowInvoice_"+val).css("background-color", "white");
              val=parseInt(val)-1;
              $("#hdnInvoiceSeleted").val(val);
              $("#rowInvoice_"+val).css("background-color", "rgb(162, 226, 232)");

            }

        }
        $("#searchInvoice").focus();

    }
    if(tecla==27)
    {
         //console.log(tecla);
         $('#barCodeSearch').focus();
         $('#barCodeSearch').select();

    }
};
//$(function() {
$(document).ready(function() {
var clicando= false;

 // Evento del segundo boton


    $('#AddSale').on('shown.bs.modal', function() {
      $('#PaidReal').val('');
      $('#PaidReal').trigger('focus');
    });
    $('#SearchPriceModal').on('shown.bs.modal', function() {
      $('#searchPrice').trigger('focus');
    });
    $('#SearchInvoiceModal').on('shown.bs.modal', function() {
      $('#searchInvoice').trigger('focus');
    });
    $('#CashinHand').on('shown.bs.modal', function() {
      $('#cash').trigger('focus');
    });
    $('#modalQtPosale').on('shown.bs.modal', function() {
      $('#qtposale').trigger('focus');
    });
    $('#modalAuthDiscount').on('shown.bs.modal', function() {
      $('#authdiscount').trigger('focus');
    });
    $('#modalAuthRemision').on('shown.bs.modal', function() {
      $('#authremision').trigger('focus');
    });
    $('#modalAuthAnular').on('shown.bs.modal', function() {
      $('#authanular').trigger('focus');
    });
    $('#ticket').on('shown.bs.modal', function() {
      $('#btnTicket').trigger('focus');
    });
    $('#devolucion').on('shown.bs.modal', function() {
      $('#btnDevolucion').trigger('focus');
    });
    $('#ModalHelp').on('shown.bs.modal', function() {
      $('#btnMenuBtn').trigger('focus');
    });

    if ( $("#ModalCaja") ) {
      $('#ModalCaja').on('shown.bs.modal', function() {
        $('#b100mil').trigger('focus');
      });
    }
    $('#Addpayament').on('shown.bs.modal', function() {
      $('#PaidPos').val('');
      $('#PaidPos').trigger('focus');
    });
   
  });


</script>

<?php if (!$this->session->userdata('register'))
{?>


   <!--****************************************************-->
   <!--****************************************************-->
   <!--SELECTOR DE TIENDAS-->
   <!--****************************************************-->
   <!--****************************************************-->
   <jscr>
   <div class="container container-small">
      <div class="row">
         <h1 class="text-center choose_store"> <?=label('ChooseStore');?> </h1>
      </div>
      <div class="row">
         <ul id="storeline">
            <?php      

            //print_r($Store); 
 
            foreach ($stores as $store):
                  $statusClass='store_close';
                  $storeLabel='Cerrada';
                  $status=0;
            
             ?>
             <?php if($this->user->role == "admin"){
                    $statusClass='store_close';
                    $storeLabel='Cerrada';
                    $status=0;
                     foreach ($holdIdStore as $row):
                      if($store->id==$row->store_id)
                      {
                          $statusClass='store_open';
                          $storeLabel='Abierto';
                          $status=1;
                      }
                      endforeach;
              ?>
                <a href="javascript:void(0)"  onclick="OpenRegister(<?=$status;?>, <?=$store->id;?>)">
                  <li class="listing clearfix">
                    <div class="image_wrapper">
                      <img src="<?=base_url()?>assets/img/store.svg" alt="store">
                    </div>
                    <div class="info">
                      <span class="store_title"><?=$store->name;?></span>
                      <span class="store_info"><?=$store->city;?> <span>&bull;</span> <?=$store->phone;?> <span>&bull;</span> <?=$store->email;?></span>
                    </div>
                    <span class="store_type <?=$statusClass;?>"><?=$storeLabel;?></span>
                  </li>
                </a>
              <?php 


            }elseif($storeIdUser==$store->id){
                  if($storeIdUser==$store->id)
                  {                  
                      if($holdIdStore>0)
                      {
                          $statusClass='store_open';
                          $storeLabel='Abierto';
                          $status=1;
                      }
                   }   
                ?>
                <a href="javascript:void(0)"  onclick="OpenRegister(<?=$status;?>, <?=$store->id;?>)">
                  <li class="listing clearfix">
                    <div class="image_wrapper">
                      <img src="<?=base_url()?>assets/img/store.svg" alt="store">
                    </div>
                    <div class="info">
                      <span class="store_title"><?=$store->name;?></span>
                      <span class="store_info"><?=$store->city;?> <span>&bull;</span> <?=$store->phone;?> <span>&bull;</span> <?=$store->email;?></span>
                    </div>
                    <span class="store_type <?=$statusClass;?>"><?=$storeLabel;?></span>
                  </li>
                </a>
                <?php }
            //}
                 endforeach;?>
         </ul>
      </div>
      <div style="float: left;">         
         <a><i class="glyphicon glyphicon-print"></i> <?=label("último cierre de caja");?></a>
         
      </div>
      <div style="float: right;">
         <h5><?=label('Licencia de uso');?>: <?=$licencias->licencia;?> </h5>
         <h5><?=label('Fecha de activación');?>: <?=$licencias->date_activo->format('d/m/Y');?></h5>
         <h5><?=label('Última actualización');?>: <?=$licencias->date_activo->format('d/m/Y');?></h5>
         
      </div>
      
   </div>
   <script type="text/javascript">
   function OpenRegister(status, storeid, storename, storecity, storephone, storeemail){

      if(status == 0) {
         $('#CashinHand').modal('show');
         $('#store').val(storeid);
      }else {
         window.location.href = "<?php echo site_url('pos/openregister/')?>/" + storeid;
      }
   }

   </script>

   <!-- Modal add user -->
   <div class="modal fade" id="CashinHand" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
       <div class="modal-content">
         <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
           <h4 class="modal-title" id="myModalLabel"><?=label("CashinHand");?></h4>
         </div>
         <?php echo form_open_multipart('pos/openregister'); ?>
         <div class="modal-body">
               <div class="form-group">
                <label for="CashinHand"><?=label("CashinHand");?></label>
                <input type="number" step="any" name="cash" Required class="form-control" id="cash" placeholder="<?=label("CashinHand");?>">
                <input type="hidden" name="store" class="form-control" id="store">
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
   <?php
}else {?>
<!--FIN-SELECTOR DE TIENDAS-->
<!--****************************************************-->

<!--******************************-->
<!--******************************-->
<!--CONTENEDOR DEL POS-->
<!--******************************-->
<!--******************************-->

<div class="container-fluid" style="padding: inherit;">
   <!-- 
    #####  #   #   ###     #    ####   #####  #####    #    ####    ###
    #      #   #  #   #   # #    #  #  #          #   # #    #  #  #   #
    #      ##  #  #      #   #   #  #  #         #   #   #   #  #  #   #
    ####   # # #  #      #   #   ###   ####     #    #   #   #  #  #   #
    #      #  ##  #      #####   #  #  #       #     #####   #  #  #   #
    #      #   #  #   #  #   #   #  #  #      #      #   #   #  #  #   #
    #####  #   #   ###   #   #  ####   #####  #####  #   #  ####    ###
   -->
 <div class="row" id="pos_completo">   
   <div class="col-sm-12" id="pos_encabezado" style="padding-left: 0px;padding-right: 0px;">   
         <div class="col-md-8 right-side_pos_total table_pos_subtotal_text">
               
               <!--******************************************-->
               <!--******************************************-->
               <!--TOTALES DE LA FACTURA -->
               <!-- <div class="footer-section"> -->
                <table class="table table_pos_subtotal" id="table_pos_subtotal">
                        <tr style="display: none;">
                           <td class="active">
                              <?=label("OrderTAX");?>
                           </td>
                           <td class="whiteBg table_pos_subtotal_text">
                              <input type="text" value="<?=$this->setting->tax;?>" onchange="total_change()" id="<?=strval($this->setting->keyboard) === '1' ? 'num01' : ''?>" class="total-input TAX" placeholder="N/A"  maxlength="5" >
                              <span class="float-right"><b id="taxValue"></b></span>
                           </td>
                        </tr>
                        <tr >
                           <td rowspan="2" width="25%" style="background: aliceblue;">
                              <a class="" href="#">
                                <?php if($this->setting->logo){ ?>
                                  <img src="<?=base_url()?>files/Setting/<?=$this->setting->logo;?>" alt="logo"  >
                                <?php } else { ?>
                                  <img src="<?=base_url()?>assets/img/logo.png" alt="logo"     height= "45px" >
                                <?php } ?>
                              </a>
                            </td>
                           <td class="whiteBg table_pos_datos_empresa_text" width="25%">
                            <?= $this->setting->companyname;?>
                           </td>
                     
                           <td class="active" width="25%"  >
                              <?=label("SubTotal");?>
                           </td>
                           <td class="whiteBg table_pos_subtotal_text">
                              <span class="float-right"><b id="ItemsNum"><span></span> <?=label("item");?></b></span>
                              <span id="Subtot" style="display: none;"></span> <span id="subTotalReal"></span> 
                           </td>
                        </tr>
                        <tr >
                          <td class="table_pos_datos_empresa table_pos_datos_empresa_text">
                            <a href="https://adysgem.com" target="blank_">https://adysgem.com</a>
                           </td>                        
                   
                           <td class="active">
                              <?=label("Discount");?> (%)
                           </td>
                           <td class="whiteBg table_pos_subtotal_text"><input type="text" value="<?=$this->setting->discount;?>" onchange="PushDiscount();" id="num02" class="total-input Remise" placeholder="N/A" maxlength="5" <?php if($this->user->role !== "admin"){?> readonly <?php }?> >
                              <span class="float-right"><b id="RemiseValue">0</b></span>
                           </td>
                        </tr>
                        <tr>
                          <td class="whiteBg " colspan="2" style="text-align: left;">
                            <span><?=label("caja");?>: </span><span class=""><?php echo $this->user->username?></span>
                            <span style="margin-left: 50px;"><?=label("cajero");?>: </span><span class=""><?php echo $this->user->firstname." ".$this->user->lastname?></span> 
                          </td> 
                          <td class="active table_barra_datos_text" colspan="2">
                            <div style="margin-top: 5px;">
                              <span id="totalVencidos" class="badge danger" style="background-color: red;float: left;"></span>
                              <span id="campanita" class="fa-lg glyphicon glyphicon-bell" style="float: left"></span>                        
                              <span id="totalPorVencer" class="badge gold" style="background-color: gold;color: black;float: left;"></span>
                            </div>
                            <div style="float: right; margin-top: -10px;">
                              <span style="font-size: 24px;">Factura N°: F-<b id="lastInvoice"><b></span>
                            </div>
                          </td>
                         
                        </tr>
                </table>
            
               <!--FIN - TOTALES DE LA FACTURA -->
               <!--******************************************-->

         </div>
         <div class="col-md-4 right-side_pos_total table_pos_subtotal_text">
            <table class="table table_pos_subtotal" style="margin-bottom: 3px;">
                <tr>
                  <td colspan="2" class="active table_pos_subtotal_text table_pos_subtotal_text_total">
                    <?=label("Total");?>
                  </td>
                  <td colspan="2" class="whiteBg light-blue text-bold table_pos_subtotal_text table_pos_subtotal_text_total">
                  <span id="total" style="display: none;"></span> <span id="totalReal"></span> 
                  </td>
                </tr>
                <tr style="height: 30px;font-size: initial;">
                  <td class="active" width="20%" >
                    <?=label("Petros");?>
                  </td>
                  <td class="whiteBg table_pos_subtotal_text" width="20%">
                    <span id="tazaPetros"></span> 
                  </td>
                  <td class="active" width="20%">
                    <?=label("Divisa");?>
                  </td>
                  <td class="whiteBg table_pos_subtotal_text">
                    <span><b id="tazaDolares"><span></span> <?=label("$");?></b></span> 
                    <span class="float-right"><b id="restoTaza"><span></span> <?=label("Bs");?></b></span>
                    
                  </td>
                </tr>
            </table>
          </div>
         <!-- FIN - TOTAL DE FACTURA -->
  <!-- FIN ENCABEZADO -->
     </div>


      <!--******************************-->
      <!--MENU PARA INTERCAMBIO DE TIENDA - CERRAR CUENTAS-->
      <ul class="cbp-vimenu">
        <li data-toggle="tooltip"  data-html="true" data-placement="left" title="<?=label('CloseRegister');?>"><a href="javascript:void(0)" onclick="CloseRegister()"><i class="fa fa-times" aria-hidden="true"></i></a></li>
        <li data-toggle="tooltip"  data-html="true" data-placement="left" title="<?=label('SwitchStore');?>"><a href="pos/switshregister"><i class="fa fa-random" aria-hidden="true"></i></a></li>
      </ul>
      <!--FIN - MENU PARA INTERCAMBIO DE TIENDA - CERRAR CUENTAS-->

      <!--******************************************-->
      <!--COLUMNA IZQUIERDO-->
      <!--******************************************-->
    <div class="col-sm-12" style="padding-left: 0px;padding-right: 0px; display: block;">
      <div id="columna_left_pos" class="col-md-3 left-side left-side_pos_total" style="display: none;" >
         <!-- FORMULARIO DE PRODUCTOS -->
            <form class="form-horizontal">
              <fieldset>
                <center>
                  <BR>
                  DETALLE DEL PRODUCTO
                  <BR><BR>
                  <div id="product_img">
                    <img src="<?=base_url()?>files/products/sin_imagen.jpg" width="140px" height="120px" alt="">
                  </div>
                </center>
                <br>

                <!-- Text input-->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="category_view"><?=label("Category");?></label>  
                  <div class="col-md-8">
                    <input id="category_view" name="category_view" type="text" placeholder="<?=label("Category");?>" class="form-control input-md">  
                  </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="brand_view"><?=label("Brand");?></label>  
                  <div class="col-md-8">
                    <input id="brand_view" name="brand_view" type="text" placeholder="<?=label("Brand");?>" class="form-control input-md">  
                  </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="reference_view"><?=label("Reference");?></label>  
                  <div class="col-md-8">
                    <input id="reference_view" name="reference_view" type="text" placeholder="<?=label("Reference");?>" class="form-control input-md">  
                  </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="tax_view"><?=label("tax");?></label>  
                  <div class="col-md-8">
                    <input id="tax_view" name="tax_view" type="text" placeholder="<?=label("tax");?>" class="form-control input-md">  
                  </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="price_view"><?=label("Al detal");?></label>  
                  <div class="col-md-8">
                    <input id="price_view" name="price_view" type="text" placeholder="<?=label("Precio al detal");?>" class="form-control input-md">  
                  </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="price_major"><?=label("Al mayor");?></label>  
                  <div class="col-md-8">
                    <input id="price_major" name="price_major" type="text" placeholder="<?=label("Precio al mayor");?>" class="form-control input-md">  
                  </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="price_credit"><?=label("A crédito");?></label>  
                  <div class="col-md-8">
                    <input id="price_credit" name="price_credit" type="text" placeholder="<?=label("Precio a crédito");?>" class="form-control input-md">  
                  </div>
                </div>


                <input id="barNavHdn" name="barNavHdn" type="hidden">  

              </fieldset>

              </form>
      
      </div>
      <!--FIN CUADRO left-->
      
      
      <!--*****************************-->
      <!--*****************************-->
      <!--CUADRO CATALOGO DE PRODUCTOS -->
      <!--COLUMNA DERECHA-->
      <!--******************************************-->
      <!--*****************************-->
      <!--*****************************-->
      <div id="columna_right_pos" class="col-md-8 right-side right-side_pos_total table_pos_subtotal_text nopadding">         
         <!--******************************************-->
         <!--BARRA DE SESIONES-->
         <!--******************************************-->
         <div class="row" style="display: block">
            <div class="row row-horizon">
               <span class="holdList">
                  <!-- list Holds goes here -->
               </span>
               <span class="Hold pl" onclick="AddHold()">+</span>
               <span class="Hold pl" onclick="RemoveHold()">-</span>
            </div>
         </div>
         <!--FIN - BARRA DE SESIONES-->
         <!--******************************************-->
       
         
         
         <div class="col-sm-12">   
            <!--* * * * * * * * * * * * * * * * * * * * * * *-->
            <!--BARRA DE BUSCAR PRODUCTOS-->
            <!--* * * * * * * * * * * * * * * * * * * * * * *-->
            <div class="col-sm-12 barra_cliente" style="margin-top: -10px;">

              <table class="table table_barra_datos">
                  <tr>
                     <td class="table_barra_datos_text" width="10%">
                        <span class=""><?=label("Customer");?></span>
                     </td>
                     <td class="table_barra_datos_text" width="40%">                        
                        <select class="js-example-basic-single" name="customerSelect" id="customerSelect">
                          <option value="0"><?=label("WalkinCustomer");?></option>
                          <?php foreach ($customers as $customer):?>
                             <option value="<?=$customer->id;?>"><?=$customer->firstname1;?> <?=$customer->lastname1;?></option>
                          <?php endforeach;?>
                        </select>
                     </td>
                     <td class="table_barra_datos" width="10%" >
                     </td>
                     <td style="text-align: right;" class="table_barra_datos"  width="40%" >
                        <span class="fecha" id="fecha">Fecha</span>
                     </td>
                  </tr>
                  
               </table>

            </div>
             <div id="searchContaner">
            <!-- LECTOR BARCODE -->
              <!-- <div class="input-group stylish-input-group"> -->
              <div class="col-sm-12" style="margin-top: -10px;">
                     <input type="text" autofocus="autofocus" id="barCodeSearch" class="form-control barcode" placeholder="<?=label('BarcodeScanner');?>" autocomplete="off">
              </div>
             <!--FIN LECTOR BARCODE-->
            </div>            
            <!--BARRA DE BUSCAR PRODUCTOS-->
         </div>         
         
         <!--******************************************-->
         <!--DETALLES DE FACTURA/PRODUCTOS-->
         <div class="col-sm-12">   
            <div class="col-xs-2 table-header">
               <h3><?=label("ProductCode");?></h3>
            </div>
            <div class="col-xs-4 table-header">
               <h3 class="text-center"><?=label("Product");?></h3>
            </div>
            <div class="col-xs-1 table-header">
               <h3 class="text-center"><?=label("price");?></h3>
            </div>
            <div class="col-xs-2 table-header nopadding">
               <h3 class="text-center"><?=label("Quantity");?></h3>
            </div>
            <div class="col-xs-1 table-header nopadding">
               <h3 class="text-center"><?=label("Desc.");?></h3>
            </div>
            <div class="col-xs-1 table-header nopadding">
               <h3 class="text-center"><?=label("IVA");?></h3>
            </div>
            <div class="col-xs-1 table-header nopadding">
               <h3 class="text-center"><?=label("Total");?></h3>
            </div>
            <div id="productList" style="height: 230px;">
               <!-- product List goes here  -->
            </div>
            <input type="hidden" id="hdnItemSeleted" value="-1">
         </div>
         <!--FIN - DETALLES DE FACTURA/PRODUCTOS-->
         <!--******************************************-->
            <!--*****************************-->
            <!-- BARRA DE BOTONES -->
            <div class="col-sm-12">

              <table class="barra_funciones" width="100%" >
                <!-- etiquetas superior -->
                <tr class="pos_buttons_labels">
                  <td width="9%"><?=label('F1');?></td>
                  <td width="9%"><?=label('CtF1');?></td>
                  <td width="9%"><?=label('F2');?></td>
                  <td width="9%"><?=label('CtF2 Clientes');?></td>
                  <td width="9%"><?=label('F3');?></td>
                  <td width="9%"><?=label('CtR Devoluciones');?></td>
                  <td width="9%"><?=label('CtJ Retornos');?></td>
                  <td width="9%"><?=label('F11');?></td>
                  <td width="9%"><?=label('F10');?></td>
                </tr>
              

                <tr class="area_botones_funcion">
                    <td><a href="javascript:void(0)" class="btn btn-block btn-default" id="btnhideShowMenu"><span class=" fa-lg fa fa-file-text-o"></span></a></td>

                    <td><a href="javascript:void(0)" class="btn btn-block btn-default" data-toggle="modal" data-target="#ModalHelp"><span class="fa-lg glyphicon glyphicon-info-sign"></span></a></td>
                    
                    <td><a href="#" class="btn btn-block btn-default" id="btnFocusProduct">
                        <span class="fa-lg fa fa-barcode"></span>
                        </a></td>

                    <td><a href="#" class="btn btn-block btn-default" id="btnFocusCostumer"><span class=" fa-lg glyphicon glyphicon-search"></span></a></td>

                    <td><a href="javascript:void(0)" class="btn btn-block btn-default" data-toggle="modal" data-target="#AddCustomer"><span class=" fa-lg glyphicon glyphicon-user"></span></a></td>
                   
                    <td><a href="javascript:void(0)" onclick="doReturnSales()" class="btn btn-block btn-default"><span class="fa-lg glyphicon glyphicon-erase"></span></a></td>
                   
                    <td><a href="javascript:void(0)" onclick="realizarDevolucion()" class="btn btn-block btn-default"><span class="fa-lg glyphicon glyphicon-transfer"></span></a></td>
                   
                    <td>
                      <a href="javascript:void(0)" onclick="cancelPOS()" class="btn btn-block btn-danger" data-toggle="modal"  data-toggle="tooltip" data-placement="top" title="" >
                        <span class=" fa-lg" >
                              <i class="glyphicon glyphicon-off -2x blue"></i>
                        </span>
                      </a>
                    </td>
                    <td valign="middle">
                      <a href="javascript:void(0)" onclick="openAddSale()" class="btn btn-block btn-success">
                        <span class=" fa-lg" >
                          <i class="glyphicon glyphicon-shopping-cart -1x blue"></i>
                        </span>
                      </a>
                    </td>
                    
                </tr>
                <tr class="area_botones_funcion" >
                  <!--  <td style="padding-top: 5px;"><a href="javascript:void(0)" class="btn btn-block btn-default" onclick="EditItems()">
                        <span class="fa-lg glyphicon glyphicon-edit"></span>
                    </a></td>-->
                    <td style="padding-top: 5px;"><a href="javascript:void(0)" class="btn btn-block btn-default" onclick="controlCalidad()">
                        <span class="fa-lg glyphicon glyphicon-bell"></span>
                    </a></td>
                    <td style="padding-top: 5px;"><a href="#" class="btn btn-block btn-default" data-toggle="modal" data-target="#SearchPriceModal"><span class=" fa-lg glyphicon glyphicon-tag"></span></a></td>
                    <td><a href="javascript:void(0)" class="btn btn-block btn-default" onclick="Descuento()"><span class=" fa-lg fa fa-cut"></span></a></td>
                    <td><a href="#" class="btn btn-block btn-default" data-toggle="modal" data-target="#AddExpence"><span class=" fa-lg fa fa-money"></span></a></td>    
                    <td><a href="javascript:void(0)" class="btn btn-block btn-default" onclick="CloseRegister()"><span class=" fa-lg fa fa-bank"></span></a></td>
                    <td><a href="javascript:void(0)" class="btn btn-block btn-default" onclick="buscarInvoice()"><span class=" fa-lg fa fa-ticket"></span></a></td>
                    <td><a href="javascript:void(0)" onclick="realizarRemision()" class="btn btn-block btn-default"><span class="fa fa-truck"></span></a>
                    </td>                   
                    <td>
                      <a href="javascript:void(0)" onclick="cotizar()" class="btn btn-block btn-primary">
                        <span class=" fa-lg" >
                              <i class="fa-lg fa fa-file-text-o"></i>
                        </span>
                      </a>
                    </td>
                    <td>
                      <a href="javascript:void(0)" onclick="realizarPedido()" class="btn btn-block btn-warning" data-toggle="modal"  data-toggle="tooltip" data-placement="top" title="" >
                        <span class=" fa-lg" >
                              <i class="fa-lg fa fa-file-text-o"></i>
                        </span>
                      </a>
                    </td>
                </tr>
                <tr class="pos_buttons_labels">
                    <!--<td width="9%"><?=label('CtA');?></td>-->
                    <td width="9%"><?=label('CtO Calidad');?></td>
                    <td width="9%"><?=label('F6');?></td>
                    <td width="9%"><?=label('F7');?></td>
                    <td width="9%"><?=label('F8');?></td>
                    <td width="9%"><?=label('F9');?></td>
                    <td width="9%"><?=label('CtF Facturas');?></td>
                    <td width="9%"><?=label('CtY Remisiones');?></td>
                    <td width="9%"><?=label('CtK');?></td>
                    <td width="9%"><?=label('CtM');?></td>
                </tr>
               
              </table>

              <span id="spnCode" name="spnCode"></span>


            </div>
            <!-- FIN - BARRA DE BOTONES -->
            <!--*****************************-->
         
      </div>
      <!--FIN COLUMNA DERECHA - 2DO CUADRO CATALOGO DE PRODUCTOS -->
      <!--*****************************-->
      <!--*****************************--> 
      <div id="columna_left_prod" class="col-md-4 left-side left-side_pos_total" style="display: block; padding-left: 0px; padding-right: 0px; margin-top: 0px;">
         <!-- FORMULARIO DE PRODUCTOS -->
            <div class="row row-horizon">
                  <span class="categories selectedGat" id=""><i class="fa fa-home"></i></span>
                  <?php foreach ($categories as $category):?>
                     <span class="categories" id="<?=$category->name;?>"><?=$category->name;?></span>
                  <?php endforeach;?>
               </div>
         
                  <div class="col-sm-12">
                  <div id="searchContaner">
                      <div class="input-group stylish-input-group">
                          <input type="text" id="searchProdTouch" class="form-control"  placeholder="<?=label('Search');?>" >
                          <span class="input-group-addon">
                              <button type="submit">
                                  <span class="glyphicon glyphicon-search"></span>
                              </button>
                          </span>
                      </div>
                  </div>
              </div>
              <div id="productListTouch" style="margin-left: -7px; margin-right: 0px;">
                 <?php foreach ($products as $product):?>
                   <?php $cheked = false;
                   $invis = $product->h_stores;
                   $invis = trim($invis, ",");
                   $array = explode(',', $invis); //split string into array seperated by ', '
                   foreach($array as $value) //loop over values
                   {
                      if($value == $this->store)
                        $cheked=true;
                   }
                   if($cheked) {?>
                   <div class="col-sm-4">
                     <a href="javascript:void(0)" class="addPct" onclick="selectProdTouch('<?=$product->reference;?>','<?=$product->name;?>' )">

                        <div class="product2 flat-box <?=$product->color;?>">
                           <div class="product flat-box ">
                            <?php if($product->photo){ ?><img src="<?=base_url()?>files/products/<?=$product->photothumb;?>" alt="<?=$product->name;?>" style="width: 100px;height: 70px;">
                            <?php }else{ ?>
                              <img id="idphoto-<?=$product->id;?>" src="<?=base_url()?>files/products/sin_imagen.jpg" alt="<?=$product->name;?>" style="width: 100px;height: 70px;">
                            <?php } ?><br>
                             <span id="procateTouch" style="display: none;"><?=$product->category_name;?></span>
                             <span id="pronameTouch"><?=character_limiter($product->name, 15);?></span><br>
                             <span id="procodeTouch"><?=$product->reference;?></span>
                           </div>
                         </div>
                         <input type="hidden" id="idphoto-<?=$product->id;?>" name="name" value="<?=$product->photothumb;?>" />
                         <input type="hidden" id="idreference-<?=$product->id;?>" name="reference" value="<?=$product->reference;?>" />
                         <input type="hidden" id="idname-<?=$product->id;?>" name="name" value="<?=$product->name;?>" />
                         <input type="hidden" id="idprice-<?=$product->id;?>" name="price" value="<?=$product->price;?>" />
                         <input type="hidden" id="idprice_major-<?=$product->id;?>" name="price_major" value="<?=$product->price_major;?>" />
                         <input type="hidden" id="idprice_credit-<?=$product->id;?>" name="price_credit" value="<?=$product->price_credit;?>" />
                         <input type="hidden" id="idcategory-<?=$product->id;?>" name="category" value="<?=$product->category_name;?>" />
                         <input type="hidden" id="idcurrency-<?=$product->id;?>" name="currency" value="<?=$this->setting->currency;?>" />
                         <input type="hidden" id="idcode-<?=$product->id;?>" name="code" value="<?=$product->code;?>" />
                         <input type="hidden" id="idtax-<?=$product->id;?>" name="tax" value="<?=$product->tax_name;?>" />
                         <input type="hidden" id="idtax_id-<?=$product->id;?>" name="tax_id" value="<?=$product->tax_sale_id;?>" />
                         <input type="hidden" id="idbrand-<?=$product->id;?>" name="brand" value="<?=$product->brand_name;?>" />                         
                         </a>
                   </div>

               <?php } ?>
            <?php endforeach;?>  
             </div>
      
      </div>
            <!--FIN COLUMNA DERECHA - 2DO CUADRO CATALOGO DE PRODUCTOS -->
 </div>

</div>
   <!--FIN DEL ROW-->
   <!--*****************************-->
   <!--*****************************-->
   

   
</div>
<!-- /.container -->


<script type="text/javascript">

 function getObject(obj)
  {
    var theObj;
    if (document.all) {
      if (typeof obj=='string') {
        return document.all(obj);
      } else {
        return obj.style;
      }
    }
    if (document.getElementById) {
      if (typeof obj=='string') {
        return document.getElementById(obj);
      } else {
        return obj.style;
      }
    }
    return null;
  }
 //-->

</script>
<!--<script src="<?=base_url()?>assets/js/bootstrap-combobox.js"></script>-->
<script type="text/javascript" src="<?=base_url()?>assets/js/select2.min.js"></script>

<script type="text/javascript">

$('.js-example-basic-single').select2({}).focus(function () { $(this).select2('open'); });

$(document).ready(function() {
  $('#dateexpense').datepicker({
         todayHighlight: true,
         format:'yyyy-mm-dd'
  }).datepicker("setDate",'now');;


 $('#barCodeSearch').focus();
  /* OCULTAR BARRA DE NAVEGACION DE LA APP */
  function hide_navbar_app(){
    // $('#navbarapp').hide();
    $('#navbarapp').fadeOut();
    $('#barNavHdn').val(false);
    $('body').css('padding-top','0px');
    $('.pace-done').css('padding-top','0px');
    $('.container-fluid').css('margin-top', '5px');
  }
  /* MOSTRAR BARRA DE NAVEGACION DE LA APP */
  function show_navbar_app(){
    // $('#navbarapp').show();
    $('#navbarapp').fadeIn();
    $('#barNavHdn').val(true);
    //$('#btnshow').hide();
    //$('#btnhide').fadeIn();
    $('body').css('padding-top','70px');
    $('.pace-done').css('padding-top','70px');
    $('.container-fluid').css('margin-top', '20px');
  }
  function hide_show_navbar_app(){
   
      if($("#barNavHdn").val()==='true')
        hide_navbar_app();   
      else
        show_navbar_app();
  }
  

  /* BOTON PARA OCULTAR BARRA DE NAVEGACION DE LA APP */
  $('#btnhideShowMenu').on( "click", function() {
    hide_show_navbar_app();
  });

  $('#btnFocusProduct').on( "click", function() {
    $("#barCodeSearch").focus();
  });

  $('#btnFocusCostumer').on( "click", function() {

      var elem=$(".combobox-container").children('div').children('input');
      elem.val('');
      elem.focus();

  });


  // LLAMADOA FUNCION PARA CERRAR LA VENTANA
  hide_navbar_app();

   $('#lastInvoice').load("<?php echo site_url('pos/lastInvoice')?>");

   $('#productList').load("<?php echo site_url('pos/load_posales')?>");
   $('#Subtot').load("<?php echo site_url('pos/subtot')?>", null, total_change);
   $('#ItemsNum span, #ItemsNum2 span').load("<?php echo site_url('pos/totiems')?>");
   $('.holdList').load("<?php echo site_url('pos/holdList/'.$this->register)?>");
   $('#totalPorVencer').load("<?php echo site_url('calidads/totalPorVencer')?>");
   $('#totalVencidos').load("<?php echo site_url('calidads/totalVencidos')?>");
   //var totalVencidos = $('#totalVencidos').text();
   //console.log(totalVencidos);
   //if(totalVencidos>0)
   $('#campanita').addClass('campanita');
          
   $('.Paid').show();
   $('.ReturnChange').show();
   $('.CreditCardNum').hide();
   $('.CreditCardHold').hide();
   $('.ChequeNum').hide();
   $('.stripe-btn').hide();

   $("#paymentMethod").change(function(){

      var p_met = $(this).find('option:selected').val();

      if (p_met === '0') {
         $('.Paid').show();
         $('.ReturnChange').show();
         $('.CreditCardNum').hide();
         $('.CreditCardHold').hide();
         $('.CreditCardMonth').hide();
         $('.CreditCardYear').hide();
         $('.CreditCardCODECV').hide();
         $('#CreditCardNum').val('');
         $('#CreditCardHold').val('');
         $('#CreditCardYear').val('');
         $('#CreditCardMonth').val('');
         $('#CreditCardCODECV').val('');
         $('.stripe-btn').hide();
         $('.ChequeNum').hide();
      } else if (p_met === '1') {
         $('.Paid').show();
         $('.ReturnChange').hide();
         $('.CreditCardNum').show();
         $('.CreditCardHold').show();
         $('.CreditCardMonth').show();
         $('.CreditCardYear').show();
         $('.CreditCardCODECV').show();
         $('.stripe-btn').show();
         $('.ChequeNum').hide();
      } else if (p_met === '2') {
         $('.Paid').hide();
         $('.ReturnChange').hide();
         $('.CreditCardNum').hide();
         $('.CreditCardHold').hide();
         $('.CreditCardMonth').hide();
         $('.CreditCardYear').hide();
         $('.CreditCardCODECV').hide();
         $('#CreditCardNum').val('');
         $('#CreditCardHold').val('');
         $('#CreditCardYear').val('');
         $('#CreditCardMonth').val('');
         $('#CreditCardCODECV').val('');
         $('.stripe-btn').hide();
         $('.ChequeNum').show();
      } else if (p_met === '3') {
         $('.Paid').hide();
         $('.ReturnChange').hide();
         $('.CreditCardNum').hide();
         $('.CreditCardHold').hide();
         $('.CreditCardMonth').hide();
         $('.CreditCardYear').hide();
         $('.CreditCardCODECV').hide();
         $('#CreditCardNum').val('');
         $('#CreditCardHold').val('');
         $('#CreditCardYear').val('');
         $('#CreditCardMonth').val('');
         $('#CreditCardCODECV').val('');
         $('.stripe-btn').hide();
         $('.ChequeNum').hide();
      }

   });
   /********************************* Credit Card infos section ****************************************/
   $('#CreditCardNum').validateCreditCard(function(result) {
      var cardtype = result.card_type == null ? '-' : result.card_type.name;
      $('.CreditCardNum i').removeClass('dark-blue');
      $('#' + cardtype).addClass('dark-blue');
   });

   $('#CreditCardNum').keypress(function (e) {
      var data = $(this).val();
      if(data.length > 22){

       if (e.keyCode == 13) {
           e.preventDefault();

           var c = new SwipeParserObj(data);

               $('#CreditCardNum').val(c.account);
               $('#CreditCardHold').val(c.account_name);
               $('#CreditCardYear').val(c.exp_year);
               $('#CreditCardMonth').val(c.exp_month);
               $('#CreditCardCODECV').val('');

           }
           else {
               $('#CreditCardNum').val('');
               $('#CreditCardHold').val('');
               $('#CreditCardYear').val('');
               $('#CreditCardMonth').val('');
               $('#CreditCardCODECV').val('');
           }

           $('#CreditCardCODECV').focus();
           $('#CreditCardNum').validateCreditCard(function(result) {
              var cardtype = result.card_type == null ? '-' : result.card_type.name;
              $('.CreditCardNum i').removeClass('dark-blue');
              $('#' + cardtype).addClass('dark-blue');
           });
   }

   });


   // ********************************* change calculations
  $('#PaidReal').on('keyup',function(e) {

    var tecla = e.keyCode;
    if(tecla==13)
    {

      verificarSalesBtn();
       
    }
    else
    {
      $(this).val(function(index, value) {
         var num = value.replace(/\./g,'');
         num = num.toString().split('').reverse().join('').replace(/(?=\d*\.?)(\d{3})/g,'$1.');
         num = num.split('').reverse().join('').replace(/^[\.]/,'');
         return num;

      });
      var res= this.value;
      var paid = res.split('.').join('');

      $('#Paid').val(parseFloat(paid));
      var change = -(parseFloat($('#total').text()) - parseFloat(paid));
      change = change.toFixed(<?=$this->setting->decimals;?>);
      change = new Intl.NumberFormat("de-DE").format(change);
     
      if(change < 0){
        
         $("#hdnVerificarCantidad").val(0);
         $('#ReturnChange span').text(change);
         $('#ReturnChange span').addClass( "red" );
         $('#ReturnChange span').removeClass( "light-blue" );
      }else{
         $('#ReturnChange span').text(change);
         $('#ReturnChange span').removeClass( "red" );
         $('#ReturnChange span').addClass( "light-blue" );
        $("#hdnVerificarCantidad").val(1);
      }
    }
  });

    //  search product
   $("#searchProdTouch").keyup(function(){
      // Retrieve the input field text
      var filter = $(this).val();
      // Loop through the list
      $("#productListTouch #pronameTouch").each(function(){
         // If the list item does not contain the text phrase fade it out
         if ($(this).text().search(new RegExp(filter, "i")) < 0) {
             $(this).parent().parent().parent().parent().hide();
         // Show the list item if the phrase matches
         } else {
             $(this).parent().parent().parent().parent().show();
         }
      });
   });
   //  search product modal
   $("#searchPrice").keyup(function(e){
      // Retrieve the input field text
      var tecla=e.keyCode;
      
      if(tecla!=38 && tecla!=40)
      {

        var filter = $(this).val();
        // Loop through the list
        $.ajax({
            url : "<?php echo site_url('productcontroller/searchPrice')?>/"+filter,
            type: "POST",
            success: function(data)
            {
               $('#hdnProductSeleted').val(-1);
               $('#resultPrice').html(data);
               //$('#barCodeSearch').val(filter);
               
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert("error");
            }
         });
      }
      if(tecla==13)
      {
            var val=$("#hdnProductSeleted").val();
            if(val>-1)
            {
              var id=$("#hdnIdProduct_"+val).val();
              var code=$("#codeProduct_"+val).html();
              $('.barcode').val(code);
              $('#SearchPriceModal').modal('hide');

              $('#modalProductQtPosale').html($('#idname-'+id).val());
              $('#qtposale').val(1);
              $('#qtposale').select();
              $('#modalQtPosale').modal('show');
            }
            


      }
   });
   //  search product modal
   $("#searchInvoice").keyup(function(e){
      // Retrieve the input field text
      var tecla=e.keyCode;
      
      if(tecla!=38 && tecla!=40)
      {

        var filter = $(this).val();
        // Loop through the list
        $.ajax({
            url : "<?php echo site_url('invoices/searchInvoice')?>/"+filter,
            type: "POST",
            success: function(data)
            {
               $('#hdnInvoiceSeleted').val(-1);
               $('#resultInvoice').html(data);
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert("error");
            }
         });
      }
      if(tecla==13)
      {
            var val=$("#hdnInvoiceSeleted").val();
            if(val>-1)
            {
                var id=$("#hdnIdInvoice_"+val).val();
                var paidmethod=$("#hdnInvoiceStatus_"+val).val();
                var in_activo=$("#hdnInvoiceInActivo_"+val).val();
                $('#SearchInvoiceModal').modal('hide');
                saleID=id;
                if(paidmethod==3)
                    $('#printSection').load("<?php echo site_url('invoices/payaments')?>/"+id);
                else  
                {
                   if(in_activo==2)
                      id=id+'NIT'+in_activo;  
                   
                   $('#printSection').load("<?php echo site_url('invoices/ShowTicket')?>/"+id);
                }
                $('#cambioticket').html('');
                $('#ticket').modal('show');
                if(in_activo==2)
                  $('#btnDeleteSale').attr("disabled", true);
                else
                  $('#btnDeleteSale').attr("disabled", false);

            }
           


      }
   });
   
   $("#authdiscount").keyup(function(e){
      // Retrieve the input field text
      var tecla=e.keyCode;
      
      if(tecla==13)
      {
          var pass = $(this).val();
          // Loop through the list
          $.ajax({
              url : "<?php echo site_url('auth/authdiscount')?>/"+pass,
              type: "POST",
              data:{type:1},
              success: function(data)
              {
                  $('#modalAuthDiscount').modal('hide');

                  if(data==0)
                  {
                      swal('Oops...', 'Clave no autorizada', 'error'); 
                  }
                  else       
                  {
                      $("#num02").removeAttr("readonly");

                      $("#num02").focus();
                      var valor=$('#hdnItem').val();
                      for(i=0;i<valor;++i)
                      {
                          var id=$("#posale_id_"+i).text();
                          $("#price-"+id).removeAttr("readonly");
                      }

                  }    

              },
              error: function (jqXHR, textStatus, errorThrown)
              {
                  alert("error");
              }
           });

      }
   });

   $("#authanular").keyup(function(e){
      // Retrieve the input field text
      var tecla=e.keyCode;
      
      if(tecla==13)
      {
          var pass = $(this).val();
          // Loop through the list
          $.ajax({
              url : "<?php echo site_url('auth/authdiscount')?>/"+pass,
              type: "POST",
              data:{type:2},
              success: function(data)
              {
                  $('#modalAuthAnular').modal('hide');

                  if(data==0)
                  {
                      swal('Oops...', 'Clave no autorizada', 'error'); 
                  }
                  else       
                  {
                      deleteSale();
                  }    

              },
              error: function (jqXHR, textStatus, errorThrown)
              {
                  alert("error");
              }
           });

      }
   });
$("#authremision").keyup(function(e){
      // Retrieve the input field text
      var tecla=e.keyCode;
      
      if(tecla==13)
      {
          var pass = $(this).val();
          // Loop through the list
          $.ajax({
              url : "<?php echo site_url('auth/authdiscount')?>/"+pass,
              type: "POST",
              data:{type:3},
              success: function(data)
              {
                  $('#modalAuthRemision').modal('hide');

                  if(data==0)
                  {
                      swal('Oops...', 'Clave no autorizada', 'error'); 
                  }
                  else       
                  {
                      doRemision();
                  }    

              },
              error: function (jqXHR, textStatus, errorThrown)
              {
                  alert("error");
              }
           });

      }
   });
        
    shortcut.add("Ctrl+Alt", function () {
    var number = $('.selectedHold').clone().children().remove().end().text();
    var numHolds = $(".holdList").children().length;
    var i=0;
    var arrayId = new Array(numHolds);
    $(".holdList >").each(function(){
        i++;
        var id=$(this).attr('id');
        //console.log(id);
        arrayId[i]=id;

     });
    for(i=1;i<=numHolds;i++){
        
        if(arrayId[i]==number)
        {
          if(i==numHolds)
            newNumber=arrayId[1];
          else
            newNumber=arrayId[i+1];
        }  

     }

     //console.log(newNumber);
     SelectHold(newNumber);

    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });
    
    shortcut.add("Ctrl+Shift", function () {
    
      AddHold();


    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });

    shortcut.add("Ctrl+F6", function () {
    console.log($('#columna_left_pos').css("display"));
      if($('#columna_left_pos').css("display") == 'none')
      {
         $('#columna_left_pos').css("display","block");
         $('#columna_left_prod').css("display","none");         
         $('#columna_left_prod').removeClass("col-md-4");
         $('#columna_left_prod').addClass("col-md-3");
         $('#columna_right_pos').removeClass("col-md-8");
         $('#columna_right_pos').addClass("col-md-9");
      }
      else
      {
         $('#columna_left_pos').css("display","none");
         $('#columna_left_prod').css("display","block");
         $('#columna_left_prod').removeClass("col-md-3");
         $('#columna_left_prod').addClass("col-md-4");
         $('#columna_right_pos').removeClass("col-md-9");
         $('#columna_right_pos').addClass("col-md-8");

      }


    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });

    shortcut.add("Ctrl+Delete", function () {
      //alert("Aquiiiiii");
      RemoveHold();

    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });

    shortcut.add("F1", function () {
    
      hide_show_navbar_app();
     
    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });
    
    shortcut.add("F2", function () {

      $('#barCodeSearch').focus();
      $('#barCodeSearch').select();

    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });
    
    shortcut.add("F3", function () {
    
      $("#AddCustomer").modal("show");  
    
    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });
    
    shortcut.add("F4", function () {

      if($("#paymentMethod").is(":focus"))
      { 
        $("#PaidReal").focus();
      }
      else
      {
        $("#paymentMethod").focus(); 
      }

    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });

    shortcut.add("F6", function () {        

        $('#hdnProductSeleted').val(-1);
        $('#searchPrice').val('');
        $('#resultPrice').html('');
        $('#SearchPriceModal').modal('show');

    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    }); 
    
    shortcut.add("F7", function () {
    <?php if($this->user->role === "admin"){?>
      $("#num02").focus();
    <?php }else{?>
      $("#authdiscount").val('');
      $('#modalAuthDiscount').modal('show');

    <?php }?>
  
    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });

    shortcut.add("F8", function () {

         $('#AddExpence').modal('show');
        
    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });

    shortcut.add("F9", function () {
    
      CloseRegister();      
  //    cancelPOS();

    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });

    shortcut.add("F10", function () {

    //      CloseRegister();
      openAddSale();
    
    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });

    shortcut.add("F11", function () {

      //$('#AddSale').modal('show');
        cancelPOS();

    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });

    // OTRAS TECLAS

    shortcut.add("Ctrl+C", function () {

      if($('#CloseRegister').data('bs.modal').isShown == true){

        SubmitRegister();

      }

    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });

    shortcut.add("Ctrl+Q", function () {

      if($('#AddExpence').data('bs.modal').isShown == true){
        $('#btnAddExpense').click();
      }

    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });

    shortcut.add("Ctrl+K", function () {

       cotizar();

    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });

    shortcut.add("Ctrl+M", function () {

       realizarPedido();

    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });

    shortcut.add("Ctrl+R", function () {

       doReturnSales();

    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });

    shortcut.add("Ctrl+F2", function () {
     

      $('.js-example-basic-single').focus();
      

    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });

   shortcut.add("Ctrl+F1", function () {

      $('#ModalHelp').modal('show');


    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });
        
  $('#barCodeSearch').bind('keyup', function (e) {
    var key = e.keyCode || e.which;
    
    if (key === 13) {
        searchBarcode();

    }
    /*else
    {
      var filter = $(this).val();
      if(filter.length==3)
      {
          $('#hdnProductSeleted').val(-1);
          $('#searchPrice').val(filter);
          //$('#resultPrice').html('');
          $('#resultPrice').load("<?php echo site_url('productcontroller/searchPrice')?>/"+filter);
          $('#SearchPriceModal').modal('show');
      }
    }*/
       

  });   
  $('#qtposale').bind('keyup', function (e) {
    var key = e.keyCode || e.which;
    if (key === 13) {
        barcode();

    };
  });
  shortcut.add("Ctrl+A", function () {
   

       EditItems();

    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
  });
  
  shortcut.add("Ctrl+Z", function () {

      if($('#CloseRegister').data('bs.modal').isShown == true){

        ReporteZ();

      }

    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });

    shortcut.add("Ctrl+F", function () {        
      
      buscarInvoice();

    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    }); 

  shortcut.add("Ctrl+D", function () {

      if($('#ticket').data('bs.modal').isShown == true)
      {

         if($('#btnDeleteSale').attr("disabled")!='disabled')
         {
            validarDeleteSale(); 
   
         }

      }

    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });
  shortcut.add("Ctrl+H", function () {
    
      if($('#CloseRegister').data('bs.modal').isShown == true){

      $("#ModalCaja").modal("show");  

      }

    
    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });
  shortcut.add("Ctrl+L", function () {

      if($('#ticket').data('bs.modal').isShown == true){

        addpymntBtn();

      }

    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });
  shortcut.add("Ctrl+O", function () {

       controlCalidad();


    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });
  shortcut.add("Ctrl+J", function () {

       realizarDevolucion();


    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });
  
  shortcut.add("Ctrl+1", function () {
     var val=$("#hdnItemSeleted").val();
     //alert(val);
     if(val>-1)
     {
         var posale_id=$("#posale_id_"+val).html();
         $("#price-"+posale_id).focus();
         $("#price-"+posale_id).select();
     }

       

    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });
    
  shortcut.add("Ctrl+2", function () {
     var val=$("#hdnItemSeleted").val();
     //alert(val);
     if(val>-1)
     {
         var posale_id=$("#posale_id_"+val).html();
         $("#qt-"+posale_id).focus();
         $("#qt-"+posale_id).select();

     }       

    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });
  shortcut.add("Ctrl+Y", function () {
   var customerSelect = $("#customerSelect").val();
   if(customerSelect>0)
   {
      <?php if($this->user->role === "admin"){?>
         doRemision();
      <?php }else{?>
        $("#authremision").val('');
        $('#modalAuthRemision').modal('show');

      <?php }?>
    }
    else
    {
         swal('Oops...', 'Debe seleccionar cliente', 'error'); 
    }
    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });


    
});
// FIN DE DOCUMENT READY





jQuery.displayDateTime = function(wrapper){ 
     var now    = new Date();    
     var months = new Array('Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre');
     var days   = new Array('Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado');
     
     var date   = now.getDate();
     var year   = now.getFullYear();
     var month  = now.getMonth()+1;
     var day    = now.getDay();
     
     var hour   = now.getHours();
     var minute = now.getMinutes();
     var second = now.getSeconds();
     
     day0        = ( day < 10 )? "0"+day : day;
     month0      = ( month < 10 )? "0"+month : month;
     
     hour       = ( hour < 10 )? "0"+hour : hour;
     minute     = ( minute < 10 )? "0"+minute : minute;
     second     = ( second < 10 )? "0"+second : second;
 
    var datetime = ''+days[day]+' '+date+'/'+month0+'/'+year+' - '+ hour +':'+ minute +':'+ second;
    $(wrapper).html(datetime);
 
    setTimeout('jQuery.displayDateTime("'+wrapper+'");','1000');
  };

jQuery.displayDateTime("span.fecha");


function realizarRemision(){
   var customerSelect = $("#customerSelect").val();
   if(customerSelect>0)
   {
   
      <?php if($this->user->role === "admin"){?>   
            doRemision();
      <?php }else{?>
            $('#modalAuthRemision').modal('show');
      <?php }?>
    }
    else
    {
         swal('Oops...', 'Debe seleccionar cliente', 'error'); 
    }

}
function validarDeleteSale(){
  <?php if($this->user->role === "admin"){?>   
        deleteSale();
  <?php }else{?>
        $('#modalAuthAnular').modal('show');
  <?php }?>
}
// //Cotizar
function openAddSale(){

      if($("#hdnItem").val()>0)
      {
          $("#hdnVerificarCantidad").val(0);
          $("#hdnVerificarSalesBtn").val(1);
          $('#AddSale').modal('show');  
      }
      else
      {
          swal('Oops...', 'Debe agregar al menos un producto al POS', 'error'); 

      }
 }

 function buscarInvoice() {

   var now    = new Date();    
   var date   = now.getDate();
   var year   = now.getFullYear();
   var month  = now.getMonth()+1;
   var day    = now.getDay();
   day0        = ( date < 10 )? "0"+date : date;
   month0      = ( month < 10 )? "0"+month : month;
   var created_at = year+'-'+month0+'-'+day0;
        
   $('#hdnInvoiceSeleted').val(-1);
   $('#searchInvoice').val('');
       //$('#resultInvoice').html('');
   $('#resultInvoice').load("<?php echo site_url('invoices/searchInvoice')?>/"+created_at);
   $('#SearchInvoiceModal').modal('show');
 
};
// //Cotizar
function ReporteZ() {

  $('#CloseRegister').modal('hide');
  $('#printSection').load("<?php echo site_url('pos/ReporteZ')?>");
  $('#ticket').modal('show');
  $('#btnDeleteSale').attr("disabled", true);

 
};
function doRemision(){

    $('#printSectionRemision').load("<?php echo site_url('pos/doReturnSales')?>");
    $('#remisiones').modal('show');

}
// //Cotizar
function cotizar() {


  $('#printSection').load("<?php echo site_url('pos/cotizar')?>");  
  $('#cambioticket').html('');    
  $('#ticket').modal('show');  
  $('#btnDeleteSale').attr("disabled", true);


 
};

function realizarPedido() {


  $('#printSectionPedido').load("<?php echo site_url('pos/pedido')?>");
  $('#pedido').modal('show');

 
};
function doReturnSales() {


  $('#printSectionReturn').load("<?php echo site_url('pos/doReturnSales')?>");
  $('#returnSales').modal('show');

 
};
function controlCalidad() {


  $('#resultControl').load("<?php echo site_url('calidads/viewCalidads')?>");
  $('#ControlCalidadModal').modal('show');

 
};
function realizarDevolucion() {


  $('#printSectionDevolucion').load("<?php echo site_url('devolucions/listar')?>");
  $('#devolucion').modal('show');

 
};
function deleteSale() {
  
  var id=$('#hdnTicketInvoice').val();
 
    $.ajax({
         url : "<?php echo site_url('invoices/ajax_delete')?>/"+id,
         type: "POST",
         dataType: "JSON",
         success: function(data)
         {
            $('#ticket').modal('hide');
            swal('Exito!', 'Factura anulada!', "success"); 


         },
         error: function (jqXHR, textStatus, errorThrown)
         {
            alert("error Anulando factura");
         }
      });
}

function addpymntBtn(){
  console.log(saleID);

   if(<?=$this->register ? 'true' : 'false';?>)
     $('#Addpayament').modal('show');
  else
      swal("<?=label("requiresRegister");?>");
}

function deletepayement(id){
   $.ajax({
       url : "<?php echo site_url('invoices/deletepayement')?>/"+id+"/"+saleID,
       type: "POST",
       success: function(data)
       {
          $('#printSection').load("<?php echo site_url('invoices/payaments')?>/"+saleID);
       },
       error: function (jqXHR, textStatus, errorThrown)
       {
          alert("error");
       }
  });
}
function AddPayement(type){
  //console.log(saleID);
      
      var createdBy = '<?php echo $this->user->firstname." ".$this->user->lastname;?>';
      var Paid = $('#PaidPos').val();
      var ccnum = $('#CreditCardNum').val();
      var ccmonth = $('#CreditCardMonth').val();
      var ccyear = $('#CreditCardYear').val();
      var ccv = $('#CreditCardCODECV').val();
      var paidMethod = $('#paymentMethod').find('option:selected').val();
      switch(paidMethod) {
          case '1':
              paidMethod += '~'+$('#CreditCardNum').val()+'~'+$('#CreditCardHold').val();
              break;
          case '2':
              paidMethod += '~'+$('#ChequeNum').val();
      }

     $.ajax({
         url : "<?php echo site_url('invoices/Addpayament')?>/"+type,
         type: "POST",
         data: {created_by: createdBy, paid: Paid, paidmethod: paidMethod, ccnum: ccnum, ccmonth: ccmonth, ccyear: ccyear, ccv: ccv, sale_id: saleID},
         success: function(data)
         {
            $('#printSection').load("<?php echo site_url('invoices/payaments')?>/"+saleID);
            $('#Addpayament').modal('hide');
            $('#btnTicket').trigger('focus');

         },
         error: function (jqXHR, textStatus, errorThrown)
         {
            alert("error");
         }
     });

     $('#CreditCardNum').val('');
     $('#CreditCardHold').val('');
     $('#CreditCardYear').val('');
     $('#CreditCardMonth').val('');
     $('#CreditCardCODECV').val('');
}



function EditItems() {


   var selected=$("#hdnItemSeleted").val();
        if(selected==-1)
        {
            var posale_id=$("#posale_id_0").html();
            var product_id=$("#product_id_0").val();
           //$("#qt-' . $posale->id . '").focus();
            $(".barcode").blur();
            $("#qt-"+posale_id).select();
            $("#hdnItemSeleted").val(0);

            $("#rowItem_0").css("background-color", "rgb(162, 226, 232)");
            product_view(product_id);

        }
        else
        {
            $("#rowItem_"+selected).css("background-color", "white");                  
            $("#hdnItemSeleted").val(-1);
            $(".barcode").focus();
            product_view(-1);

           //$("#qt-' . $posale->id . '").blur();

        }
   
 
};



function selectProdTouch(code, name){

    $('.barcode').val(code);
    $('#modalProductQtPosale').html(name);
    $('#qtposale').val(1);
    $('#qtposale').select();
    $('#modalQtPosale').modal('show');

}
// barcode scanner

function searchBarcode(){

   var code = $('.barcode').val();
   if(code.length>0)
   {
      $.ajax({
       url : "<?php echo site_url('pos/findproduct')?>/"+code,
       type: "POST",
       dataType: "JSON",
       success: function(data)
       {
          //alert(data);
          if(data>0)
          {
            $('#modalProductQtPosale').html($('#idname-'+data).val());
            $('#qtposale').val(1);
            $('#qtposale').select();
            $('#modalQtPosale').modal('show');
          }
          else 
             {
                $('.barcode').val('');
                swal('Oops...', 'Código de producto no existe', 'error'); 
             }


   
       }
    });
  }
};
function barcode(){

   var code = $('.barcode').val();
   //console.log(code);
   var qtposale = $('#qtposale').val();
   $('#modalQtPosale').modal('hide');

   $.ajax({
       url : "<?php echo site_url('pos/findproduct')?>/"+code,
       type: "POST",
       dataType: "JSON",
       data:{qtposale:qtposale},
       success: function(data)
       {
          add_posale(data, qtposale);

          $('.barcode').val('');
       },
       error: function (jqXHR, textStatus, errorThrown)
       {
          alert("error 333");

       }
   });

};

//  **********************select categorie

$(".categories").on("click", function () {
   // Retrieve the input field text
   var filter = $(this).attr('id');
   $(this).parent().children().removeClass('selectedGat');
   console.log(filter);

   $(this).addClass('selectedGat');
   // Loop through the list
   $("#productListTouch #procateTouch").each(function(){
      // If the list item does not contain the text phrase fade it out
      console.log($(this).text());
      if ($(this).text().search(new RegExp(filter, "i")) < 0) {
         $(this).parent().parent().parent().parent().hide();
         // Show the list item if the phrase matches
      } else {
         $(this).parent().parent().parent().parent().show();
      }
   });
});
// function to calculate a percentage from a number
function percentage(tot, n) {
   var perc;
   perc = ((parseFloat(tot) * (parseFloat(n ? n : 0)*0.01)));
   return perc;
}
// function to calculate the total number
function total_change() {
   var tot, taxValue;
   if ( ($('.TAX').val().indexOf('%') == -1) && ($('.Remise').val().indexOf('%') == -1) ) {

      tot = parseFloat($('#Subtot').text().replace(/ /g,''));
      $('#total').text(tot.toFixed(<?=$this->setting->decimals;?>));
      $('#TotalModal').text(tot.toFixed(<?=$this->setting->decimals;?>));
   
   }else if ( ($('.TAX').val().indexOf('%') != -1) && ($('.Remise').val().indexOf('%') == -1) ) {
   
      tot = parseFloat($('#Subtot').text().replace(/ /g,''));
      taxValue=percentage($('#Subtot').text(), $('.TAX').val()).toFixed(<?=$this->setting->decimals;?>);
      $('#total').text(tot.toFixed(<?=$this->setting->decimals;?>));
      $('#TotalModal').text(tot.toFixed(<?=$this->setting->decimals;?>));
   
   }else if ( ($('.TAX').val().indexOf('%') != -1) && ($('.Remise').val().indexOf('%') != -1) ) {
   
      tot = parseFloat($('#Subtot').text()) + percentage($('#Subtot').text(), $('.TAX').val());
      taxValue=percentage($('#Subtot').text(), $('.TAX').val()).toFixed(<?=$this->setting->decimals;?>);
      tot = parseFloat($('#Subtot').text().replace(/ /g,''));      
      $('#total').text(tot.toFixed(<?=$this->setting->decimals;?>));
      $('#TotalModal').text(tot.toFixed(<?=$this->setting->decimals;?>));
   
   }else if ( ($('.TAX').val().indexOf('%') == -1) && ($('.Remise').val().indexOf('%') != -1) ) {
   
      tot = parseFloat($('#Subtot').text().replace(/ /g,''));
      $('#total').text(tot.toFixed(<?=$this->setting->decimals;?>));
      $('#TotalModal').text(tot.toFixed(<?=$this->setting->decimals;?>));
   
   }
   console.log(tot);
   $('#tazaPetros').load("<?php echo site_url('pos/tazaPetros')?>/"+tot);
   $('#tazaDolares span').load("<?php echo site_url('pos/tazaDolares')?>/"+tot);
   $('#restoTaza span').load("<?php echo site_url('pos/restoTaza')?>/"+tot);
   
   var totalReal= new Intl.NumberFormat("de-DE").format($('#total').text());
   $('#totalReal').text(totalReal);
   var subTotalReal= new Intl.NumberFormat("de-DE").format($('#Subtot').text());
   $('#subTotalReal').text(subTotalReal);
   $('#taxValue').text(new Intl.NumberFormat("de-DE").format(taxValue));
   var TotalModalReal= new Intl.NumberFormat("de-DE").format($('#TotalModal').text());
   $('#TotalModal').text('<?=label("Total");?> '+TotalModalReal);
      
}

function cliente_especial()
{
  //console.log($("#num02").attr("readonly"));
  
  if($("#num02").attr("readonly")!='readonly')
  { 
     var valor=$('#hdnItem').val();
    for(i=0;i<valor;++i)
    {
         var id=$("#posale_id_"+i).text();
         
         $("#price-"+id).removeAttr("readonly");
         
         
    }
  }
}

function delete_posale(id)
{
  // ajax delete data to database
  $.ajax({
      url : "<?php echo site_url('pos/delete')?>/"+id,
      type: "POST",
      dataType: "JSON",
      success: function(data)
      {
         $('#productList').load("<?php echo site_url('pos/load_posales')?>");
         $('#ItemsNum span, #ItemsNum2 span').load("<?php echo site_url('pos/totiems')?>");
         $('#Subtot').load("<?php echo site_url('pos/subtot')?>", null, total_change);
      },
      error: function (jqXHR, textStatus, errorThrown)
      {
         alert("error");
      }
  });
 product_view(-1);
 $('.barcode').focus();
}


/********************************** Hold functions ************************************/
function AddHold()
{
  $.ajax({
      url : "<?php echo site_url('pos/AddHold')?>/<?=$this->register?>",
      type: "POST",
      dataType: "JSON",
      success: function(data)
      {
         $('#productList').load("<?php echo site_url('pos/load_posales')?>");
         $('#ItemsNum span, #ItemsNum2 span').load("<?php echo site_url('pos/totiems')?>");
         $('#Subtot').load("<?php echo site_url('pos/subtot')?>", null, total_change);
         $('.holdList').load("<?php echo site_url('pos/holdList/'.$this->register)?>");
      },
      error: function (jqXHR, textStatus, errorThrown)
      {
         alert("error");
      }
  });

}

function RemoveHold()
{
   var number = $('.selectedHold').clone().children().remove().end().text();
   if(number !=1) {
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
            url : "<?php echo site_url('pos/RemoveHold')?>/"+number+"/<?=$this->register;?>",
            type: "POST",
            dataType: "JSON",
            success: function(data)
            {
               $('#productList').load("<?php echo site_url('pos/load_posales')?>");
               $('#ItemsNum span, #ItemsNum2 span').load("<?php echo site_url('pos/totiems')?>");
               $('#Subtot').load("<?php echo site_url('pos/subtot')?>", null, total_change);
               $('.holdList').load("<?php echo site_url('pos/holdList/'.$this->register)?>");
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
               alert("error");
            }
        });
      swal.close(); });
   }

}

function SelectHold(number)
{
  // ajax delete data to database
  $.ajax({
      url : "<?php echo site_url('pos/SelectHold')?>/"+number,
      type: "POST",
      dataType: "JSON",
      success: function(data)
      {
         $('#productList').load("<?php echo site_url('pos/load_posales')?>");
         $('#ItemsNum span, #ItemsNum2 span').load("<?php echo site_url('pos/totiems')?>");
         $('#Subtot').load("<?php echo site_url('pos/subtot')?>", null, total_change);
         $('#'+number).parent().children().removeClass('selectedHold');
         $('#'+number).addClass('selectedHold');
         //console.log(data);
         $("#customerSelect").val(data);
         $("#customerSelect").trigger('change');

      },
      error: function (jqXHR, textStatus, errorThrown)
      {
         alert("error");
      }
  });
  product_view(-1);

}
function product_view(id)
{
  var valorProd=$('#hdnSearchProduct').val();
  //console.log(valorProd, 'Aqui 1');
 // if(typeof valorProd==='undefined' || valorProd==='undefined')
  //{
      if(id>=0)
      {
         var price = $('#idprice-'+id).val();
         var price_major = $('#idprice_major-'+id).val();
         var price_credit = $('#idprice_credit-'+id).val();
         var photo = $('#idphoto-'+id).val();
         var category = $('#idcategory-'+id).val();
         var brand = $('#idbrand-'+id).val();
         var reference = $('#idreference-'+id).val();
         var code = $('#idcode-'+id).val();
         var tax = $('#idtax-'+id).val();
         var quantity = $('#idquantity-'+id).val();
         console.log(photo, 'Aqui 2');
         if(photo.length==0)
            photo='sin_imagen.jpg';
         
         $('#product_img').html('');
         var url_img='<img src="<?=base_url()?>files/products/'+photo+'" width="140px" height="120px" alt="">';
         $('#product_img').html(url_img);
       
         $('#reference_view').val(reference);
         $('#category_view').val(category);
         $('#brand_view').val(brand);
         $('#productcode_view').val(code);
         $('#price_view').val(price);
         $('#price_major').val(price_major);
         $('#price_credit').val(price_credit);
         $('#tax_view').val(tax);
         $('#quantity_view').val(quantity);
      }
      else
      {
         $('#reference_view').val('');
         $('#category_view').val('');
         $('#brand_view').val('');
         $('#productcode_view').val('');
         $('#price_view').val('');
         $('#price_major').val('');
         $('#price_credit').val('');
         $('#tax_view').val('');
         $('#quantity_view').val('');
         $('#product_img').html('');
         var url_img='<img src="<?=base_url()?>files/products/sin_imagen.jpg" width="140px" height="120px" alt="">';
         $('#product_img').html(url_img);
       
      }

  // }

   
}
/********************************** end Hold functions ************************************/

function add_posale(id, qtposale)
{
   var name1 = $('#idname-'+id).val();
   var price1 = $('#idprice-'+id).val();
   //var photo = $('#idphoto-'+id).val();
   //var brand = $('#idbrand-'+id).val();
   var code = $('#idcode-'+id).val();
   //var currency = $('#idcurrency-'+id).val();
   //var tax = $('#idtax-'+id).val();
   var tax_id = $('#idtax_id-'+id).val();
  // var quantity = $('#idquantity-'+id).val();
   var number = $('.selectedHold').clone().children().remove().end().text();
   var discount = $('#num02').val();
      
   if(qtposale>0)
      product_view(id);
   else
      product_view(-1);  
   
   $.ajax({
         url : "<?php echo site_url('pos/addpdc')?>/",
         type: "POST",
         data: {name: name1, price: price1, product_id: id, tax_id: tax_id, number: number, registerid: <?=$this->register;?>, code: code, qtposale: qtposale, discount: discount},
         success: function(data)
         {
            if(data === 'stock'){
               swal("<?=label("Lowinventory");?>");
              

            }else{
                $('#productList').load("<?php echo site_url('pos/load_posales')?>");
                $('#ItemsNum span, #ItemsNum2 span').load("<?php echo site_url('pos/totiems')?>");
                $('#Subtot').load("<?php echo site_url('pos/subtot')?>", null, total_change);
            }
         },
         error: function (jqXHR, textStatus, errorThrown)
         {
            alert("error 888");
         }
     });
$('.barcode').focus();
}

function edit_posale(id)
{
   var qt1 = $('#qt-'+id).val();
   var base1 = $('#priceHdn-'+id).val();
   var price1 = $('#price-'+id).val();
   base1 = base1.split('.').join('');
   price1 = price1.split('.').join('');
   base1 = base1.replace(',','.');
   price1 = price1.replace(',','.');
   //console.log(base1);
   //console.log(price1);
   if(qt1<=0)
   {
          swal('Oops...', 'Debe agregar un valor mayor a cero (0)', 'error'); 
          qt1=1;
          $('#qt-'+id).val(1);


   }
      var discount = $('#num02').val();
        $.ajax({
            url : "<?php echo site_url('pos/edit')?>/"+id,
            type: "POST",
            data: {base: base1, price: price1, qt: qt1, discount: discount},
            success: function(data)
            {
               if(data === 'stock'){
                  swal("<?=label("Lowinventory");?>");
                  $('#productList').load("<?php echo site_url('pos/load_posales')?>");
               }else{
                   $('#productList').load("<?php echo site_url('pos/load_posales')?>/"+id);
                   $('#ItemsNum span, #ItemsNum2 span').load("<?php echo site_url('pos/totiems')?>");
                   $('#Subtot').load("<?php echo site_url('pos/subtot')?>", null, total_change);
                   //$(elem).focus();
                   
            

               }
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
               alert("error");
            }
        });
  var pos=$("#"+id).attr('name');
  $("#hdnItemSeleted").val(pos);    
  //$("#rowItem_"+pos).css("background-color", "#9cbcdd");
  

}


$("#customerSelect").change(function(){
//$("#barCodeSearch").focus();

  var id = $(this).find('option:selected').val();
  var number = $('.selectedHold').clone().children().remove().end().text();

    $.ajax({
         url : "<?php echo site_url('pos/GetDiscount')?>/"+id,
         type: "POST",
         data:{number:number},
         success: function(data)
         {
            var values = data.split('~');
            $('#customerName span').text(values[1]);
            $('.Remise').val(values[0]);
            $('#RemiseValue').text(values[2]);
            $('#productList').load("<?php echo site_url('pos/load_posales')?>");
            $('#Subtot').load("<?php echo site_url('pos/subtot')?>", null, total_change);
         },
         error: function (jqXHR, textStatus, errorThrown)
         {
            alert("error");
         }
    });
 //}
});

function cancelPOS(){
   swal({   title: '<?=label("Areyousure");?>',
   text: '<?=label("Deletemessage");?>',
   type: "warning",
   showCancelButton: true,
   confirmButtonColor: "#DD6B55",
   confirmButtonText: '<?=label("yesiam");?>',
   closeOnConfirm: false },
   function(){
   
  $('.js-example-basic-single').val('0');
  $('.js-example-basic-single').trigger('change.select2');
  $('.Remise').val('<?=$this->setting->discount;?>');
  $('.TAX').val('<?=$this->setting->tax;?>');

  $.ajax({
      url : "<?php echo site_url('pos/ResetPos')?>/",
      type: "POST",
      success: function(data)
      {
          $('#productList').load("<?php echo site_url('pos/load_posales')?>");
          $('#Subtot').load("<?php echo site_url('pos/subtot')?>", null, total_change);
          $('#ItemsNum span, #ItemsNum2 span').text("0");
      },
      error: function (jqXHR, textStatus, errorThrown)
      {
         alert("error");
      }
 });
 swal('<?=label("Deleted");?>', '<?=label("Deletedmessage");?>', "success"); });
};

function PushDiscount(){ 
     
 var id = $("#customerSelect").find('option:selected').val();
 var discount = $("#num02").val();
    $.ajax({
         url : "<?php echo site_url('pos/PushDiscount')?>/"+id,
         type: "POST",
         data:{discount: discount},
         success: function(data)
         {
            var values = data.split('~');
            //$('#customerName span').text(values[1]);
            $('.Remise').val(values[0]);
            $('#RemiseValue').text(values[1]);
            $('#productList').load("<?php echo site_url('pos/load_posales')?>");
            $('#Subtot').load("<?php echo site_url('pos/subtot')?>", null, total_change);
         },
         error: function (jqXHR, textStatus, errorThrown)
         {
            alert("error");
         }
    });
};


function Descuento(){ 
     
      $("#num02").focus();

};

function verificarSalesBtn(type)
{ 
    var verificar = $("#hdnVerificarCantidad").val();
    var paymentMethod=$("#paymentMethod").val();
      //console.log(paymentMethod, verificar);
      if(verificar==1 || paymentMethod==3)
      {
         //swal('Yeah...', 'Excelente', 'warning'); 
         saleBtn(type);
      }
      else
      {
         swal('Oops...', 'Debe agregar un monto mayor o igual al total de la venta', 'error'); 
         $('#PaidReal').focus();
        // $('#barCodeSearch').select();

      }
};

function saleBtn(type) {
var clicando = $("#hdnVerificarSalesBtn").val();
console.log($("#hdnVerificarCantidad").val());
if(clicando==1)
{   
   $("#hdnVerificarCantidad").val(0);
   console.log($("#hdnVerificarCantidad").val());
   var clientID = $('#customerSelect').find('option:selected').val();
   var clientName = $('#customerName span').text();
   var Tax = $('.TAX').val();
   var Discount = $('.Remise').val();
   var Subtotal = $('#Subtot').text();
   var Total = $('#total').text();
   var createdBy = '<?php echo $this->user->firstname." ".$this->user->lastname;?>';
   var totalItems = $('#ItemsNum span').text();
   var Paid = $('#Paid').val();
   var paidMethod = $('#paymentMethod').find('option:selected').val();
   var Status = 0;
   var ccnum = $('#CreditCardNum').val();
   var ccmonth = $('#CreditCardMonth').val();
   var ccyear = $('#CreditCardYear').val();
   var ccv = $('#CreditCardCODECV').val();
   switch(paidMethod) {
       case '1':
           paidMethod += '~'+$('#CreditCardNum').val()+'~'+$('#CreditCardHold').val();
           break;
       case '2':
           paidMethod += '~'+$('#ChequeNum').val()
           break;
       case '3':
           Status = 1;
           break;
       case '0':
           var change = parseFloat(Total) - parseFloat(Paid);
           if(change==parseFloat(Total)) Status = 1;
           else if(change>0) Status = 2;
           else if(change<=0) Status = 0;
       break;
   }
   var taxamount = $('.TAX').val().indexOf('%') != -1 ? parseFloat($('#taxValue').text()) : $('.TAX').val();
   var discountamount = $('.Remise').val().indexOf('%') != -1 ? parseFloat($('#RemiseValue').text()) : $('.Remise').val();
  
  $.ajax({
      url : "<?php echo site_url('pos/AddNewSale')?>/"+type,
      type: "POST",
      data: {client_id: clientID, clientname: clientName, discountamount: discountamount, taxamount: taxamount, tax: Tax, discount: Discount, subtotal: Subtotal, total: Total, created_by: createdBy, totalitems: totalItems, paid: Paid, status: Status, paidmethod: paidMethod, ccnum: ccnum, ccmonth: ccmonth, ccyear: ccyear, ccv: ccv},
      success: function(data)
      {
          $('#printSection').html(data);
          $('#RemiseValue').text('0');
          $('#num02').val('');

          $('#lastInvoice').load("<?php echo site_url('pos/lastInvoice')?>");
          $('#productList').load("<?php echo site_url('pos/load_posales')?>");
          $('#ItemsNum span, #ItemsNum2 span').load("<?php echo site_url('pos/totiems')?>");
          $('#Subtot').load("<?php echo site_url('pos/subtot')?>", null, total_change);
          $('#AddSale').modal('hide');
          $('#ticket').modal('show');
          $('#btnDeleteSale').attr("disabled", false);

          var cambio = parseFloat(Paid)-parseFloat(Total);
          cambio = cambio.toFixed(<?=$this->setting->decimals;?>);
          var cambioFinal= new Intl.NumberFormat("de-DE").format(cambio);
          $('#cambioticket').text('Cambio: '+cambioFinal);

          $('#ReturnChange span').text('0');
          $('#totalPorVencer').load("<?php echo site_url('calidads/totalPorVencer')?>");
          $('#totalVencidos').load("<?php echo site_url('calidads/totalVencidos')?>");
          $('#Paid').val('0');
          $('.holdList').load("<?php echo site_url('pos/holdList/'.$this->register)?>");
          <?php if($this->user->role != "admin"){?>
            $("#num02").attr("readonly","readonly");
          <?php }?>
        
      },
      error: function (jqXHR, textStatus, errorThrown)
      {
         alert("error");
      }
  });

  $('#CreditCardNum').val('');
  $('#CreditCardHold').val('');
  $('#CreditCardYear').val('');
  $('#CreditCardMonth').val('');
  $('#CreditCardCODECV').val('');
  $('#product_img').html('');
  var url_img='<img src="<?=base_url()?>files/products/sin_imagen.jpg" width="140px" height="120px" alt="">';
  $('#product_img').html(url_img);

  $('#brand_view').val('');
  $('#productcode_view').val('');
  $('#tax_view').val('');
  $('#price_view').val('');
  $('#price_major').val('');
  $('#price_credit').val('');
  $('.js-example-basic-single').val('0');
  $('.js-example-basic-single').trigger('change.select2');  
  $('#customerSelect').val(0);
  $('#customerName span').text('<?=label("WalkinCustomer")?>');
  $('#barCodeSearch').focus();
 


}
}


function PrintTicket() {
   $('.modal-body').removeAttr('id');
   $('.btnDeletePaid').hide();
   $('#btnAddPaid').hide();
   window.print();
   $('#btnAddPaid').show();
   $('.btnDeletePaid').show();       
   $('.modal-body').attr('id', 'modal-body');
   $("#ticket").modal('hide');
   $("#barCodeSearch").focus();


}

function EnviarTicketPedido() {

  var email_admin= $('#email_admin').val();
  
  var msg= $('#printSectionPedido').html();
  //console.log(msg);
  $.ajax({
      url : "<?php echo site_url('pos/enviarPedido')?>",
      type: "POST",
      data: {msg: msg, email_admin:email_admin},
      success: function(data)
      {
          $("#pedido").modal('hide');
      },
      error: function (jqXHR, textStatus, errorThrown)
      {
         alert("error");
      }
  });
}

function EnviarRemision() {

  //console.log(msg);
  var typeRemision = $("#typeRemision").val();
  var customer = $("#customerSelect").val();
  console.log(typeRemision, customer);
  if(typeRemision>0){
    $.ajax({
        url : "<?php echo site_url('pos/EnviarRemision')?>",
        type: "POST",
        data: {typeRemision:typeRemision, customer:customer},
        success: function(data)
        {
            $("#remisiones").modal('hide');
            swal('Exito', 'Remisión creada', "success");
            cerrarCotizacion();
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
           alert("error");
        }
    });
  }
  else
  {
      swal('Oops', 'Debe seleccionar tipo de remisión', "error"); 
  }
}
function EnviarReturnSales() {

  //console.log(msg);
  $.ajax({
      url : "<?php echo site_url('pos/enviarReturnSales')?>",
      type: "POST",
      success: function(data)
      {
          $("#returnSales").modal('hide');
          cerrarCotizacion();
      },
      error: function (jqXHR, textStatus, errorThrown)
      {
         alert("error");
      }
  });
}

function EnviarTicketDevolucion() {

  var email_admin= $('#email_admin').val();
  
  var msg= $('#printSectionDevolucion').html();
  //console.log(msg);
  $.ajax({
      url : "<?php echo site_url('devolucions/enviarDevolucion')?>",
      type: "POST",
      data: {msg: msg, email_admin:email_admin},
      success: function(data)
      {
          $("#devolucion").modal('hide');
      },
      error: function (jqXHR, textStatus, errorThrown)
      {
         alert("error");
      }
  });
}

function CloseRegister() {
   $.ajax({
      url : "<?php echo site_url('pos/CloseRegister')?>/",
      type: "POST",
      success: function(data)
      {
         $('#closeregsection').html(data);
         $('#CloseRegister').modal('show');
         setTimeout(function(){$('#countedcash').focus()}, 1000);
         $('#countedcash').on('keyup',function() {
          fcountedcash();

         });

         $('#countedcc').on('keyup',function() {
           $(this).val(function(index, value) {
             var num = value.replace(/\./g,'');
             num = num.toString().split('').reverse().join('').replace(/(?=\d*\.?)(\d{3})/g,'$1.');
             num = num.split('').reverse().join('').replace(/^[\.]/,'');
             return num;

           });
           var diffcash=$('#diffcash').text();
           var diffcheque=$('#diffcheque').text();
           
           var countedcash=$('#countedcash').val();
           var countedcheque=$('#countedcheque').val();

           var expectedcc=$('#expectedcc').text();
           var countedcc=$(this).val();
           if(countedcc=='' || countedcc<0)
           {          
             countedcc=0;
           }
           var expectedcc = expectedcc.split('.').join('');
           var countedcc = countedcc.split('.').join('');
           var countedcash = countedcash.split('.').join('');
           var countedcheque = countedcheque.split('.').join('');

           var change = -(parseFloat(expectedcc) - parseFloat(countedcc));
           var difftot = change + parseFloat(diffcash) + parseFloat(diffcheque);
           var total = parseFloat(countedcc) + parseFloat(countedcheque) + parseFloat(countedcash);
           $('#countedtotal').text(total.toFixed(<?=$this->setting->decimals;?>));
           $('#difftotal').text(difftot.toFixed(<?=$this->setting->decimals;?>))
           if(change < 0){
               $('#diffcc').text(change.toFixed(<?=$this->setting->decimals;?>));
               $('#diffcc').addClass( "red" );
               $('#diffcc').removeClass( "light-blue" );
           }else{
               $('#diffcc').text(change.toFixed(<?=$this->setting->decimals;?>));
               $('#diffcc').removeClass( "red" );
               $('#diffcc').addClass( "light-blue" );
           }
         });

         $('#countedcheque').on('keyup',function() {
           $(this).val(function(index, value) {
             var num = value.replace(/\./g,'');
             num = num.toString().split('').reverse().join('').replace(/(?=\d*\.?)(\d{3})/g,'$1.');
             num = num.split('').reverse().join('').replace(/^[\.]/,'');
             return num;

           });
           var diffcash=$('#diffcash').text();
           var diffcc=$('#diffcc').text();
           
           var countedcash=$('#countedcash').val();
           var countedcc=$('#countedcc').val();

           var expectedcheque=$('#expectedcheque').text();
           var countedcheque=$(this).val();
           if(countedcheque=='' || countedcheque<0)
           {          
             countedcheque=0;
           }
           var expectedcheque = expectedcheque.split('.').join('');
           var countedcc = countedcc.split('.').join('');
           var countedcash = countedcash.split('.').join('');
           var countedcheque = countedcheque.split('.').join('');

           var change = -(parseFloat(expectedcheque) - parseFloat(countedcheque));
           var difftot = change + parseFloat(diffcc) + parseFloat(diffcash);
           var total = parseFloat(countedcc) + parseFloat(countedcheque) + parseFloat(countedcash);
           $('#countedtotal').text(total.toFixed(<?=$this->setting->decimals;?>));
           $('#difftotal').text(difftot.toFixed(<?=$this->setting->decimals;?>))
           if(change < 0){
               $('#diffcheque').text(change.toFixed(<?=$this->setting->decimals;?>));
               $('#diffcheque').addClass( "red" );
               $('#diffcheque').removeClass( "light-blue" );
           }else{
               $('#diffcheque').text(change.toFixed(<?=$this->setting->decimals;?>));
               $('#diffcheque').removeClass( "red" );
               $('#diffcheque').addClass( "light-blue" );
           }
         });
      },
      error: function (jqXHR, textStatus, errorThrown)
      {
          alert("error");
      }
   });
}

function SubmitRegister() {

   var expectedcash = $('#expectedcash').text();
   var countedcash = $('#countedcash').val();
   var expectedcc = $('#expectedcc').text();
   var countedcc = $('#countedcc').val();
   var expectedcheque = $('#expectedcheque').text();
   var countedcheque = $('#countedcheque').val();
   var RegisterNote = $('#RegisterNote').val();
   
   expectedcash = expectedcash.split('.').join('');
   expectedcc = expectedcc.split('.').join('');
   expectedcheque = expectedcheque.split('.').join('');
   
   countedcash = countedcash.split('.').join('');
   countedcc = countedcc.split('.').join('');
   countedcheque = countedcheque.split('.').join('');



   swal({   title: '<?=label("Areyousure");?>',
   text: '<?=label("CloseMessageRegister");?>',
   type: "warning",
   showCancelButton: true,
   confirmButtonColor: "#DD6B55",
   confirmButtonText: '<?=label("yesClose");?>',
   closeOnConfirm: false },
   function(){

   $.ajax({
      url : "<?php echo site_url('pos/SubmitRegister')?>/",
      type: "POST",
      data: {expectedcash: expectedcash, countedcash: countedcash, expectedcc: expectedcc, countedcc: countedcc, expectedcheque: expectedcheque, countedcheque: countedcheque, RegisterNote: RegisterNote},
      success: function(data)
      {        

         window.location.href = "<?php echo site_url()?>";

      },
      error: function (jqXHR, textStatus, errorThrown)
      {
          alert("error");
      }
   });

   swal.close(); });

}
function AddExpence() {
var reference = $("#Reference").val();
var monto = $("#Amount").val();
var category = $("#Category").val();

if(reference.length==0){
   swal('Oops', 'Debe agregar número de referencia', "error");
   return;
}
if(category.length==0){
   swal('Oops', 'Debe seleccionar una categoría', "error");
   return;
}
if(monto.length==0){
   swal('Oops', 'Debe agregar monto del egreso', "error");
   return;
}

    $.post("pos/addExpense",$("#addExpenseForm").serialize(),function(data){
           $("#AddExpence").modal('hide');

           
           $('#printSection').load("<?php echo site_url('expences/showTicket')?>/"+data);
           $('#ticket').modal('show');  
           $('#btnDeleteSale').attr("disabled", true);

     });


}

function email()
{
   $('#ticket').modal('hide');
   swal({
      title: "An input!",
      text: "Email:",
      type: "input",
      showCancelButton: true,
      closeOnConfirm: false,
      animation: "slide-from-top",
      inputPlaceholder: "Email" },
      function(inputValue){
         if (inputValue === false) return false;
         if (inputValue === "") {
            swal.showInputError("You need to write an email!");
            return false   }
            var content = $('#printSection').html();
            $.ajax({
               url : "<?php echo site_url('pos/email')?>/",
               type: "POST",
               data: {content: content, email: inputValue},
               success: function(data)
               {
                  $('#ticket').modal('show');
                  swal.close();
               },
               error: function (jqXHR, textStatus, errorThrown)
               {
                   alert("error");
               }
            });
             });
}

function pdfreceipt(){


   var content = $('#printSection').html();
   $.redirect('<?php echo site_url('pos/pdfreceipt')?>/', { content: content });

}

function pdfreceiptCotizacion(){


   var content = $('#printSectionCotizacion').html();
   $.redirect('<?php echo site_url('pos/pdfreceipt')?>/', { content: content });

}
function contarCaja(){


   var b100mil = $('#b100mil').val()*100000;
   var b50mil = $('#b50mil').val()*50000;
   var b20mil = $('#b20mil').val()*20000;
   var b10mil = $('#b10mil').val()*10000;
   var b5mil = $('#b5mil').val()*5000;
   var b2mil = $('#b2mil').val()*2000;
   var b1mil = $('#b1mil').val()*1000;
   var m1mil = $('#m1mil').val()*1000;
   var m500 = $('#m500').val()*500;
   var m200 = $('#m200').val()*200;
   var m100 = $('#m100').val()*100;
   var m50 = $('#m50').val()*50;
   var suma = parseInt(b100mil)+parseInt(b50mil)+parseInt(b20mil)+parseInt(b10mil)
             +parseInt(b5mil)+parseInt(b2mil)+parseInt(b1mil)+parseInt(m1mil)+parseInt(m500)
             +parseInt(m200)+parseInt(m100)+parseInt(m50);
    console.log(suma);
   $('#countedcash').val(suma);
   fcountedcash();

}
function fcountedcash()
{

  $('#countedcash').val(function(index, value) {
             var num = value.replace(/\./g,'');
             num = num.toString().split('').reverse().join('').replace(/(?=\d*\.?)(\d{3})/g,'$1.');
             num = num.split('').reverse().join('').replace(/^[\.]/,'');
             return num;

           });
           var diffcc=$('#diffcc').text();
           var diffcheque=$('#diffcheque').text();
           
           var countedcc=$('#countedcc').val();
           var countedcheque=$('#countedcheque').val();

           var expectedcash=$('#expectedcash').text();
           var countedcash=$('#countedcash').val();
           if(countedcash=='' || countedcash<0)
           {          
             countedcash=0;
           }
           var expectedcash = expectedcash.split('.').join('');
           var countedcash = countedcash.split('.').join('');
           var countedcc = countedcc.split('.').join('');
           var countedcheque = countedcheque.split('.').join('');


           var change = -(parseFloat(expectedcash) - parseFloat(countedcash));
           var difftot = change + parseFloat(diffcc) + parseFloat(diffcheque);
           var total = parseFloat(countedcc) + parseFloat(countedcheque) + parseFloat(countedcash);
           $('#countedtotal').text(total.toFixed(<?=$this->setting->decimals;?>));
           $('#difftotal').text(difftot.toFixed(<?=$this->setting->decimals;?>))
           if(change < 0){
               $('#diffcash').text(change.toFixed(<?=$this->setting->decimals;?>));
               $('#diffcash').addClass( "red" );
               $('#diffcash').removeClass( "light-blue" );
           }else{
               $('#diffcash').text(change.toFixed(<?=$this->setting->decimals;?>));
               $('#diffcash').removeClass( "red" );
               $('#diffcash').addClass( "light-blue" );
           }

}


function cerrarCotizacion(){

 $.ajax({
      url : "<?php echo site_url('pos/ResetPos')?>/",
      type: "POST",
      success: function(data)
      {
          $('#productList').load("<?php echo site_url('pos/load_posales')?>");
          $('#Subtot').load("<?php echo site_url('pos/subtot')?>", null, total_change);
          $('#ItemsNum span, #ItemsNum2 span').text("0");
          
          $('#pedido').modal('hide');
          $('#returnSales').modal('hide');

      },
      error: function (jqXHR, textStatus, errorThrown)
      {
         alert("error");
      }
 });

}
function ResetPos(){

 $.ajax({
      url : "<?php echo site_url('pos/ResetPos')?>/",
      type: "POST",
      success: function(data)
      {
          $('#productList').load("<?php echo site_url('pos/load_posales')?>");
          $('#Subtot').load("<?php echo site_url('pos/subtot')?>", null, total_change);
          $('#ItemsNum span, #ItemsNum2 span').text("0");
          
          $('#pedido').modal('hide');

      },
      error: function (jqXHR, textStatus, errorThrown)
      {
         alert("error");
      }
 });

}
function cerrarContarCaja(){

$('#ModalCaja').modal('hide');
$('#countedcash').focus();

}


</script>
   
<!-- Modal -->
<div class="modal fade" id="AddSale" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="AddSale"><?=label("AddSale");?></h4>
        <?php //echo $abrirMonedero = chr(27)."p025";?>
      </div>
      <form>
      <div class="modal-body">
          <div class="form-group">
              <h2 id="customerName"><?=label("Customer");?> <span><?=label("WalkinCustomer");?></span></h2>
          </div>
           <div class="form-group">
             <h3 id="ItemsNum2"><span></span> <?=label("item");?></h3>
          </div>
           <div class="form-group">
             <h2 id="TotalModal"></h2>
          </div>
           <div class="form-group">
             <label for="paymentMethod" ><?=label("paymentMethod");?></label>
             <select class="form-control" id="paymentMethod" style="width: 200px">
               <option value="0"><?=label("Cash");?></option>
               <option value="1"><?=label("CreditCard");?></option>
               <option value="2"><?=label("Cheque");?></option>
               <option value="3"><?=label("CreditSale");?></option>
            </select>
           </div>
           <div class="form-group Paid">

             <label for="Paid"><?=label("Paid");?></label>
             <input type="text" name="PaidReal" class="form-control <?=strval($this->setting->keyboard) === '1' ? 'paidk' : ''?>" id="PaidReal" placeholder="0" style="font-size: x-large;font-weight: bold;">
             <input type="hidden" name="Paid" id="Paid">             
           </div>
           <div class="form-group CreditCardNum">
             <i class="fa fa-cc-visa fa-2x" id="visa" aria-hidden="true"></i>
             <i class="fa fa-cc-mastercard fa-2x" id="mastercard" aria-hidden="true"></i>
             <i class="fa fa-cc-amex fa-2x" id="amex" aria-hidden="true"></i>
             <i class="fa fa-cc-discover fa-2x" id="discover" aria-hidden="true"></i>
             <label for="CreditCardNum"><?=label("CreditCardNum");?></label>
             <input type="text" class="form-control cc-num" id="CreditCardNum" placeholder="<?=label("CreditCardNum");?>">
           </div>
           <div class="clearfix"></div>
           <div class="form-group CreditCardHold col-md-4 padding-s">
             <input type="text" class="form-control" id="CreditCardHold" placeholder="<?=label("CreditCardHold");?>">
           </div>
           <div class="form-group CreditCardHold col-md-2 padding-s">
             <input type="text" class="form-control" id="CreditCardMonth" placeholder="<?=label("Month");?>">
           </div>
           <div class="form-group CreditCardHold col-md-2 padding-s">
             <input type="text" class="form-control" id="CreditCardYear" placeholder="<?=label("Year");?>">
           </div>
           <div class="form-group CreditCardHold col-md-4 padding-s">
             <input type="text" class="form-control" id="CreditCardCODECV" placeholder="<?=label("CODECV");?>">
           </div>
           <div class="form-group ChequeNum">
             <label for="ChequeNum"><?=label("ChequeNum");?></label>
             <input type="text" name="chequenum" class="form-control" id="ChequeNum" placeholder="<?=label("ChequeNum");?>">
           </div>
          <div class="form-group ReturnChange">
             <h3 id="ReturnChange"><?=label("Change");?> <span>0</span> <?=$this->setting->currency;?></h3>
          </div>
          <div class="clearfix"></div>
          <input type="hidden" id="hdnVerificarCantidad" name="hdnVerificarCantidad">
          <input type="hidden" id="hdnVerificarSalesBtn" name="hdnVerificarSalesBtn">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><?=label("Close");?></button>
        <?=strval($this->setting->stripe) === '1' ? '<button type="button" class="btn btn-add stripe-btn" onclick="verificarSalesBtn(2)"><i class="fa fa-cc-stripe" aria-hidden="true"></i> '.label("StripePayment").'</button>' : ''; ?>
        <button if="btnSaleBtn" type="button" class="btn btn-add" onclick="verificarSalesBtn(1)"><?=label("Submit");?></button>
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
        <h4 class="modal-title" id="ticket" style="float: left;"><?=label("Receipt");?></h4><h4 class="modal-title" id="cambioticket" style="float: right; font-size: x-large;"></h4>
      </div>
      <div class="modal-body" id="modal-body">
         <div id="printSection">
            <!-- Ticket goes here -->
            <center><h1 style="color:#34495E"><?=label("empty");?></h1></center>
         </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default hiddenpr" data-dismiss="modal"><?=label("Close");?></button>
        <button type="button" id="btnDeleteSale" class="btn btn-danger hiddenpr" onclick="validarDeleteSale()"><?=label("Anular");?></button>
        <button type="button" class="btn btn-add hiddenpr" href="javascript:void(0)" onClick="pdfreceipt()">PDF</button>
        <button type="button" id="btnTicket" class="btn btn-add hiddenpr" onclick="PrintTicket()"><?=label("print");?></button>
      </div>
    </div>
 </div>
</div>
<!-- /.Modal -->

<!-- Modal -->
<div class="modal fade" id="AddCustomer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div id="modal_addcustomer" class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?=label("AddCustomer");?></h4>
      </div>
      <?php echo form_open_multipart('pos/AddCustomer'); ?>
      <div class="modal-body">
        <!-- 
         ___  __   __                        __     __
        |__  /  \ |__)  |\/| |  | |     /\  |__) | /  \
        |    \__/ |  \  |  | \__/ |___ /~~\ |  \ | \__/ 
        -->
        <div class="row"  id="form_addcustomer">   
          <div class="col-md-12">             
                    <!-- FILA 1 -->
                    <div class="form-group">
                      <label class="col-md-2 control-label" for="numdoc"><?=label("Document");?> </label>
                        <div class="col-md-2 form-group">  
                           <select class="form-control" id="typedoc" name="typedoc">
                             <option value="">Seleccione</option>
                             <option value="1" selected>Cédula</option>
                             <option value="2">Pasaporte</option>
                             <option value="3">NIT</option>
                          </select>
                        </div>
                      <div class="col-md-2 form-group">  
                        <input type="text" name="numdoc" id="numdoc" maxlength="50" Required class="form-control" placeholder="<?=label("Number");?>">
                      </div>   
                      <label class="col-md-2 control-label" for="regime"><?=label("Regime");?></label>
                      <div class="col-md-4 form-group">  
                         <select class="form-control" id="regime" name="regime">
                           <option value="">Seleccione</option>
                           <option value="1" selected>Común</option>
                           <option value="2">Simplificado</option>
                        </select>
                      </div>                   
                    </div>                 
                  <!-- FILA 2 -->   
                  <div class="form-group">
                      <label class="col-md-2 control-label" for="firstname1"><?=label("Firstname1");?></label>
                      <div class="col-md-4 form-group">  
                        <input type="text" name="firstname1" id="firstname1" maxlength="50" Required class="form-control" placeholder="<?=label("Firstname1");?>">
                      </div>                      
                    </div>                 
                  <!-- FILA 2 -->              
                    <div class="form-group">
                     <label class="col-md-2 control-label" for="firstname2"><?=label("Firstname2");?></label>
                      <div class="col-md-4 form-group">  
                        <input type="text" name="firstname2" maxlength="50" class="form-control" id="firstname2" placeholder="<?=label("Firstname2");?>">
                      </div>
                      <label class="col-md-2 control-label" for="birthday"><?=label("Birthday");?> </label>
                          <div class="col-md-2 form-group">  
                             <select class="form-control" id="monthbirthday" name="monthbirthday">
                               <option value="0"><?=label("Month");?></option>
                               <option value="1"><?=label("January");?></option>
                               <option value="2"><?=label("February");?></option>
                               <option value="3"><?=label("March");?></option>
                               <option value="4"><?=label("April");?></option>
                               <option value="5"><?=label("May");?></option>
                               <option value="6"><?=label("June");?></option>
                               <option value="7"><?=label("July");?></option>
                               <option value="8"><?=label("August");?></option>
                               <option value="9"><?=label("September");?></option>
                               <option value="10"><?=label("October");?></option>
                               <option value="11"><?=label("November");?></option>
                               <option value="12"><?=label("December");?></option>
                            </select>
                          </div>
                          <div class="col-md-2 form-group">  
                             <select class="form-control" id="daybirthday" name="daybirthday">
                               <option value="0"><?=label("Day");?></option>
                               <?php for ( $dia=1 ; $dia <= 31 ; $dia++): ?>
                               <option value="<?=$dia;?>"><?=$dia;?></option> 
                               <?php endfor; ?>
                            </select>
                          </div>  
                        
                    </div>                
                  <!-- FILA 3 -->             
                    <div class="form-group">
                      <label class="col-md-2 control-label" for="lastname1"><?=label("Lastname1");?></label>
                      <div class="col-md-4 form-group">  
                        <input type="text" name="lastname1" maxlength="50" Required class="form-control" id="lastname1" placeholder="<?=label("Lastname1");?>">
                      </div>                 
                      <label class="col-md-2 control-label" for="movil"><?=label("Movil");?></label>
                      <div class="col-md-4 form-group">  
                        <input type="text" name="movil" maxlength="50" class="form-control" id="movil" placeholder="<?=label("Movil");?>">
                      </div>                    
                    </div>              
                <!-- FILA 4 -->               
                    <div class="form-group">
                      <label class="col-md-2 control-label" for="lastname2"><?=label("Lastname2");?></label>
                      <div class="col-md-4 form-group">  
                        <input type="text" name="lastname2" maxlength="50" class="form-control" id="lastname2" placeholder="<?=label("Lastname2");?>">
                      </div>
                      <label class="col-md-2 control-label" for="adresse"><?=label("Adresse");?></label>
                      <div class="col-md-4 form-group">  
                        <input type="text" name="adresse" maxlength="50"  class="form-control" id="adresse" placeholder="<?=label("Adresse");?>">
                      </div>
                   </div>                
                <!-- FILA 5 -->              
                   <div class="form-group">
                     <label class="col-md-2 control-label" for="phone"><?=label("Phone");?></label>
                     <div class="col-md-4 form-group">  
                       <input type="text" name="phone" maxlength="50"  class="form-control" id="phone" placeholder="<?=label("Phone");?>">
                      </div>                    
                      <label class="col-md-2 control-label" for="city"><?=label("City");?></label>
                      <div class="col-md-4 form-group">  
                        <input type="text" name="city" maxlength="50"  class="form-control" id="city" placeholder="<?=label("City");?>" >
                      </div>   
                    </div>               
                <!-- FILA 6 -->             
                    <div class="form-group">
                      <label class="col-md-2 control-label" for="email"><?=label("Email");?></label>
                      <div class="col-md-4 form-group">  
                        <input type="email" name="email" maxlength="50"  class="form-control" id="email" placeholder="<?=label("Email");?>">
                      </div>
                     
                      <label class="col-md-2 control-label" for="discount"><?=label("Discount");?></label>
                      <div class="col-md-4 form-group">  
                        <input type="text" name="discount" maxlength="50"  class="form-control" id="discount" placeholder="<?=label("Discount");?>">
                      </div>
                    </div>  
             </div>
        </div> 
        <!-- FIN-form_addcustomer --> 
      </div>
      <!-- FIN-modal-body -->
      <!-- *************************************************** -->
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary"><?=label("save");?></button>
        <button type="button" class="btn btn-warning" data-dismiss="modal"><?=label("Close");?></button>
      </div>
      <!-- FIN BARRA BOTONES -->
      <?php echo form_close(); ?>
    </div>
  </div>
</div>
<!-- /.Modal -->


<!-- Modal add user -->
<div class="modal fade" id="CloseRegister" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header" style="padding: 8px;">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?=label("CloseRegister");?></h4>
      </div>
      <div class="modal-body">
         <div id="closeregsection" style="margin-top: -26px;">
            <!-- close register detail goes here -->
         </div>
      </div>
    <!--  <div class="modal-footer">
        <a href="javascript:void(0)" onclick="SubmitRegister()" class="btn btn-red col-md-12 flat-box-btn"><?=label("CloseRegister");?></a>
      </div>-->
    </div>
 </div>
</div>
<!-- /.Modal -->
<!-- Modal DEMO -->
<div class="modal fade" id="SearchPriceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog modal-lg" role="document" style="width: 70%;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
          <h4 class="modal-title" id="SearchPrice"><?=label("SearchPrice");?></h4>
      </div>
      <div class="modal-body">
         <div id="demos">

       
              <!-- Form Name -->
              <legend><?=label("SearchOption");?></legend>

              <!-- Text input-->
              <div class="form-group">
                <label class="col-md-2 control-label" for="searchPrice"><?=label("ProductName");?></label>  
                <div class="col-md-4">
                  <input id="searchPrice" name="searchPrice" type="search" placeholder="<?=label("ProductName");?>" class="form-control input-md" autocomplete="off">
                </div>
              </div>
                <input id="hdnProductSeleted" name="hdnProductSeleted" type="hidden">

              <div id="resultPrice" style="margin-top: 20px; height: 400px;overflow: auto; display: inline-block !important;width: 100% !important;">
              </div>
       
             


         </div>
      </div>
    
    </div>
 </div>
</div>
<!-- /.Modal -->

<!-- Modal -->
  <div class="modal fade" id="AddExpence" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel"><?=label("AddExpence");?></h4>
        </div>
        <?php
        $attributes = array('id' => 'addExpenseForm');
        echo form_open_multipart('pos/addExpense', $attributes);
        ?>
        <div class="modal-body">
        <fieldset>

              <div class="form-group controls col-sm-6 ">
               <label for="Date"><?=label("Date");?> *</label>
               <input type="text" maxlength="30" Required name="dateexpense" class="form-control" id="dateexpense" placeholder="<?=label("Date");?>">
               <input type="hidden" value="<?=$storeId;?>" name="store_id">
             </div>
             <div class="form-group col-sm-6">
               <label for="Reference"><?=label("Reference");?> *</label>
               <input type="text" name="reference" maxlength="25" Required class="form-control" id="Reference" placeholder="<?=label("Reference");?>" Required>
             </div>

             <div class="form-group col-sm-6">
               <label for="Category"><?=label("Category");?></label>
               <select class="form-control" name="category" id="Category" Required>
                 <option value=""><?=label("Category");?></option>
                 <?php foreach ($expenses as $row):?>
                    <option value="<?=$row->id;?>"><?=$row->name;?></option>
                 <?php endforeach;?>
              </select>
             </div>
             <div class="form-group col-sm-6">
               <label for="Amount"><?=label("Amount");?> (<?=$this->setting->currency;?>) *</label>
               <input type="number" step="any" Required name="amount" class="form-control" id="Amount" placeholder="<?=label("Amount");?>">
             </div>
             <div class="form-group col-sm-12">
                <label for="exampleInputFile"><?=label("Attachment");?></label>
                <input type="file" name="userfile" id="attachment">
                
             </div>
      

             <div class="form-group col-sm-12">
               <p class="help-block"><?=label("AttachmentInfos");?></p>
             </div>
             <div class="form-group col-sm-12">
               <label for="note"><?=label("Note");?></label>
               <textarea id="note" name="note" row="3" class="form-control" Required></textarea>
             </div>
           </fieldset>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal"><?=label("Close");?></button>
          <button type="button" id="btnAddExpense" class="btn btn-add hiddenpr" onClick="AddExpence()"><?=label("Enviar");?></button>
          <!--<button type="submit" id="btnAddExpense" class="btn btn-add"><?=label("Submit");?></button>-->
        </div>
     <?php echo form_close(); ?>
      </div>
   </div>
  </div>
  <!-- /.Modal -->

<!-- /.Modal -->


<!-- Modal ticket -->
<div class="modal fade" id="pedido" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document" id="modalPedido">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="ticket"><?=label("Pedido");?></h4>
      </div>
             
      <div class="modal-body-pedido" id="modal-body-pedido">        
        <fieldset>
     
         <div id="printSectionPedido">
            <!-- Ticket goes here -->
            <center><h1 style="color:#34495E"><?=label("empty");?></h1></center>
         </div>
         <div class="form-group col-sm-12">
               <label for="email_admin">Enviar pedido a:</label>
               <select class="form-control" name="email_admin" id="email_admin">
                 <?php foreach ($emailadmins as $row):?>
                        <option value="<?=$row->email;?>" >
                                <?=$row->email;?>
                        </option>
                 <?php endforeach;?>
              </select>
         </div>
         </fieldset>

      </div>      
      <div class="modal-footer">   
          <button type="button" class="btn btn-default" data-dismiss="modal"><?=label("Close");?></button>
        <button type="button" id="btnPedido" class="btn btn-add hiddenpr" onClick="EnviarTicketPedido()"><?=label("Enviar");?></button>
      </div>
    </div>
 </div>
</div>
<!-- /.Modal -->

<!-- Modal ticket -->
<div class="modal fade" id="returnSales" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document" id="modalReturn">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="ticket"><?=label("Devolución de Productos");?></h4>
      </div>
             
      <div class="modal-body-return" id="modal-body-return">        
        <fieldset>
     
         <div id="printSectionReturn">
            <!-- Ticket goes here -->
            <center><h1 style="color:#34495E"><?=label("empty");?></h1></center>
         </div>
         </fieldset>

      </div>      
      <div class="modal-footer">   
          <button type="button" class="btn btn-default" data-dismiss="modal"><?=label("Close");?></button>
        <button type="button" id="btnReturn" class="btn btn-add hiddenpr" onClick="EnviarReturnSales()"><?=label("Enviar");?></button>
      </div>
    </div>
 </div>
</div>
<!-- /.Modal -->

<!-- Modal ticket -->
<div class="modal fade" id="remisiones" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document" id="modalRemisiones">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="ticket"><?=label("Remisión de Productos");?></h4>
      </div>
             
      <div class="modal-body-remision" id="modal-body-remision">        
        <fieldset>
         <div class="form-group col-sm-8">
              <label for="typeRemision"><?=label("Tipo de remisión");?></label>
                <select class="form-control" name="typeRemision" id="typeRemision">
                  <option value=""><?=label("Tipo de remisión");?></option>
                  <option value="1">Nota de Crédito</option>
                  <option value="2">Nota de Débito</option>
                  <option value="3">Nota de Entrega</option>
                </select>                  
            </div>          
         <div id="printSectionRemision">
            <!-- Ticket goes here -->
            <center><h1 style="color:#34495E"><?=label("empty");?></h1></center>
         </div>
         </fieldset>

      </div>      
      <div class="modal-footer">   
          <button type="button" class="btn btn-default" data-dismiss="modal"><?=label("Close");?></button>
        <button type="button" id="btnRemision" class="btn btn-add hiddenpr" onClick="EnviarRemision()"><?=label("Enviar");?></button>
      </div>
    </div>
 </div>
</div>
<!-- /.Modal -->

<!-- Modal ticket -->
<div class="modal fade" id="devolucion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document" id="modalPedido">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="ticket"><?=label("Retornar Mercancia");?></h4>
      </div>
             
      <div class="modal-body-devolucion" id="modal-body-devolucion">        
        <fieldset>
     
         <div id="printSectionDevolucion">
            <!-- Ticket goes here -->
            <center><h1 style="color:#34495E"><?=label("empty");?></h1></center>
         </div>
         <div class="form-group col-sm-12">
               <label for="email_admin">Enviar devolución a:</label>
               <select class="form-control" name="email_admin" id="email_admin">
                 <?php foreach ($emailadmins as $row):?>
                        <option value="<?=$row->email;?>" >
                                <?=$row->email;?>
                        </option>
                 <?php endforeach;?>
              </select>
         </div>
         </fieldset>

      </div>      
      <div class="modal-footer">        
          <button type="button" class="btn btn-default" data-dismiss="modal"><?=label("Close");?></button>
          <button type="button" id="btnDevolucion" class="btn btn-add hiddenpr" onClick="EnviarTicketDevolucion()"><?=label("Enviar");?></button>
      </div>
    </div>
 </div>
</div>
<!-- /.Modal -->

<!-- Modal DEMO -->
<div class="modal fade" id="modalQtPosale" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
          <h6 class="modal-title" id="modalProductQtPosale"></h6>
      </div>
      <div class="modal-body">
         <div id="demos">

              <fieldset>
              <!-- Text input-->
                <label class="col-md-12 control-label" for="textinput">Cantidad de Producto</label>  
                <div class="col-md-12">
                <input id="qtposale" name="qtposale" type="number" step="0.01" placeholder="Ingrese cantidad" class="form-control input-md">
                <input id="hdnIdItemProdct" name="hdnIdItemProdct" type="hidden">
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

<!-- Modal DEMO -->
<div class="modal fade" id="modalAuthDiscount" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
          <h4 class="modal-title" id="modalAuthDiscountF7">Requiere Autorización</h4>
      </div>
      <div class="modal-body">
         <div id="demos">

              <fieldset>
              <!-- Text input-->
                <label class="col-md-12 control-label" for="textinput">Clave Administrador</label>  
                <div class="col-md-12">
                <input id="authdiscount" name="authdiscount" type="password" placeholder="Ingrese clave" class="form-control input-md">
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

<!-- Modal DEMO -->
<div class="modal fade" id="modalAuthRemision" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
          <h4 class="modal-title" id="modalAuthRemisionCtrW">Requiere Autorización</h4>
      </div>
      <div class="modal-body">
         <div id="demos">

              <fieldset>
              <!-- Text input-->
                <label class="col-md-12 control-label" for="textinput">Clave Administrador</label>  
                <div class="col-md-12">
                <input id="authremision" name="authremision" type="password" placeholder="Ingrese clave" class="form-control input-md">
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
<!-- Modal DEMO -->
<div class="modal fade" id="modalAuthAnular" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
          <h4 class="modal-title" id="modalAuthAnularCtrD">Requiere Autorización</h4>
      </div>
      <div class="modal-body">
         <div id="demos">

              <fieldset>
              <!-- Text input-->
                <label class="col-md-12 control-label" for="textinput">Clave Administrador</label>  
                <div class="col-md-12">
                <input id="authanular" name="authanular" type="password" placeholder="Ingrese clave" class="form-control input-md">
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
<!-- Modal DEMO -->
<div class="modal fade" id="ModalHelp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog modal-lg" role="document" style="width:80%;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
          <h4 class="modal-title" id="myModalLabel">Menú de Botones</h4>
      </div>
      <div class="modal-body">
         <div id="demos">

            <form class="form-horizontal">
              <fieldset>


                     <div class="col-sm-12">

              <table class="barra_funciones" width="100%" >
                <!-- etiquetas superior -->
                <tr class="pos_help_labels" >
                  <td><a href="#" class="btn btn-block btn-default"><span class=" fa-lg fa fa-file-text-o"></span></a></td>
                  <td><?=label('F1');?></td>
                  <td>Mostrar/Ocultar menú superior</td>
                  <td><a href="#" class="btn btn-block btn-default"><span class=" fa-lg glyphicon glyphicon-edit"></span></a></td>
                  <td><?=label('CtA');?></td>
                  <td>Editar item de pŕoducto del POS</td>
                </tr>
                <tr class="pos_help_labels">
                  <td style="padding-top: 5px;"><a href="#" class="btn btn-block btn-default"><span class="fa-lg glyphicon glyphicon-info-sign"></span></a></td>
                  <td><?=label('CtF1');?></td>
                  <td>Mostar menú de botones</td>
                  <td><a href="#" class="btn btn-block btn-default"><span class=" fa-lg glyphicon glyphicon-tag"></span></a></td>
                  <td ><?=label('F6');?></td>
                  <td>Buscar productos y precios</td>
                </tr>
                <tr class="pos_help_labels">
                  <td style="padding-top: 5px;"><a href="#" class="btn btn-block btn-default"><span class=" fa-lg fa fa-barcode"></span></a></td>                 
                  <td><?=label('F2');?></td>
                  <td>Agregar codigo de barras de producto</td>
                  <td><a href="#" class="btn btn-block btn-default"><span class=" fa-lg fa fa-cut"></span></a></td>
                  <td><?=label('F7');?></td>
                  <td>Agregar descuento</td>
                </tr>
                <tr class="pos_help_labels">
                  <td style="padding-top: 5px;"><a href="#" class="btn btn-block btn-default"><span class=" fa-lg glyphicon glyphicon-user"></span></a></td>                   
                  <td><?=label('CtF2');?></td>
                  <td>Buscar clientes</td>
                  <td><a  href="#" class="btn btn-block btn-default"><span class=" fa-lg fa fa-money"></span></a></td>    
                  <td><?=label('F8');?></td>
                  <td>Crear egresos</td>
                </tr>
                <tr class="pos_help_labels">
                  <td style="padding-top: 5px;"><a  href="#" class="btn btn-block btn-default"><span class=" fa-lg glyphicon glyphicon-search"></span></a></td>
                  <td><?=label('F3');?></td>
                  <td>Crear nuevo cliente</td>
                  <td><a href="#" class="btn btn-block btn-default"><span class=" fa-lg fa fa-bank"></span></a></td>
                  <td><?=label('F9');?></td>
                  <td>Cerrar caja / Reporte Z</td>
                </tr>
                <tr class="pos_help_labels">
                  <td style="padding-top: 5px;">
                    <a  href="#" class="btn btn-block btn-default"><span class=" fa-lg fa fa-ticket"></span></a>
                  </td>
                  <td><?=label('CtF');?></td>
                  <td>Buscar facturas realizadas</td>
                  <td> 
                    <a  href="#" class="btn btn-block btn-default">
                      <span class="glyphicon glyphicon-transfer"></span></a>
                  </td>
                  <td><?=label('CtJ Retornos');?></td>
                  <td>Realizar devoluciones de mercancia</td>
                </tr>
                <tr class="pos_help_labels">
                  <td style="padding-top: 5px;">
                      <a  href="#" class="btn btn-block btn-success">
                        <span class=" fa-lg" ><i class="glyphicon glyphicon-shopping-cart -1x blue"></i></span>
                      </a></td>
                  <td><?=label('F10');?></td>
                  <td>Realizar venta</td>
                  <td>
                      <a href="#" class="btn btn-block btn-primary">
                        <span class=" fa-lg" >
                              <i class="fa-lg fa fa-file-text-o"></i>
                        </span>
                      </a>
                    </td>
                    <td><?=label('CtK');?></td>
                    <td>Crear cotización</td>
                </tr>
                <tr class="pos_help_labels">
                  <td style="padding-top: 5px;">
                      <a href="#" class="btn btn-block btn-danger">
                        <span class=" fa-lg" >
                              <i class="glyphicon glyphicon-off -2x blue"></i>
                        </span>
                      </a>
                  </td>
                  <td><?=label('F11');?></td>
                  <td>Cancelar venta</td>
                  <td><a href="#" class="btn btn-block btn-warning">
                        <span class=" fa-lg" >
                              <i class="fa-lg fa fa-file-text-o"></i>
                        </span>
                      </a>
                  </td>
                  <td><?=label('CtM');?></td>                  
                  <td>Crear pedido</td>
                </tr>
                <tr class="pos_help_labels">
                  <td style="padding-top: 5px;">
                      <a href="#" class="btn btn-block btn-default">
                        <span class=" fa-lg" >
                              <i class="glyphicon glyphicon-apple"></i>
                        </span>
                      </a>
                  </td>
                  <td><?=label('CtO');?></td>
                  <td>Ver productos vencidos o por vencerse</td>
                  <td><a href="#" class="btn btn-block btn-default">
                        <span class=" fa-lg" >
                              <i class="fa-lg fa fa-money"></i>
                        </span>
                      </a>
                  </td>
                  <td><?=label('CtH');?></td>                  
                  <td>Contar monedas y billetes</td>
                </tr>            
                <tr class="pos_help_labels">
                  <td style="padding-top: 5px;">
                      <a href="#" class="btn btn-block btn-default">
                        <span class=" fa-lg" >
                              <i class="fa-lg fa fa-money"></i>
                        </span>
                      </a>
                  </td>
                  <td><?=label('F4');?></td>
                  <td>Seleccionar método de pago/Introducir cantidad</td>
                  <td><a href="#" class="btn btn-block btn-default">
                        <span class=" fa-lg" >
                              <i class="fa-lg glyphicon glyphicon-erase"></i>
                        </span>
                      </a>
                  </td>
                  <td><?=label('CtR Devoluciones');?></td>                  
                  <td>Devolver productos de facturas</td>
                </tr>                              
              </table>
            </div>
            </fieldset>
            </form>
         </div>
      </div>
      <div class="modal-footer">       
          <button type="button" class="btn btn-default" data-dismiss="modal"><?=label("Close");?></button>
          <button id="btnMenuBtn" type="button" class="btn btn-primary" data-dismiss="modal"><?=label("Aceptar");?></button>
      </div>
    </div>
 </div>
</div>
<!-- /.Modal -->
<!-- Modal DEMO -->
<div class="modal fade" id="SearchInvoiceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog modal-lg" role="document" style="width: 85%;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
          <h4 class="modal-title" id="searchInvoiceH4"><?=label("SearchInvoice");?></h4>
      </div>
      <div class="modal-body">
         <div id="demos">       
              <!-- Text input-->
              <div class="form-group">
                <label class="col-md-2 control-label" for="searchInvoice"><?=label("invoice");?></label>  
                <div class="col-md-4">
                  <input id="searchInvoice" name="searchInvoice" type="search" placeholder="<?=label("invoice");?>" class="form-control input-md" autocomplete="off">
                </div>
              </div>
              <input id="hdnInvoiceSeleted" name="hdnInvoiceSeleted" type="hidden">
              <div id="resultInvoice" style="margin-top: 20px; height: 400px;overflow: auto; display: inline-block !important;width: 100% !important;">
              </div>
         </div>
      </div>
    
    </div>
 </div>
</div>
<!-- /.Modal -->


  <!-- Modal -->
  <div class="modal fade" id="Addpayament" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="Addpayament"><?=label("AddPayements");?></h4>
        </div>
        <form>
        <div class="modal-body">
             <div class="form-group">
               <h2 id="TotalModal"></h2>
            </div>
             <div class="form-group">
               <label for="paymentMethod"><?=label("paymentMethod");?></label>
               <select class="js-select-options form-control" id="paymentMethod">
                 <option value="0"><?=label("Cash");?></option>
                 <option value="1"><?=label("CreditCard");?></option>
                 <option value="2"><?=label("Cheque");?></option>
              </select>
             </div>
             <div class="form-group">
               <label for="PaidPos"><?=label("Paid");?></label>
               <input type="text" value="0" name="PaidPos" class="form-control <?=strval($this->setting->keyboard) === '1' ? 'paidk' : ''?>" id="PaidPos" placeholder="<?=label("Paid");?>">
             </div>
             <div class="form-group CreditCardNum">
               <i class="fa fa-cc-visa fa-2x" id="visa" aria-hidden="true"></i>
               <i class="fa fa-cc-mastercard fa-2x" id="mastercard" aria-hidden="true"></i>
               <i class="fa fa-cc-amex fa-2x" id="amex" aria-hidden="true"></i>
               <i class="fa fa-cc-discover fa-2x" id="discover" aria-hidden="true"></i>
               <label for="CreditCardNum"><?=label("CreditCardNum");?></label>
               <input type="text" class="form-control cc-num" id="CreditCardNum" placeholder="<?=label("CreditCardNum");?>">
             </div>
             <div class="clearfix"></div>
             <div class="form-group CreditCardHold col-md-4 padding-s">
               <input type="text" class="form-control" id="CreditCardHold" placeholder="<?=label("CreditCardHold");?>">
             </div>
             <div class="form-group CreditCardHold col-md-2 padding-s">
               <input type="text" class="form-control" id="CreditCardMonth" placeholder="<?=label("Month");?>">
             </div>
             <div class="form-group CreditCardHold col-md-2 padding-s">
               <input type="text" class="form-control" id="CreditCardYear" placeholder="<?=label("Year");?>">
             </div>
             <div class="form-group CreditCardHold col-md-4 padding-s">
               <input type="text" class="form-control" id="CreditCardCODECV" placeholder="<?=label("CODECV");?>">
             </div>
             <div class="form-group ChequeNum">
               <label for="ChequeNum"><?=label("ChequeNum");?></label>
               <input type="text" name="chequenum" class="form-control" id="ChequeNum" placeholder="<?=label("ChequeNum");?>">
             </div>
            <div class="clearfix"></div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal"><?=label("Close");?></button>
          <?=strval($this->setting->stripe) === '1' ? '<button type="button" class="btn btn-add stripe-btn" onclick="AddPayement(2)"><i class="fa fa-cc-stripe" aria-hidden="true"></i> '.label("StripePayment").'</button>' : ''; ?>
          <button type="button" class="btn btn-add" onclick="AddPayement(1)"><?=label("Submit");?></button>
        </div>
     <?php echo form_close(); ?>
      </div>
   </div>
  </div>
  <!-- /.Modal -->



<!-- Modal DEMO -->
<div class="modal fade" id="ModalCaja" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
          <h4 class="modal-title" id="myModalLabel">Contador de caja</h4>
      </div>
      <div class="modal-body">
         <div id="demos">

            <form class="form-horizontal">
              <fieldset>

                       <!-- Text input-->
               <div class="row">
                <div class="form-group col-md-12">
                   <label ><?=label("Billetes");?></label>
                </div>  
                <div class="form-group col-md-3" style="margin-left: inherit;">
                    <label ><?=label("100 mil");?></label>
                    <input id="b100mil" name="b100mil" type="number" class="form-control" value="0" onchange="contarCaja()">
                </div>  
                <div class="form-group col-md-3" style="margin-left: inherit;">
                    <label ><?=label("50 mil");?></label>
                    <input id="b50mil" name="b50mil" type="number" class="form-control" value="0" onchange="contarCaja()">
                </div>  
                <div class="form-group col-md-3" style="margin-left: inherit;">
                    <label ><?=label("20 mil");?></label>
                    <input id="b20mil" name="b20mil" type="number" class="form-control" value="0" onchange="contarCaja()">
                </div>  
                <div class="form-group col-md-3" style="margin-left: inherit;">
                    <label ><?=label("10 mil");?></label>
                    <input id="b10mil" name="b10mil" type="number" class="form-control" value="0" onchange="contarCaja()">
                </div>  
                <div class="form-group col-md-3" style="margin-left: inherit;">
                    <label ><?=label("5 mil");?></label>
                    <input id="b5mil" name="b5mil" type="number" class="form-control" value="0" onchange="contarCaja()">
                </div>  
                <div class="form-group col-md-3" style="margin-left: inherit;">
                    <label ><?=label("2 mil");?></label>
                    <input id="b2mil" name="b2mil" type="number" class="form-control" value="0" onchange="contarCaja()">
                </div>  
                <div class="form-group col-md-3" style="margin-left: inherit;">
                    <label ><?=label("1 mil");?></label>
                    <input id="b1mil" name="b1mil" type="number" class="form-control" value="0" onchange="contarCaja()">
                </div>  
              </div>  

               <div class="row">
                <div class="form-group col-md-12">
                   <label ><?=label("Monedas");?></label>
                </div>  
                <div class="form-group col-md-3" style="margin-left: inherit;">
                    <label ><?=label("1 mil");?></label>
                    <input id="m1mil" name="m1mil" type="number" class="form-control" value="0" onchange="contarCaja()">
                </div>  
                <div class="form-group col-md-3" style="margin-left: inherit;">
                    <label ><?=label("500");?></label>
                    <input id="m500" name="m500" type="number" class="form-control" value="0" onchange="contarCaja()">
                </div>  
                <div class="form-group col-md-3" style="margin-left: inherit;">
                    <label ><?=label("200");?></label>
                    <input id="m200" name="m200" type="number" class="form-control" value="0" onchange="contarCaja()">
                </div>  
                <div class="form-group col-md-3" style="margin-left: inherit;">
                    <label ><?=label("100");?></label>
                    <input id="m100" name="m100" type="number" class="form-control" value="0" onchange="contarCaja()">
                </div>  
                <div class="form-group col-md-3" style="margin-left: inherit;">
                    <label ><?=label("50");?></label>
                    <input id="m50" name="m50" type="number" class="form-control" value="0" onchange="contarCaja()">
                </div>  
              </div> 
              </fieldset>
              </form>
         </div>
      </div>

        <div class="modal-footer" style="height: 65px;">
          <button type="button" class="btn btn-add" onclick="cerrarContarCaja()"><?=label("Submit");?></button>
        </div>
    </div>
 </div>
</div>
<!-- /.Modal -->
<!-- Modal DEMO -->
<div class="modal fade" id="ControlCalidadModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog " role="document" style="width: 95%;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
          <h4 class="modal-title" id="controlCalidadH4"><?=label("Control de calidad");?></h4>
      </div>
      <div class="modal-body">
         <div id="demos">                     
              <div id="resultControl">
              </div>
         </div>
      </div>
    
    </div>
 </div>
</div>
<!-- /.Modal -->


<?php } ?>
