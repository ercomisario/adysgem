<!-- Page Content -->
<link rel="stylesheet" href="<?=base_url()?>assets/css/buttons.dataTables.min.css" type='text/css'>

<div class="container" style="width: 98%;">
  <form action="trazas" method="post" class="form-inline float-right hidden-xs hidden-sm">

            <label for="date"><?=label("Date");?> *</label>
            <input type="text" maxlength="30" Required name="date" class="form-control" id="date" value="<?=$date?>">         
            <button type="submit" class="btn btn-primary"><?=label("Buscar");?></button>
         
   
     </form>
     <div id="printSectionTraza" style="margin-top: 50px;">
      <table id="tableTrazas" class="table table-striped table-bordered" cellspacing="0" width="100%">
          <thead>
              <tr>
                  <th><?=label("Code");?></th>
                  <th><?=label("Acción");?></th>
                  <th><?=label("Createdby");?></th>
                  <th><?=label("Date");?></th>
              </tr>
          </thead>

          <tbody>
             <?php 
             
             foreach ($trazas as $row){
                  
                  ?>
              <tr>
                 <td><?=$row->id;?></td>
                 <td><?=$row->action;?></td>
                 <td><?=$row->created_by;?></td>
                 <td><?=$row->created_at->format('d/m/Y H:m:i');?></td>
              </tr>
           <?php }?>
          </tbody>
      </table>
      </div>

</div>
<!-- /.container -->

  <script src="<?=base_url()?>assets/js/jquery.dataTables.min.js"></script>
  <script src="<?=base_url()?>assets/js/dataTables.buttons.min.js"></script>
  <script src="<?=base_url()?>assets/js/jszip.min.js"></script>
  <script src="<?=base_url()?>assets/js/pdfmake.min.js"></script>
  <script src="<?=base_url()?>assets/js/vfs_fonts.js"></script>
  <script src="<?=base_url()?>assets/js/buttons.html5.min.js"></script>
    
  

<script type="text/javascript">

$(document).ready(function() {
 
   $('#date').datepicker({
          todayHighlight: true,
          format:'yyyy-mm-dd'
   });
   $('#tableTrazas').DataTable( {
       "pageLength": 30,
        dom: 'Bfrtip',
        buttons: [
            'csv', 'excel', 'pdf'
        ]
    } );

});

</script>
