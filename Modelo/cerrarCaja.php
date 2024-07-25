<?php
session_start();

// Verificar si el usuario ha iniciado sesión y es administrador o vendedor
if (!isset($_SESSION['id_Tipo_de_usuario'])) {
    header("Location: login.php");
    exit();
}

// Verificar si se recibió un monto de cierre
if (isset($_POST['montoCierre'])) {
    $montoCierre = $_POST['montoCierre'];

    // Conexión a la base de datos
    $conexion = new mysqli("localhost", "root", "", "tiendapabeso");

    if ($conexion->connect_error) {
        die("Problemas con la conexión: " . $conexion->connect_error);
    }

    // Obtener el monto final actual desde la base de datos
    $result = $conexion->query("SELECT monto_Final FROM caja WHERE id_Caja = (SELECT MAX(id_Caja) FROM caja)");
    $row = $result->fetch_assoc();
    $montoFinalActual = $row['monto_Final'];

    // Calcular la diferencia de caja
    $diferenciaCaja = $montoCierre - $montoFinalActual;

    // Actualizar la base de datos con la información del cierre
    $query = "UPDATE caja SET monto_Final = ?, difCaja = ?, fecha_Cierre = NOW() WHERE id_Caja = (SELECT MAX(id_Caja) FROM caja)";
    $stmt = $conexion->prepare($query);
    $stmt->bind_param("dd", $montoCierre, $diferenciaCaja);
    $stmt->execute();

    // Comprobación de la actualización
    if ($stmt->affected_rows > 0) {
        echo '<div class="alert alert-success" role="alert">La caja ha sido cerrada correctamente.</div>';
    } else {
        echo '<div class="alert alert-danger" role="alert">Ha habido un problema al cerrar la caja.</div>';
    }

    // Cierre de la conexión y del statement
    $stmt->close();
    $conexion->close();
} else {
    echo '<div class="alert alert-danger" role="alert">No se ha proporcionado un monto de cierre.</div>';
}

echo '<a href="accesoAceptadoAdmin.php" class="btn btn-secondary btn-lg mt-3">Volver</a>';
?>
