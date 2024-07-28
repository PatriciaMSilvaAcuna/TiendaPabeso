$(document).ready(function() {
    obtenerMontoFinalActual(); // Obtener el monto final actual al cargar la página

    // Asociar la función al evento submit del formulario
    $('#formCerrarCaja').on('submit', enviarFormulario);
});

// Función para obtener el monto final actual mediante JavaScript
function obtenerMontoFinalActual() {
    $.ajax({
        url: '../Modelo/cajaCierre.php', 
        method: 'GET',
        success: function(response) {
            $('#montoFinalActual').val(response.trim());
        },
        error: function(xhr, status, error) {
            console.error('Error al obtener el monto final actual:', error);
        }
    });
}

// Función para enviar el formulario y validar el monto ingresado
function enviarFormulario(event) {
    event.preventDefault(); // Evitar el envío del formulario por defecto

    // Obtener el monto ingresado por el usuario
    var montoIngresado = parseFloat($('#montoCierre').val());

    // Obtener el monto final actual desde el campo de texto
    var montoFinalActual = parseFloat($('#montoFinalActual').val());

    // Comparar el monto ingresado con el monto final actual
    if (isNaN(montoIngresado) || isNaN(montoFinalActual)) {
        alert('Por favor, ingrese un monto válido.');
        return;
    }

    // Realizar una solicitud AJAX para validar el monto ingresado
    $.ajax({
        url: '../Modelo/cerrarCaja.php', 
        method: 'POST',
        data: $('#formCerrarCaja').serialize(),
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                alert(response.message);
                window.location.href = "accesoAceptadoAdmin.php";
            } else {
                $('#mensaje').html(
                    `<div class="alert alert-warning" role="alert">
                        ${response.message}
                        <button id="confirmarBtn" class="btn btn-primary">Confirmar</button>
                        <button id="cancelarBtn" class="btn btn-secondary">Cancelar</button>
                    </div>`
                );

                // Manejar los botones de confirmar y cancelar
                $('#confirmarBtn').click(function() {
                    $('#confirmar').val('1'); // Establecer el valor de confirmación a 1
                    // Reenviar el formulario con confirmación
                    $.ajax({
                        url: '../Modelo/cerrarCaja.php', 
                        method: 'POST',
                        data: $('#formCerrarCaja').serialize(),
                        dataType: 'json',
                        success: function(response) {
                            if (response.success) {
                                alert(response.message);
                                window.location.href = "accesoAceptadoAdmin.php";
                            } else {
                                alert(response.message);
                            }
                        },
                        error: function(xhr, status, error) {
                            console.error('Error al enviar el formulario:', error);
                        }
                    });
                });

                $('#cancelarBtn').click(function() {
                    $('#mensaje').empty(); // Limpiar el mensaje si se cancela
                });
            }
        },
        error: function(xhr, status, error) {
            console.error('Error al enviar el formulario:', error);
        }
    });
}
