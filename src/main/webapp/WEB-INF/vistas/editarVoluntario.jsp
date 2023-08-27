<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Voluntario</title>
<script	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.all.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/control.asistencia/res/css/estilo.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body class="prueba">
	<%@ include file='sidebar.jsp'%>
	<div class=contacto style="display: flex; justify-content: center;">
		<form action="/control.asistencia/GuardarEdicionVoluntario" method="post">
			<h1 class=tituloContacto>Formulario de edición de Voluntario</h1>
			<br>
			<!--Datos en comun para todos los tipos de Usuario-->
			<label for="correo">Ingrese correo:</label><br> 
			<input type="text" id="correo" name="correo" value="${voluntario.correo}" title="Campo Obligatorio"><br>
			<span id="correoValidationMessage" style="color: red;"></span><br>
			<label for="password">Ingrese contraseña:</label><br> 
			<input type="text" id="password" name="password" value="${voluntario.password}" title="Campo Obligatorio"><br>
			<span id="passwordValidationMessage" style="color: red;"></span><br> 
			<label for="fechaNacimiento">Ingrese fecha de nacimiento:</label><br> 
			<input type="text" id="fechaNacimiento"	name="fechaNacimiento" value="${voluntario.fechaNacimiento}" title="Formato DD/MM/AAAA"><br>
			<span id="fechaNacimientoValidationMessage"style="color: red;"></span><br> 
			<label for="telefono">Teléfono:</label><br> 
			<input type="text" id="telefono" name="telefono" value="${voluntario.telefono}" title="Campo Obligatorio / Debe Introducir un Valor Númerico."><br>
			<span id="telefonoValidationMessage" style="color: red;"></span><br> 
			<label for="direccion">Dirección:</label><br>
			<input type="text" id="direccion" name="direccion" value="${voluntario.direccion}" title="Campo Obligatorio"><br>
			<span id="direccionValidationMessage" style="color: red;"></span><br>
			<label for="comuna">Comuna:</label><br> 
			<input type="text" id="comuna" name="comuna" value="${voluntario.comuna}" title="Campo Obligatorio"><br>
			<span id="comunaValidationMessage" style="color: red;"></span><br>
			<label for="runVoluntario">Ingrese run:</label><br> 
			<input type="text" id="runVoluntario" name="runVoluntario" value="${voluntario.runVoluntario}" title="Campo Obligatorio / Debe Introducir un Valor Númerico."><br>
			<span id="runVoluntarioValidationMessage" style="color: red;"></span><br>
			<label for="nombresV">Nombres:</label><br> 
			<input type="text" id="nombresV" name="nombresV" value="${voluntario.nombresV}" title="Campo Obligatorio"><br>
			<span id="nombresVValidationMessage" style="color: red;"></span><br> 
			<label for="apellidosV">Apellidos:</label><br> 
			<input type="text" id="apellidosV" name="apellidosV" value="${voluntario.apellidosV}" title="Campo Obligatorio"><br>
			<span id="apellidosVValidationMessage" style="color: red;"></span><br> 
			<label for="cargo">Cargo:</label><br> 
			<input type="text" id="cargo" name="cargo" value="${voluntario.cargo}" title="Campo Obligatorio"><br>
			<span id="cargoValidationMessage" style="color: red;"></span><br> 
			<label for="fechaDeIngreso">Fecha de ingreso:</label><br>
			<input type="text" id="fechaDeIngreso" name="fechaDeIngreso" value="${voluntario.fechaDeIngreso}" title="/ En Formato DD/MM/AAAA"><br>
			<span id="fechaDeIngresoValidationMessage" style="color: red;"></span><br>
			<input type="hidden" name="tipo" value="Voluntario">
			<input type="hidden" name="id" value="${voluntario.id}">
			<div style="display: flex; justify-content: center;">
				<input type="submit" value="Enviar" class="boton-enviar">
			</div>
		</form>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="/control.asistencia/res/js/editarVoluntario.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
	<%@ include file='footer.jsp'%>
</body>
</html>