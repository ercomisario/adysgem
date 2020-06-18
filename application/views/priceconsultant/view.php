<style media="screen">
  body {
        background: url(<?=base_url()?>assets/img/login.jpg) no-repeat center center fixed;
       -webkit-background-size: cover;
       -moz-background-size: cover;
       -o-background-size: cover;
        background-size: cover;
     }
  .well {
    background-color: #FFFFFF !important;
  }
</style>
  <div class="container">
    
    <div class="col-sm-12">
         <div class="row"> 
            <div class="col-sm-12 well" style="width: 100%; height: 400px; border: solid #666666 1px;  margin-top: 20px;">
            <?php if($this->setting->image_publicity){ 
                  $type = substr($this->setting->image_publicity, -3);    // devuelve "ef"
                        //$type='mp4';
                    if($type=='mp4'){
                    ?><video id="video" class="responsive-video" width="1100" height="360" controls autoplay=”autoplay” muted="muted" loop>
                       <source src="<?=base_url()?>files/Setting/<?=$this->setting->image_publicity;?>" type="video/mp4" />
                        Tu navegador no soporta la etiqueta HTML5 video.
                       </video>                               
                <?php }else{ ?><img src="<?=base_url()?>files/Setting/<?=$this->setting->image_publicity;?>" width="1100px" height="360px"/>
                <?php  }
            } else { ?><img src="<?=base_url()?>files/Setting/publicidad.jpg" alt="logo" width="1100px" height="360px" ><?php } ?>
            </div>
          </div>
          <div class="row" style="display: flex; margin-top: 10px; ">
             <input type="text" name="barcode" id="barcode" class="col-sm-6" style="color: black;">
             <div class="col-sm-6" id="divSectionPrice"> <-- BUSQUEDA POR CODIGO DE BARRAS</div>
              <!-- <button type="button" class="btn btn-primary btn-lg col-sm-4" onclick="consultorPrice();">
               <?=label("Consultar Precio");?>
             </button>
             <button type="submit" class="btn btn-success btn-lg col-sm-4" onclick="cancelconsultorPrice();">
               <?=label("Limpiar Consulta");?>
             </button>-->
             
          </div>
          <div class="row" id="printSectionPrice" style="color: black; display: flex; margin-top: 20px;">
            
          </div>
          <input id="barNavHdn" name="barNavHdn" type="hidden">  

    </div>
</div>


<script type="text/javascript">
$(document).ready(function() {

  
  $('#printSectionPrice').css('background-color', '#FFFFFF');
  $('#divSectionPrice').css('background-color', 'rgb(81, 189, 156)');
  $('#divSectionPrice').css('color', '#FFFFFF');
  $('#divSectionPrice').css('padding-top', '7px');
  $('#divSectionPrice').css('font-weight', 'bold');
  $('#barcode').css('height','35px');

  $('#barcode').trigger('focus');
  $('#barcode').keypress(function (e) {
          if (e.keyCode == 13) {
            consultorPrice();          
          }          
    });

  /* OCULTAR BARRA DE NAVEGACION DE LA APP */
  function hide_navbar_app(){    
    $('#navbarapp').fadeOut();
    $('#barNavHdn').val(false);
    $('body').css('padding-top','0px');
    $('.pace-done').css('padding-top','0px');
    $('.container-fluid').css('margin-top', '5px');
  }
  /* MOSTRAR BARRA DE NAVEGACION DE LA APP */
  function show_navbar_app(){
    $('#navbarapp').fadeIn();
    $('#barNavHdn').val(true);
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
  // LLAMADOA FUNCION PARA CERRAR LA VENTANA
  console.log("aqui");

  shortcut.add("F1", function () {
    
      hide_show_navbar_app();
     
    }, {
      "type": "keydown",
      "propagate": false,
      "target": document
    });
    
hide_navbar_app();
  

});



 function consultorPrice(){
   //var productBcode = '123456';
   var productBcode = $("#barcode").val();
   if(productBcode.length>1)
   {
       $.ajax({
           url : "<?php echo site_url('productcontroller/barcodeprice')?>/"+productBcode,
           type: "POST",
           success: function(data)
           {
              $('#printSectionPrice').html(data);
              $('#barcode').val('');
              $('#barcode').trigger('focus');

              
           },
           error: function (jqXHR, textStatus, errorThrown)
           {
              alert("error");
           }
      });
    }
    else
    {
        swal('Oops...', 'Debe ingresar Código de Producto válido', 'error'); 
        cancelconsultorPrice();
    }
}  

function cancelconsultorPrice(){

    $('#printSectionPrice').html('');
    $('#barcode').trigger('focus');

}

  </script>

