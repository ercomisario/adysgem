<?php
echo microtime();
echo "<br>";
echo time();
echo "<br>PRUEBA DE CONEXION CON PDO<br><br>";
$servername = "localhost";
$username = "root";
$password = "";
$database = "zarpos2";
/*
BASE DE DATOS
DB Name: id10293092_testing_cumanadigital1
DB User: id10293092_user_cumanadigital1
DB Host: localhost
DB Pass: 123456
*/
try {
    $conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully"; 
    } catch(PDOException $e) {    
    echo "Connection failed: " . $e->getMessage();
    }
echo "<br><br><br>";
echo time();
echo "<br>";
echo microtime();
echo "<br>FIN DE PRUEBA DE CONEXION CON PDO<br><br>";
phpinfo();
?>
