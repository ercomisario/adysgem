<!-- Page Content -->
 <?php $tab = (isset($_GET['tab'])) ? $_GET['tab'] : null; ?>
 <?php $resp = (isset($_GET['resp'])) ? $_GET['resp'] : null; ?>
 <div class="container">
   <div class="row" style="margin-top:100px;">
      <div class="col-md-12">
         <!-- tab navigation -->
         <ul class="nav nav-tabs">
            <li class="<?php echo ($tab == 'setting') ? 'active' : ''; ?>"><a href="#setting" data-toggle="tab"><i class="fa fa-cog" aria-hidden="true"></i> <?=label("Settings");?></a></li>
            <li class="<?php echo ($tab == 'users') ? 'active' : ''; ?>"><a href="#users" data-toggle="tab"><i class="fa fa-users" aria-hidden="true"></i> <?=label("users");?></a></li>
            <li class="<?php echo ($tab == 'stores') ? 'active' : ''; ?>"><a href="#stores" data-toggle="tab"><i class="fa fa-building-o" aria-hidden="true"></i> <?=label("PointOfSale");?></a></li>
            <li class="<?php echo ($tab == 'taxes') ? 'active' : ''; ?>"><a href="#taxes" data-toggle="tab"><i class="fa fa-usd" aria-hidden="true"></i> <?=label("Taxes");?></a></li>
            <li class="<?php echo ($tab == 'publicity') ? 'active' : ''; ?>"><a href="#publicity" data-toggle="tab"><i class="fa fa-usd" aria-hidden="true"></i> <?=label("Publicity");?></a></li>
         </ul>

         <!-- tab sections -->
         <div class="tab-content">
            <!-- General setting tab -->
            <div class="tab-pane fade in <?php echo ($tab == 'setting') ? 'active' : ''; ?>" id="setting">
               <h1><?=label("Settings");?></h1>
               <p><?=label("SettingsDesciption");?></p>
               <?php echo form_open_multipart('settings/updateSettings'); ?>
                 <div class="form-group col-md-6">
                   <label for="companyName"><?=label("Company");?></label>
                   <input type="text" value="<?=$this->setting->companyname;?>" name="companyname" class="form-control" id="companyName" placeholder="<?=label("Company");?>">
                 </div>
                 <div class="form-group col-md-6">
                    <label for="logo"><?=label("CompanyLogo");?></label>
                    <input type="file" name="logo_file" id="logo">
                    <?php if($this->setting->logo){ ?><img src="<?=base_url()?>files/Setting/<?=$this->setting->logo;?>" alt="" class="float-right" width="100px"/><?php } else { ?><img src="<?=base_url()?>assets/img/logo.png" alt="logo" class="float-right" width="100px">
                    <?php } ?>
                 </div>
                 <div class="form-group col-md-3">
                   <label for="phone"><?=label("Phone");?></label>
                   <input type="text" value="<?=$this->setting->phone;?>" name="phone" class="form-control" id="phone" placeholder="<?=label("Phone");?>">
                 </div>
                 <div class="form-group col-md-3">
                   <label for="currency"><?=label("Currency");?></label>
                   <input type="text" value="<?=$this->setting->currency;?>" name="currency" class="form-control" id="currency" placeholder="<?=label("Currency");?>">
                 </div>
                 <div class="form-group col-md-3">
                   <label for="DefaultDiscount"><?=label("DefaultDiscount");?></label>
                   <input type="text" value="<?=$this->setting->discount;?>" name="discount" class="form-control" id="DefaultDiscount" placeholder="<?=label("DefaultDiscount");?>">
                 </div>
                 <!--<div class="form-group col-md-3">
                   <label for="DefualtTax"><?=label("DefualtTax");?></label>
                   <input type="text" value="<?=$this->setting->tax;?>" name="tax" class="form-control" id="DefualtTax" placeholder="<?=label("DefualtTax");?>">
                 </div>-->
                 <div class="form-group col-md-3">
                   <label for="numberDecimal"><?=label("numberDecimal");?></label>
                   <select class="form-control" name="decimals" id="numberDecimal">
                      <option value="0" <?=$this->setting->decimals===0 ? 'selected' : '';?>>0</option>
                      <option value="1" <?=$this->setting->decimals===1 ? 'selected' : '';?>>0.1</option>
                      <option value="2" <?=$this->setting->decimals===2 ? 'selected' : '';?>>0.01</option>
                      <option value="3" <?=$this->setting->decimals===3 ? 'selected' : '';?>>0.001</option>
                   </select>
                 </div>
                 <div class="form-group col-md-6">
                   <label for="petros"><?=label("Petros");?></label>
                   <input type="text" value="<?=$this->setting->petros;?>" name="petros" class="form-control" id="petros" placeholder="<?=label("Petros");?>">
                 </div>
                 <div class="form-group col-md-6">
                   <label for="dollars"><?=label("Dolares");?></label>
                   <input type="text" value="<?=$this->setting->dollars;?>" name="dollars" class="form-control" id="dollars" placeholder="<?=label("Dolares");?>">
                 </div>
                 
                 <div class="form-group col-md-6">
                   <label>
                     <input type="hidden" name="keyboard" value="0" />
                     <input type="checkbox" name="keyboard" value="1" <?=strval($this->setting->keyboard) === '1' ? 'checked' : '';?>>
                     <span class="label-text"><?=label("Ver caja");?></span>
                   </label>
                 </div>
                 <div class="form-group col-md-6">
                   <label>
                      <select name="timezone" class="form-control">
                         <option value="0"><?= label('timezone');?></option>
                         <?php foreach($Timezones as $t) { ?>
                           <option value="<?php print $t['zone'] ?>" <?=$t['zone'] === $this->setting->timezone ? 'selected' : ''; ?>>
                             <?php print $t['diff_from_GMT'] . ' - ' . $t['zone'] ?>
                           </option>
                         <?php } ?>
                       </select>
                   </label>
                 </div>

                 <div class="col-md-6">
                    <h4><?=label("ReceiptHeader");?></h4>
                    <textarea id="summernote" name="receiptheader"><?=$this->setting->receiptheader;?></textarea>
                  </div>
                  <div class="form-group col-md-6">
                     <h4><?=label("ReceiptFooter");?></h4>
                     <textarea  id="summernote2" name="receiptfooter"><?=$this->setting->receiptfooter;?></textarea>
                  </div>
                 <!-- <div class="form-group col-md-12">
                    <label data-toggle="collapse" data-target="#collapseStripe">
                      <input type="hidden" name="stripe" value="0" />
                      <input type="checkbox" name="stripe" value="1" <?=strval($this->setting->stripe) === '1' ? 'checked' : '';?>>
                      <span class="label-text">Stripe</span>
                    </label>
                  </div>
                  <div id="collapseStripe" class="panel-collapse collapse <?=strval($this->setting->stripe) === '1' ? 'in' : '';?>">
                     <div class="panel-body">
                       <div class="form-group col-md-6">
                          <label for="stripe_secret_key">stripe secret key</label>
                          <input type="text" value="<?=$this->setting->stripe_secret_key;?>" name="stripe_secret_key" class="form-control" id="stripe_secret_key" placeholder="stripe secret key">
                       </div>
                       <div class="form-group col-md-6">
                          <label for="stripe_publishable_key">stripe publishable key</label>
                          <input type="text" value="<?=$this->setting->stripe_publishable_key;?>" name="stripe_publishable_key" class="form-control" id="stripe_publishable_key" placeholder="stripe publishable key">
                       </div>
                     </div>
                  </div>-->
                  <div class="form-group col-md-12">
                      <div class="form-group col-md-6">
                         <h4><?=label("themesPick");?></h4>
                         <label class="themesPick col-md-6">
                            <input type="radio" name="theme" value="Light" <?=$this->setting->theme === 'Light' ? 'checked' : '';?>/>
                            <img src="<?=base_url(
                            )?>assets/img/Light-theme.png" alt="Light-theme" width="200">
                          </label>
                          <label class="themesPick col-md-6">
                            <input type="radio" name="theme" value="Dark" <?=$this->setting->theme === 'Dark' ? 'checked' : '';?> />
                            <img src="<?=base_url()?>assets/img/Dark-theme.png" alt="Dark-theme" width="200">
                          </label>
                      </div>                    
                  </div>
                 <div class="col-md-12">
                    <button type="submit" class="btn btn-primary btn-lg"><?=label("Submit");?></button>
                 </div>
               <?php echo form_close(); ?>
            </div>
            <!-- users tab -->
            <div class="tab-pane fade in <?php echo ($tab == 'users') ? 'active' : ''; ?>" id="users">
               <table class="table">
                  <tr>
                     <th><?=label("Avatar");?></th>
                     <th><?=label("firstname");?></th>
                     <th><?=label("lastname");?></th>
                     <th><?=label("Username");?></th>
                     <th><?=label("Role");?></th>
                     <th><?=label("lastActive");?></th>
                     <th><?=label("Action");?></th>
                  </tr>
                  <?php foreach ($Users as $user):?>
                   <tr>
                      <td><img class="img-circle topbar-userpic hidden-xs" src="<?=$user->avatar ? base_url().'files/Avatars/'.$user->avatar : base_url().'assets/img/Avatar.jpg' ?>" width="30px" height="30px"></td>
                      <td><?=$user->firstname;?></td>
                      <td><?=$user->lastname;?></td>
                      <td><?=$user->username;?></td>
                      <td><?=$user->role;?></td>
                      <td><?=$user->last_active;?></td>
                      <td><div class="btn-group">
                            <?php if($user->id !== 1){?><a class="btn btn-default" href="settings/deleteUser/<?=$user->id;?>" data-toggle="tooltip" data-placement="top" title="<?=label('Delete');?>"><i class="fa fa-times"></i></a><?php } ?>
                            <a class="btn btn-default" href="settings/editUser/<?=$user->id;?>" data-toggle="tooltip" data-placement="top" title="<?=label('Edit');?>"><i class="fa fa-pencil"></i></a>
                          </div>
                       </td>
                   </tr>
                <?php endforeach;?>
               </table>
               <!-- Button trigger modal -->
               <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#AddUser">
                  <?=label("Adduser");?>
               </button>
            </div>
            <!-- Stores tab -->
            <div class="tab-pane fade in <?php echo ($tab == 'stores') ? 'active' : ''; ?>" id="stores">
               <table class="table">
                  <tr>
                     <th><?=label("StoreName");?></th>
                     <th><?=label("Email");?></th>
                     <th><?=label("StorePhone");?></th>
                     <th><?=label("Country");?></th>
                     <th><?=label("City");?></th>
                     <th><?=label("Licencia");?></th>
                     <th><?=label("Inicio factura");?></th>
                     <th><?=label("Action");?></th>
                  </tr>
                  <?php foreach ($Stores as $store):?>
                   <tr>
                      <td><?=$store->name;?></td>
                      <td><?=$store->email;?></td>
                      <td><?=$store->phone;?></td>
                      <td><?=$store->country;?></td>
                      <td><?=$store->city;?></td>
                      <td>Activa</td>
                      <td><?=$store->invoice_begin;?></td>
                      <td><div class="btn-group">
                            <a class="btn btn-default" <?= $store->id == 1 ? 'disabled="disabled"' : '';?> href="stores/delete/<?=$store->id;?>" data-toggle="tooltip" data-placement="top" title="<?=label('Delete');?>"><i class="fa fa-times"></i></a>
                            <a class="btn btn-default" href="stores/edit/<?=$store->id;?>" data-toggle="tooltip" data-placement="top" title="<?=label('Edit');?>"><i class="fa fa-pencil"></i></a>
                          </div>
                       </td>
                   </tr>
                   <?php endforeach;?>
                  </table>
                  <!-- Button trigger modal -->

                <?php if ( isset($resp) && ($resp=='nolicencia') ){?>
                   <div class="well">
                     'Ooop!', 'Debe comprar licencia. Comuniquese con su proveedor'; 
                   </div>
                <?php }?>
                  <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#AddStore">
                     <?=label("AddStore");?>
                  </button>
                 
            </div>
            <!-- Impuestos tab -->
            <div class="tab-pane fade in <?php echo ($tab == 'taxes') ? 'active' : ''; ?>" id="taxes">
               <table class="table">
                  <tr>
                     <th><?=label("TaxName");?></th>
                     <th><?=label("TaxValue");?></th>
                     <th><?=label("CreatedDate");?></th>
                     <th><?=label("Action");?></th>
                  </tr>
                  <?php foreach ($taxes as $row):?>
                   <tr>
                      <td><?=$row->name;?></td>
                      <td><?=$row->value;?></td>
                      <td><?=$row->created_date;?></td>
                      <td><div class="btn-group">
                            <a class="btn btn-default" href="taxes/delete/<?=$row->id;?>" data-toggle="tooltip" data-placement="top" title="<?=label('Delete');?>"><i class="fa fa-times"></i></a>
                            <a class="btn btn-default" href="taxes/edit/<?=$row->id;?>" data-toggle="tooltip" data-placement="top" title="<?=label('Edit');?>"><i class="fa fa-pencil"></i></a>
                          </div>
                       </td>
                   </tr>
                   <?php endforeach;?>
                  </table>
                  <!-- Button trigger modal -->
                  <button type="button" class="btn btn-add btn-lg" data-toggle="modal" data-target="#AddTaxes">
                     <?=label("AddTaxes");?>
                  </button>
            </div>
            <!-- Publicidad -->
            <div class="tab-pane fade in <?php echo ($tab == 'publicity') ? 'active' : ''; ?>" id="publicity">
              <?php echo form_open_multipart('settings/updateSettingsPublicity'); ?>
                  <dir class="row">
                    <div class="form-group col-md-12">
                        <label for="image_publicity"><?=label("ImagePublicity");?></label>
                        <input type="file" name="publicity_file" id="publicity_file"><br>
                        <h4>Recomendado para imágenes resolución 1100 x 310 pixeles y videos .mp4</h4><br>
                        <?php if($this->setting->image_publicity){ 
                        $type = substr($this->setting->image_publicity, -3);    // devuelve "ef"
                        //$type='mp4';
                          if($type=='mp4'){
                          ?><video class="responsive-video" controls width="400" height="250" >
                             <source src="<?=base_url()?>files/Setting/<?=$this->setting->image_publicity;?>" type="video/mp4" />
                              </video>                               
                        <?php }else{ ?><img src="<?=base_url()?>files/Setting/<?=$this->setting->image_publicity;?>" alt="" class="float-left" width="300px"/>
                        <?php  }

                                           
                      } else { 
                          ?><img src="<?=base_url()?>files/Setting/publicidad.jpg" alt="logo" class="float-right" width="300px">
                        <?php } ?>
                    </div>
                  </dir>  
                 
                  <div class="col-md-12">
                    <button type="submit" class="btn btn-primary btn-lg"><?=label("Submit");?></button>
                 </div>
               <?php echo form_close(); ?>
            </div>
            <!-- fin Publicidad -->
         </div>
      </div>
   </div>
