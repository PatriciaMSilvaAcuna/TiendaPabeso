<?php
header('Content-Type: text/plain'); // Configurar el tipo de contenido a texto plano

// Conexión a la base de datos
$conexion = new mysqli("localhost", "root", "", "tiendapabeso");

// Verificar errores de conexión
if ($conexion->connect_error) {
    die("Problemas con la conexión: " . $conexion->connect_error);
}

// Consulta SQL para obtener el monto_Inicio y monto_Final de la caja abierta más reciente
$query = "SELECT monto_Inicio, monto_Final FROM caja WHERE fecha_Cierre IS NULL ORDER BY id_Caja DESC LIMIT 1";
$result = $conexion->query($query);

// Verificar si la consulta fue exitosa
if ($result === false) {
    die("Error al ejecutar la consulta: " . $conexion->error);
}

// Verificar si se encontró algún resultado
if ($result->num_rows > 0) {
    // Obtener el primer y único resultado
    $row = $result->fetch_assoc();
    $montoInicio = $row['monto_Inicio'];
    $montoFinal = $row['monto_Final'];
    
    // Calcular la suma de monto_Inicio y monto_Final
    $montoFinalActual = $montoInicio + $montoFinal;
    
    // Devolver el monto final actual como respuesta
    echo $montoFinalActual;
} else {
    // Si no se encontraron resultados
    echo "No se encontró ningún monto final actual.";
}

// Cerrar la conexión a la base de datos
$conexion->close();
?>
