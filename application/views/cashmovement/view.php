<!-- Page Content -->
<link rel="stylesheet" href="<?=base_url()?>assets/css/buttons.dataTables.min.css" type='text/css'>

<style>
  .tablecash{
    text-align: end;
    width: 100%;
  }
  .titulo{
    text-align: left;
    font-weight: bold;
   }
  .totales{
    
    font-weight: bold;
    
  }
</style>

 
  <?php
  if(!$dateBegin)$dateBegin=date('Y-m-d');
  if(!$dateEnd)$dateEnd=date('Y-m-d');
  ?>
  <div class="container">

    <h3><?=label('CashMovements');?></h3>
    <br />
    <br />
  <div style="display: flex;">
    <div class="col-sm-5 well">
      <form action="cashmovements" method="post" >
        <div class="form-group controls col-sm-12 ">
          <label for="type"><?=label("TypeReport");?></label>
          <select class="form-control" name="type" id="type">
            <option value="1" <?php if($type==1) echo "selected ";?> >Reporte Z</option>
            <option value="2" <?php if($type==2) echo "selected ";?> >Informe Detallado Diario</option>
            <option value="4" <?php if($type==4) echo "selected ";?> >Informe Fiscal Diario</option>
            <option value="5" <?php if($type==5) echo "selected ";?> >Informe de Retenciones</option>
          </select>     
        </div>  
        <div class="form-group controls col-sm-6 ">
          <label for="date"><?=label("DateBegin");?></label>
          <input type="text" name="dateBegin" class="form-control" id="dateBegin" placeholder="<?=label("Date");?>" value="<?=$dateBegin?>">
        </div>
        <div class="form-group controls col-sm-6 ">
          <label for="date"><?=label("DateEnd");?></label>
          <input type="text" name="dateEnd" class="form-control col-sm-6" id="dateEnd" placeholder="<?=label("DateEnd");?>" value="<?=$dateEnd?>">
        </div>
        <div class="form-group controls col-sm-12 ">
          <label for="store_id"><?=label("Store");?></label>
          <select class="form-control" name="store_id" id="store_id">
            <option value=""><?=label("TODAS");?></option>
            <?php foreach ($stores as $row):?>
            <option value="<?=$row->id;?>" <?php if($store_id==$row->id) echo "selected ";?> ><?=$row->name;?></option>
            <?php endforeach;?>
          </select>      
        </div>
        <div class="form-group controls col-sm-12 ">
          <label for="register_id"><?=label("Registro");?></label>
          <select class="form-control" id="register_id" name="register_id">
            <option value=''><?=label("TODOS");?></option>
          <?php foreach ($registers as $row):
            $status='Cerrada';
            if($row->status==1)$status='Abierta';?>
            <option value="<?=$row->id;?>" <?php if($register_id==$row->id) echo "selected ";?> ><?=$row->id;?> - Fecha: <?=$row->date->format('d/m/Y');?> Caja: <?=$row->username;?> <?=$row->firstname;?> - <?=$status;?></option>
          <?php endforeach;?>
          </select>
        </div>
        <div class="form-group controls col-sm-12 ">
          <label for="user_id"><?=label("Caja/Usuario");?></label>
          <select class="form-control" name="user_id" id="user_id">
            <option value=""><?=label("TODOS");?></option>
            <?php foreach ($users as $row):?>
            <option value="<?=$row->id;?>" <?php if($user_id==$row->id) echo "selected ";?> ><?=$row->username;?> <?=$row->firstname;?> <?=$row->lastname;?></option>
            <?php endforeach;?>
          </select>        
        </div>
        <div class="col-sm-12 ">
           <button type="submit" class="btn btn-primary col-sm-4"><?=label("Search");?></button>
           <button type="button" class="btn btn-success col-sm-4" onclick="ticket();"><?=label("Ticket");?></button>
           <button type="button" class="btn btn-danger col-sm-4" onclick="gotoCashmovement();"><?=label("Cancel");?></button>
        </div>
                  

     </form>
  </div>
  <div class="col-sm-7 well" id="resultReport" style="margin-left: 10px;">
    <table id="encabezado" width="100%"><tr class="text-center" style="font-size: small;"><td><?=$this->setting->receiptheader;?></td></tr></table>

