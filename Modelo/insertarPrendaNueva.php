<!DOCTYPE html>
<html lang="es">
<head>
    <title>Agregar Stock</title>
    <link rel="icon" href="../Vista/vendedora.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="../Vista/css.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body class="vh-100 d-flex flex-column">
    <header class="text-center bg-dark text-danger py-3">
        <h4 id="Bienvenida">PaBeSo Tienda</h4>
    </header>
    <div class="container flex-grow-1 d-flex justify-content-center align-items-center">
        <div class="card w-75">
            <div class="card-header bg-success text-white text-center">
                <h4>Formulario de Prenda</h4>
    </div>
    <div class="card-body">
                <form action="altas02.php" method="post">
                    <div class="mb-3">
                        <label for="id_Tipo_de_prenda" class="form-label">TIPO DE PRENDA</label>
                        <select id="id_Tipo_de_prenda" name="id_Tipo_de_prenda" class="form-select">
 <?php
   $conexion = mysqli_connect("localhost", "root", "", "tiendapabeso") or die ("problemas con la conexion");
   $registros = mysqli_query($conexion, "select id_Tipo_de_prenda, nombre from tipodeprenda") or die ("Problemas con el select: " . mysqli_error($conexion));
        echo "<option value='0'>Seleccione un Tipo de prenda</option>";
        while ($reg = mysqli_fetch_array($registros)) {
        echo "<option value=\"$reg[id_Tipo_de_prenda]\">$reg[nombre]</option>";
                }
?>
        </select>
        </div>
                    <div class="mb-3">
                        <label for="id_color" class="form-label">SELECCIONE COLOR DE LA PRENDA</label>
                        <select id="id_color" name="id_color" class="form-select">
                            <?php
                            $conexion = mysqli_connect("localhost", "root", "", "tiendapabeso") or die ("problemas con la conexion");
                            $registros = mysqli_query($conexion, "select id_Color, nombre from color") or die ("Problemas con el select: " . mysqli_error($conexion));
                            echo "<option value='0'>Seleccione un color</option>";
                            while ($reg = mysqli_fetch_array($registros)) {
                                echo "<option value=\"$reg[id_Color]\">$reg[nombre]</option>";
                            }
                            ?>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="id_talle" class="form-label">SELECCIONE TALLE DE LA PRENDA</label>
                        <select id="id_talle" name="id_talle" class="form-select">
                            <?php
                            $conexion = mysqli_connect("localhost", "root", "", "tiendapabeso") or die ("problemas con la conexion");
                            $registros = mysqli_query($conexion, "select id_Talle, nombre from talle") or die ("Problemas con el select: " . mysqli_error($conexion));
                            echo "<option value='0'>Seleccione un Talle</option>";
                            while ($reg = mysqli_fetch_array($registros)) {
                                echo "<option value=\"$reg[id_Talle]\">$reg[nombre]</option>";
                            }
                            ?>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="descripcion" class="form-label">Descripcion:</label>
                        <input type="text" id="descripcion" name="descripcion" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="stock_minimo" class="form-label">Stock Mínimo:</label>
                        <input type="text" id="stock_minimo" name="stock_minimo" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="stock" class="form-label">Cantidad:</label>
                        <input type="text" id="stock" name="stock" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="precio" class="form-label">Precio:</label>
                        <input type="text" id="precio" name="precio" class="form-control">
                    </div>
                    <div class="d-flex justify-content-between">
                        <a href="../Modelo/accesoAceptadoAdmin.php" class="btn btn-secondary btn-lg mi-boton">Volver</a>
                        <input type="submit" class="btn btn-success btn-lg mi-boton" value="Dar de Alta">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <footer class="text-center bg-dark text-white py-3 mt-auto">
        <p>© 2023 PaBeSo Tienda. Todos los derechos reservados.</p>
    </footer>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>

<!-Creamos el script donde trabajaremos con AJAX->
<script type="text/javascript">
    //esta función inicia atomaticamente al cargarse la página.
    $(document).ready(function(){
        //Asignamos el valor 0 al select al iniciar la página.
        $('#prenda').val(0);
        //La funbción recargarLista() realiza una peticion en ajax
        recargarLista();
        //Esta función se va a ejecutar cada vez que el select marca sufra un cambio.
        $('#prenda').change(function(){
            // Y vuelve a ejecutar la función recargarLista;
            recargarLista();
        });
    })
</script>
<script type="text/javascript">
    function recargarLista(){
        // La función realiza una petición ajax mediante un post que trae al select "prendas".
        $.ajax({
            // El post manda los datos a datos.php
            type:"POST",
            url:"datos.php",
            // Se manda como idPrenda el contenido del select.
            data:"id_Tipo_de_prenda=" + $('#prenda').val(),
            // "r" es el que devuelve el contenido html de datos.php.
            success:function(r){
                // se carga "r" en el div descripcion
                $('#descripcion').html(r);
            }
        });
    }
</script>

 