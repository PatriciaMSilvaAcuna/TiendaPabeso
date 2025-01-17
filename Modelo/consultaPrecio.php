<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title> Consulta de Precio </title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
    <body class="vh-100">
<header class="text-center bg-dark text-danger py-3">
        <h4 id="Bienvenida"> PaBeSo Tienda</h4>
</header>
	
	<div>

	<div class="card w-25 h-75 m-auto">	
		<div class="card-header bg-success text-white text-center">
			<h4> Consulta de Precio</h4>
	</div>
	<div class="card-body">
            
        <form action="../Modelo/pagina3.php" method="post">
        <h5 class="card-title">Ingrese prenda a Consultar:</h5>
        
        <input type="text" name="descripcion" placeholder=" Ingrese Prenda" class="form-control border border-5">
    <br>
    <br>
    
    <br>
    <div class="d-flex justify-content-center w-100">
    <input type="submit" class="btn btn-info btn-lg d-grid d-grid w-100" value="Buscar">    
    </div>
    <br>
    <br>
    
    </form>
    
</div>
<div class="card-footer ">
<?php
session_start();
$conexion = mysqli_connect("localhost", "root", "", "tiendapabeso") or die("Problemas con la conexión");

                if (isset($_SESSION['id_Tipo_de_usuario']) && $_SESSION['id_Tipo_de_usuario'] == 1) {
                    echo '<a href="accesoAceptadoAdmin.php" class="btn btn-secondary btn-lg d-grid w-100">Volver</a>';
                } else {
                    echo '<a href="accesoAceptadoVendedor.php" class="btn btn-secondary btn-lg d-grid w-100">Volver</a>';
                }
                ?>


<footer class="text-center bg-dark text-white py-3 fixed-bottom">
    <p>© 2023 PaBeSo Tienda. Todos los derechos reservados.</p>
</footer>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
</body>
</html>
