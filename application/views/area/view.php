<!-- Page Content -->
<div class="container">
   <h3>Segmento</h3>
    <div class="float-right hidden-xs hidden-sm" style="margin-bottom:-30px;">
         <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#AddArea">
           <?=label("Añadir Segmento");?>
         </button>         
     </div>
      <table id="Table" class="table table-striped table-bordered" cellspacing="0" width="100%">
          <thead>
              <tr>
                  <th><?=label("Name");?></th>
                  <th><?=label("CreatedAt");?></th>
                  <th><?=label("Action");?></th>
              </tr>
          </thead>

          <tbody>
             <?php foreach ($areas as $row):?>
              <tr>
                 <td><?=$row->name;?></td>
                 <td><?=$row->created_at;?></td>
                 <td><div class="btn-group">
                          <a class="btn btn-primary dropdown-toggle" href="javascript:void(0)" data-toggle="dropdown" >
                          <i class="fa fa-cog fa-fw"></i> <?=label("Action")?></a>
                          <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#">
                             <span class="fa fa-caret-down" title="Toggle dropdown menu"></span></a>
                          <ul class="dropdown-menu">
                             <li><a href="areas/edit/<?=$row->id;?>">
                                 <i class="fa fa-pencil fa-fw" aria-hidden="true"></i> <?=label("Edit")?></a></li>
                             <li><a href="javascript:void(0)" onclick="deleteAreas(<?=$row->id;?>)">
                                 <i class="fa fa-trash-o fa-fw" aria-hidden="true"></i><?=label("Delete")?></a></li>
                          </ul>
                      </div>
                  </td>
              </tr>
           <?php endforeach;?>
          </tbody>
      </table>
   
   <!-- Button trigger modal -->
</div>
<!-- /.container -->
<!-- Modal -->
<div class="modal fade" id="AddArea" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?=label("Add");?></h4>
      </div>
      <?php echo form_open_multipart('areas/add'); ?>
      <div class="modal-body">
           <div class="form-group">
             <label for="name"><?=label("Name");?></label>
             <input type="text" maxlength="50" name="name" class="form-control" id="name" placeholder="<?=label("CategoryName");?>" required>
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
  
function deleteAreas(id)
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
             url : "<?php echo site_url('areas/delete')?>/"+id,
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
</script>