</div>
<!-- /.container -->
<script type="text/javascript">

</script>

<!-- add user Modal -->
<div class="modal fade" id="AddUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?=label("Adduser");?></h4>
      </div>
      <?php echo form_open_multipart('settings/addUser'); ?>
      <div class="modal-body">
         <fieldset>
            <div class="form-group col-md-6">
             <label for="username"><?=label("Username");?> *</label>
             <input type="text" name="username" class="form-control" id="username" placeholder="<?=label("Username");?>" required>
           </div>
           <div class="form-group col-sm-6">
               <label for="store_id"><?=label("Store");?></label>
                     <select class="form-control" name="store_id" id="store_id">
                       <option value=""><?=label("Store");?></option>
                       <?php foreach ($Stores as $store):?>
                          <option value="<?=$store->id;?>"><?=$store->name;?></option>
                       <?php endforeach;?>
                       </select>            
             </div>
            
           <div class="form-group col-md-6">
             <label for="firstname"><?=label("firstname");?> *</label>
             <input type="text" name="firstname" class="form-control" id="firstname" placeholder="<?=label("firstname");?>" required>
           </div>
           <div class="form-group col-md-6">
             <label for="lastname"><?=label("lastname");?></label>
             <input type="text" name="lastname" class="form-control" id="lastname" placeholder="<?=label("lastname");?>">
           </div>
           <div class="form-group col-md-6">
               <label for="role"><?=label("Role");?> *</label><br>
               <label class="radio-inline">
                 <input type="radio" name="role" id="role" value="admin" checked> <?=label("RoleAdimn");?>
               </label>
               <label class="radio-inline">
                 <input type="radio" name="role" id="role" value="sales"> <?=label("RoleSales");?>
               </label>
            </div>
           <div class="form-group col-md-6">
             <label for="email"><?=label("Email");?></label>
             <input type="email" name="email" class="form-control" id="email" placeholder="<?=label("Email");?>">
           </div>
           <div class="form-group col-md-6">
             <label for="password"><?=label("Password");?> *</label>
             <input type="password" name="password" class="form-control" id="password" placeholder="<?=label('Password');?>" required>
          </div>
           <div class="form-group col-md-6">
             <label for="confirm_password"><?=label("PasswordRepeat");?> *</label>
             <input type="password" name="PasswordRepeat" class="form-control" id="confirm_password" placeholder="<?=label('PasswordRepeat');?>" required>
           </div>
           <div class="form-group col-md-12">
             <label for="Avatar"><?=label("Avatar");?></label>
             <input type="file" name="userfile" id="Avatar">
           </div>
        </fieldset>

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


