document.addEventListener('DOMContentLoaded', function() {

	//Validar Campo Nombre
	var nombreInput = document.getElementById('nombre');
	var nombreValidationMessage = document.getElementById('nombreValidationMessage');

	nombreInput.addEventListener('input', function() {
		var nombreValue = nombreInput.value.trim();

		if (nombreValue === '') {
			nombreValidationMessage.textContent = 'Por favor, introduzca el nombre. Campo Obligatorio';
		} else if (nombreValue.length > 10) {
			nombreValidationMessage.textContent = 'Por favor, introduzca el nombre, máximo 10 caracteres.';
		} else {
			nombreValidationMessage.textContent = '';
		}
	});

	//Validar Campo Correo
	var emailInput = document.getElementById('email');
	var emailValidationMessage = document.getElementById('emailValidationMessage');

	emailInput.addEventListener('input', function() {
		var emailValue = emailInput.value.trim();

		if (emailValue === '') {
			emailValidationMessage.textContent = 'Por favor, introduzca un email. Campo Obligatorio';
		} else if (!isValidEmail(emailValue)) {
			emailValidationMessage.textContent = 'Por favor, introduzca un email válido, ejemplo hola@hola.com';
		} else {
			emailValidationMessage.textContent = '';
		}
	});

	// Función para validar un email electrónico
	function isValidEmail(email) {
		// Expresión regular para validar el formato de email electrónico
		var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
		return emailPattern.test(email);
	}


	//Validar Campo Comentario
	var comentarioInput = document.getElementById('comentario');
	var comentarioValidationMessage = document.getElementById('comentarioValidationMessage');

	comentarioInput.addEventListener('input', function() {
		var comentarioValue = comentarioInput.value.trim();

		if (comentarioValue === '') {
			comentarioValidationMessage.textContent = 'Por favor, introduzca el comentario. Campo Obligatorio';
		} else if (comentarioValue.length > 70) {
			comentarioValidationMessage.textContent = 'Por favor, introduzca el comentario, máximo 70 caracteres.';
		} else {
			comentarioValidationMessage.textContent = '';
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