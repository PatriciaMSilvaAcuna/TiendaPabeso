<?php
// Conexión a la base de datos
$conexion = new mysqli("localhost", "root", "", "tiendapabeso");

// Verificar errores de conexión
if ($conexion->connect_error) {
    die("Problemas con la conexión: " . $conexion->connect_error);
}

// Consulta SQL para obtener el monto final actual
$result = $conexion->query("SELECT monto_Final FROM caja WHERE id_Caja = (SELECT MAX(id_Caja) FROM caja)");

// Verificar si la consulta fue exitosa
if ($result === false) {
    die("Error al ejecutar la consulta: " . $conexion->error);
}

// Verificar si se encontró algún resultado
if ($result->num_rows > 0) {
    // Obtener el primer y único resultado
    $row = $result->fetch_assoc();
    $montoFinalActual = $row['monto_Final'];
    
    // Devolver el monto final actual como respuesta
    echo $montoFinalActual;
} else {
    // Si no se encontraron resultados
    echo "No se encontró ningún monto final actual.";
}

// Cerrar la conexión a la base de datos
$conexion->close();
?>
