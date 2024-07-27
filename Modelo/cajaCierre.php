<?php
// Conexión a la base de datos
$conexion = new mysqli("localhost", "root", "", "tiendapabeso");

// Verificar errores de conexión
if ($conexion->connect_error) {
    die("Problemas con la conexión: " . $conexion->connect_error);
}

// Obtener el monto ingresado (supongamos que se pasa por una solicitud POST)
$montoIngresado = isset($_POST['montoIngresado']) ? floatval($_POST['montoIngresado']) : 0;

// Verificar si hay una caja abierta
$query_ultima_caja_abierta = $conexion->query("SELECT * FROM caja WHERE fecha_Cierre IS NULL ORDER BY id_Caja DESC LIMIT 1");

// Verificar si la consulta fue exitosa
if ($query_ultima_caja_abierta === false) {
    die("Error al verificar la última caja abierta: " . $conexion->error);
}

// Obtener la última caja abierta
if ($query_ultima_caja_abierta->num_rows > 0) {
    $row_ultima_caja = $query_ultima_caja_abierta->fetch_assoc();
    $montoInicio = $row_ultima_caja['monto_Inicio'];
    $id_caja_abierta = $row_ultima_caja['id_Caja'];
} else {
    echo "<script>alert('No hay caja abierta.');</script>";
    exit();
}

// Consulta para obtener el monto_Final de la misma caja
$query_monto_final = $conexion->query("SELECT monto_Final FROM caja WHERE id_Caja = $id_caja_abierta");

// Verificar si la consulta fue exitosa
if ($query_monto_final === false) {
    die("Error al ejecutar la consulta de monto_Final: " . $conexion->error);
}

// Obtener el monto_Final
if ($query_monto_final->num_rows > 0) {
    $row_final = $query_monto_final->fetch_assoc();
    $montoFinal = $row_final['monto_Final'];
} else {
    die("No se encontró monto_Final.");
}

// Sumar el monto_Inicio y el monto_Final
$montoFinalActual = $montoInicio + $montoFinal;

// Comparar el monto ingresado con el monto calculado
if ($montoIngresado != $montoFinalActual) {
    echo "<script>alert('El monto ingresado es diferente del monto final actual.');</script>";
} else {
    echo "Monto ingresado es correcto. Monto Final Actual: " . $montoFinalActual;
}

// Cerrar la conexión a la base de datos
$conexion->close();
?>
