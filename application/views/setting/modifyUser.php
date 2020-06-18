<div class="container container-small">
   <div class="row" style="margin-top:50px;">
      <a class="btn btn-default float-right" href="#" onclick="history.back(-1)" style="margin-top:10px;">
         <i class="fa fa-arrow-left"></i> <?=label("Back");?></a>

      <?php echo form_open_multipart('settings/editUser/'.$user->id); ?>
        <div style="margin-top: 50px;">
            <div class="form-group col-md-6">
             <label for="username"><?=label("Username");?></label>
             <input type="text" name="username" value="<?=$user->username?>" class="form-control" id="username" placeholder="<?=label("Username");?>">
           </div>
           
           <div class="form-group col-sm-6">
             <label for="store_id"><?=label("Store");?></label>
                     <select class="form-control" name="store_id" id="store_id">
                       <option value=""><?=label("Store");?></option>
                       <?php foreach ($Stores as $store):?>
                          <option value="<?=$store->id;?>" <?php if($user->store_id==$store->id){?> selected <?php }?> ><?=$store->name;?></option>
                       <?php endforeach;?>
                       </select>            
             </div>
             <div class="form-group col-md-6">
             <label for="firstname"><?=label("firstname");?></label>
             <input type="text" name="firstname" value="<?=$user->firstname?>" class="form-control" id="firstname" placeholder="<?=label("firstname");?>">
           </div>
           <div class="form-group col-md-6">
             <label for="lastname"><?=label("lastname");?></label>
             <input type="text" name="lastname" value="<?=$user->lastname?>" class="form-control" id="lastname" placeholder="<?=label("lastname");?>">
           </div>
           <div class="form-group col-md-6">
               <label for="role"><?=label("Role");?></label><br>
               <label class="radio-inline">
                 <input type="radio" name="role" id="role" value="admin"> <?=label("RoleAdimn");?>
               </label>
               <label class="radio-inline">
                 <input type="radio" name="role" id="role" value="sales"> <?=label("RoleSales");?>
               </label>
            </div>
           <div class="form-group col-md-6">
             <label for="email"><?=label("Email");?></label>
             <input type="email" name="email" value="<?=$user->email?>" class="form-control" id="email" placeholder="<?=label("Email");?>">
           </div>
           <div class="form-group col-md-6">
             <label for="password"><?=label("Password");?></label>
             <input type="password" name="password" class="form-control" id="password" placeholder="<?=label('Password');?>">
          </div>
           <div class="form-group col-md-6">
             <label for="PasswordRepeat"><?=label("PasswordRepeat");?></label>
             <input type="password" name="PasswordRepeat" class="form-control" id="PasswordRepeat" placeholder="<?=label('PasswordRepeat');?>">
           </div>
           <div class="form-group col-md-12">
             <label for="Avatar"><?=label("Avatar");?></label>
             <input type="file" name="userfile" id="Avatar">
           </div>
           <?php if($user->avatar){ ?><img src="<?=base_url()?>files/Avatars/<?=$user->avatar;?>" alt="" class="float-right" width="150px"/><?php }else{ ?><img src="<?=base_url()?>assets/img/Avatar.jpg" alt="" class="float-right" width="150px"/><?php } ?>

          <div class="form-group">
            <button type="submit" class="btn btn-green col-md-6 flat-box-btn"><?=label("Submit");?></button>
          </div>
      </div>
      <?php echo form_close(); ?>
    </div>
</div>
