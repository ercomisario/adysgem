<!-- Page Content -->
<link rel="stylesheet" href="<?=base_url()?>assets/css/buttons.dataTables.min.css" type='text/css'>
<style>
  .danger {
   background: #f2dede;
   color: #000;
}
</style>

<div class="container">
   <div class="row" style="margin-top:60px;">
      <div class="col-md-4">
         <div class="statCart Statcolor01">
   			<i class="fa fa-users" aria-hidden="true"></i>
   			<h1><?=$CustomerNumber;?></h1><br>
   			<span><?=label('Customers');?></span>
		    </div>
      </div>
      <div class="col-md-4">
         <div class="statCart Statcolor02">
   			<i class="fa fa-archive" aria-hidden="true"></i>
   			<h1><?=$ProductNumber;?></h1><br>
   			<span><?=label('Product');?> (<?=label('in');?> <?=$CategoriesNumber;?> <?=label('Categories');?>)</span>
		    </div>
      </div>
      <div class="col-md-4">
         <div class="statCart Statcolor03">
   			<i class="fa fa-money" aria-hidden="true"></i>
   			<h1 style="display: inline"><?=number_format($TodaySales, $this->setting->decimals, ',', '.');?></h1><br>
   			<span><?=label('TodaySale');?></span>
		    </div>
      </div>
   </div>
   <div class="row" style="margin-top:50px;">
      <div class="col-md-8">
         <!-- chart container  -->
         <div class="statCart"  style="padding-bottom: 35px;">
            <label class="col-md-3">
             <input type="radio" id="lapso1" name="lapso" <?php if($lapso==1){?>checked="checked" <?php }?>  onclick="makeLapso(1)" value="1">
             <span class="label-text">Año</span>             
             </label>
             <label class="col-md-2">
             <input type="radio" id="lapso2" name="lapso" <?php if($lapso==2){?>checked="checked" <?php }?> onclick="makeLapso(2)" value="2">
             <span class="label-text">Mes</span>             
             </label>
             <label class="col-md-3">
             <select id="mes2" name="mes2" <?php if($lapso!=2){?> readonly <?php }?> onclick="makeLapso(2)" class="form-control" style="margin-top:-7px;margin-left:-57px;">
              <option value="1" <?php if($month==1){?> selected <?php }?>>Enero</option>
              <option value="2" <?php if($month==2){?> selected <?php }?>>Febrero</option>
              <option value="3" <?php if($month==3){?> selected <?php }?>>Marzo</option>
              <option value="4" <?php if($month==4){?> selected <?php }?>>Abril</option>
              <option value="5" <?php if($month==5){?> selected <?php }?>>Mayo</option>
              <option value="6" <?php if($month==6){?> selected <?php }?>>Junio</option>
              <option value="7" <?php if($month==7){?> selected <?php }?>>Julio</option>
              <option value="8" <?php if($month==8){?> selected <?php }?>>Agosto</option>
              <option value="9" <?php if($month==9){?> selected <?php }?>>Septiembre</option>
              <option value="10" <?php if($month==10){?> selected <?php }?>>Octubre</option>
              <option value="11" <?php if($month==11){?> selected <?php }?>>Noviembre</option>
              <option value="12" <?php if($month==12){?> selected <?php }?>>Diciembre</option>
              </select>
             </label>
             <label class="col-md-2">
             <input type="radio" id="lapso3" name="lapso" <?php if($lapso==3){?>checked="checked" <?php }?> onclick="makeLapso(3)" value="3">
             <span class="label-text">Semana</span>             
             </label>
             <label class="col-md-2">
             <input type="radio" id="lapso4" name="lapso" <?php if($lapso==4){?>checked="checked" <?php }?> onclick="makeLapso(4)" value="4">
             <span class="label-text">Día</span>             
             </label>
         </div>
         
         <div class="statCart" style="margin-top: 5px;">
            <h4><?=$tituloStat;?></h4>
            <div style="width:100%">
               <canvas id="canvas" height="330" width="750" style="background: #e3f0f3;"></canvas>
            </div>
         </div>
      </div>
      <div class="col-md-4">
         <!-- pie container  -->
         <div class="statCart" style="padding-bottom: 35px;">
            <label class="col-md-6">
                <input type="radio" id="top1" name="top" <?php if($top==5){?>checked="checked" <?php }?> onclick="makeTop(5)" value="5">
                <span class="label-text">Top 5</span>             
            </label>
            <label class="col-md-6">
                <input type="radio" id="top2" name="top" <?php if($top==10){?>checked="checked" <?php }?> onclick="makeTop(10)" value="10">
                <span class="label-text">Top 10</span>             
            </label>
         </div>
         <div class="statCart" style="margin-top: 5px;">
            <h4><?=$tituloTop?></h4>
            <div id="canvas-holder">
               <?= count($Top5product) >=5 ? '<canvas id="chart-area2" width="230" height="230" />' : '<h3 style="margin: 50px 0">'.label("EmptyList").'</h3>';?>
            </div>
         </div>
      </div>
   </div>
   <div class="row rangeStat" style="margin-top:50px;">
      <h3 class="col-sm-12"><?=label('ClientsStats');?></h3>
      <div class="col-md-5">
         <div class="form-group">
             <label for="customerSelect"><?=label('SelectClient');?></label>
               <select class="js-select-options form-control" id="customerSelect">
                  <option value="0"><?=label("WalkinCustomer");?></option>
                 <?php foreach ($customers as $customer):?>
                    <option value="<?=$customer->id;?>"><?=$customer->firstname1;?> <?=$customer->lastname1;?></option>
                 <?php endforeach;?>
               </select>
         </div>
      </div>
      <div class="col-md-5">
            <div class="form-group">
                <label><?=label('SelectRange');?></label>
            <div class="input-group margin-bottom-sm">
               <span class="input-group-addon RangePicker"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i></span>
               <input class="form-control" id="CustomerRange" type="text" name="daterange" />
            </div>
         </div>
      </div>
      <div class="col-md-2">
         <button class="cancelBtn btn btn-picker" type="button" onclick="getCustomerReport()"><?=label('GetReport');?></button>
      </div>
   </div>

   <div class="row rangeStat" style="margin-top:50px;">
      <h3 class="col-sm-12"><?=label('ProductsStats');?></h3>
      <div class="col-md-5">
         <div class="form-group">
             <label for="customerSelect"><?=label('SelectProduct');?></label>
               <select class="js-select-options form-control" id="productSelect">
                  <?php foreach ($Products as $product):?>
                    <option value="<?=$product->id;?>"><?=$product->name;?></option>
                 <?php endforeach;?>
               </select>
         </div>
      </div>
      <div class="col-md-5">
            <div class="form-group">
                <label><?=label('SelectRange');?></label>
            <div class="input-group margin-bottom-sm">
               <span class="input-group-addon RangePicker"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i></span>
               <input class="form-control" id="ProductRange" type="text" name="daterangeP" />
            </div>
         </div>
      </div>
      <div class="col-md-2">
         <button class="cancelBtn btn btn-picker" type="button" onclick="getProductReport()"><?=label('GetReport');?></button>
      </div>
   </div>
   <div class="row rangeStat" style="margin-top:50px;">
      <h3 class="col-sm-12"><?=label('RegisterStats');?></h3>
      <div class="col-md-5">
         <div class="form-group">
             <label for="customerSelect"><?=label('SelectStore');?></label>
               <select class="js-select-options form-control" id="StoresSelect">
                  <?php foreach ($Stores as $store):?>
                    <option value="<?=$store->id;?>"><?=$store->name;?></option>
                 <?php endforeach;?>
               </select>
         </div>
      </div>
      <div class="col-md-5">
            <div class="form-group">
                <label><?=label('SelectRange');?></label>
            <div class="input-group margin-bottom-sm">
               <span class="input-group-addon RangePicker"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i></span>
               <input class="form-control" id="RegisterRange" type="text" name="daterangeR" />
            </div>
         </div>
      </div>
      <div class="col-md-2">
         <button class="cancelBtn btn btn-picker" type="button" onclick="getRegisterReport()"><?=label('GetReport');?></button>
      </div>
   </div>
   <!-- ********************************************* warehouses report ***************************************************** -->
   <div class="row rangeStat" style="margin-top:50px;">
      <h3 class="col-sm-12"><?=label('StockStats');?></h3>
      <div class="col-md-5">
         <div class="form-group">
             <label for="customerSelect"><?=label('SelectStore');?></label>
               <select class="js-select-options form-control" id="StockSelect">
                  <?php foreach ($Stores as $store):?>
                    <option value="S<?=$store->id;?>"><?=$store->name;?></option>
                 <?php endforeach;?>
               </select>
         </div>
      </div>
      <div class="col-md-5">
            <div class="form-group">
                <label></label>
            <div class="input-group margin-bottom-sm">
               <span class="input-group-addon RangePicker"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i></span>
               <input class="form-control" id="" type="text" name="" disabled />
            </div>
         </div>
      </div>
      <div class="col-md-2">
         <button class="cancelBtn btn btn-picker" type="button" onclick="getStockReport()"><?=label('GetReport');?></button>
      </div>
   </div>
   <!-- ************************************************************************************************** -->

   <div class="row rangeStat" style="margin-top:50px; margin-bottom:70px;">
      <div class="col-md-12">
         <div class="statCart">
            <h1 class="statYear"><?=$year;?></h1>
            <button class="btn btn-Year" type="button" onclick="getyearstats('next')"><</button>
            <button class="btn btn-Year" type="button" onclick="getyearstats('prev')">></button>
            <div class="float-right" style="margin-top: 50px;">
               <span class="revenuespan" style="font-size:11px;"><?=label("Revenue");?></span>
               <span class="expencespan" style="font-size:11px;"><?=label("Expense");?></span>
            </div>
            <div id="statyears">
               <table class="StatTable">
                  <tr>
                     <td><span class="revenuespan" data-toggle="tooltip" data-placement="top"  data-html="true" title="<h5><?=label('tax');?> : <b><?=$monthly[0]->januarytax;?> </b> <br><br> <?=label('Discount');?> : <b><?=$monthly[0]->januarydisc;?> </b></h5>"><?=number_format($monthly[0]->january, $this->setting->decimals, ',', '.');?></span><span class="expencespan"><?=number_format($monthlyExp[0]->january, $this->setting->decimals, ',', '.');?> </span><?=label('January');?></td>
                     
                     <td><span class="revenuespan" data-toggle="tooltip" data-placement="top"  data-html="true" title="<h5><?=label('tax');?> : <b><?=$monthly[0]->feburarytax;?> </b> <br><br> <?=label('Discount');?> : <b><?=$monthly[0]->feburarydisc;?> </b></h5>"><?=number_format($monthly[0]->feburary, $this->setting->decimals, ',', '.');?></span><span class="expencespan"><?=number_format($monthlyExp[0]->feburary, $this->setting->decimals, ',', '.');?></span><?=label('February');?></td>
                     <td><span class="revenuespan" data-toggle="tooltip" data-placement="top"  data-html="true" title="<h5><?=label('tax');?> : <b><?=$monthly[0]->marchtax;?> </b> <br><br> <?=label('Discount');?> : <b><?=$monthly[0]->marchdisc;?> </b></h5>"><?=number_format($monthly[0]->march, $this->setting->decimals, ',', '.');?></span><span class="expencespan"><?=number_format($monthlyExp[0]->march, $this->setting->decimals, ',', '.');?></span><?=label('March');?></td>
                     <td><span class="revenuespan" data-toggle="tooltip" data-placement="top"  data-html="true" title="<h5><?=label('tax');?> : <b><?=$monthly[0]->apriltax;?> </b> <br><br> <?=label('Discount');?> : <b><?=$monthly[0]->aprildisc;?> </b></h5>"><?=number_format($monthly[0]->april, $this->setting->decimals, ',', '.');?></span><span class="expencespan"><?=number_format($monthlyExp[0]->april, $this->setting->decimals, ',', '.');?></span><?=label('April');?></td>
                  </tr>
                  <tr>
                     <td><span class="revenuespan" data-toggle="tooltip" data-placement="top"  data-html="true" title="<h5><?=label('tax');?> : <b><?=$monthly[0]->maytax;?> </b> <br><br> <?=label('Discount');?> : <b><?=$monthly[0]->maydisc;?> </b></h5>">
                        <?=number_format($monthly[0]->may, $this->setting->decimals, ',', '.');?></span><span class="expencespan"><?=number_format($monthlyExp[0]->may, $this->setting->decimals, ',', '.');?></span><?=label('May');?></td>
                     <td><span class="revenuespan" data-toggle="tooltip" data-placement="top"  data-html="true" title="<h5><?=label('tax');?> : <b><?=$monthly[0]->junetax;?> </b> <br><br> <?=label('Discount');?> : <b><?=$monthly[0]->junedisc;?> </b></h5>">

                        <?=number_format($monthly[0]->june, $this->setting->decimals, ',', '.');?></span><span class="expencespan"><?=number_format($monthlyExp[0]->june, $this->setting->decimals, ',', '.');?></span><?=label('June');?></td>
                     <td><span class="revenuespan" data-toggle="tooltip" data-placement="top"  data-html="true" title="<h5><?=label('tax');?> : <b><?=$monthly[0]->julytax;?> </b> <br><br> <?=label('Discount');?> : <b><?=$monthly[0]->julydisc;?> </b></h5>">

                        <?=number_format($monthly[0]->july, $this->setting->decimals, ',', '.');?></span><span class="expencespan"><?=number_format($monthlyExp[0]->july, $this->setting->decimals, ',', '.');?></span><?=label('July');?></td>
                     <td><span class="revenuespan" data-toggle="tooltip" data-placement="top"  data-html="true" title="<h5><?=label('tax');?> : <b><?=$monthly[0]->augusttax;?> </b> <br><br> <?=label('Discount');?> : <b><?=$monthly[0]->augustdisc;?> </b></h5>">
                        <?=number_format($monthly[0]->august, $this->setting->decimals, ',', '.');?></span><span class="expencespan"><?=number_format($monthlyExp[0]->august, $this->setting->decimals, ',', '.');?></span><?=label('August');?></td>
                  </tr>
                  <tr>
                     <td><span class="revenuespan" data-toggle="tooltip" data-placement="top"  data-html="true" title="<h5><?=label('tax');?> : <b><?=$monthly[0]->septembertax;?> </b> <br><br> <?=label('Discount');?> : <b><?=$monthly[0]->septemberdisc;?> </b></h5>">
                        <?=number_format($monthly[0]->september, $this->setting->decimals, ',', '.');?></span><span class="expencespan"><?=number_format($monthlyExp[0]->september, $this->setting->decimals, ',', '.');?></span><?=label('September');?></td>
                     <td><span class="revenuespan" data-toggle="tooltip" data-placement="top"  data-html="true" title="<h5><?=label('tax');?> : <b><?=$monthly[0]->octobertax;?> </b> <br><br> <?=label('Discount');?> : <b><?=$monthly[0]->octoberdisc;?> </b></h5>">
                        <?=number_format($monthly[0]->october, $this->setting->decimals, ',', '.');?></span><span class="expencespan"><?=number_format($monthlyExp[0]->october, $this->setting->decimals, ',', '.');?></span><?=label('October');?></td>
                     <td><span class="revenuespan" data-toggle="tooltip" data-placement="top"  data-html="true" title="<h5><?=label('tax');?> : <b><?=$monthly[0]->novembertax;?> </b> <br><br> <?=label('Discount');?> : <b><?=$monthly[0]->novemberdisc;?></b></h5>">
                        <?=number_format($monthly[0]->november, $this->setting->decimals, ',', '.');?></span><span class="expencespan"><?=number_format($monthlyExp[0]->november, $this->setting->decimals, ',', '.');?></span><?=label('November');?></td>
                     <td><span class="revenuespan" data-toggle="tooltip" data-placement="top"  data-html="true" title="<h5><?=label('tax');?> : <b><?=$monthly[0]->decembertax;?> </b> <br><br> <?=label('Discount');?> : <b><?=$monthly[0]->decemberdisc;?></b></h5>">
                        <?=number_format($monthly[0]->december, $this->setting->decimals, ',', '.');?></span><span class="expencespan"><?=number_format($monthlyExp[0]->december, $this->setting->decimals, ',', '.');?></span><?=label('December');?></td>
                  </tr>
               </table>
            </div>
         </div>
      </div>
   </div>
