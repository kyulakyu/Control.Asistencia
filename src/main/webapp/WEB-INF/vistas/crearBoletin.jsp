<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/control.asistencia/res/css/estilo.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Crear Boletin</title>
</head>
<body>
	<%@ include file='sidebar.jsp'%>
		<div class=contacto style="display: flex; justify-content: center;" data-mensaje="${mensaje}">
				<form action="/control.asistencia/CrearBoletin" method="post" onsubmit="return enviarFormulario(event)">
				<h1 class="tituloContacto">Crear Boletin</h1>
				<label for="titulo">Titulo:</label><br>
				<input type="text" id="titulo" name="titulo" title="Campo Obligatorio"><br>
				<span id="tituloValidationMessage" style="color: red;"></span> <br>
				<label for="fechaBoletin">Ingrese el Día:</label><br>
				<input type="text" id="fechaBoletin" name="fechaBoletin" title="Formato DD/MM/AAAA"><br>
				<span id="fechaBoletinValidationMessage" style="color: red;"></span><br> 
				<label for="detalle">Ingrese el detalle:</label><br> 
				<input type="text" id="detalle" name="detalle" title="Campo Obligatorio / Max 70 Caracteres."><br>
				<span id="detalleValidationMessage" style="color: red;"></span><br>
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
	<!-- Incluir el archivo crearBoletin.js -->
	<script src="/control.asistencia/res/js/crearBoletin.js"></script>
	<%@ include file='footer.jsp'%>
</body>
</html>