<?php if($type==1){?>
   <table class="table" cellspacing="0" >
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr style="font-size: smaller;">
        <td style="width: 50%;">REPORTE Z</td>
        <td style="width: 50%;" ><?=label("Openedby").' '.$createdBy;?></td>
      </tr> 
    </table>
   
    <table id="table0" class="table" cellspacing="0">
      <tbody>
      <?php if(isset($totales)){?>
       <?php    foreach ($totales as $row):    
       $totalFacturado=$row->total;        
            ?>
             <tr style="font-size: smaller;">
                 <td style="width: 50%;border-top:1px dashed #000;"><?=label('Total Facturado');?></td>
                 <td style="width: 50%;border-top:1px dashed #000;"><?=number_format((float)$row->total, $this->setting->decimals, '', '.');?></td>                 
              </tr>
           <?php endforeach;
         }
      ?>         
       </tbody>
    </table>
    <table id="table1" class="table" cellspacing="0">
      <tbody>
      <?php if(isset($invoices)){?>
       <thead class="thead-inverse">
        <tr style="font-size: smaller;">
          <th colspan="2" class="titulo" style="border-top:1px dashed #000;"><?=label('Dates');?></th>
        </tr >
      </thead>     
            <?php    foreach ($invoices as $row):            
            ?>
              <tr style="font-size: smaller;">
                 <td style="width: 50%;"><?=label('DateBegin');?></td>
                 <td><?=$row->datebegin;?></td>                 
              </tr>
              <tr style="font-size: smaller;">
                 <td><?=label('DateEnd');?></td>
                 <td><?=$row->dateend;?></td>                 
              </tr>
           <?php endforeach;
         }
      ?>         
       </tbody>
    </table>
    <table id="table2" class="table" cellspacing="0" >
      
    <?php if(isset($invoices)){?>
      <thead class="thead-inverse">
        <tr style="font-size: smaller;">
          <th colspan="2" class="titulo" style="border-top:1px dashed #000;"><?=label('Documents');?></th>
        </tr>
      </thead>
      <tbody>
            <?php  foreach ($invoices as $row):?>
              <tr style="font-size: smaller;">
                 <td style="width: 50%;"><?=label('InvoiceBegin');?></td>
                 <td><?=sprintf("%08d", $row->invoicebegin);?></td>                 
              </tr>
              <tr style="font-size: smaller;">
                 <td><?=label('InvoiceEnd');?></td>
                 <td><?=sprintf("%08d", $row->invoiceend);?></td>                 
              </tr>
              <tr class="totales" style="font-size: smaller;">
                 <td><?=label('InvoicesProcessed');?></td>
                 <td><?=$row->qt;?></td>                 
              </tr>
           <?php endforeach;?>
           <?php  foreach ($invoiceAnuladas as $row):?>
              <tr class="totales" style="font-size: smaller;">
                 <td><?=label('Facturas Anuladas');?></td>
                 <td><?=$row->anuladas;?></td>                 
              </tr>
           <?php endforeach;?>
          </tbody>
         <?php }?>         
    </table>
    <table id="table3" class="table" cellspacing="0" >
      <?php if(isset($paidmethods)){?>
      <thead class="thead-inverse">
        <tr style="font-size: smaller;">
          <th colspan="2" class="titulo" style="border-top:1px dashed #000;"><?=label('PaidMethods');?></th>
        </tr>
      </thead>      
      <tbody>
          <?php $total=0;
                foreach ($paidmethods as $row):
                  $paidmethod="Efectivo";
                  $PayMethode = explode('~', $row->paidmethod);
                  if($PayMethode[0]==1)
                    $paidmethod="Tarjeta de Crédito";
                  if($PayMethode[0]==2)
                    $paidmethod="Cheque";
                  if($PayMethode[0]==3)
                    $paidmethod="A Crédito";
                  $total+=$row->amount;
            ?>
              <tr style="font-size: smaller;">
                 <td style="width: 50%;"><?=$paidmethod;?></td>
                 <td><?=number_format((float)$row->amount, $this->setting->decimals, '', '.');?></td>
        
              </tr>
           <?php endforeach;?>                      
          </tbody>
         <?php }?>    
    </table>
    <table id="table3" class="table" cellspacing="0" >
      <?php if(isset($engravins)){?>
      <thead class="thead-inverse">
        <tr style="font-size: smaller;">
          <th colspan="2" class="titulo" style="border-top:1px dashed #000;"><?=label('Engravins');?></th>
        </tr>
      </thead>      
      <tbody>
          <?php foreach ($engravins as $row):            
            ?>
              <tr style="font-size: smaller;">
                 <td><?=label('Base');?></td>
                 <td><?=number_format((float)$row->base, $this->setting->decimals, '.', ',');?></td>
              </tr>
              <tr style="font-size: smaller;">
                 <td><?=label('Discount');?></td>
                 <td><?=number_format((float)$row->discountamount, $this->setting->decimals, '.', ',');?></td>
              </tr>
              <tr style="font-size: smaller;">
                 <td><?=label('Tax');?></td>
                 <td><?=number_format((float)$row->taxamount, $this->setting->decimals, '.', ',');?></td>
              </tr>
              <tr class="totales" style="font-size: smaller;">
                 <td><?=label('Total');?></td>
                 <td><?=number_format((float)$row->total, $this->setting->decimals, '', '.');?></td>
              </tr>
           <?php endforeach;?>           
          </tbody>
         <?php }?>    
    </table>
    
    <table class="table display nowrap" style="width:100%">
       <tr style="font-size: smaller;">
          <th colspan="5" class="titulo" style="border-top:1px dashed #000;"><?=label('Ingresos Ventas a Crédito');?></th>
        </tr>   
      <tr style="font-size: smaller;">
        <th width="25%"><?=label("invoice")?></th>
        <th width="50%"><?=label("Fecha de Factura")?></th>
        <th width="50%"><?=label("Paid")?></th></tr>
        <?php
              $totalPaid=0;
            foreach ($payaments as $row) {
              $totalPaid+=$row->paid;
              ?>
               <tr style="font-size: smaller;">
                  <td><?=sprintf("%08d", $row->invoice);?></td>                 
                  <td><span><?=$row->created_at;?></span></td>
                  <td><span><?=number_format((float)$row->paid, $this->setting->decimals, ',', '.')?></span></td>
               </tr>
            <?php }?>
            <tr style="font-size: smaller;"><td><?=label("Total")?></td><td></td>
               <td><span><?=number_format((float)$totalPaid, $this->setting->decimals, ',', '.')?></span></td>
            </tr>        
    </table>
    
    <table class="table display nowrap" style="width:100%">
       <tr style="font-size: smaller;">
          <th colspan="3" class="titulo" style="border-top:1px dashed #000;"><?=label('Expenses');?></th>
        </tr>   
      <tr style="font-size: smaller;">
        <th width="25%"><?=label("Category")?></th>
        <th width="50%"><?=label("Note")?></th>
        <th width="25%"><?=label("Amount")?></th></tr>
        <?php
              $totalExpenses=0;
            foreach ($expences as $row) {
              $totalExpenses+=$row->amount;
              ?>
               <tr style="font-size: smaller;">
                  <td><?=$row->category_name;?></td>
                  <td><span><?=$row->note;?></span></td>
                  <td><span><?=number_format((float)$row->amount, $this->setting->decimals, ',', '.')?></span></td>
               </tr>
            <?php }?>
            <tr style="font-size: smaller;">
              <td colspan="2"><?=label("Total")?></td><td></td>
              <td><span><?=number_format((float)$totalExpenses, $this->setting->decimals, ',', '.')?></span></td>
               </tr>        
     </table>
    <table class="table display nowrap" style="width:100%">
       <tr style="font-size: smaller;">
          <th colspan="2" class="titulo" style="border-top:1px dashed #000;"><?=label('Devoluciones');?></th>
        </tr>   
      <tr style="font-size: smaller;">
        <th width="75%"><?=label("Cantidad")?></th>
        <th width="25%"><?=label("Amount")?></th></tr>
        <?php
              $totalDevoluciones=0;
            foreach ($devoluciones as $row) {
              $totalDevoluciones=$row->total;
              ?>
               <tr style="font-size: smaller;">
                  <td><?=$row->devoluciones;?></td>
                  <td><span><?=number_format((float)$row->total, $this->setting->decimals, ',', '.')?></span></td>
               </tr>
            <?php }?>       
     </table>
    <table class="table display nowrap" style="width:100%">
       <tr style="font-size: small;">
          <th class="titulo" style="border-top:1px dashed #000;"><?=label('Facturado + Ingresos - Egresos- Devoluciones');?></th>
          <th class="titulo" style="border-top:1px dashed #000;"><?=number_format((float)$totalFacturado+$totalPaid-$totalExpenses-$totalDevoluciones, $this->setting->decimals, ',', '.')?></th>
       </tr>         
     </table>

    <table id="table4" class="table" cellspacing="0">
      <?php if(isset($sales)){?>
      <thead class="thead-inverse">
        <tr style="font-size: smaller;">
          <th colspan="4" class="titulo" style="border-top:1px dashed #000;"><?=label('TaxResume');?></th>
        </tr>
      </thead>
      <tbody>     
          <?php foreach ($sales as $row):
            ?>
              <tr style="font-size: smaller;">
                 <td><?=$row->name;?></td>
                 <td><?=number_format((float)$row->base, $this->setting->decimals, '', '.');?></td>
                 <td><?=number_format((float)$row->taxamount, $this->setting->decimals, '', '.');?></td>
                 <td><?=number_format((float)$row->total, $this->setting->decimals, '', '.');?></td>
              </tr>
           
           <?php endforeach;?>
          </tbody>
         <?php }?>    
     </table>
    <table id="tableDevol" class="table" cellspacing="0">
      <?php if(isset($taxDevoluciones)){?>
      <thead class="thead-inverse">
        <tr style="font-size: smaller;">
          <th colspan="4" class="titulo" style="border-top:1px dashed #000;"><?=label('Resumen IVA Devoluciones');?></th>
        </tr>
      </thead>
      <tbody>     
          <?php foreach ($taxDevoluciones as $row):
            ?>
              <tr style="font-size: smaller;">
                 <td><?=$row->name;?></td>
                 <td><?=number_format((float)$row->base, $this->setting->decimals, '', '.');?></td>
                 <td><?=number_format((float)$row->taxamount, $this->setting->decimals, '', '.');?></td>
                 <td><?=number_format((float)$row->total, $this->setting->decimals, '', '.');?></td>
              </tr>
           
           <?php endforeach;?>
          </tbody>
         <?php }?>    
     </table>
    <table class="table" cellspacing="0" border="0">
      <thead class="thead-inverse">
        <tr style="font-size: smaller;">
          <th colspan="2" class="titulo" style="border-top:1px dashed #000;"><?=label('Total por Categorías');?></th>
        </tr>
      </thead>
      <tbody>

      <?php
      $totalArea=0;
      foreach ($areas as $row) {
         $totalArea+=$row->total;?>
          <tr style="font-size: smaller;">
            <td style="text-align:left;"><?=$row->name?></td>
            <td style="text-align:center;"><?=number_format($row->total, $this->setting->decimals, ',', '.')?></td>
          </tr>
      <?php }?>
          <tr style="font-size: smaller;">
              <td style="text-align:left;">TOTAL : </td>
              <td style="text-align:center;"><?=number_format($totalArea, $this->setting->decimals, ',', '.')?></td>
          </tr>
      </tbody>
    </table>
                  
   <?php }?>
   <?php if($type==2){?>
     <table width="100%">
          <tr class="text-center" style="font-size: small;"><td id="titulo1">Informe Detallado Diario</td></tr>
          <tr class="text-center" style="font-size: small;"><td id="titulo2">Desde:<?=$dateBegin;?> Hasta; <?=$dateEnd;?></td></tr>
      </table>

      <table id="tableDiario" class="table display nowrap" style="width:100%">
      <?php if(isset($sales)){
        ?>
      <thead class="thead-inverse">
        <tr style="font-size: smaller;">
          <th ><?=label('invoice');?></th>
          <th ><?=label('Método');?></th>
          <th ><?=label('Date');?></th>          
          <th ><?=label('Base');?></th>
          <th ><?=label('IVA');?></th>
          <th ><?=label('Status');?></th>
          <th ><?=label('Total');?></th>
        </tr>
      </thead>
      <tbody>     
          <?php

            $totalBbase = 0;
            $totalTaxamount = 0;
            $sumaTotal = 0;
            $i=0;
            $j=0;
          foreach ($sales as $row):
            $i++;
            $status="Valida";
            $color="";
            if($row->in_activo==2)
              {
                $status="Anulada";
                $color="color:red";
                $j++;
              }
              else
              {
                $totalBbase+=$row->base;
                $totalTaxamount+=$row->taxamount;
                $sumaTotal+=$row->subtotal;
              }
                $paidmethod="Efectivo";
                $PayMethode = explode('~', $row->paidmethod);
                if($PayMethode[0]==1)
                    $paidmethod="Tarjeta de Crédito";
                if($PayMethode[0]==2)
                    $paidmethod="Cheque";
                if($PayMethode[0]==3)
                    $paidmethod="A Crédito";
                 
            ?>
              <tr style="font-size: smaller; <?=$color?> ">
                 <td ><?=sprintf("%08d", $row->invoice);?></td>
                 <td ><?=$paidmethod;?></td>
                 <td ><?=$row->created_at->format('d/m/Y');?></td>
                 <td ><?=number_format((float)$row->base, $this->setting->decimals, ',', '.');?></td>
                 <td ><?=number_format((float)$row->taxamount, $this->setting->decimals, ',', '.');?></td>
                 <td ><?=$status;?></td>
                 <td ><?=number_format((float)$row->subtotal, $this->setting->decimals, ',', '.');?></td>
              </tr>
           
           <?php endforeach;?>
           <tr style="font-size: smaller;">
              <td >Totales&nbsp;:</td>
              <td ><?=($i-$j);?>&nbsp;&nbsp;Valido</td>
              <td ><?=$j;?>&nbsp;&nbsp;&nbsp;Anulado</td>
              <td ><?=number_format((float)$totalBbase, $this->setting->decimals, ',', '.');?></td>
              <td ><?=number_format((float)$totalTaxamount, $this->setting->decimals, ',', '.');?></td>
              <td ></td>              
              <td ><?=number_format($sumaTotal, $this->setting->decimals, ',', '.');?></td>
           </tr>
           
          </tbody>
         <?php }?>    
     </table>


   <?php }?>