</div>


      <script src="<?=base_url()?>assets/js/jquery.dataTables.min.js"></script>
      <script src="<?=base_url()?>assets/js/dataTables.buttons.min.js"></script>
      <script src="<?=base_url()?>assets/js/jszip.min.js"></script>
      <script src="<?=base_url()?>assets/js/pdfmake.min.js"></script>
      <script src="<?=base_url()?>assets/js/vfs_fonts.js"></script>
      <script src="<?=base_url()?>assets/js/buttons.html5.min.js"></script>

	<script>

   var meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
   var semana = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"];
   /******* Range date picker *******/
   $(function() {
      $('input[name="daterange"]').daterangepicker();
      $('input[name="daterangeP"]').daterangepicker();
      $('input[name="daterangeR"]').daterangepicker();
      var d = new Date().getFullYear();
      $('#ProductRange').val('01/01/'+d+' - 12/31/'+d);
      $('#CustomerRange').val('01/01/'+d+' - 12/31/'+d);
      $('#RegisterRange').val('01/01/'+d+' - 12/31/'+d);

   });
   /************************ Chart Data *************************/
		var randomScalingFactor = function(){ return Math.round(Math.random()*100)};
		var lineChartData = {
			labels : [
               <?php $dias = array("Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado");
                  for ($i=0;$i<count($salesExpences);$i++){

                     if($lapso==1){?>
                        meses[<?=$salesExpences[$i]->mes;?>-1], 
                     <?php }
                     if($lapso==2 || $lapso==3){
                     $diaSemana= $dias[$salesExpences[$i]->texto].' '.$salesExpences[$i]->diames; 
                    ?>
                        "<?=$diaSemana?>",
                     <?php }   
                     if($lapso==4){?>
                        "<?=$salesExpences[$i]->hora;?>", 
                     <?php }?>                 
               <?php }?>                 
                  ],
			datasets : [
            {
               label: "<?=label('Egresos');?>",
               backgroundColor: "rgba(255,99,132,0.2)",
               borderColor: "rgba(255,99,132,1)",
               pointBackgroundColor: "rgba(255,99,132,1)",
               pointBorderColor: "#fff",
               pointHoverBackgroundColor: "#fff",
               pointHoverBorderColor: "rgba(255,99,132,1)",
               data: [
                     <?php for ($i=0;$i<count($salesExpences);$i++){?>
                           "<?=$salesExpences[$i]->expence;?>", 
                     <?php }?>                 
                     ]
            },
				{
					label: "<?=label('Revenue');?>",
					backgroundColor : "#34495e",
					borderColor : "#2c3e50",
					pointBackgroundColor : "#34495e",
					pointBorderColor : "#fff",
					pointHoverBackgroundColor : "#fff",
					pointHoverBorderColor : "#2c3e50",
					data : [
                     <?php for ($i=0;$i<count($salesExpences);$i++){?>
                           "<?=$salesExpences[$i]->sale;?>", 
                     <?php }?>                 
                      ]
				}
			]
		}
	window.onload = function(){

      // Chart.defaults.global.gridLines.display = false;

	var ctx = document.getElementById("canvas").getContext("2d");
	window.myLine = new Chart(ctx, {
    type: 'line',
    data: lineChartData,
    options: {
         scales : {
           xAxes :[
                    {
                       labels: 
                       {
                          rotate: -45
                       }
                       
                    }
                  ],
           yAxes :[ 
                     {
                        gridLines : 
                        {
                           display : false
                        }
                     } 
                  ]
          },
         scaleFontSize: 9,
         tooltipFillColor: "rgba(0, 0, 0, 0.71)",
         tooltipFontSize: 10,
			responsive: true
		}});

      /********************* pie **********************/
      <?php if(count($Top5product) >=5){ ?>


      var pieData =  {
          labels: [
               <?php for ($i=0;$i<count($Top5product);$i++){?>
                     "<?=$Top5product[$i]->name;?>", 
               <?php }?>
          ],
          datasets: [
           {
               data: [
               <?php for ($i=0;$i<count($Top5product);$i++){?>
                     <?=$Top5product[$i]->totalquantity;?>, 
               <?php }?>
               ],
               backgroundColor: [
                   "#34495E",
                   "#7f8c8d",
                   "#ECF0F1",
                   "#3498DB",
                   "#1ABC9C",
                   "#c9302c",
                   "#901bef",
                   "#f5ea0c",
                   "#694006",
                   "#f5a00e"
               ],
               hoverBackgroundColor: [
                   "#3e5367",
                   "#95a5a6",
                   "#f5fbfc",
                   "#459eda",
                   "#2dc6a8",
                   "#c86e6b",
                   "#a54ced",
                   "#f3ed6d",
                   "#664921",
                   "#f6bd5c"
               ]
            }
         ]
      };

      Chart.defaults.global.legend.display = false;

      var ctx2 = document.getElementById("chart-area2").getContext("2d");
      window.myPie = new Chart(ctx2,{
             type: 'pie',
             data: pieData});
      <?php } ?>
	}

