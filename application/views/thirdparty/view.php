<!-- Page Content -->
<style>
  #AddSupplier {
    width: 80%;
     vertical-align: middle;
}
body {
    padding-top: 40px;
}
</style>
<div class="container">
   <div class="row" style="margin-top:50px;">
      <table id="Table" class="table table-striped table-bordered" cellspacing="0" width="100%">
          <thead>
              <tr>
                  <th><?=label("ThirdpartyName");?></th>
                  <th><?=label("ThirdpartyPhone");?></th>
                  <th class="hidden-xs"><?=label("ThirdpartyEmail");?></th>
                  <th class="hidden-xs"><?=label("CreatedAt");?></th>
                  <th><?=label("Action");?></th>
              </tr>
          </thead>

          <tbody>
             <?php foreach ($thirdparties as $row):?>
              <tr>
                 <td><?=$row->name;?></td>
                 <td><?=$row->phone;?></td>
                 <td class="hidden-xs"><?=$row->email;?></td>
                 <td class="hidden-xs"><?=$row->created_at;?></td>
                 <td><div class="btn-group">
                       <a class="btn btn-default" href="javascript:void(0)" data-toggle="popover" data-placement="left"  data-html="true" title='<?=label("Areyousure");?>' data-content='<a class="btn btn-danger" href="thirdparties/delete/<?=$row->id;?>"><?=label("yesiam");?></a>'><i class="fa fa-times"></i></a>
                       <a class="btn btn-default" href="thirdparties/edit/<?=$row->id;?>" data-toggle="tooltip" data-placement="top" title="<?=label('Edit');?>"><i class="fa fa-pencil"></i></a>
                     </div>
                  </td>
              </tr>
           <?php endforeach;?>
          </tbody>
      </table>
   </div>
   <!-- Button trigger modal -->
   <button type="button" class="btn btn-add btn-lg" data-toggle="modal" data-target="#AddThirdparties">
     <?=label("AddThirdparties");?>
   </button>
</div>
<!-- /.container -->

<!-- Modal -->


