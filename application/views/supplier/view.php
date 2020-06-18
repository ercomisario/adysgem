<!-- Page Content -->
<div class="container">
   <div class="row" style="margin-top:20px;">
      <div class="float-right hidden-xs hidden-sm" style="margin-bottom:-30px;">
         <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#AddSupplier">
     <?=label("AddSupplier");?></button>
         <button type="button" class="btn btn-info" onclick="javascript:location.href='suppliers/csv/1';"><?=label("DownloadCSV");?></button>
         <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#ImportSuppliers"><?=label("UploadCSVfile");?></button>
     </div>
      <table id="Table" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
          <thead>
              <tr>
                  <th><?=label("SupplierName");?></th>
                  <th><?=label("NIT");?></th>
                  <th><?=label("City");?></th>
                  <th><?=label("SupplierPhone");?></th>
                  <th><?=label("SupplierEmail");?></th>
                  <th><?=label("CreatedAt");?></th>
                  <th><?=label("Action");?></th>
              </tr>
          </thead>

          <tbody>
             <?php foreach ($suppliers as $supplier):?>
              <tr>
                 <td><?=$supplier->name;?></td>
                 <td><?=$supplier->numdoc;?></td>
                 <td><?=$supplier->city;?></td>
                 <td><?=$supplier->phone;?></td>
                 <td><?=$supplier->email;?></td>
                 <td><?=$supplier->created_at;?></td>
                 <td><div class="btn-group">
                          <a class="btn btn-primary dropdown-toggle" href="javascript:void(0)" data-toggle="dropdown" >
                          <i class="fa fa-cog fa-fw"></i> <?=label("Action")?></a>
                          <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#">
                             <span class="fa fa-caret-down" title="Toggle dropdown menu"></span></a>
                          <ul class="dropdown-menu">
                             <li><a href="suppliers/edit/<?=$supplier->id;?>">
                                 <i class="fa fa-pencil fa-fw" aria-hidden="true"></i> <?=label("Edit")?></a></li>
                             <?php if($supplier->total==0){?>
                             <li><a href="javascript:void(0)" onclick="deleteSupplier(<?=$supplier->id;?>)">
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
  
function deleteSupplier(id)
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
             url : "<?php echo site_url('suppliers/delete')?>/"+id,
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
                   location.href="<?=base_url()?>suppliers";
                }           
             );
          


<?php }else if($band==-1){ ?>
          swal({   
              title: '<?=label("Aviso");?>',
              text: 'Importación de proveedores realizado con éxito',
              type: "info",
              showCancelButton: false,
              confirmButtonColor: "#DD6B55",
              confirmButtonText: '<?=label("Aceptar");?>',
              closeOnConfirm: true },
              function(){
                   location.href="<?=base_url()?>suppliers";
                }           
             );

<?php } ?>
});

  </script>

<!-- Modal -->
<div class="modal fade" id="AddSupplier" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div id="modal_addsupplier" class="modal-dialog" role="document">
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
                      <label class="col-md-2 control-label" for="numdoc"><?=label("Tipo documento");?> </label>
                        <div class="col-md-4 form-group">  
                           <select class="form-control" id="typedoc" name="typedoc">
                             <option value="">Seleccione</option>
                             <option value="1">Cédula</option>
                             <option value="2">Pasaporte</option>
                             <option value="3" selected>NIT</option>
                          </select>
                        </div>
                      <label class="col-md-2 control-label" for="numdoc"><?=label("Numero documento");?> </label>
                      <div class="col-md-4 form-group">  
                        <input type="text" name="numdoc" id="numdoc" maxlength="50" Required class="form-control" placeholder="<?=label("Number");?>">
                      </div>       
                    </div>     
      
                <!-- FILA 5 -->
                 
                 <div class="form-group">
                      <label class="col-sm-2 control-label" for="name"><?=label("SupplierName");?></label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="name" id="name" maxlength="50" class="form-control" placeholder="<?=label("SupplierName");?>" Required>
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
                <!-- FILA 6 -->
                 <div class="form-group">
                      <label class="col-sm-2 control-label" for="adresse"><?=label("Adresse");?></label>
                      <div class="col-sm-10 form-group">  
                        <input type="text" name="adresse" id="adresse" maxlength="50" class="form-control" placeholder="<?=label("Adresse");?>">
                      </div>                     
                </div> 
            <!-- FILA 7 --> 
            <div class="form-group">
                      <label class="col-sm-2 control-label" for="movil1"><?=label("Movil1");?></label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="movil1" id="movil1" maxlength="50" class="form-control" placeholder="<?=label("Movil1");?>">
                      </div> 
                      <label class="col-sm-2 control-label" for="phone"><?=label("SupplierPhone");?></label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="phone" id="phone" maxlength="50" class="form-control" placeholder="<?=label("SupplierPhone");?>">
                      </div>                     
                </div> 
         
           <!-- FILA 7 --> 

            <div class="form-group">
                      <label class="col-sm-2 control-label" for="movil2"><?=label("Movil2");?></label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="movil2" id="movil2" maxlength="50" class="form-control" placeholder="<?=label("Movil2");?>">
                      </div> 
                      <label class="col-sm-2 control-label" for="city"><?=label("City");?></label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="city" id="city" maxlength="50" class="form-control" placeholder="<?=label("City");?>">
                      </div>                     
                </div> 
         
           <!-- FILA 7 --> 

            <div class="form-group">
                      <label class="col-sm-2 control-label" for="email"><?=label("Email");?></label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="email" id="email" maxlength="50" class="form-control" placeholder="<?=label("Email");?>">
                      </div>                     
                       <label class="col-sm-2 control-label" for="note"><?=label("Description");?></label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="note" id="note"  class="form-control" placeholder="<?=label("Description");?>" >
                      </div>
                </div>        
         

             </div>

        </div> 
        <!-- FIN-form_addcustomer --> 

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
<!-- /.Modal -->
<!-- Modal -->
<div class="modal fade" id="ImportSuppliers" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?=label("AddSupplier");?></h4>
      </div>
      <?php
      $attributes = array('id' => 'addform');
      echo form_open_multipart('suppliers/importcsv', $attributes);
      ?>
      <div class="modal-body">
         <div class="form-group">
           <label for="user_file_import"><?=label("UploadCSVfile");?></label>
           <input type="file" name="user_file_import" id="user_file_import">
           <p class="help-block"><a href="<?=site_url('suppliers/csv/2');?>"><?=label('DownloadSample');?></a></p>
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

