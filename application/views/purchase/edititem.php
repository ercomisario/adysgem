<div class="container container-small">
  <div class="row"   style="margin-top:60px;">
    <div class="row">  
         <a class="btn btn-default float-right" href="#" onclick="history.back(-1)" style="margin-bottom:20px;">
         <i class="fa fa-arrow-left"></i> <?=label("Back");?></a>
     </div>
  
    <?php
         $attributes = array('id' => 'addform');
         echo form_open_multipart('purchases/edititem/'.$item_purchase->id.'/'.$store_id, $attributes);
         ?>
    <div class="modal-body">
            
             <div class="form-group col-sm-6">
               <label for="qt"><?=label("Quantity");?> *</label>
               <input type="text" name="qt" maxlength="25" Required class="form-control" id="qt" value="<?=$item_purchase->qt?>">
               
             </div>

           
            <div class="form-group controls col-sm-6 ">
               <label for="cost"><?=label("Cost");?></label>
               <input type="text" name="cost" id="cost" maxlength="50" class="form-control" value="<?=$item_purchase->cost?>">
             </div>
               <div class="form-group col-sm-6">
               <label for="store_id"><?=label("Tax");?></label>
                    <select class="form-control" name="tax_id" id="tax_id" Required>
                       <option value=""><?=label("Tax");?></option>
                       <?php foreach ($taxes as $row):?>
                          <option value="<?=$row->id;?>" <?=$item_purchase->tax_id===$row->id ? 'selected' : '';?> >
                                <?=$row->name;?>
                          </option>
                       <?php endforeach;?>
                       </select>
             </div>
           

           
            <div class="form-group controls col-sm-6 ">
               <label for="lote"><?=label("Lote");?></label>
               <input type="text" name="lote" id="lote" maxlength="50" class="form-control" value="<?=$item_purchase->lote?>">
             </div>
            <?php
            $date_exp='';
            $date_ven='';
            if($item_purchase->date_exp)
              $date_exp=$item_purchase->date_exp->format('Y-m-d');
            if($item_purchase->date_ven)
              $date_ven=$item_purchase->date_ven->format('Y-m-d');
            ?>
            <div class="form-group controls col-sm-6 ">
               <label for="date_exp"><?=label("Fecha expedición");?></label>
               <input type="text" name="date_exp" id="date_exp" maxlength="50" class="form-control date_purchase" value="<?=$date_exp?>" readonly>
             </div>
            <div class="form-group controls col-sm-6 ">
               <label for="date_ven"><?=label("Fecha vencimiento");?></label>
               <input type="text" name="date_ven" id="date_ven" maxlength="50" class="form-control date_purchase" value="<?=$date_ven?>" readonly>
             </div>

         </div>

     <div class="form-group">
       <button type="submit" class="btn btn-add"><?=label("Submit");?></button>
     </div>
     <?php echo form_close(); ?>
     </div>
</div>

<script type="text/javascript">

$(document).ready(function() {

      $('.date_purchase').datepicker({
          todayHighlight: true,
          format:'yyyy-mm-dd'
      });

  });

</script>

