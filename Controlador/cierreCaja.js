// Función para obtener el monto final actual mediante JavaScript
function obtenerMontoFinalActual() {
    $.ajax({
        url: '../Modelo/cajaCierre.php', // Archivo PHP que devuelve el monto final actual
        method: 'GET',
        success: function(response) {
            // Actualizar el valor en el campo de texto
            $('#montoFinalActual').val(response);
        },
        error: function(xhr, status, error) {
            console.error('Error al obtener el monto final actual:', error);
            // Manejar errores aquí según sea necesario
        }
    });
}

// Ejecutar al cargar el documento
$(document).ready(function() {
    obtenerMontoFinalActual(); // Obtener el monto final actual al cargar la página

    // Asignar la función a un evento click del enlace
    $('#obtenerMontoFinal').click(function(event) {
        event.preventDefault(); // Evitar que el enlace realice su acción por defecto (navegar a una URL)
        obtenerMontoFinalActual(); // Llamar a la función para obtener el monto final actual
    });
});
