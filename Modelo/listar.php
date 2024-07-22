<?php
$conexion=mysqli_connect("localhost","root","","tiendapabeso") or
    die("Problemas con la conexión");
date_default_timezone_set('America/Argentina/Buenos_Aires');
$fecha_actual = date("Y-m-d"); // obtiene la fecha actual


$registros=mysqli_query($conexion,"select * from ventas where DATE(fecha_Venta) = '$fecha_actual'") or
  die("Problemas en el select:".mysqli_error($conexion));

$totalVentas=mysqli_query($conexion,"select SUM(total) as totalVentas from ventas where DATE(fecha_Venta) = '$fecha_actual'") or
  die("Problemas en el select:".mysqli_error($conexion));
$totalVentasDia = mysqli_fetch_assoc($totalVentas);

if (mysqli_num_rows($registros) > 0){
echo "<h1>Listado de Ventas del día</h1>";
echo "<table border='1'>";
echo "<tr>";
echo "<th>ID Venta</th>";
echo "<th>ID Empleado</th>";
echo "<th>Fecha Venta</th>";
echo "<th>ID Medio de Pago</th>";
echo "<th>total</th>";
echo "</tr>";

while ($reg=mysqli_fetch_array($registros))
{
  echo "<tr>";
  echo "<td>" . $reg['id_ventas'] . "</td>";
  echo "<td>" . $reg['id_Empleado'] . "</td>";
  echo "<td>" . $reg['fecha_Venta'] . "</td>";
  echo "<td>" . $reg['id_Medio_de_pago'] . "</td>";
  echo "<td>" . $reg['total'] . "</td>";
  
  echo "</tr>";
}

echo "</table>";
echo "<h2>Total de ventas del día: " . $totalVentasDia['totalVentas'] . "</h2>";

} else{
  echo "Lo siento no hay ventas disponibles para el día de hoy";
}

mysqli_close($conexion);
?>
