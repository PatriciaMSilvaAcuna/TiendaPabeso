<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Consultas Cajas</title>
  <link rel="icon" href="../vista/vendedora.png" type="image/x-icon">
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
            $conexion = mysqli_connect("localhost", "root", "", "tiendapabeso") or die("Problemas con la conexión");

            $registros = mysqli_query($conexion, "
                SELECT
                    c.id_Caja AS Num_Caja,
                    e.usuario AS Usuario,
                    c.monto_Inicio AS Monto_Apertura,
                    c.ventas_debito AS Ventas_Debito,
                    c.ventas_credito AS Ventas_Credito,
                    c.monto_Final AS Monto_Cierre,
                    c.difCaja AS Diferencia_Caja,
                    c.fecha_Cierre AS Fecha_Cierre
                FROM caja AS c
                JOIN empleado AS e ON c.id_Empleado = e.id_Empleado
                ORDER BY c.id_Caja DESC
            ") or die("Problemas en el select: " . mysqli_error($conexion));

            if (mysqli_num_rows($registros) > 0) {
                echo "<h1 class='mb-4'>Listado de Cajas</h1>";
                echo "<table class='table table-striped table-bordered'>";
                echo "<thead class='table-dark'>";
                echo "<tr>";
                echo "<th>Num Caja</th>";
                echo "<th>Usuario</th>";
                echo "<th>Monto Apertura</th>";
                echo "<th>Ventas Débito</th>";
                echo "<th>Ventas Crédito</th>";
                echo "<th>Monto Cierre</th>";
                echo "<th>Diferencia Caja</th>";
                echo "<th>Fecha Cierre</th>";
                echo "</tr>";
                echo "</thead>";
                echo "<tbody>";

                while ($reg = mysqli_fetch_array($registros)) {
                    echo "<tr>";
                    echo "<td>" . $reg['Num_Caja'] . "</td>";
                    echo "<td>" . $reg['Usuario'] . "</td>";
                    echo "<td>" . $reg['Monto_Apertura'] . "</td>";
                    echo "<td>" . $reg['Ventas_Debito'] . "</td>";
                    echo "<td>" . $reg['Ventas_Credito'] . "</td>";
                    echo "<td>" . $reg['Monto_Cierre'] . "</td>";
                    echo "<td>" . $reg['Diferencia_Caja'] . "</td>";
                    echo "<td>" . ($reg['Fecha_Cierre'] ? $reg['Fecha_Cierre'] : 'Abierta') . "</td>";
                    echo "</tr>";
                }

                echo "</tbody>";
                echo "</table>";
            } else {
                echo "<p>No hay cajas registradas.</p>";
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
