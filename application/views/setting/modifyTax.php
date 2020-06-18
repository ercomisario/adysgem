<div class="container container-small">
   <div class="row" style="margin-top:100px;">
      <a class="btn btn-default float-right" href="#" onclick="history.back(-1)"style="margin-bottom:10px;">
         <i class="fa fa-arrow-left"></i> <?=label("Back");?></a>
      <?php echo form_open_multipart('taxes/edit/'.$taxes->id); ?>

      <div class="form-group">
      <label for="name"><?=label("TaxName");?> *</label>
      <input type="text" name="name" value="<?=$taxes->name;?>" class="form-control" id="name" placeholder="<?=label("TaxName");?>" required>
     </div>
     <div class="form-group">
        <label for="value"><?=label("TaxValue");?></label>
        <input type="text" name="value" value="<?=$taxes->value;?>" class="form-control" id="value" placeholder="<?=label("TaxValue");?>">
     </div>   
     
      <div class="form-group">
        <button type="submit" class="btn btn-green col-md-6 flat-box-btn"><?=label("Submit");?></button>
      </div>
      <?php echo form_close(); ?>
    </div>
</div>
