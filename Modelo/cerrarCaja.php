<?php
session_start();

// Verificar si el usuario ha iniciado sesión y es administrador o vendedor
if (!isset($_SESSION['id_Tipo_de_usuario'])) {
    header("Location: login.php");
    exit();
}

// Variable para almacenar los mensajes de alerta o éxito
$alerta = '';
$mostrarConfirmacion = false;

// Conexión a la base de datos
$conexion = new mysqli("localhost", "root", "", "tiendapabeso");

if ($conexion->connect_error) {
    die("Problemas con la conexión: " . $conexion->connect_error);
}

// Obtener el monto final actual desde la base de datos
$result = $conexion->query("SELECT monto_Final FROM caja WHERE id_Caja = (SELECT MAX(id_Caja) FROM caja)");
$row = $result->fetch_assoc();
$montoFinalActual = $row['monto_Final'];
$montoFinalActual = floatval($montoFinalActual); // Convertir a float

// Verificar si se recibió un monto de cierre
if (isset($_POST['montoCierre'])) {
    $montoCierre = floatval($_POST['montoCierre']); // Convertir a float
    $diferenciaCaja = $montoCierre - $montoFinalActual;

    if (isset($_POST['confirmar']) && $_POST['confirmar'] === 'true') {
        // Confirmar el cierre de caja
        $query = "UPDATE caja SET monto_Final = ?, difCaja = ?, fecha_Cierre = NOW() WHERE id_Caja = (SELECT MAX(id_Caja) FROM caja)";
        $stmt = $conexion->prepare($query);
        $stmt->bind_param("dd", $montoCierre, $diferenciaCaja);
        $stmt->execute();

        // Comprobación de la actualización
        if ($stmt->affected_rows > 0) {
            $alerta = '<div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong>Éxito:</strong> La caja ha sido cerrada correctamente.
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                       </div>';
        } else {
            $alerta = '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Error:</strong> Ha habido un problema al cerrar la caja.
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                       </div>';
        }
        $stmt->close();
    } else {
        // Verificar si el monto de cierre es diferente al monto final actual
        if ($montoCierre != $montoFinalActual) {
            $alerta = '<div class="alert alert-warning alert-dismissible fade show" role="alert">
                        <strong>Advertencia:</strong> El monto ingresado es diferente al monto final actual. Se va a generar un registro.
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        <br>
                        <form id="formConfirmar" method="post">
                            <input type="hidden" name="confirmar" value="true">
                            <input type="hidden" name="montoCierre" value="' . htmlspecialchars($montoCierre, ENT_QUOTES, 'UTF-8') . '">
                            <button type="submit" class="btn btn-primary mt-3">Confirmar</button>
                            <a href="../Modelo/accesoAceptadoAdmin.php" class="btn btn-secondary mt-3">Volver</a>
                        </form>
                       </div>';
        } else {
            // Actualizar la base de datos con la información del cierre
            $query = "UPDATE caja SET monto_Final = ?, difCaja = ?, fecha_Cierre = NOW() WHERE id_Caja = (SELECT MAX(id_Caja) FROM caja)";
            $stmt = $conexion->prepare($query);
            $stmt->bind_param("dd", $montoCierre, $diferenciaCaja);
            $stmt->execute();

            // Comprobación de la actualización
            if ($stmt->affected_rows > 0) {
                $alerta = '<div class="alert alert-success alert-dismissible fade show" role="alert">
                            <strong>Éxito:</strong> La caja ha sido cerrada correctamente.
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                           </div>';
            } else {
                $alerta = '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <strong>Error:</strong> Ha habido un problema al cerrar la caja.
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                           </div>';
            }
            $stmt->close();
        }
    }

    // Cierre de la conexión
    $conexion->close();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cierre de Caja</title>
    <link rel="icon" href="../Vista/vendedora.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="../Vista/css.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex flex-column vh-100">
    <header class="text-center bg-dark text-danger py-3">
        <h4 id="Bienvenida">PaBeSo Tienda</h4>
    </header>

    <div class="container my-auto">
        <div class="card mx-auto" style="max-width: 600px;">
            <div class="card-header bg-success text-white text-center">
                <h4>Cierre de Caja</h4>
            </div>
            <div class="card-body">
                <!-- Mostrar alertas generadas dinámicamente -->
                <?php echo $alerta; ?>
                <form id="formCerrarCaja" action="cerrarCaja.php" method="post">
                    <div class="form-group">
                        <label>Monto Final Actual:</label>
                        <input type="text" id="montoFinalActual" name="montoFinalActual" class="form-control" readonly>
                    </div>
                    <div class="form-group mt-3">
                        <label>Ingrese Monto de Cierre:</label>
                        <input type="number" step="0.01" name="montoCierre" id="montoCierre" class="form-control" required>
                    </div>
                    <br>
                    <!-- Botón para cerrar la caja -->
                    <input type="submit" value="Cerrar Caja" class="btn btn-success">
                </form>
            </div>
            <div class="card-footer d-flex justify-content-between">
                <a href="../Modelo/accesoAceptadoAdmin.php" class="btn btn-secondary">Volver</a>
            </div>
        </div>
    </div>

    <footer class="text-center bg-dark text-white py-3">
        <p>© 2023 PaBeSo Tienda. Todos los derechos reservados.</p>
    </footer>

    <!-- Bootstrap y JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Lógica para cargar el monto final actual en el input correspondiente
        document.getElementById('montoFinalActual').value = <?php echo json_encode($montoFinalActual); ?>;
    </script>
</body>
</html>
