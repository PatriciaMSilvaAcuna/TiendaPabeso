<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alta Stock</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body class="vh-100 text-center">

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
    if($stmt->affected_rows > 0){
        echo '<div class="alert alert-success" role="alert">La prenda ha sido añadida correctamente.</div>';
    } else {
        echo '<div class="alert alert-danger" role="alert">Ha habido un problema al añadir la prenda.</div>';
    }
    
    echo '<a href="accesoAceptadoAdmin.php" class="btn btn-secondary btn-lg">Volver</a>';

    // Cierre de la conexión
    $stmt->close();
    $conexion->close();
?>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>  

</body>
</html>
