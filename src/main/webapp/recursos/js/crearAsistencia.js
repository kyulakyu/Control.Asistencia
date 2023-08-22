document.addEventListener('DOMContentLoaded', function() {

//Validar Campo Dia Asistencia
var fechaAsistenciaInput = document.getElementById('fechaAsistencia');
var fechaAsistenciaValidationMessage = document.getElementById('fechaAsistenciaValidationMessage');

fechaAsistenciaInput.addEventListener('input', function() {
	var fechaAsistenciaValue = fechaAsistenciaInput.value.trim();

	if (fechaAsistenciaValue === '') {
		fechaAsistenciaValidationMessage.textContent = 'Por favor, introduzca el dia de asistencia. Campo Obligatorio';
	} else if (!isValidDateFormat(fechaAsistenciaValue)) {
		fechaAsistenciaValidationMessage.textContent = 'El formato de fecha debe ser DD/MM/AAAA';
	} else {
		fechaAsistenciaValidationMessage.textContent = '';
	}
});

//validar formato de fecha
function isValidDateFormat(dateString) {
	// Validar el formato de fecha dd/mm/aaaa usando una expresión regular
	var datePattern = /^\d{2}\/\d{2}\/\d{4}$/;
	return datePattern.test(dateString);
}

//Validar Campo detalle
var detalleInput = document.getElementById('detalle');
var detalleValidationMessage = document.getElementById('detalleValidationMessage');

detalleInput.addEventListener('input', function() {
  var detalleValue = detalleInput.value.trim();
  
  if (detalleValue === '') {
    detalleValidationMessage.textContent = 'Por favor, introduzca el detalle. Campo Obligatorio';
  } else if (detalleValue.length > 70) {
    detalleValidationMessage.textContent = 'Por favor, introduzca el detalle, máximo 70 caracteres.';
  } else {
    detalleValidationMessage.textContent = '';
  }
});
	// Obtener el mensaje del atributo flash del modelo
	var mensaje = document.querySelector("[data-mensaje]").getAttribute("data-mensaje");

	// Mostrar SweetAlert según el mensaje recibido
	if (mensaje) {
		if (mensaje === "La información fue enviada correctamente.") {
			Swal.fire({
				icon: 'success',
				title: 'Éxito',
				text: mensaje
			});
		} else {
			Swal.fire({
				icon: 'error',
				title: 'Error',
				text: mensaje
			});
		}
	}

});