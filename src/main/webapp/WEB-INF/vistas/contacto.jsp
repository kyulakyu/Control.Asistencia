<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/control.asistencia/res/css/estilo.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Formulario de Contacto</title>
</head>
<body>
	<%@ include file='sidebar.jsp'%>
	<div class=contacto style="display: flex; justify-content: center;" data-mensaje="${mensaje}">
		<form action="/control.asistencia/CrearContacto" method="post" class="mb-5" class="mt-5">
			<h1 class=tituloContacto>Contacto</h1>
			<label for="nombre">Nombre:</label><br> 
			<input type="text" id="nombre" name="nombre" title="Campo Obligatorio"><br>
			<span id="nombreValidationMessage" style="color: red;"></span><br> 
			<label for="email">Email:</label><br> 
			<input type="text" id="email" name="email" title="Campo Obligatorio"><br>
			<span id="emailValidationMessage" style="color: red;"></span><br>
			<label for="comentario">Comentario:</label><br>
			<input type="text" id="comentario" name="comentario" title="Campo Obligatorio / Max 70 Caracteres."><br>
			<span id="comentarioValidationMessage" style="color: red;"></span><br>
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
	<script src="/control.asistencia/res/js/contacto.js"></script>
	<%@ include file='footer.jsp'%>
</body>
</html>