<!-- add store Modal -->
<div class="modal fade" id="AddStore" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?=label("AddStore");?></h4>
      </div>
      <?php echo form_open_multipart('stores/add'); ?>
      <div class="modal-body">
        <fieldset>
            <div class="col-md-12 form-group">
             <label for="licencia"><?=label("Licencia");?> *</label>
             <input type="text" name="licencia" class="form-control" id="licencia" placeholder="<?=label("Licencia");?>" required>
           </div>
            <div class="col-md-12 form-group">
             <label for="StoreName"><?=label("StoreName");?> *</label>
             <input type="text" name="name" class="form-control" id="StoreName" placeholder="<?=label("StoreName");?>" required>
           </div>
           <div class="col-md-6 form-group">
             <label for="email"><?=label("Email");?></label>
             <input type="email" name="email" class="form-control" id="email" placeholder="<?=label("Email");?>">
          </div>
           <div class="col-md-6 form-group">
             <label for="StorePhone"><?=label("StorePhone");?></label>
             <input type="text" name="phone" class="form-control" id="StorePhone" placeholder="<?=label("StorePhone");?>">
           </div>
           <div class="col-md-6 form-group">
             <label for="Country"><?=label("Country");?></label>
             <input type="text" name="country" class="form-control" id="Country" placeholder="<?=label("Country");?>">
           </div>
           <div class="col-md-6 form-group">
             <label for="City"><?=label("City");?></label>
             <input type="text" name="city" class="form-control" id="City" placeholder="<?=label("City");?>">
           </div>
           <div class="col-md-12 form-group">
             <label for="Adresse"><?=label("Adresse");?></label>
             <input type="text" name="adresse" class="form-control" id="Adresse" placeholder="<?=label("Adresse");?>">
           </div>
           <div class="col-md-12 form-group">
             <label for="CustomeFooter"><?=label("CustomeFooter");?></label>
             <input type="text" name="footer_text" class="form-control" id="CustomeFooter" placeholder="<?=label("CustomeFooter");?>">
           </div>
           </fieldset>
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
</div>

<!-- add warehouse Modal -->
<div class="modal fade" id="AddTaxes" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?=label("AddTaxes");?></h4>
      </div>
      <?php echo form_open_multipart('taxes/add'); ?>
      <div class="modal-body">
            <div class="form-group">
             <label for="name"><?=label("TaxName");?> *</label>
             <input type="text" name="name" class="form-control" id="name" placeholder="<?=label("TaxName");?>" required>
           </div>
           <div class="form-group">
             <label for="value"><?=label("TaxValue");?></label>
             <input type="text" name="value" class="form-control" id="value" placeholder="<?=label("TaxValue");?>">
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

<script type="text/javascript">

/******** passwors confirmation validation ****************/

var currency = document.getElementById("currency");

function validatecurrency(){
  if(currency.value.length < 3) {
    currency.setCustomValidity("The Currency code must be at least 3 characters length");
  } else {
    currency.setCustomValidity('');
  }
}
if(currency) currency.onchange = validatecurrency;

//$('.collapse').collapse()

</script>

