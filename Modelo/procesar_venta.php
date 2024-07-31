// Procesar Venta (procesar_venta.php)
<?php
session_start();

if (isset($_SESSION['id_Empleado'])) {
    $id_Empleado = $_SESSION['id_Empleado'];
} else {
    echo '<div class="alert alert-danger" role="alert">id_Empleado no está establecido en la sesión.</div>';
    exit;
}

$conexion = mysqli_connect("localhost", "root", "", "tiendapabeso") or die("Problemas con la conexión");

$id_Medio_de_pago = isset($_POST['medio_de_pago']) ? (int)$_POST['medio_de_pago'] : null;
$subtotal = isset($_POST['precio']) ? (float)$_POST['precio'] : 0.0;

if ($id_Medio_de_pago === null || $subtotal == 0.0) {
    echo '<div class="alert alert-danger" role="alert">Datos inválidos: medio de pago o precio no válidos.</div>';
    exit;
}

$sql = "INSERT INTO ventas (id_Empleado, fecha_Venta, id_Medio_de_pago, total) VALUES (?, NOW(), ?, ?)";
$stmt = mysqli_prepare($conexion, $sql);
if ($stmt === false) {
    echo '<div class="alert alert-danger" role="alert">Error al preparar la consulta de venta.</div>';
    exit;
}

mysqli_stmt_bind_param($stmt, 'iid', $id_Empleado, $id_Medio_de_pago, $subtotal);

if (mysqli_stmt_execute($stmt)) {
    $id_Venta = mysqli_insert_id($conexion);

    $sql_id_caja = "SELECT id_Caja FROM caja WHERE id_Empleado = ? AND fecha_Cierre IS NULL";
    $stmt_id_caja = mysqli_prepare($conexion, $sql_id_caja);
    mysqli_stmt_bind_param($stmt_id_caja, 'i', $id_Empleado);
    mysqli_stmt_execute($stmt_id_caja);
    mysqli_stmt_bind_result($stmt_id_caja, $id_Caja);
    mysqli_stmt_fetch($stmt_id_caja);
    mysqli_stmt_close($stmt_id_caja);

    if (!$id_Caja) {
        echo '<div class="alert alert-danger" role="alert">Error: No se pudo determinar el id_Caja. Asegúrese de que haya una caja abierta para este empleado.</div>';
        exit;
    }

    $sql_caja = "UPDATE caja SET monto_Final = monto_Final + ? WHERE id_Caja = ?";
    $stmt_caja = mysqli_prepare($conexion, $sql_caja);
    if ($stmt_caja === false) {
        echo '<div class="alert alert-danger" role="alert">Error al preparar la consulta de actualización de caja: ' . mysqli_error($conexion) . '</div>';
    } else {
        mysqli_stmt_bind_param($stmt_caja, 'di', $subtotal, $id_Caja);
        if (mysqli_stmt_execute($stmt_caja)) {
            if (isset($_SESSION['prendas_seleccionadas']) && is_array($_SESSION['prendas_seleccionadas'])) {
                foreach ($_SESSION['prendas_seleccionadas'] as $id_Prenda => $prenda) {
                    $cantidad = $prenda['cantidad'];

                    $sql_stock = "UPDATE prendas SET stock = stock - ? WHERE id_Prenda = ?";
                    $stmt_stock = mysqli_prepare($conexion, $sql_stock);
                    mysqli_stmt_bind_param($stmt_stock, 'ii', $cantidad, $id_Prenda);
                    if (!mysqli_stmt_execute($stmt_stock)) {
                        echo '<div class="alert alert-danger" role="alert">Error al actualizar el stock para la prenda con ID ' . htmlspecialchars($id_Prenda) . ': ' . mysqli_error($conexion) . '</div>';
                    }
                }
            }
        } else {
            echo '<div class="alert alert-danger" role="alert">Error al actualizar el monto de la caja: ' . mysqli_error($conexion) . '</div>';
        }
        mysqli_stmt_close($stmt_caja);
    }

    unset($_SESSION['prendas_seleccionadas']);

    echo '<div class="alert alert-success" role="alert">Venta procesada con éxito. ID de Venta: ' . htmlspecialchars($id_Venta) . '</div>';
    header("Location: operacionExitosa.php?id_Venta=" . $id_Venta . "&id_Empleado=" . $id_Empleado);

} else {
    echo '<div class="alert alert-danger" role="alert">Error al insertar la venta: ' . mysqli_error($conexion) . '</div>';
}

mysqli_stmt_close($stmt);
mysqli_close($conexion);

if (!isset($_SESSION['prendas_seleccionadas'])) {
    echo '<div class="alert alert-success" role="alert">Productos seleccionados han sido limpiados correctamente.</div>';
} else {
    echo '<div class="alert alert-danger" role="alert">Error al limpiar productos seleccionados de la sesión.</div>';
}
?>