<!-- Modal -->
<div class="modal fade" id="AddThirdparties" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div id="modal_addcustomer" class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?=label("AddThirdparties");?></h4>
      </div>
     <?php echo form_open_multipart('thirdparties/add'); ?>
      <div class="modal-body">

        <!-- 
         ___  __   __                        __     __
        |__  /  \ |__)  |\/| |  | |     /\  |__) | /  \
        |    \__/ |  \  |  | \__/ |___ /~~\ |  \ | \__/ 
        -->


        <div class="row"  id="form_addcustomer">   
         
          <div class="panel panel-default">
            <div class="panel-heading" id="heading_product" style="height: 50px">              
                <div class="col-md-12"> 
                  <div class="form-group">
                <div class="col-md-5"> 
                  <label class="radio-inline" for="cxpvended-0">
                    <input type="radio" name="CampoGeneral" id="cxpvended-0" value="1" checked="checked">
                    CXP
                  </label> 
                  <label class="radio-inline" for="radios-1">
                    <input type="radio" name="CampoGeneral" id="cxpvended-1" value="2">
                    CXC
                  </label> 
                </div>
              
              </div>
            </div>
          </div>
        </div>


          <div class="col-md-12">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="numdocumento">CC o NIT</label>
                    <div class="col-sm-4 form-group">  
                        <input type="text" name="numdoc" id="numdocumento" maxlength="50" class="form-control" placeholder="CC o NIT">
                    </div> 
                <label class="col-sm-2 control-label" for="modReferencia">Consultar:</label>
                   <div class="col-sm-4 form-group">  
                     <input type="text" name="numdoc" id="modReferencia" maxlength="50" class="form-control" placeholder="Tercero">
                   </div>
           </div> 
                <!-- FILA 5 -->
                 
                 <div class="form-group">
                      <label class="col-sm-2 control-label" for="numdocumento">Tipo documento</label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="numdoc" id="numdocumento" maxlength="50" class="form-control" placeholder="Tip documento">
                      </div> 
                      <label class="col-sm-2 control-label" for="numdocumento">Tipo tercero</label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="numdoc" id="numdocumento" maxlength="50" class="form-control" placeholder="Tipo tercero">
                      </div>                     
                </div> 
                <!-- FILA 6 -->
                 <div class="form-group">
                      <label class="col-sm-2 control-label" for="numdocumento">Nombres</label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="numdoc" id="numdocumento" maxlength="50" class="form-control" placeholder="Nombres">
                      </div> 
                      <label class="col-sm-2 control-label" for="numdocumento">Apellidos</label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="numdoc" id="numdocumento" maxlength="50" class="form-control" placeholder="Apellidos">
                      </div>                     
                </div> 
            <!-- FILA 7 --> 
            <div class="form-group">
                      <label class="col-sm-2 control-label" for="numdocumento">Dir principal</label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="numdoc" id="numdocumento" maxlength="50" class="form-control" placeholder="Dirección principal">
                      </div> 
                      <label class="col-sm-2 control-label" for="numdocumento">Telf principal</label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="numdoc" id="numdocumento" maxlength="50" class="form-control" placeholder="Teléfono principal">
                      </div>                     
                </div> 
         
           <!-- FILA 7 --> 

            <div class="form-group">
                      <label class="col-sm-2 control-label" for="numdocumento">Ciudad principal</label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="numdoc" id="numdocumento" maxlength="50" class="form-control" placeholder="Ciudad principal">
                      </div> 
                      <label class="col-sm-2 control-label" for="numdocumento">Celular</label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="numdoc" id="numdocumento" maxlength="50" class="form-control" placeholder="Celular">
                      </div>                     
                </div> 
         
           <!-- FILA 7 --> 

            <div class="form-group">
                      <label class="col-sm-2 control-label" for="numdocumento">Email</label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="numdoc" id="numdocumento" maxlength="50" class="form-control" placeholder="Email">
                      </div> 
                      <label class="col-sm-2 control-label" for="numdocumento">Empresa</label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="numdoc" id="numdocumento" maxlength="50" class="form-control" placeholder="Empresa">
                      </div>                     
                </div> 
          <!-- FILA 7 --> 

            <div class="form-group">
                      <label class="col-sm-2 control-label" for="numdocumento">Telf. Emprsa</label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="numdoc" id="numdocumento" maxlength="50" class="form-control" placeholder="Teléfono Empresa">
                      </div> 
                      <label class="col-sm-2 control-label" for="numdocumento">Dir. Empresa</label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="numdoc" id="numdocumento" maxlength="50" class="form-control" placeholder="Dirección Empresa">
                      </div>                     
                </div> 
           <!-- FILA 7 --> 

            <div class="form-group">
                      <label class="col-sm-2 control-label" for="numdocumento">Zona Dist.</label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="numdoc" id="numdocumento" maxlength="50" class="form-control" placeholder="Zona Distribución">
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
        <button type="button" class="btn btn-success"><?=label("new");?></button>
        <button   type="button" 
                  class="btn btn-danger" 
                  data-toggle="popover" 
                  data-placement="top" 
                  data-html="true"  
                  data-content='<a class="btn btn-danger" href="javascript:void(0)"><?=label("yesiam");?></a>'    
                  title='<?=label("Areyousure");?>'>
                  <?=label("delete2");?>
        </button>

        <button type="button" class="btn btn-info"><?=label("notes");?></button>
        <a href="#" class="btn btn-primary"><span class=" fa fa-file-text-o"></span></a>
        <a href="#" class="btn btn-success" data-toggle="modal" data-target="#ImportProducts" ><span class=" fa fa-file-excel-o"></span></a>
      
        <a class="btn btn-add btn-xs" href="products/csv"><?=label("DownloadCSV");?></a>
        <a class="btn btn-add btn-xs" data-toggle="modal" data-target="#ImportProducts"><?=label("UploadCSVfile");?></a>

        <!-- <button type="button" class="btn btn-default fa fa-file-text-o"></button> -->
        <!-- <button type="button" class="btn btn-default fa fa-file-excel-o"></button> -->
        <button type="button" class="btn bg-purple"><?=label("infdesc");?></button>
        <button type="button" class="btn "><?=label("chgdesc");?></button>
        <button type="button" class="btn btn-warning" data-dismiss="modal"><?=label("Close");?></button>
        
      </div>
      <!-- FIN BARRA BOTONES -->
      <?php echo form_close(); ?>
    </div>
  </div>
</div>
<!-- /.Modal -->
<!--<div class="modal fade" id="AddSupplier" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?=label("AddSupplier");?>sdffffffffff</h4>
      </div>
      <?php echo form_open_multipart('suppliers/add'); ?>
      <div class="modal-body">
            <div class="form-group">
             <label for="SupplierName"><?=label("SupplierName");?></label>
             <input type="text" name="name" maxlength="50" Required class="form-control" id="SupplierName" placeholder="<?=label("SupplierName");?>">
           </div>
           <div class="form-group">
             <label for="SupplierPhone"><?=label("SupplierPhone");?></label>
             <input type="text" name="phone" maxlength="30" class="form-control" id="SupplierPhone" placeholder="<?=label("SupplierPhone");?>">
           </div>
           <div class="form-group">
             <label for="SupplierEmail"><?=label("SupplierEmail");?></label>
             <input type="email" maxlength="50" name="email" class="form-control" id="SupplierEmail" placeholder="<?=label("SupplierEmail");?>">
           </div>
           <div class="form-group">
           <label for="Note"><?=label("Note");?></label>
           <textarea id="summernote" name="note"></textarea>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><?=label("Close");?></button>
        <button type="submit" class="btn btn-add"><?=label("Submit");?></button>
      </div>
   <?php echo form_close(); ?>
    </div>
 </div>
</div>-->
<!-- /.Modal -->
