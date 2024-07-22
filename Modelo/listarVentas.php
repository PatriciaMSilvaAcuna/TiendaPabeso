<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Ventas del Día</title>
  <link rel="stylesheet" type="text/css" href="../Vista/css.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body class="d-flex flex-column min-vh-100">
<header class="text-center bg-dark text-danger py-3">
    <h4 id="Bienvenida">PaBeSo Tienda</h4>
</header>

<div class="container my-4">
    <div class="card shadow-lg mx-auto" style="max-width: 800px;">
        <div class="card-body">
            <?php
            $conexion = mysqli_connect("localhost", "root", "", "tiendapabeso") or
                die("Problemas con la conexión");
            date_default_timezone_set('America/Argentina/Buenos_Aires');
            $fecha_actual = date("Y-m-d"); // obtiene la fecha actual

            $registros = mysqli_query($conexion, "SELECT * FROM ventas WHERE DATE(fecha_Venta) = '$fecha_actual'") or
                die("Problemas en el select: " . mysqli_error($conexion));

            $totalVentas = mysqli_query($conexion, "SELECT SUM(total) as totalVentas FROM ventas WHERE DATE(fecha_Venta) = '$fecha_actual'") or
                die("Problemas en el select: " . mysqli_error($conexion));
            $totalVentasDia = mysqli_fetch_assoc($totalVentas);

            if (mysqli_num_rows($registros) > 0) {
                echo "<h1 class='mb-4'>Listado de Ventas del Día</h1>";
                echo "<table class='table table-striped table-bordered'>";
                echo "<thead class='table-dark'>";
                echo "<tr>";
                echo "<th>ID Venta</th>";
                echo "<th>ID Empleado</th>";
                echo "<th>Fecha Venta</th>";
                echo "<th>ID Medio de Pago</th>";
                echo "<th>Total</th>";
                echo "</tr>";
                echo "</thead>";
                echo "<tbody>";

                while ($reg = mysqli_fetch_array($registros)) {
                    echo "<tr>";
                    echo "<td>" . $reg['id_ventas'] . "</td>";
                    echo "<td>" . $reg['id_Empleado'] . "</td>";
                    echo "<td>" . $reg['fecha_Venta'] . "</td>";
                    echo "<td>" . $reg['id_Medio_de_pago'] . "</td>";
                    echo "<td>" . $reg['total'] . "</td>";
                    echo "</tr>";
                }

                echo "</tbody>";
                echo "</table>";
                echo "<h2 class='mt-4'>Total de Ventas del Día: <span class='text-primary'>" . $totalVentasDia['totalVentas'] . "</span></h2>";

            } else {
                echo "<p>Lo siento, no hay ventas disponibles para el día de hoy.</p>";
            }

            mysqli_close($conexion);
            ?>
            <div class="text-center mt-4">
            <a href="../Modelo/accesoAceptadoAdmin.php" class="btn btn-success btn-lg btn-estilo">Volver</a>
            </div>
           </div>   
    </div>
</div>
<br><br>
<footer class="text-center bg-dark text-white py-3 mt-auto">
    <p>© 2023 PaBeSo Tienda. Todos los derechos reservados.</p>
</footer>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
