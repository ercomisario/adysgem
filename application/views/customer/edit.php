<div class="container container-medium">
  <div class="row" style="margin-top:100px;">
    <a class="btn btn-default float-right" href="#" onclick="history.back(-1)"style="margin-bottom:10px;">
      <i class="fa fa-arrow-left"></i> <?=label("Back");?>
    </a>
    <?php echo form_open_multipart('customers/edit/'.$customer->id); ?>
              <div class="col-md-12">
                    <div class="form-group">
                      <label class="col-md-2 control-label" for="numdoc"><?=label("Document");?> </label>
                        <div class="col-md-2 form-group">  
                           <select class="form-control" id="typedoc" name="typedoc">
                             <option value="1"<?php if($customer->typedoc==1){?> selected <?php }?>>Cedula</option>
                             <option value="2"<?php if($customer->typedoc==2){?> selected <?php }?>>Pasaporte</option>
                             <option value="3"<?php if($customer->typedoc==3){?> selected <?php }?>>NIT</option>
                          </select>
                        </div>
                      <div class="col-md-2 form-group">  
                        <input type="text" name="numdoc" id="numdoc" maxlength="50" Required class="form-control" placeholder="<?=label("Number");?>" value="<?=$customer->numdoc;?>">
                      </div>   
                      <label class="col-md-2 control-label" for="regime"><?=label("Regime");?></label>
                      <div class="col-md-4 form-group">  
                         <select class="form-control" id="regime" name="regime">
                           <option value="">Seleccione</option>
                           <option value="1"<?php if($customer->regime==1){?> selected <?php }?>>Común</option>
                           <option value="2"<?php if($customer->regime==2){?> selected <?php }?>>Simplificado</option>
                        </select>
                      </div>
                    </div>  

                    <div class="form-group">
                      <label class="col-md-2 control-label" for="firstname1"><?=label("Firstname1");?></label>
                      <div class="col-md-4 form-group">  
                        <input type="text" name="firstname1" id="firstname1" maxlength="50" Required class="form-control" placeholder="<?=label("Firstname1");?>" value="<?=$customer->firstname1;?>">
                      </div>                      
                    </div>
                  <!-- FILA 3 -->
              
                    <div class="form-group">
                     <label class="col-md-2 control-label" for="firstname2"><?=label("Firstname2");?></label>
                      <div class="col-md-4 form-group">  
                        <input type="text" name="firstname2" maxlength="50" class="form-control" id="firstname2" placeholder="<?=label("Firstname2");?>" value="<?=$customer->firstname2;?>">
                      </div>
                      <label class="col-md-2 control-label" for="birthday"><?=label("Birthday");?> </label>
                          <div class="col-md-2 form-group">  
                             <select class="form-control" id="monthbirthday" name="monthbirthday">
                               <option value=""><?=label("Month");?></option>
                               <option value="1"<?php if($customer->monthbirthday==1){?> selected <?php }?>><?=label("January");?></option>
                               <option value="2"<?php if($customer->monthbirthday==2){?> selected <?php }?>><?=label("February");?></option>
                               <option value="3"<?php if($customer->monthbirthday==3){?> selected <?php }?>><?=label("March");?></option>
                               <option value="4"<?php if($customer->monthbirthday==4){?> selected <?php }?>><?=label("April");?></option>
                               <option value="5"<?php if($customer->monthbirthday==5){?> selected <?php }?>><?=label("May");?></option>
                               <option value="6"<?php if($customer->monthbirthday==6){?> selected <?php }?>><?=label("June");?></option>
                               <option value="7"<?php if($customer->monthbirthday==7){?> selected <?php }?>><?=label("July");?></option>
                               <option value="8"<?php if($customer->monthbirthday==8){?> selected <?php }?>><?=label("August");?></option>
                               <option value="9"<?php if($customer->monthbirthday==9){?> selected <?php }?>><?=label("September");?></option>
                               <option value="10"<?php if($customer->monthbirthday==10){?> selected <?php }?>><?=label("October");?></option>
                               <option value="11"<?php if($customer->monthbirthday==11){?> selected <?php }?>><?=label("November");?></option>
                               <option value="12"<?php if($customer->monthbirthday==12){?> selected <?php }?>><?=label("December");?></option>
                            </select>
                          </div>
                          <div class="col-md-2 form-group">  
                             <select class="form-control"  id="daybirthday" name="daybirthday">
                               <option value=""><?=label("Day");?></option>
                               <?php for ( $dia=1 ; $dia <= 31 ; $dia++): ?>
                               <option value="<?=$dia;?>"<?php if($customer->daybirthday==$dia){?> selected <?php }?>><?=$dia;?></option> 
                               <?php endfor; ?>
                            </select>
                          </div>                          
                    </div>                
                  <!-- FILA 4 -->
             
                    <div class="form-group">
                      <label class="col-md-2 control-label" for="lastname1"><?=label("Lastname1");?></label>
                      <div class="col-md-4 form-group">  
                        <input type="text" name="lastname1" maxlength="50" Required class="form-control" id="lastname1" placeholder="<?=label("Lastname1");?>" value="<?=$customer->lastname1;?>">
                      </div>                 
                      <label class="col-md-2 control-label" for="movil"><?=label("Movil");?></label>
                      <div class="col-md-4 form-group">  
                        <input type="text" name="movil" maxlength="50" class="form-control" id="movil" placeholder="<?=label("Movil");?>" value="<?=$customer->movil;?>">
                      </div>                    
                    </div>              
                <!-- FILA 5 -->
               
                    <div class="form-group">
                      <label class="col-md-2 control-label" for="lastname2"><?=label("Lastname2");?></label>
                      <div class="col-md-4 form-group">  
                        <input type="text" name="lastname2" maxlength="50" class="form-control" id="lastname2" placeholder="<?=label("Lastname2");?>" value="<?=$customer->lastname2;?>">
                      </div>
                      <label class="col-md-2 control-label" for="adresse"><?=label("Adresse");?></label>
                      <div class="col-md-4 form-group">  
                        <input type="text" name="adresse" maxlength="50"  class="form-control" id="adresse" placeholder="<?=label("Adresse");?>" value="<?=$customer->adresse;?>">
                      </div>
                   </div>                
                <!-- FILA 7 -->              
                    <div class="form-group">
                      <label class="col-md-2 control-label" for="phone"><?=label("Phone");?></label>
                      <div class="col-md-4 form-group">  
                        <input type="text" name="phone" maxlength="50"  class="form-control" id="phone" placeholder="<?=label("Phone");?>" value="<?=$customer->phone;?>">
                      </div>                    
                      <label class="col-md-2 control-label" for="city"><?=label("City");?></label>
                      <div class="col-md-4 form-group">  
                        <input type="text" name="city" maxlength="50"  class="form-control" id="city" placeholder="<?=label("City");?>"value="<?=$customer->city;?>" >
                      </div>   
                    </div>
                <!-- FILA 9 -->
                    <div class="form-group">
                      <label class="col-md-2 control-label" for="email"><?=label("Email");?></label>
                      <div class="col-md-4 form-group">  
                        <input type="email" name="email" maxlength="50"  class="form-control" id="email" placeholder="<?=label("Email");?>" value="<?=$customer->email;?>">
                      </div>                     
                      <label class="col-md-2 control-label" for="discount"><?=label("Discount");?></label>
                      <div class="col-md-4 form-group">  
                        <input type="text" name="discount" maxlength="50"  class="form-control" id="discount" placeholder="<?=label("Discount");?>" value="<?=$customer->discount;?>">
                      </div>
                    </div>  
             </div>

  <div class="form-group">
    <button type="submit" class="btn btn-add"><?=label("Submit");?></button>
  </div>
  <?php echo form_close(); ?>
</div>