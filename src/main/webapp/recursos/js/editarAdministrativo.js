document.addEventListener('DOMContentLoaded', function() {

//Validaciones Campos generales
//Validar Campo Correo
var correoInput = document.getElementById('correo');
var correoValidationMessage = document.getElementById('correoValidationMessage');

correoInput.addEventListener('input', function() {
	var correoValue = correoInput.value.trim();

	if (correoValue === '') {
		correoValidationMessage.textContent = 'Por favor, introduzca un correo. Campo Obligatorio';
	} else if (!isValidEmail(correoValue)) {
		correoValidationMessage.textContent = 'Por favor, introduzca un correo válido, ejemplo hola@hola.com';
	} else {
		correoValidationMessage.textContent = '';
	}
});

// Función para validar un correo electrónico
function isValidEmail(email) {
	// Expresión regular para validar el formato de correo electrónico
	var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	return emailPattern.test(email);
}

//Validar Campo Contraseña
var passwordInput = document.getElementById('password');
var passwordValidationMessage = document.getElementById('passwordValidationMessage');

passwordInput.addEventListener('input', function() {
	var passwordValue = passwordInput.value.trim();

	if (passwordValue === '') {
		passwordValidationMessage.textContent = 'Por favor, introduzca una contraseña de 8 caracteres, debe tener número, mayúscula, minúscula y símbolo';
	} else if (!isValidPassword(passwordValue)) {
		passwordValidationMessage.textContent = 'La contraseña debe contener al menos 8 caracteres, debe tener número, mayúscula, minúscula y símbolo';
	} else {
		passwordValidationMessage.textContent = '';
	}
});

// Función para validar una contraseña
function isValidPassword(password) {
	// Expresiones regulares para cada requisito
	var hasNumber = /\d/.test(password); // Al menos un número
	var hasUpperCase = /[A-Z]/.test(password); // Al menos una letra mayúscula
	var hasLowerCase = /[a-z]/.test(password); // Al menos una letra minúscula
	var hasSymbol = /[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]/.test(password); // Al menos un símbolo
	
	// Verificar longitud mínima y todos los requisitos
	return password.length >= 8 && hasNumber && hasUpperCase && hasLowerCase && hasSymbol;
}

//Validar Campo fecha de nacimiento
var fechaNacimientoInput = document.getElementById('fechaNacimiento');
var fechaNacimientoValidationMessage = document.getElementById('fechaNacimientoValidationMessage');

fechaNacimientoInput.addEventListener('input', function() {
	var fechaNacimientoValue = fechaNacimientoInput.value.trim();

	if (fechaNacimientoValue === '') {
		fechaNacimientoValidationMessage.textContent = 'Por favor, introduzca la fecha de nacimiento. Campo Obligatorio';
	} else if (!isValidDateFormat(fechaNacimientoValue)) {
		fechaNacimientoValidationMessage.textContent = 'El formato de fecha debe ser DD/MM/AAAA';
	} else {
		fechaNacimientoValidationMessage.textContent = '';
	}
});

//validar formato de fecha
function isValidDateFormat(dateString) {
	// Validar el formato de fecha dd/mm/aaaa usando una expresión regular
	var datePattern = /^\d{2}\/\d{2}\/\d{4}$/;
	return datePattern.test(dateString);
}

//Validar Campo telefono
var telefonoInput = document.getElementById('telefono');
var telefonoValidationMessage = document.getElementById('telefonoValidationMessage');

telefonoInput.addEventListener('input', function() {
	var telefonoValue = telefonoInput.value.trim();

	if (telefonoValue === '') {
		telefonoValidationMessage.textContent = 'Por favor, introduzca un número de teléfono. Campo Obligatorio';
	} else if (!isValidPhoneNumber(telefonoValue)) {
		telefonoValidationMessage.textContent = 'Por favor, introduzca un número de teléfono válido';
	} else if (parseInt(telefonoValue) <= 911111111 || parseInt(telefonoValue) >= 999999999) {
		telefonoValidationMessage.textContent = 'Por favor, introduzca un número de teléfono válido, debe ser de 9 digitos';
	} else {
		telefonoValidationMessage.textContent = '';
	}
});


function isValidPhoneNumber(phoneNumber) {
	// Validar que el número de teléfono contenga solo dígitos numéricos
	var numberPattern = /^\d+$/;
	return numberPattern.test(phoneNumber);
}
//Validar Campo direccion
var direccionInput = document.getElementById('direccion');
var direccionValidationMessage = document.getElementById('direccionValidationMessage');

direccionInput.addEventListener('input', function() {
	var direccionValue = direccionInput.value.trim();

	if (direccionValue === '') {
		direccionValidationMessage.textContent = 'Por favor, introduzca dirección. Campo Obligatorio';
	} else {
		direccionValidationMessage.textContent = '';
	}
});

//Validar Campo comuna
var comunaInput = document.getElementById('comuna');
var comunaValidationMessage = document.getElementById('comunaValidationMessage');

comunaInput.addEventListener('input', function() {
	var comunaValue = comunaInput.value.trim();

	if (comunaValue === '') {
		comunaValidationMessage.textContent = 'Por favor, introduzca la comuna. Campo Obligatorio';
	} else {
		comunaValidationMessage.textContent = '';
	}
});
//Validar datos del usurio tipo Voluntario y Administrativo

//Validar Campo Run
var runInput = document.getElementById('run');
var runValidationMessage = document.getElementById('runValidationMessage');

runInput.addEventListener('input', function() {
	var runValue = runInput.value.trim();

	if (runValue === '') {
		runValidationMessage.textContent = 'Por favor, introduzca el Run sin puntos ni guion';
	} else if (!/^[0-9]+$/.test(runValue)) {
		runValidationMessage.textContent = 'Por favor, introduzca un Run válido. Solo se permiten dígitos numéricos.';
	} else if (parseInt(runValue, 10) > 99999999) {
		runValidationMessage.textContent = 'Por favor, introduzca un Run válido. El número no puede ser mayor a 99.999.999.';
	} else {
		runValidationMessage.textContent = '';
	}
});

//Validar Campo Nombres
var nombresInput = document.getElementById('nombres');
var nombresValidationMessage = document.getElementById('nombresValidationMessage');

nombresInput.addEventListener('input', function() {
	var nombresValue = nombresInput.value.trim();

	if (nombresValue === '') {
		nombresValidationMessage.textContent = 'Por favor, introduzca nombres. Campo Obligatorio';
	} else {
		nombresValidationMessage.textContent = '';
	}
});

// Validar Campo Apellidos
var apellidosInput = document.getElementById('apellidos');
var apellidosValidationMessage = document.getElementById('apellidosValidationMessage');

apellidosInput.addEventListener('input', function() {
	var apellidosValue = apellidosInput.value.trim();

	if (apellidosValue === '') {
		apellidosValidationMessage.textContent = 'Por favor, introduzca apellidos. Campo Obligatorio';
	} else {
		apellidosValidationMessage.textContent = '';
	}
});

//Validar Campo Cliente Administrativo
var clienteAdministrativoInput = document.getElementById('clienteAdministrativo');
var clienteAdministrativoValidationMessage = document.getElementById('clienteAdministrativoValidationMessage');

clienteAdministrativoInput.addEventListener('input', function() {
	var clienteAdministrativoValue = clienteAdministrativoInput.value.trim();

	if (clienteAdministrativoValue === '') {
		clienteAdministrativoValidationMessage.textContent = 'Por favor, introduzca el cliente. Campo Obligatorio';
	} else {
		clienteAdministrativoValidationMessage.textContent = '';
	}
});
});

function enviarFormulario(event) {
	event.preventDefault(); // Cancelar el envío del formulario

	Swal.fire({
		icon: 'success',
		title: 'Éxito',
		text: 'El usuario se creó correctamente.'
	}).then(() => {
		document.forms[0].submit(); // Enviar el formulario después de mostrar la alerta
	});

	return false;
}

//Funcion de despliege
function mostrarCamposAdicionales() {
	var tipoSeleccionado = document.getElementById("tipo").value;
	var camposCliente = document.getElementById("camposCliente");
	var camposVoluntario = document.getElementById("camposVoluntario");
	var camposAdministrativo = document.getElementById("camposAdministrativo");

	camposCliente.style.display = "none";
	camposVoluntario.style.display = "none";
	camposAdministrativo.style.display = "none";

	if (tipoSeleccionado === "Cliente") {
		camposCliente.style.display = "block";
	} else if (tipoSeleccionado === "Voluntario") {
		camposVoluntario.style.display = "block";
	} else if (tipoSeleccionado === "Administrativo") {
		camposAdministrativo.style.display = "block";
	}
}