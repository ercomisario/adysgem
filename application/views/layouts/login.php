
<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>POS Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="<?=base_url();?>assets/datatables/css/dataTables.bootstrap.css" rel="stylesheet">
    <script src="<?=base_url();?>assets/js/modernizr.min.js" type="text/javascript"></script>
    <!--<script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>-->
    <!-- normalize & reset style -->
    <link rel="stylesheet" href="<?=base_url();?>assets/css/normalize.min.css"  type='text/css'>
    <link rel="stylesheet" href="<?=base_url();?>assets/css/reset.min.css"  type='text/css'>
    <!-- Bootstrap Core CSS -->
    <link href="<?=base_url();?>assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<?=base_url()?>assets/css/Style-<?=$this->setting->theme?>.css" rel="stylesheet">
    <style media="screen">
    body {
            background: url(<?=base_url()?>assets/img/login.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
         }
    </style>
  </head>
  <body>
     <div class="modal fade" id="login-modal" tabindex="-1" role="dialog">
       <div class="modal-dialog">
            <div class="loginmodal-container">

      <?php if($licencia>0){?>
               <?php if($this->setting->logo){ ?><img src="<?=base_url()?>files/Setting/<?=$this->setting->logo;?>" alt="logo"  style='max-height: 45px; max-width: 200px; margin: 0 auto'><?php } else { ?><img src="<?=base_url()?>assets/img/logo.png" alt="logo"><?php } ?>
               <h1><?=label('Loginaccount');?></h1><br>
               <?php if(isset($message)){echo "<div class='red'>".$message."</div>";}?>
               <?php
              $attributes = array('class' => 'login');
              echo form_open('login', $attributes);
              ?>
               <input type="text" name="username" id="username" value="<?=isset($username)?$username:''?>" placeholder="<?=label("Username");?>" required autocomplete="off">
               <input type="password" name="password" id="password" placeholder="<?=label("Password");?>" required>
               <?php
                  echo form_submit('submit', label("Login"), "class='login loginmodal-submit'");
               ?>

              <?=form_close()?>

              <div class="login-help">
               &copy; <?=date("Y");?> <?=$this->setting->companyname?>
               <br><br>
                <h4><b>Sistema POS</b>, Para información y Soporte <a href="https://nitpos.com" target="_blank" style="color: black;">NIT S.A.S</a></h4>
              </div>
            <?php }elseif($licencia=='user'){?>

            <h5><?=label('Crear Usuario Administrador');?></h5>
              <?php
              $attributes = array('class' => 'login');
              echo form_open('auth/addUser', $attributes);
              ?>
               <input type="text" name="username" id="username" value="<?=isset($username)?$username:''?>" placeholder="<?=label("Usuario Administrador");?>" required autocomplete="off">

               <h5><?=label('Password');?></h5>
               <input type="password" name="password" id="password" value="<?=isset($store)?$store:''?>" placeholder="<?=label("Password");?>" required autocomplete="off">
             
               <h5><?=label('firstname');?></h5>
               <input type="text" name="firstname" id="firstname" value="<?=isset($firstname)?$firstname:''?>" placeholder="<?=label("firstname");?>" required autocomplete="off">
             
               <h5><?=label('lastname');?></h5>
               <input type="text" name="lastname" id="lastname" value="<?=isset($lastname)?$lastname:''?>" placeholder="<?=label("lastname");?>" required autocomplete="off">
               
               <h5><?=label('Email');?></h5>
               <input type="text" name="email" id="email" value="<?=isset($email)?$email:''?>" placeholder="<?=label("Email");?>" required autocomplete="off">
               <?php
                  echo form_submit('submit', label("Login"), "class='login loginmodal-submit'");
               ?>

              <?=form_close()?>
            
             
            <?php }else{?>
               <h5><?=label('Licencia');?></h5>
              <?php if(isset($message)){echo "<div class='red'>".$message."</div>";}?>
              <?php
              $attributes = array('class' => 'login');
              echo form_open('auth/licencia', $attributes);
              ?>
               <input type="text" name="text" id="text" value="<?=isset($text)?$text:''?>" placeholder="<?=label("Licencia");?>" required autocomplete="off">

               <h5><?=label('StoreName');?></h5>
               <input type="text" name="store" id="store" value="<?=isset($store)?$store:''?>" placeholder="<?=label("StoreName");?>" required autocomplete="off">
             
               <h5 class="col-sm-6"><?=label('Phone');?></h5>
               <h5 class="col-sm-6"><?=label('Adresse');?></h5>
               <input class="col-sm-6" type="text" name="phone" id="phone" value="<?=isset($phone)?$phone:''?>" placeholder="<?=label("Phone");?>" required autocomplete="off" style="width: 48%;margin-right: 5px">
               <input class="col-sm-6" type="text" name="adresse" id="adresse" value="<?=isset($adresse)?$adresse:''?>" placeholder="<?=label("Adresse");?>" required autocomplete="off" style="width: 48%;margin-left: 5px;">

               <h5 class="col-sm-6"><?=label('City');?></h5>
               <h5 class="col-sm-6"><?=label('Country');?></h5>
               <input class="col-sm-6" type="text" name="city" id="city" value="<?=isset($city)?$city:''?>" placeholder="<?=label("City");?>" required autocomplete="off" style="width: 48%;margin-right: 5px">
               <input class="col-sm-6" type="text" name="country" id="country" value="<?=isset($country)?$country:''?>" placeholder="<?=label("Country");?>" required autocomplete="off" style="width: 48%;margin-left: 5px;">
               
               <h5 class="col-sm-12"><?=label('Email');?></h5>
               <input type="text" name="email" id="email" value="<?=isset($email)?$email:''?>" placeholder="<?=label("Email");?>" required autocomplete="off">
               <?php
                  echo form_submit('submit', label("Login"), "class='login loginmodal-submit'");
               ?>

              <?=form_close()?>
            
            <?php }?>


            </div>
         </div>
       </div>




      <!-- jQuery -->
      <script type="text/javascript" src="<?=base_url()?>assets/js/jquery-2.2.2.min.js"></script>
      <!-- waves material design effect -->
      <script type="text/javascript" src="<?=base_url()?>assets/js/waves.min.js"></script>
      <!-- Bootstrap Core JavaScript -->
      <script type="text/javascript" src="<?=base_url()?>assets/js/bootstrap.min.js"></script>

      <script type="text/javascript">
      $(document).ready(function() {
         $('#login-modal').modal('show').on('hide.bs.modal', function (e) {
            e.preventDefault();
         
         });
         $('#login-modal').on('shown.bs.modal', function() {
            $('#username').trigger('focus');
         });
    
      });
      </script>
   </body>
</html>
