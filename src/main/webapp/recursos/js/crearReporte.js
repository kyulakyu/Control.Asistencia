document.addEventListener('DOMContentLoaded', function() {

//Validar Campo Dia Reporte
var fechaReporteInput = document.getElementById('fechaReporte');
var fechaReporteValidationMessage = document.getElementById('fechaReporteValidationMessage');

fechaReporteInput.addEventListener('input', function() {
	var fechaReporteValue = fechaReporteInput.value.trim();

	if (fechaReporteValue === '') {
		fechaReporteValidationMessage.textContent = 'Por favor, introduzca el dia del incidente. Campo Obligatorio';
	} else if (!isValidDateFormat(fechaReporteValue)) {
		fechaReporteValidationMessage.textContent = 'El formato de fecha debe ser DD/MM/AAAA';
	} else {
		fechaReporteValidationMessage.textContent = '';
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

});