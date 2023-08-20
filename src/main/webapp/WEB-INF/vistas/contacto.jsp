<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/control.asistencia/res/css/estilo.css">
<title>Formulario de Contacto</title>
</head>

<body>
	<%@ include file='sidebar.jsp'%>
	<div class=contacto style="display: flex; justify-content: center;">

		<form action="/control.asistencia/CrearContacto" method="post" class="mb-5" class="mt-5">
			<h1 class=tituloContacto>Formulario de Contacto</h1>
			<label for="nombre">Nombre:</label><br> 
			<input type="text" id="nombre" name="nombre"><br><br> 
			<label for="email">Email:</label><br> 
			<input type="email" id="email" name="email"><br><br> 
			<label for="comentario">Comentario:</label><br>
			<textarea id="comentario" name="comentario"></textarea>
			<br><br>

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
	
</body>

</html>