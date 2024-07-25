<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Modificar Usuario</title>
<link rel="icon" href="../Vista/vendedora.png" type="image/x-icon">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../Vista/css.css">
</head>
<body class="d-flex flex-column vh-100" id="solo">
<header class="text-center bg-dark text-danger py-3">
<h4 id="Bienvenida">PaBeSo Tienda</h4>
</header>

<div class="container my-auto">
<div class="card mx-auto" style="max-width: 600px;">
<div class="card-header bg-success text-white text-center">
<h4>Modificar Empleado</h4>
</div>
<div class="card-body">
<?php
$conexion = mysqli_connect("localhost", "root", "", "tiendapabeso") or die("Problemas con la conexión");

$dni = $_REQUEST['dni'];
// Consulta los datos del empleado
$resultado = mysqli_query($conexion, "SELECT e.dni, e.nombre, e.usuario, e.contrasena, e.estado, i.nombre as tipoUsuario FROM empleado as e JOIN tipodeusuario as i ON e.id_Tipo_de_usuario = i.id_Tipo_de_usuario WHERE dni = $dni");

if ($resultado) {
    $empleado = mysqli_fetch_assoc($resultado);
    if ($empleado) {
        // Mostrar los datos del empleado y formulario de edición
        ?>
        <form method='post'>
            <div class='form-group'>
                <label for='nombre'>Nombre:</label>
                <input type='text' class='form-control' name='nombre' value='<?php echo htmlspecialchars($empleado['nombre']); ?>'>
            </div>
            <div class='form-group'>
                <label for='usuario'>Usuario:</label>
                <input type='text' class='form-control' name='usuario' value='<?php echo htmlspecialchars($empleado['usuario']); ?>'>
            </div>
            <div class='form-group'>
                <label for='contrasena'>Contraseña:</label>
                <input type='password' class='form-control' name='contrasena' value='<?php echo htmlspecialchars($empleado['contrasena']); ?>'>
            </div>
            <div class='form-group'>
                <label for='estado'>Estado:</label>
                <input type='number' class='form-control' name='estado' value='<?php echo htmlspecialchars($empleado['estado']); ?>'>
            </div>
            <div class='form-group'>
                <label for='tipoUsuario'>Tipo de Usuario:</label>
                <select class='form-control' name='tipoUsuario'>
                    <option value='1' <?php echo ($empleado['tipoUsuario'] == 'Administrador') ? 'selected' : ''; ?>>Administrador</option>
                    <option value='2' <?php echo ($empleado['tipoUsuario'] == 'Vendedor') ? 'selected' : ''; ?>>Vendedor</option>
                </select>
            </div>
            <input type='hidden' name='dni' value='<?php echo htmlspecialchars($empleado['dni']); ?>'>
            </div>
            <div class="card-footer d-flex justify-content-between">
            <a href="../Vista/AdministracionEmpleados.html" class="btn btn-secondary btn-lg mi-boton">Volver</a>

            <button type='submit' class='btn btn-success mi-boton' name='submit'>Guardar cambios</button>
            </div>

        </form>
        <?php
    } else {
        echo "<div class='alert alert-warning' role='alert'>No se encontró ningún empleado con el DNI proporcionado.</div>";
    }
} else {
    echo "<div class='alert alert-danger' role='alert'>Error al consultar los datos del empleado: " . mysqli_error($conexion) . "</div>";
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Solo procesar cuando se envíe el formulario (cuando se hace POST)
    if (isset($_POST['submit'])) {
        // Recibe los datos del formulario de edición
        $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : '';
        $usuario = isset($_POST['usuario']) ? $_POST['usuario'] : '';
        $contrasena = isset($_POST['contrasena']) ? $_POST['contrasena'] : '';
        $estado = isset($_POST['estado']) ? $_POST['estado'] : '';
        $tipoUsuario = isset($_POST['tipoUsuario']) ? $_POST['tipoUsuario'] : '';

        // Actualiza los datos en la base de datos
        $update = mysqli_query($conexion, "UPDATE empleado SET nombre = '$nombre', usuario = '$usuario', contrasena = '$contrasena', estado = '$estado', id_Tipo_de_usuario = '$tipoUsuario' WHERE dni = $dni");

        if ($update) {
            echo "<div class='alert alert-success' role='alert'>Empleado actualizado correctamente.</div>";
        } else {
            echo "<div class='alert alert-danger' role='alert'>Error al actualizar al empleado: " . mysqli_error($conexion) . "</div>";
        }
    }
}
?>
</div>
<br>
<br>

<footer class="text-center bg-dark text-white py-3 fixed-bottom">
<p>© 2023 PaBeSo Tienda. Todos los derechos reservados.</p>
</footer>
</div>
</div>
</body>
</html>