<?php if($type==3){
  if(isset($data))echo $data;
  ?>
   <?php }?>

 <?php if($type==4){?>
  

     <?php $total=0;
        foreach ($sales as $row):
         // $taxamount=$row->value*$row->base/100;
          //$dateBegin=$row->datebegin;
          //$dateEnd=$row->dateend;
          $total+=$row->base;
         endforeach;?>
 
      <?php if(isset($sales)){?>
          <?php 
              $invoiceEnd=0;
              $invoiceBegin=10000000;
               foreach ($sales as $row):
                if($row->invoiceend>$invoiceEnd)
                  $invoiceEnd=$row->invoiceend;
                if($row->invoicebegin<$invoiceBegin)
                  $invoiceBegin=$row->invoicebegin;
               endforeach;?>
       <table width="100%">
       <tr  style="font-size: smaller;">
         <td class="text-center">INFORME FISCAL DE VENTAS DIARIAS</td>
       </tr>
       <tr>
         <td class="text-center" >Desde: <?=$dateBegin;?> Hasta: <?=$dateEnd;?></td>
       </tr>
       <tr  style="font-size: smaller;">
         <td class="text-center"><?=label('InvoiceBegin').' '.sprintf("%08d", $invoiceBegin).' - '.label('InvoiceEnd').' '.sprintf("%08d", $invoiceEnd);?></td> 
       </tr>
       <tr  style="font-size: smaller;">
         <td class="text-center">&nbsp;</td> 
       </tr>
       <tr  style="font-size: smaller;">
         <td class="text-center">&nbsp;</td> 
       </tr>
     </table>

      <table id="table6" class="table" cellspacing="0" width="500">
      <thead class="thead-inverse">

        <tr style="font-size: smaller;">
          <th class="titulo" style="border-top:1px dashed #000;"><?=label('Cuenta');?></th>
          <th class="titulo" style="border-top:1px dashed #000;"><?=label('Debito');?></th>
          <th class="titulo" style="border-top:1px dashed #000;"><?=label('Crédito');?></th>          
        </tr>
      </thead>
      <tbody>     
           <tr style="font-size: smaller;">
                 <td>Caja</td>
                 <td><?=number_format((float)$total, $this->setting->decimals, ',', '.');?></td>
                 <td></td>       
           </tr>           
          <?php foreach ($sales as $row):
            //$taxamount=$row->value*$row->base/100;
            ?>
              <tr style="font-size: smaller;">
                 <td>Ventas al <?=$row->name?></td>
                 <td></td>
                 <td><?=number_format((float)$row->base, $this->setting->decimals, ',', '.');?></td>                
              </tr>
           
           <?php endforeach;?>
           <tr style="font-size: smaller;">
                 <td>Sumas iguales</td>
                 <td><?=number_format((float)$total, $this->setting->decimals, ',', '.');?></td>
                 <td><?=number_format((float)$total, $this->setting->decimals, ',', '.');?></td>       
           </tr>           
          </tbody>
          </table>
         <?php }?>    
           <table id="tableF" class="table">
      
    <?php if(isset($invoices)){?>
      <thead class="thead-inverse">
        <tr style="font-size: smaller;">
          <th colspan="2" class="titulo" style="border-top:1px dashed #000;"><?=label('Documents');?></th>
        </tr>
      </thead>
      <tbody>
            <?php  foreach ($invoices as $row):
            ?>
              <tr style="font-size: smaller;">
                 <td style="width: 50%;"><?=label('InvoiceBegin');?></td>
                 <td><?=sprintf("%08d", $row->invoicebegin);?></td>                 
              </tr>
              <tr style="font-size: smaller;">
                 <td><?=label('InvoiceEnd');?></td>
                 <td><?=sprintf("%08d", $row->invoiceend);?></td>                 
              </tr>
              <tr class="totales" style="font-size: smaller;">
                 <td><?=label('Clientes atendidos');?></td>
                 <td><?=$row->qt;?></td>                 
              </tr>
           <?php endforeach;?>
          </tbody>
         <?php }?>         
    </table>
  
     <table width="100%">
       <tr>
         <td colspan="3">&nbsp;</td>
       </tr>
       <tr>
         <td colspan="3">&nbsp;</td>
       </tr>
       <tr>
         <td colspan="3">&nbsp;</td>
       </tr>
       <tr style="font-size: small;">
         <td width="40%">Impreso por: NITPOS</td>
         <td width="30%" style="text-align: right;">Aprobado por:</td>
         <td width="30%" style="text-align: left;">______________</td>
       </tr>
     </table>


   <?php }?>
     <?php if($type==5){?>
      <table width="100%">
          <tr class="text-center" style="font-size: small;"><td id="titulo1">Informe de Retenciones</td></tr>
          <tr class="text-center" style="font-size: small;"><td id="titulo2">Desde:<?=$dateBegin;?> Hasta; <?=$dateEnd;?></td></tr>
      </table>
      <table id="tableRetention" class="table display nowrap" style="width:100%">
      <?php if(isset($purchases)){
        ?>
      <thead class="thead-inverse">
        <tr style="font-size: smaller;">
          <th ><?=label('Orden de Compra');?></th>
          <th ><?=label('Supplier');?></th>
          <th ><?=label('Date');?></th>
          <th ><?=label('Total Compra');?></th>          
          <th ><?=label('Retención');?></th>
        </tr>
      </thead>
      <tbody>     
          <?php

            $totalRetention = 0;
            $sumaTotal = 0;
            $i=0;
            $j=0;
          foreach ($purchases as $row):
            $i++;
            $totalRetention+=$row->retention;
            $sumaTotal+=$row->total;
            ?>
              <tr style="font-size: smaller; ">
                 <td ><?=sprintf("%08d", $row->purchase_order);?></td>
                 <td ><?=$row->supplier;?></td>
                 <td ><?=$row->date->format('d/m/Y');?></td>
                 <td ><?=number_format((float)$row->total, $this->setting->decimals, ',', '.');?></td>
                 <td ><?=number_format((float)$row->retention, $this->setting->decimals, ',', '.');?></td>
              </tr>
           
           <?php endforeach;?>
           <tr style="font-size: smaller;">
              <td >Totales&nbsp;:</td>
              <td ><?=$i;?>&nbsp;&nbsp;Retención(es)</td>
              <td ></td>
              <td ><?=number_format($sumaTotal, $this->setting->decimals, ',', '.');?></td>
              <td ><?=number_format($totalRetention, $this->setting->decimals, ',', '.');?></td>
           </tr>
           
          </tbody>
         <?php 
          $setting=strip_tags($this->setting->receiptheader,'<br>');
        }?>    
     </table>


   <?php }?>

  </div>
