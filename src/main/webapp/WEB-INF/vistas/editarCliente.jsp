<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Cliente</title>
<script	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.all.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/control.asistencia/res/css/estilo.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body class="prueba">
	<%@ include file='sidebar.jsp'%>
	<div class=contacto style="display: flex; justify-content: center;">
	<form action="/control.asistencia/GuardarEdicionCliente" method="post">
			<h1 class=tituloContacto>Formulario de edición de Cliente</h1>
			<br> <br>
			<!--Datos en comun para todos los tipos de Usuario-->
			<label for="correo">Ingrese correo:</label><br> 
			<input type="text" id="correo" name="correo" value="${cliente.correo}" title="Campo Obligatorio"><br>
			<span id="correoValidationMessage" style="color: red;"></span><br>
			<label for="password">Ingrese contraseña:</label><br> 
			<input type="text" id="password" name="password" value="${cliente.password}" title="Campo Obligatorio"><br>
			<span id="passwordValidationMessage" style="color: red;"></span><br> 
			<label for="fechaNacimiento">Ingrese fecha de nacimiento:</label><br> 
			<input type="text" id="fechaNacimiento"	name="fechaNacimiento" value="${cliente.fechaNacimiento}" title="Formato DD/MM/AAAA"><br>
			<span id="fechaNacimientoValidationMessage"style="color: red;"></span><br> 
			<label for="telefono">Teléfono:</label><br> 
			<input type="text" id="telefono" name="telefono" value="${cliente.telefono}" title="Campo Obligatorio / Debe Introducir un Valor Númerico."><br>
			<span id="telefonoValidationMessage" style="color: red;"></span><br> 
			<label for="direccion">Dirección:</label><br>
			<input type="text" id="direccion" name="direccion" value="${cliente.direccion}" title="Campo Obligatorio"><br>
			<span id="direccionValidationMessage" style="color: red;"></span><br>
			<label for="comuna">Comuna:</label><br> 
			<input type="text" id="comuna" name="comuna" value="${cliente.comuna}" title="Campo Obligatorio"><br>
			<span id="comunaValidationMessage" style="color: red;"></span><br>
			<label for="rut">RUT:</label><br> 
			<input type="text" id="rut" name="rut" value="${cliente.rut}" title="Campo Obligatorio / Debe Introducir un Valor Númerico."><br>
			<span id="rutValidationMessage" style="color: red;"></span><br> 
			<label for="nombre">Nombre:</label><br> 
			<input type="text" id="nombre" name="nombre" value="${cliente.nombre}" title="Campo Obligatorio"><br>
			<span id="nombreValidationMessage" style="color: red;"></span><br> 
			<input type="hidden" name="tipo" value="Cliente">
			<input type="hidden" name="id" value="${cliente.id}">
			<div style="display: flex; justify-content: center;">
				<input type="submit" value="Enviar" class="boton-enviar">
			</div>
		</form>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
	<%@ include file='footer.jsp'%>
	<script src="/control.asistencia/res/js/editarCliente.js"></script>
</body>
</html>