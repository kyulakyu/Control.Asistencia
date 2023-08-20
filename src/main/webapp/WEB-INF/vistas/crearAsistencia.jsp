<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/control.asistencia/res/css/estilo.css">
<title>Marcar Asistencia</title>
</head>
<body class="asistencia">
	<%@ include file='sidebar.jsp'%>
	<div class="form-container">
		<div class="contacto">
					<form action="/control.asistencia/CrearAsistencia" method="post"
				onsubmit="return enviarFormulario(event)">
				<h1 class="tituloContacto">Formulario de Asistencia</h1>
				<label for="voluntarioId">Ingrese ID Voluntario:</label><br>
				<input type="text" id="voluntarioId" name="voluntarioId" title="Campo Obligatorio"><br>
				<span id="voluntarioIdValidationMessage" style="color: red;"></span><br>
				<label for="fechaAsistencia">Ingrese el Día de la Asistencia:</label><br>
				<input type="text" id="fechaAsistencia" name="fechaAsistencia" title="Formato DD/MM/AAAA"><br>
				<span id="fechaAsistenciaValidationMessage" style="color: red;"></span><br> 
				<label for="detalle">Ingrese el detalle:</label><br> 
				<input type="text" id="detalle" name="detalle" title="Campo Obligatorio / Max 70 Caracteres."><br>
				<span id="detalleValidationMessage" style="color: red;"></span><br>
				<br>
				<div style="display: flex; justify-content: center;" class="mb-5">
					<input type="submit" value="Enviar" class="boton-enviar">
				</div>
			</form>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
	<!-- Incluir el archivo crearCapacitacion.js -->
	<script src="/control.asistencia/res/js/crearAsistencia.js"></script>
	<%@ include file='footer.jsp'%>
</body>
</html>