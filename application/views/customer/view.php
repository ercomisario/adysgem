<!-- Page Content -->
<div class="container">
  <div class="row" style="margin-top:20px;">
      <div class="float-right hidden-xs hidden-sm" style="margin-bottom:-30px;">
         <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#AddCustomer">
     <?=label("AddCustomer");?></button>
         <button type="button" class="btn btn-info" onclick="javascript:location.href='customers/csv/1';"><?=label("DownloadCSV");?></button>
         <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#ImportCustomers"><?=label("UploadCSVfile");?></button>
     </div>      
     <table id="Table" class="table table-striped table-bordered" cellspacing="0" width="100%">
          <thead>
              <tr>
                  <th><?=label("ID");?></th>
                  <th><?=label("vnombre");?></th>
                  <th><?=label("vapellido");?></th>
                  <th><?=label("Phone");?></th>
                  <th><?=label("Celular");?></th>
                  <th><?=label("Email");?></th>
                  <th><?=label("Discount");?></th>
                  <th><?=label("CreatedAt");?></th>
                  <th><?=label("Action");?></th>
              </tr>
          </thead>

          <tbody>
             <?php foreach ($customers as $customer):?>
              <tr>
                 <td><?=$customer->id;?></td>
                 <td><?=$customer->firstname1;?></td>
                 <td><?=$customer->lastname1;?></td>
                 <td><?=$customer->phone;?></td>
                 <td><?=$customer->movil;?></td>
                 <td><?=$customer->email;?></td>
                 <td><?=$customer->discount;?></td>
                 <td><?=$customer->created_at->format('d/m/Y')?></td>
                 <td><div class="btn-group">
                          <a class="btn btn-primary dropdown-toggle" href="javascript:void(0)" data-toggle="dropdown" >
                          <i class="fa fa-cog fa-fw"></i> <?=label("Action")?></a>
                          <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#">
                             <span class="fa fa-caret-down" title="Toggle dropdown menu"></span></a>
                          <ul class="dropdown-menu">
                             <li><a href="customers/edit/<?=$customer->id;?>">
                                 <i class="fa fa-pencil fa-fw" aria-hidden="true"></i> <?=label("Edit")?></a></li>
                                 <?php if($customer->total==0){?>
                             <li><a href="javascript:void(0)" onclick="deleteCustomer(<?=$customer->id;?>)">
                                 <i class="fa fa-trash-o fa-fw" aria-hidden="true"></i><?=label("Delete")?></a></li>
                               <?php }?>
                          </ul>
                      </div>
                  </td>
              </tr>
           <?php endforeach;?>
          </tbody>
      </table>
   
   </div>
</div>
<!-- /.container -->
<script type="text/javascript">
  
function deleteCustomer(id)
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
             url : "<?php echo site_url('customers/delete')?>/"+id,
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

$(document).ready(function() {

<?php if($band>-1){ ?>

  var error;
  <?php if($band==1){ ?>
    error='Documento de identificación ya registrado.';
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
                   location.href="<?=base_url()?>customers";
                }           
             );
          


<?php }else if($band==-1){ ?>
          swal({   
              title: '<?=label("Aviso");?>',
              text: 'Importación de clientes realizado con éxito',
              type: "info",
              showCancelButton: false,
              confirmButtonColor: "#DD6B55",
              confirmButtonText: '<?=label("Aceptar");?>',
              closeOnConfirm: true },
              function(){
                   location.href="<?=base_url()?>customers";
                }           
             );

<?php } ?>
});

  </script>

<!-- Modal -->
<div class="modal fade" id="AddCustomer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div id="modal_addcustomer" class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?=label("AddCustomer");?></h4>
      </div>
      <?php echo form_open_multipart('customers/add'); ?>
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
                           <select class="form-control" id="typedoc" name="typedoc" Required>
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
                         <select class="form-control" id="regime" name="regime" Required>
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
<!-- Modal -->
<div class="modal fade" id="ImportCustomers" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?=label("AddCustomer");?></h4>
      </div>
      <?php
      $attributes = array('id' => 'addform');
      echo form_open_multipart('customers/importcsv', $attributes);
      ?>
      <div class="modal-body">
         <div class="form-group">
           <label for="user_file_import"><?=label("UploadCSVfile");?></label>
           <input type="file" name="user_file_import" id="user_file_import">
           <p class="help-block"><a href="<?=site_url('customers/csv/2');?>"><?=label('DownloadSample');?></a></p>
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

