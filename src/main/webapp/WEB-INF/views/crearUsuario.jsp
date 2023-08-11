<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="/modulo6/res/css/styles.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<title>Crear Usuario</title>
<body class="prueba">
	<%@ include file='sidebar.jsp'%>
	<img class="imagen-zoom" src="/modulo6/res/img/logogrupo4.png"
		alt="Logo de la empresa">

	<div class="form-container">


		<div class=contacto>

			<form action="/modulo6/CrearUsuario" method="post"
				onsubmit="return enviarFormulario(event)">
				<h1 class=tituloContacto>Formulario de Creacion de Usuario</h1>
				<label for="tipo">Selecciona un Tipo:</label> <select id="tipo"
					name="tipo" onchange="mostrarCamposAdicionales()">
					<option value="Seleccione">Seleccione</option>
					<option value="Cliente">Cliente</option>
					<option value="Profesional">Profesional</option>
					<option value="Administrativo">Administrativo</option>
				</select> <br> <br>
				<!--Datos en comun para todos los tipos de Usuario-->
				<label for="nombre">Ingrese el nombre de usuario:</label><br> <input
					type="text" id="nombre" name="nombre" title="Campo Obligatorio"><br>
				<br> <span id="nombreValidationMessage" style="color: red;"></span>
				<br> <label for="fechaNacimiento">Ingrese fecha de
					nacimiento:</label><br> <input type="text" id="fechaNacimiento"
					name="fechaNacimiento" title="Formato DD/MM/AAAA"><br>
				<br> <span id="fechaNacimientoValidationMessage"
					style="color: red;"></span> <br> <label for="run">Ingrese
					run:</label><br> <input type="text" id="run" name="run"
					title="Campo Obligatorio / Debe Introducir un Valor Númerico."><br>
				<br> <span id="runValidationMessage" style="color: red;"></span>
				<br>

				<!-- Datos correspondientes al usuario de tipo Cliente -->
				<div id="camposCliente" style="display: none;">
					<label for="rut">RUT:</label><br> <input type="text" id="rut"
						name="rut"
						title="Campo Obligatorio / Debe Introducir un Valor Númerico."><br>
					<br> <span id="rutValidationMessage" style="color: red;"></span>
					<br> <label for="nombres">Nombres:</label><br> <input
						type="text" id="nombres" name="nombres" title="Campo Obligatorio"><br>
					<br> <span id="nombresValidationMessage" style="color: red;"></span>
					<br> <label for="apellidos">Apellidos:</label><br> <input
						type="text" id="apellidos" name="apellidos"
						title="Campo Obligatorio"><br>
					<br> <span id="apellidosValidationMessage" style="color: red;"></span>
					<br> <label for="telefono">Teléfono:</label><br> <input
						type="number" id="telefono" name="telefono"
						title="Campo Obligatorio / Debe Introducir un Valor Númerico."><br>
					<br> <span id="telefonoValidationMessage" style="color: red;"></span>
					<br> <label for="afp">AFP:</label><br> <input type="text"
						id="afp" name="afp" title="Campo Obligatorio"><br>
					<br> <span id="afpValidationMessage" style="color: red;"></span>
					<br> <label for="sistemaDeSalud">Sistema de salud:</label><br>
					<select id="sistemaDeSalud" name="sistemaDeSalud">
						<option value="1">Fonasa</option>
						<option value="2">Isapre</option>
					</select> <br> <br> <label for="direccion">Dirección:</label><br>
					<input type="text" id="direccion" name="direccion"
						title="Campo Obligatorio"><br>
					<br> <span id="direccionValidationMessage" style="color: red;"></span>
					<br> <label for="comuna">Comuna:</label><br> <input
						type="text" id="comuna" name="comuna" title="Campo Obligatorio"><br>
					<br> <span id="comunaValidationMessage" style="color: red;"></span>
					<br> <label for="edad">Edad:</label><br> <input
						type="text" id="edad" name="edad"
						title="Campo Obligatorio / Debe Introducir un Valor Númerico."><br>
					<br> <span id="edadValidationMessage" style="color: red;"></span>
					<br>
				</div>
				<!--  Datos correspondientes al usuario de tipo Profesional-->
				<div id="camposProfesional" style="display: none;">
					<label for="titulo">Título:</label><br> <input type="text"
						id="titulo" name="titulo" title="Campo Obligatorio"><br>
					<br> <span id="tituloValidationMessage" style="color: red;"></span>
					<br> <label for="fechaDeIngreso">Fecha de ingreso:</label><br>
					<input type="text" id="fechaDeIngreso" name="fechaDeIngreso"
						title="/ En Formato DD/MM/AAAA"><br>
					<br> <span id="fechaDeIngresoValidationMessage"
						style="color: red;"></span> <br>
				</div>

				<div id="camposAdministrativo" style="display: none;">
					<label for="area">Área:</label><br> <input type="text"
						id="area" name="area" title="Campo Obligatorio"><br>
					<br> <span id="areaValidationMessage" style="color: red;"></span>
					<br> <label for="experienciaPrevia">Experiencia
						previa:</label><br> <input type="text" id="experienciaPrevia"
						name="experienciaPrevia" title="Campo Obligatorio"><br>
					<br> <span id="experienciaPreviaValidationMessage"
						style="color: red;"></span> <br>
				</div>


				<div class="contenedor-boton">
					<input type="submit" value="Enviar" class="boton-enviar">
				</div>
			</form>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
	<%@ include file='footer.jsp'%>
	<!-- Incluir el archivo crearUsuario.js -->
	<script src="/modulo6/res/js/crearUsuario.js"></script>
</body>
</html>
