<div class="container container">
   <div class="row" style="margin-top:100px;">
      <a class="btn btn-default float-right" href="#" onclick="history.back(-1)"style="margin-bottom:10px;">
         <i class="fa fa-arrow-left"></i> <?=label("Back");?></a>
      <?php echo form_open_multipart('suppliers/edit/'.$supplier->id); ?>
            <div class="row"  id="form_addcustomer">   
            <div class="col-md-12">

                    <div class="form-group">
                      <label class="col-md-2 control-label" for="numdoc"><?=label("Tipo documento");?> </label>
                        <div class="col-md-4 form-group">  
                           <select class="form-control" id="typedoc" name="typedoc">
                             <option value="1"<?php if($supplier->typedoc==1){?> selected <?php }?>>Cedula</option>
                             <option value="2"<?php if($supplier->typedoc==2){?> selected <?php }?>>Pasaporte</option>
                             <option value="3"<?php if($supplier->typedoc==3){?> selected <?php }?>>NIT</option>
                          </select>
                        </div>

                      <label class="col-md-2 control-label" for="numdoc"><?=label("Número documento");?> </label>
                      <div class="col-md-4 form-group">  
                        <input type="text" name="numdoc" id="numdoc" maxlength="50" Required class="form-control" placeholder="<?=label("Number");?>" value="<?=$supplier->numdoc;?>">
                      </div>   
                    </div>  
                <!-- FILA 5 -->
                 
                 <div class="form-group">
                      <label class="col-sm-2 control-label" for="name"><?=label("SupplierName");?></label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="name" id="name" maxlength="50" class="form-control" placeholder="<?=label("SupplierName");?>" Required value="<?=$supplier->name?>">
                      </div> 
                      <label class="col-md-2 control-label" for="regime"><?=label("Regime");?></label>
                      <div class="col-md-4 form-group">  
                         <select class="form-control" id="regime" name="regime">
                           <option value="">Seleccione</option>
                           <option value="1"<?php if($supplier->regime==1){?> selected <?php }?>>Común</option>
                           <option value="2"<?php if($supplier->regime==2){?> selected <?php }?>>Simplificado</option>
                        </select>
                      </div>
                                           
                </div> 
                <!-- FILA 6 -->
                 <div class="form-group">
                      <label class="col-sm-2 control-label" for="adresse"><?=label("Adresse");?></label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="adresse" id="adresse" maxlength="50" class="form-control" placeholder="<?=label("Adresse");?>" value="<?=$supplier->adresse?>">
                      </div> 
                      <label class="col-sm-2 control-label" for="legal"><?=label("Legal");?></label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="legal" id="legal" maxlength="50" class="form-control" placeholder="<?=label("Legal");?>" value="<?=$supplier->legal?>">
                      </div>                     
                </div> 
            <!-- FILA 7 --> 
            <div class="form-group">
                      <label class="col-sm-2 control-label" for="movil1"><?=label("Movil1");?></label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="movil1" id="movil1" maxlength="50" class="form-control" placeholder="<?=label("Movil1");?>" value="<?=$supplier->movil1?>">
                      </div> 
                      <label class="col-sm-2 control-label" for="phone"><?=label("SupplierPhone");?></label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="phone" id="phone" maxlength="50" class="form-control" placeholder="<?=label("SupplierPhone");?>" value="<?=$supplier->phone?>">
                      </div>                     
                </div> 
         
           <!-- FILA 7 --> 

            <div class="form-group">
                      <label class="col-sm-2 control-label" for="movil2"><?=label("Movil2");?></label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="movil2" id="movil2" maxlength="50" class="form-control" placeholder="<?=label("Movil2");?>" value="<?=$supplier->movil2?>">
                      </div> 
                      <label class="col-sm-2 control-label" for="city"><?=label("City");?></label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="city" id="city" maxlength="50" class="form-control" placeholder="<?=label("City");?>" value="<?=$supplier->city?>">
                      </div>                     
                </div> 
         
           <!-- FILA 7 --> 

            <div class="form-group">
                      <label class="col-sm-2 control-label" for="email"><?=label("Email");?></label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="email" id="email" maxlength="50" class="form-control" placeholder="<?=label("Email");?>" value="<?=$supplier->email?>">
                      </div>
                       <label class="col-sm-2 control-label" for="note"><?=label("Description");?></label>
                      <div class="col-sm-4 form-group">  
                        <input type="text" name="note" id="note"  class="form-control" placeholder="<?=label("Description");?>" value="<?=$supplier->note?>">
                      </div>                     
                </div> 
         
      <!-- FILA 7 --> 

            <div class="form-group">
                            
                </div> 
         

             </div>

        </div> 
        

      </div>
      <div class="form-group">
       <button type="submit" class="btn btn-add"><?=label("Submit");?></button>
      </div>
      <?php echo form_close(); ?>
</div>