</div>
</div>

      <script src="<?=base_url()?>assets/js/jquery.dataTables.min.js"></script>
      <script src="<?=base_url()?>assets/js/dataTables.buttons.min.js"></script>
      <script src="<?=base_url()?>assets/js/jszip.min.js"></script>
      <script src="<?=base_url()?>assets/js/pdfmake.min.js"></script>
      <script src="<?=base_url()?>assets/js/vfs_fonts.js"></script>
      <script src="<?=base_url()?>assets/js/buttons.html5.min.js"></script>

 <script type="text/javascript">
  

$(document).ready(function() {

      $('#dateBegin').datepicker({
          todayHighlight: true,
          format:'yyyy-mm-dd'
      });
      
      $('#dateEnd').datepicker({
          todayHighlight: true,
          format:'yyyy-mm-dd'
      });
      var titulo1 = $('#titulo1').html();
      var titulo2 = $('#titulo2').html();
      <?php $setting=strip_tags($this->setting->receiptheader,'<br>');?>
      var cabecera ="<?=$setting;?>";
      var setting = '';
      var arreglo=cabecera.split("<br>");
      for(i=0;i<arreglo.length;++i)
      {
            setting=setting+arreglo[i]+"\n";
      }
      setting=setting+'\n'+titulo1+'\n'+titulo2;
      $('#tableRetention').DataTable({
            "pageLength": 50,
             dom: 'Bfrtip',
             buttons: [
                'excelHtml5',
                'csvHtml5',
                 {
                    extend: 'pdfHtml5',
                    title: setting,
                    exportOptions: {
                          columns: [ 0, 1, 2, 3, 4]
                    },
                    customize:function(doc) {
                        //console.log(doc);
                        doc.styles.title = {
                            color: "#18293d",
                            fontSize: "12",
                            alignment: "center"
                        };
                        doc.styles.tableHeader = {
                            fillColor:"#18293d",
                            color:"white"
                        };
                        doc.content[1].table.widths = ["*", "35%","*","*","*"];
                    }
                 }
            ]
      }); $('#tableDiario').DataTable({
            "pageLength": 50,
             dom: 'Bfrtip',
             buttons: [
                'excelHtml5',
                'csvHtml5',
                 {
                    extend: 'pdfHtml5',
                    title: setting,
                    exportOptions: {
                          columns: [ 0, 1, 2, 3, 4, 5, 6]
                    },
                    customize:function(doc) {
                        //console.log(doc);
                        doc.styles.title = {
                            color: "#18293d",
                            fontSize: "12",
                            alignment: "center"
                        };
                        doc.styles.tableHeader = {
                            fillColor:"#18293d",
                            color:"white"
                        };
                        doc.content[1].table.widths = ["*", "*","*","*","*","*","*"];
                    }
                 }
            ]
      });

  });

