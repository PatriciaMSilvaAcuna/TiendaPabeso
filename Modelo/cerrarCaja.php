<?php
header('Content-Type: application/json'); // Configurar el tipo de contenido a JSON

// Conexión a la base de datos
$conexion = new mysqli("localhost", "root", "", "tiendapabeso");

// Verificar errores de conexión
if ($conexion->connect_error) {
    echo json_encode(["success" => false, "message" => "Problemas con la conexión: " . $conexion->connect_error]);
    exit();
}

// Obtener el monto ingresado (debe ser enviado mediante POST)
$montoIngresado = isset($_POST['montoCierre']) ? floatval($_POST['montoCierre']) : 0;
$confirmar = isset($_POST['confirmar']) ? intval($_POST['confirmar']) : 0;

// Verificar si hay una caja abierta
$query_ultima_caja_abierta = $conexion->query("SELECT * FROM caja WHERE fecha_Cierre IS NULL ORDER BY id_Caja DESC LIMIT 1");

if ($query_ultima_caja_abierta === false) {
    echo json_encode(["success" => false, "message" => "Error al verificar la última caja abierta: " . $conexion->error]);
    exit();
}

if ($query_ultima_caja_abierta->num_rows > 0) {
    $row_ultima_caja = $query_ultima_caja_abierta->fetch_assoc();
    $montoInicio = $row_ultima_caja['monto_Inicio'];
    $id_caja_abierta = $row_ultima_caja['id_Caja'];
} else {
    echo json_encode(["success" => false, "message" => "No hay caja abierta."]);
    exit();
}

$query_monto_final = $conexion->query("SELECT monto_Final FROM caja WHERE id_Caja = $id_caja_abierta");

if ($query_monto_final === false) {
    echo json_encode(["success" => false, "message" => "Error al ejecutar la consulta de monto_Final: " . $conexion->error]);
    exit();
}

if ($query_monto_final->num_rows > 0) {
    $row_final = $query_monto_final->fetch_assoc();
    $montoFinal = $row_final['monto_Final'];
} else {
    echo json_encode(["success" => false, "message" => "No se encontró monto_Final."]);
    exit();
}

$montoFinalActual = $montoInicio + $montoFinal;
$difCaja = $montoIngresado - $montoFinalActual;

if ($montoIngresado != $montoFinalActual && $confirmar === 0) {
    echo json_encode(["success" => false, "message" => "El monto ingresado es diferente del monto final actual."]);
} else {
    // Actualización y cierre de caja
    $update_query = $conexion->prepare("UPDATE caja SET fecha_Cierre = NOW(), difCaja = ? WHERE id_Caja = ?");
    $update_query->bind_param("di", $difCaja, $id_caja_abierta);

    if ($update_query->execute()) {
        echo json_encode(["success" => true, "message" => "Caja cerrada exitosamente. Número de caja: $id_caja_abierta. Importe de cierre: $montoIngresado."]);
    } else {
        echo json_encode(["success" => false, "message" => "Error al cerrar la caja: " . $update_query->error]);
    }

    $update_query->close();
}

// Cerrar la conexión a la base de datos
$conexion->close();
?>
