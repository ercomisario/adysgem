<?php 
echo "<pre>";

// echo "Ejemplo con array numérico con la hora actual<br>";
// print_r(localtime());
 
// echo "Ejemplo con array asociativo con la hora actual<br>";
// print_r(localtime(time(),true));
 
// $hora = (localtime(time(),true));
// echo "La hora actual extraída del array asociativo es: " . $hora["tm_hour"];



// echo '<br/>';
// echo '<br/>';



echo 'TimeZonePHP default: ', date_default_timezone_get();
echo '<br/>';
echo '<br/>';

date_default_timezone_set('America/Caracas'); //configuro un nuevo timezone
echo 'TimeZonePHP configurado: ', date_default_timezone_get();
echo '<br/>';
echo '<br/>';

echo 'Fecha/hora actual: ', date('Y-m-d h:i:s', time());

echo '<br/>';
echo '<br/>';

$fecha = new DateTime('NOW');
echo 'Fecha/hora actual: ', $fecha->format('Y-m-d H:i:s');



echo "</pre>";
?>
<div id="fecha"></div>



<script>
var f = new Date();
var hours = f.getHours();
var mins = f.getMinutes();
var secs = f.getSeconds();

var dia = f.getDate();
var mes = f.getMonth() +1	;
var anio = f.getFullYear();


document.write(dia + "/" + mes + "/" + anio  + " ---- " + hours + ":" + mins + ":" + secs );
</script> 


<script type="text/javascript">

function printTime (){
var d = new Date();
var hours = d.getHours()- 1;
var mins = d.getMinutes();
var secs = d.getSeconds();
// document.getElementbyId("fecha").innerHTML = hours + " " + mins + " "+ secs;

}
// setInterval(printTime,1000); 

</script>
