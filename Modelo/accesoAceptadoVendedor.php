<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Acceso Vendedor</title>
    <link rel="icon" href="../Vista/vendedora.png" type="image/x-icon">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="../Vista/css.css"> <!-- Incluye archivo CSS -->
</head>
<body class="d-flex flex-column vh-100">
    <header class="text-center bg-dark text-danger py-3">
        <h4 id="Bienvenida">PaBeSo Tienda</h4>
    </header>

    <div class="container flex-grow-1 d-flex flex-column justify-content-center align-items-center">
        <div class="text-center">
            <button class="btn btn-primary btn-lg" onclick="abrirCaja()">Apertura de Caja</button>
            <button class="btn btn-success btn-lg" onclick="venta()">Venta</button>
            <button class="btn btn-info btn-lg" onclick="consultaPrecio()">Consulta Precio</button>
            <button class="btn btn-primary btn-lg" onclick="cerrarCaja()">Cierre de Caja</button>
        </div>
        <div class="text-center mt-4">
            <button type="button" class="btn btn-outline-secondary btn-lg" onclick="salir()"> Salir </button>
        </div>
    </div>

    <footer class="text-center bg-dark text-white py-3 fixed-bottom">
        <p>© 2023 PaBeSo Tienda. Todos los derechos reservados.</p>
    </footer>

    <div class="d-flex justify-content-center align-items-center">
        <b>
            <?php
            session_start();
            echo "Está trabajando " . $_SESSION['usuario'];
            ?>
        </b>
    </div>

    <script>
        function abrirCaja() {
            window.location.href = "../Modelo/caja.php";
        }
        function venta() {
            window.location.href = "http://localhost/Tienda/Modelo/venta.php";
        }
        function consultaPrecio() {
            window.location.href = "../Modelo/consultaPrecio.php";
        }
        function cerrarCaja() {
            window.location.href = "../Vista/cierreCaja.html";
        }
        function salir() {
            window.location.href = "../index.html";
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