function makeTop(top)
{
   for(i=1;i<=4;++i)
   {
      var lapso;
      if($('#lapso'+i).is(':checked'))
      {
         //console.log($('#lapso'+i).val());
         lapso=$('#lapso'+i).val();
      }
   }
   var mes=$('#mes2').val();   
   var item=lapso+'~'+top+'~'+mes;
   $.redirect('<?php echo site_url('stats')?>/', { item:item });
}
function makeLapso(lapso)
{
   var top;
   for(i=1;i<=2;++i)
   {
      if($('#top'+i).is(':checked'))
      {
         console.log($('#top'+i).val());
         top=$('#top'+i).val();
      }
   }
   var mes=$('#mes2').val();
   var item=lapso+'~'+top+'~'+mes;
   $.redirect('<?php echo site_url('stats')?>/', { item:item });
}
   /********************************** Get repports functions ************************************/

   function getCustomerReport()
   {
      var client_id = $('#customerSelect').find('option:selected').val();
      var Range = $('#CustomerRange').val();
      var start = Range.slice(6,10)+'-'+Range.slice(0,2)+'-'+Range.slice(3,5);
      var end = Range.slice(19,23)+'-'+Range.slice(13,15)+'-'+Range.slice(16,18);
           // ajax delete data to database
           $.ajax({
               url : "<?php echo site_url('reports/getCustomerReport')?>/",
               type: "POST",
               data: {client_id: client_id, start: start, end: end},
               success: function(data)
               {
                  $('#statsSection').html(data);
                  $('#stats').modal('show');
                  var total=$('#totalCustomer').text();
                  var setting = "";
                  var cabecera = '<?=$this->setting->receiptheader;?>';
                  var arreglo=cabecera.split("<br>");
                  for(i=0;i<arreglo.length;++i)
                  {
                        setting=setting+arreglo[i]+"\n";
                  }

                  var table = $('#Table').DataTable( {
                      dom: 'Bfrtip',
                      tableTools: {
                          'bProcessing'    : true
                       },
                      "pageLength": 50,
                       buttons: [
                             "excelHtml5",
                             "csvHtml5",
                              {
                                  extend: "pdfHtml5",
                                  title: setting,
                                  messageBottom: "TOTAL: "+total,
                                  exportOptions: {
                                      columns: [ 0, 1, 2, 3, 4, 5]
                                  },
                                  customize:function(doc) 
                                  {
                                      console.log(doc);
                                      doc.styles.title = {
                                        color: "#18293d",
                                        fontSize: "12",
                                          alignment: "center"
                                      };
                                      doc.styles.tableHeader = {
                                        fillColor:"#18293d",
                                        color:"white"
                                      };
                                      doc.content[1].table.widths = ["*","40%","*","*","25%","*"];
                                      doc["footer"]=(function(page, pages) {
                                         return {
                                            columns: [
                                                      {
                                                        alignment: "center",
                                                        text: 
                                                        [
                                                          "Ventas por Clientes" 
                                                        ]                                                        
                                                      },
                                                      {
                                                        alignment: "center",
                                                        text: 
                                                        [
                                                          "Página ", 
                                                           { text: 
                                                             page.toString()
                                                            },  
                                                          " de ", 
                                                            { text: 
                                                              pages.toString()
                                                            },  
                                                            " "
                                                        ]
                                                      }
                                                      ]
                                                 }
                                            });
                                        }

                                     }
                                ]
                    });
               },
               error: function (jqXHR, textStatus, errorThrown)
               {
                  alert("error");
               }
           });

   }

   function getProductReport()
   {
      var product_id = $('#productSelect').find('option:selected').val();
      var Range = $('#ProductRange').val();
      var start = Range.slice(6,10)+'-'+Range.slice(0,2)+'-'+Range.slice(3,5);
      var end = Range.slice(19,23)+'-'+Range.slice(13,15)+'-'+Range.slice(16,18);
           // ajax set data to database
        $.ajax({
            url : "<?php echo site_url('reports/getProductReport')?>/",
            type: "POST",
            data: {product_id: product_id, start: start, end: end},
            success: function(data)
            {
               $('#statsSection').html(data);
               $('#stats').modal('show');
               var total=$('#totalProduct').text();
               var setting = "";
               var cabecera = '<?=$this->setting->receiptheader;?>';
               var arreglo=cabecera.split("<br>");
               for(i=0;i<arreglo.length;++i)
               {
                     setting=setting+arreglo[i]+"\n";
               }

               var table = $('#Table').DataTable( {
                   dom: 'Bfrtip',
                      tableTools: {
                          'bProcessing'    : true
                       },
                      "pageLength": 50,
                       buttons: [
                             "excelHtml5",
                             "csvHtml5",
                              {
                                  extend: "pdfHtml5",
                                  title: setting,
                                  messageBottom: "TOTAL: "+total,
                                  exportOptions: {
                                      columns: [ 0, 1, 2, 3, 4, 5, 6, 7]
                                  },
                                  customize:function(doc) 
                                  {
                                      console.log(doc);
                                      doc.styles.title = {
                                        color: "#18293d",
                                        fontSize: "12",
                                          alignment: "center"
                                      };
                                      doc.styles.tableHeader = {
                                        fillColor:"#18293d",
                                        color:"white"
                                      };
                                      doc.content[1].table.widths = ["*","25%","*","*","*","18%","*","*"];
                                      doc["footer"]=(function(page, pages) {
                                         return {
                                            columns: [
                                                      {
                                                        alignment: "center",
                                                        text: 
                                                        [
                                                          "Ventas por Productos" 
                                                        ]                                                        
                                                      },
                                                      {
                                                        alignment: "center",
                                                        text: 
                                                        [
                                                          "Página ", 
                                                           { text: 
                                                             page.toString()
                                                            },  
                                                          " de ", 
                                                            { text: 
                                                              pages.toString()
                                                            },  
                                                            " "
                                                        ]
                                                      }
                                                      ]
                                                 }
                                            });
                                        }

                                     }
                                ]
                 });
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
               alert("error");
            }
       });
   }

   function getRegisterReport()
   {
      var store_id = $('#StoresSelect').find('option:selected').val();
      var Range = $('#RegisterRange').val();
      var start = Range.slice(6,10)+'-'+Range.slice(0,2)+'-'+Range.slice(3,5);
      var end = Range.slice(19,23)+'-'+Range.slice(13,15)+'-'+Range.slice(16,18);
           // ajax set data to database
        $.ajax({
            url : "<?php echo site_url('reports/getRegisterReport')?>/",
            type: "POST",
            data: {store_id: store_id, start: start, end: end},
            success: function(data)
            {
               $('#statsSection').html(data);
               $('#stats').modal('show');
               var table = $('#Table').DataTable( {
                   dom: 'T<"clear">lfrtip',
                   tableTools: {
                       'bProcessing'    : true
                    }
                 });
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
               alert("error");
            }
       });
   }

   function getStockReport()
   {
      var stock_id = $('#StockSelect').find('option:selected').val();
           // ajax set data to database
        $.ajax({
            url : "<?php echo site_url('reports/getStockReport')?>/",
            type: "POST",
            data: {stock_id: stock_id},
            success: function(data)
            {
               $('#statsSection').html(data);
               $('#stats').modal('show');
               var table = $('#Table').DataTable( {
                   dom: 'T<"clear">lfrtip',
                   tableTools: {
                       'bProcessing'    : true
                    }
                 });
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
               alert("error");
            }
       });
   }

   function getyearstats(direction) {
      var currentyear = parseInt($('.statYear').text());
      var year = direction === 'next' ? currentyear-1 : currentyear+1;

        $.ajax({
            url : "<?php echo site_url('reports/getyearstats')?>/"+year,
            type: "POST",
            success: function(data)
            {
               $('#statyears').html(data);
               $('.statYear').text(year);
               $('[data-toggle="tooltip"]').tooltip();
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
               alert("error");
            }
      });
   }

   function RegisterDetails(id) {
      $.ajax({
         url : "<?php echo site_url('reports/RegisterDetails')?>/"+id,
         type: "POST",
         success: function(data)
         {
            $('#RegisterDetails').html(data);
            $('#stats').modal('hide');
            $('#RegisterDetail').modal('show');
         },
         error: function (jqXHR, textStatus, errorThrown)
         {
             alert("error");
         }
      });
   }

   function CloseRegisterDetails(){
      $('#RegisterDetail').modal('hide');
      $('#stats').modal('show');
   }

   function delete_register(id){
      swal({   title: '<?=label("Areyousure");?>',
      text: '<?=label("Deletemessage");?>',
      type: "warning",
      showCancelButton: true,
      confirmButtonColor: "#DD6B55",
      confirmButtonText: '<?=label("yesiam");?>',
      closeOnConfirm: false },
      function(){
         $.ajax({
             url : "<?php echo site_url('reports/delete_register')?>/"+id,
             type: "POST",
             error: function (jqXHR, textStatus, errorThrown)
             {
                alert("error");
             }
        });
      $('#stats').modal('hide');
      swal('<?=label("Deleted");?>', '<?=label("Deletedmessage");?>', "success"); });
   }


	</script>

   <!-- Modal stats -->
   <div class="modal fade" id="stats" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document" id="statsModal">
       <div class="modal-content">
         <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
           <h4 class="modal-title" id="stats"><?=label("Estadísticas");?></h4>
         </div>
         <div class="modal-body" id="modal-body">
            <div id="statsSection">
               <!-- stats goes here -->
            </div>
         </div>
         <div class="modal-footer">
           <button type="button" class="btn btn-default hiddenpr" data-dismiss="modal"><?=label("Close");?></button>
         </div>
       </div>
    </div>
   </div>
   <!-- /.Modal -->

   <!-- Modal register -->
   <div class="modal fade" id="RegisterDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
       <div class="modal-content">
         <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
           <h4 class="modal-title" id="myModalLabel"><?=label("RegisterDetails");?></h4>
         </div>
         <div class="modal-body">
            <div id="RegisterDetails">
               <!-- close register detail goes here -->
            </div>
         </div>
         <div class="modal-footer">
           <a href="javascript:void(0)" onclick="CloseRegisterDetails()" class="btn btn-orange col-md-12 flat-box-btn"><?=label("Return");?></a>
         </div>
       </div>
    </div>
   </div>
   <!-- /.Modal -->
