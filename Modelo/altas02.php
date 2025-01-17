<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alta Stock</title>
    <link rel="icon" href="../Vista/vendedora.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="../Vista/css.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body class="vh-100 d-flex flex-column text-center">
    <header class="text-center bg-dark text-danger py-3">
        <h4 id="Bienvenida">PaBeSo Tienda</h4>
    </header>
    <div class="container flex-grow-1 d-flex flex-column justify-content-center">
        <?php
            // Conexión a la base de datos
            $conexion = new mysqli("localhost", "root", "", "tiendapabeso");

            if ($conexion->connect_error) {
                die("Problemas con la conexión: " . $conexion->connect_error);
            }

            // Recogida de datos del formulario
            $descripcion = $_POST['descripcion'];
            $tipo_de_prenda = $_POST['id_Tipo_de_prenda'];
            $color = $_POST['id_color'];
            $talle = $_POST['id_talle'];
            $stock = $_POST['stock'];
            $stock_minimo = $_POST['stock_minimo'];
            $precio = $_POST['precio'];

            // Llamada al procedimiento almacenado
            $query = "CALL InsertarPrendaConPrecio(?, ?, ?, ?, ?, ?, ?)";
            $stmt = $conexion->prepare($query);
            $stmt->bind_param("siisiid", $descripcion, $tipo_de_prenda, $color, $talle, $stock, $stock_minimo, $precio);
            $stmt->execute();

            // Comprobación de la inserción
            if ($stmt->affected_rows > 0) {
                echo '<div class="alert alert-success" role="alert">La prenda ha sido añadida correctamente.</div>';
            } else {
                echo '<div class="alert alert-danger" role="alert">Ha habido un problema al añadir la prenda.</div>';
            }
        ?>
        <a href="accesoAceptadoAdmin.php" class="btn btn-secondary btn-lg mt-3">Volver</a>
    </div>
    <footer class="text-center bg-dark text-white py-3">
        <p>© 2023 PaBeSo Tienda. Todos los derechos reservados.</p>
    </footer>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
