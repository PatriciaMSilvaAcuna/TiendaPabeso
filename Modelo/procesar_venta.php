<?php
session_start();

// Obtener el id_Empleado de la sesión
if (isset($_SESSION['id_Empleado'])) {
    $id_Empleado = $_SESSION['id_Empleado'];
} else {
    echo '<div class="alert alert-danger" role="alert">id_Empleado no está establecido en la sesión.</div>';
    exit;
}

// Conectar a la base de datos
$conexion = mysqli_connect("localhost", "root", "", "tiendapabeso") or die("Problemas con la conexión");

// Obtener datos del formulario de pago
$id_Medio_de_pago = isset($_POST['medio_de_pago']) ? $_POST['medio_de_pago'] : null;
$subtotal = isset($_POST['precio']) ? (float)$_POST['precio'] : 0;

// Preparar la consulta para insertar la venta
$sql = "INSERT INTO ventas (id_Empleado, fecha_Venta, id_Medio_de_pago, total) VALUES (?, NOW(), ?, ?)";
$stmt = mysqli_prepare($conexion, $sql);
if ($stmt === false) {
    echo '<div class="alert alert-danger" role="alert">Error al preparar la consulta de venta.</div>';
    exit;
}

mysqli_stmt_bind_param($stmt, 'iid', $id_Empleado, $id_Medio_de_pago, $subtotal);

// Ejecutar la consulta para insertar la venta
if (mysqli_stmt_execute($stmt)) {
    // Obtener el id_Venta recién insertado
    $id_Venta = mysqli_insert_id($conexion);

    // Determinar la columna a actualizar en base al medio de pago
    $columna = '';
    switch ($id_Medio_de_pago) {
        case 1: // Efectivo
            $columna = 'monto_Final';
            break;
        case 2: // Débito
            $columna = 'ventas_debito';
            break;
        case 3: // Crédito
            $columna = 'ventas_credito';
            break;
        default:
            echo '<div class="alert alert-danger" role="alert">Error: Medio de pago no válido.</div>';
            exit;
    }

    // Obtener el id_Caja para la caja abierta del empleado
    $sql_id_caja = "SELECT id_Caja FROM caja WHERE id_Empleado = ? AND fecha_Cierre IS NULL";
    $stmt_id_caja = mysqli_prepare($conexion, $sql_id_caja);
    mysqli_stmt_bind_param($stmt_id_caja, 'i', $id_Empleado);
    mysqli_stmt_execute($stmt_id_caja);
    mysqli_stmt_bind_result($stmt_id_caja, $id_Caja);
    mysqli_stmt_fetch($stmt_id_caja);
    mysqli_stmt_close($stmt_id_caja);

    if (!$id_Caja) {
        echo '<div class="alert alert-danger" role="alert">Error: No se pudo determinar el id_Caja.</div>';
        exit;
    }

    // Preparar la consulta SQL para actualizar la caja
    $sql_caja = "UPDATE caja SET $columna = $columna + ? WHERE id_Caja = ?";
    $stmt_caja = mysqli_prepare($conexion, $sql_caja);
    if ($stmt_caja === false) {
        echo '<div class="alert alert-danger" role="alert">Error al preparar la consulta de actualización de caja: ' . mysqli_error($conexion) . '</div>';
    } else {
        // Vincular los parámetros para la actualización de la caja
        mysqli_stmt_bind_param($stmt_caja, 'di', $subtotal, $id_Caja);
        if (mysqli_stmt_execute($stmt_caja)) {
            // Actualizar el stock de las prendas
            if (isset($_SESSION['prendas_seleccionadas']) && is_array($_SESSION['prendas_seleccionadas'])) {
                foreach ($_SESSION['prendas_seleccionadas'] as $id_Prenda => $producto) {
                    $cantidad = $producto['cantidad'];
                    $precio = $producto['precio'];
                    $subtotal_detalle = $cantidad * $precio;

                    // Insertar detalles de la venta para cada prenda seleccionada
                    $query_detalle = "INSERT INTO detalleventa (id_Venta, id_Prenda, cantidad, precio, subtotal) VALUES (?, ?, ?, ?, ?)";
                    $stmt_detalle = mysqli_prepare($conexion, $query_detalle);
                    if ($stmt_detalle === false) {
                        echo '<div class="alert alert-danger" role="alert">Error al preparar la consulta para detalle de venta: ' . mysqli_error($conexion) . '</div>';
                    } else {
                        mysqli_stmt_bind_param($stmt_detalle, 'iiidd', $id_Venta, $id_Prenda, $cantidad, $precio, $subtotal_detalle);
                        if (mysqli_stmt_execute($stmt_detalle)) {
                            // Actualizar el stock de las prendas
                            $sql_prenda = "UPDATE prendas SET stock = stock - ? WHERE id_Prenda = ?";
                            $stmt_prenda = mysqli_prepare($conexion, $sql_prenda);
                            mysqli_stmt_bind_param($stmt_prenda, 'ii', $cantidad, $id_Prenda);
                            if (mysqli_stmt_execute($stmt_prenda)) {
                                mysqli_stmt_close($stmt_prenda);
                            } else {
                                echo '<div class="alert alert-danger" role="alert">Error al actualizar el stock: ' . mysqli_error($conexion) . '</div>';
                            }
                            mysqli_stmt_close($stmt_detalle);
                        } else {
                            echo '<div class="alert alert-danger" role="alert">Error al insertar detalle de venta: ' . mysqli_error($conexion) . '</div>';
                        }
                    }
                }
                // Limpiar la sesión de productos seleccionados después de insertar
                unset($_SESSION['prendas_seleccionadas']);
            }

            echo '<div class="alert alert-info" role="alert">Operación Exitosa.</div>';
            header("Location: operacionExitosa.php?id_Venta=" . $id_Venta); // Redirigir después de completar la operación
            exit();
        } else {
            echo '<div class="alert alert-danger" role="alert">Error al actualizar la caja: ' . mysqli_error($conexion) . '</div>';
        }
        mysqli_stmt_close($stmt_caja);
    }
} else {
    echo '<div class="alert alert-danger" role="alert">Error al procesar la venta: ' . mysqli_error($conexion) . '</div>';
}

mysqli_stmt_close($stmt);
mysqli_close($conexion);
?>