function gotoCashmovement()
{
  location.href = "<?php echo site_url('cashmovements')?>";
      

}
function PrintTicket()
{

   $('.modal-body').removeAttr('id');
   $('.dataTables_filter').hide();
   $('.dataTables_length').hide();   
   $('.dataTables_paginate').hide(); 

   window.print();
   $('.modal-body').attr('id', 'modal-body');
   $('.dataTables_filter').show();
   $('.dataTables_length').show();
   $('.dataTables_paginate').show();   
   $("#ticket").modal('hide');


}

function ticket(){

   var content = $('#resultReport').html();
   $('#printSection').html(content);
   $('#ticket').modal('show');



}
function pdfreceipt(){

   //$('.dataTables_filter').hide();
   $('.dataTables_filter').css('display','none');
   $('.dataTables_length').css('display','none');   
   $('.dataTables_paginate').css('display','none');   

   var content = $('#printSection').html();
   $.redirect('<?php echo site_url('pos/pdfreceipt')?>/', { content: content });
   
   $('.dataTables_filter').show();
   $('.dataTables_length').show();   
   $('.dataTables_paginate').show();   
      

}


  </script>

<!-- Modal ticket -->
<div class="modal fade" id="ticket" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document" id="ticketModal">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="ticket"><?=label("Receipt");?></h4>
      </div>
      <div class="modal-body" id="modal-body">
         <div id="printSection">
            <!-- Ticket goes here -->
            <center><h1 style="color:#34495E"><?=label("empty");?></h1></center>
         </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default hiddenpr" data-dismiss="modal"><?=label("Close");?></button>
        <button type="button" class="btn btn-add hiddenpr" href="javascript:void(0)" onClick="pdfreceipt()">PDF</button>
        <!--<button type="button" class="btn btn-add hiddenpr" onclick="email()"><?=label("email");?></button>-->
        <button type="button" id="btnTicket" class="btn btn-add hiddenpr" onclick="PrintTicket()"><?=label("print");?></button>
      </div>
    </div>
 </div>
</div>
<!-- /.Modal -->

