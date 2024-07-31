<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Información de Pago</title>
    <link rel="icon" href="../vista/vendedora.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="../Vista/css.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
<header class="text-center bg-dark text-danger py-3">
    <h4 id="Bienvenida">PaBeSo Tienda</h4>
</header>

<div class="card w-50 h-75 m-auto">
    <div class="card-header ">
        <h4>Información de Pago</h4>
    </div>
    <div class="card-body">
        <form action="procesar_venta.php" method="post">
            <h5 class="card-title">Ingrese pago:</h5>
            <label for="medio_de_pago">Medio de Pago:</label><br>
            <select id="medio_de_pago" name="medio_de_pago" class="form-select">
                <option value="1">Efectivo</option>
                <option value="2">Tarjeta de Débito</option>
                <option value="3">Tarjeta de Crédito</option>
            </select><br><br>

            <?php
            session_start();
            $subtotal = 0;
            $conexion = mysqli_connect("localhost", "root", "", "tiendapabeso") or die("Problemas con la conexión");

            if (isset($_POST['prendas']) && !empty($_POST['prendas'])) {
                foreach ($_POST['prendas'] as $id_Prenda) {
                    if (isset($_SESSION['prendas_seleccionadas'][$id_Prenda])) {
                        $prenda = $_SESSION['prendas_seleccionadas'][$id_Prenda];
                        $descripcion = $prenda['descripcion'];
                        $precio = $prenda['precio'];
                        $cantidad = isset($_POST['cantidad'][$id_Prenda]) ? (int)$_POST['cantidad'][$id_Prenda] : 1;

                        $_SESSION['prendas_seleccionadas'][$id_Prenda]['cantidad'] = $cantidad;

                        $subtotal_prenda = $precio * $cantidad;
                        $_SESSION['prendas_seleccionadas'][$id_Prenda]['subtotal'] = $subtotal_prenda;

                        $subtotal += $subtotal_prenda;
                    }
                }
            }
            ?>
            
            <label for="precio">Subtotal:</label><br>
            <input type="text" id="precio" name="precio" value="<?php echo htmlspecialchars($subtotal); ?>" readonly class="form-control"><br><br>
            
            <h3>Productos seleccionados:</h3>
            <?php
            if (isset($_SESSION['prendas_seleccionadas']) && !empty($_SESSION['prendas_seleccionadas'])) {
                foreach ($_SESSION['prendas_seleccionadas'] as $id_Prenda => $prenda) {
                    $descripcion = $prenda['descripcion'];
                    $precio = $prenda['precio'];
                    $cantidad =  $prenda['cantidad'];
                    echo "<div class='container'>";
                    echo "<div class='row border-bottom'>";
                    echo "<div class='col-sm'>";
                    echo "<p><strong>Cantidad:</strong> " . htmlspecialchars($cantidad) . "</p>";
                    echo "</div>";
                    echo "<div class='col-sm'>";
                    echo "<p><strong>ID Prenda:</strong> " . htmlspecialchars($id_Prenda) . "</p>";
                    echo "</div>";
                    echo "<div class='col-sm'>";
                    echo "<p><strong>Descripción:</strong> " . htmlspecialchars($descripcion) . "<br>";
                    echo "</div>";
                    echo "<div class='col-sm'>";
                    echo "<p><strong>Precio:</strong> " . htmlspecialchars($precio) . "</p>";
                    echo "</div>";
                    echo "</div>";
                    echo "</div>";
                }
            }
            ?>

            <div class="card-footer">
                <div class="d-flex justify-content-between">
                    <a href="./venta.php" class="btn btn-danger btn-lg">Cancelar</a>
                    <input type="submit" class="btn btn-success btn-lg" value="Procesar Venta">
                </div>
            </div>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script
