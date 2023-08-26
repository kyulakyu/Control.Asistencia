<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/control.asistencia/res/css/estilo.css">
<title>Crear Usuario</title>
<body>
	<%@ include file='sidebar.jsp'%>
	<div class=contacto style="display: flex; justify-content: center;" data-mensaje="${mensaje}">
			<form action="/control.asistencia/CrearUsuario" method="post" onsubmit="return enviarFormulario(event)">
				<h1 class=tituloContacto>Creacion de Usuario</h1>
				<label for="tipo">Selecciona un Tipo:</label> <select id="tipo"
					name="tipo" onchange="mostrarCamposAdicionales()">
					<option value="Seleccione">Seleccione</option>
					<option value="Cliente">Cliente</option>
					<option value="Voluntario">Voluntario</option>
					<option value="Administrativo">Administrativo</option>
				</select> <br> <br>
				<!--Datos en comun para todos los tipos de Usuario-->
					<label for="correo">Ingrese correo:</label><br> 
					<input type="text" id="correo" name="correo" title="Campo Obligatorio"><br>
					<span id="correoValidationMessage" style="color: red;"></span><br>
					<label for="password">Ingrese contraseña:</label><br> 
					<input type="text" id="password" name="password" title="Campo Obligatorio"><br>
					<span id="passwordValidationMessage" style="color: red;"></span><br> 
					<label for="fechaNacimiento">Ingrese fecha de nacimiento:</label><br> 
					<input type="text" id="fechaNacimiento"	name="fechaNacimiento" title="Formato DD/MM/AAAA"><br>
					<span id="fechaNacimientoValidationMessage"style="color: red;"></span><br> 
					<label for="telefono">Teléfono:</label><br> 
					<input type="text" id="telefono" name="telefono" title="Campo Obligatorio / Debe Introducir un Valor Númerico."><br>
					<span id="telefonoValidationMessage" style="color: red;"></span><br> 
					<label for="direccion">Dirección:</label><br>
					<input type="text" id="direccion" name="direccion" title="Campo Obligatorio"><br>
					<span id="direccionValidationMessage" style="color: red;"></span><br>
					<label for="comuna">Comuna:</label><br> 
					<input type="text" id="comuna" name="comuna" title="Campo Obligatorio"><br>
					<span id="comunaValidationMessage" style="color: red;"></span>
				
				<!-- Datos correspondientes al usuario de tipo Cliente -->
				<div id="camposCliente" style="display: none;">
					<label for="rut">RUT:</label><br> 
					<input type="text" id="rut" name="rut" title="Campo Obligatorio / Debe Introducir un Valor Númerico."><br>
					<span id="rutValidationMessage" style="color: red;"></span><br> 
					<label for="nombre">Nombre:</label><br> 
					<input type="text" id="nombre" name="nombre" title="Campo Obligatorio"><br>
					<span id="nombreValidationMessage" style="color: red;"></span><br> 
				</div>
				<!--  Datos correspondientes al usuario de tipo Voluntario-->
				<div id="camposVoluntario" style="display: none;">
					<label for="runVoluntario">Ingrese run:</label><br> 
					<input type="text" id="runVoluntario" name="runVoluntario" title="Campo Obligatorio / Debe Introducir un Valor Númerico."><br>
					<span id="runVoluntarioValidationMessage" style="color: red;"></span><br>
					<label for="nombresV">Nombres:</label><br> 
					<input type="text" id="nombresV" name="nombresV" title="Campo Obligatorio"><br>
					<span id="nombresVValidationMessage" style="color: red;"></span><br> 
					<label for="apellidosV">Apellidos:</label><br> 
					<input type="text" id="apellidosV" name="apellidosV" title="Campo Obligatorio"><br>
					<span id="apellidosVValidationMessage" style="color: red;"></span><br> 
					<label for="cargo">Cargo:</label><br> 
					<input type="text" id="cargo" name="cargo" title="Campo Obligatorio"><br>
					<span id="cargoValidationMessage" style="color: red;"></span><br> 
					<label for="fechaDeIngreso">Fecha de ingreso:</label><br>
					<input type="text" id="fechaDeIngreso" name="fechaDeIngreso" title="/ En Formato DD/MM/AAAA"><br>
					<span id="fechaDeIngresoValidationMessage" style="color: red;"></span><br>
				</div>

				<div id="camposAdministrativo" style="display: none;">
					<label for="run">Ingrese run:</label><br> 
					<input type="text" id="run" name="run" title="Campo Obligatorio / Debe Introducir un Valor Númerico."><br>
					<span id="runValidationMessage" style="color: red;"></span><br>
					<label for="nombres">Nombres:</label><br> 
					<input type="text" id="nombres" name="nombres" title="Campo Obligatorio"><br>
					<span id="nombresValidationMessage" style="color: red;"></span><br> 
					<label for="apellidos">Apellidos:</label><br> 
					<input type="text" id="apellidos" name="apellidos" title="Campo Obligatorio"><br>
					<span id="apellidosValidationMessage" style="color: red;"></span><br> 
					<label for=clienteAdministrativo>Cliente:</label><br> 
					<input type="text" id="clienteAdministrativo" name="clienteAdministrativo" title="Campo Obligatorio"><br>
					<span id="clienteAdministrativoValidationMessage" style="color: red;"></span><br> 
				</div>
				<br>
				<div style="display: flex; justify-content: center;" class="mb-5">
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
	<!-- Incluir el archivo crearUsuario.js -->
	<script src="/control.asistencia/res/js/crearUsuario.js"></script>
</body>
</html>
