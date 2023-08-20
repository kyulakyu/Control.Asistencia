<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/control.asistencia/res/css/estilo.css">
<title>Login</title>
<!-- Fontawesome CDN Link -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<div class="container">
<%
String error = (String) request.getAttribute("error");
if (error != null && error.equals("true")) {
    // Código JavaScript para mostrar la alerta de error
	out.println("<script>Swal.fire('Error de Autenticación', 'Verifica tus credenciales', 'error');</script>");
}
%>
		<input type="checkbox" id="flip">
		<div class="cover">
			<div class="front">
				<img src="/control.asistencia/res/img/login.jpg" alt="">
			</div>
		</div>
		<div class="forms">
			<div class="form-content">
				<div class="login-form">
					<div class="title">Iniciar Sesion</div>
					<form action="${pageContext.request.contextPath}/login" method="post">
						<div class="input-boxes">
							<div class="input-box">
								<i class="fas fa-envelope"></i>
								<input type="text" name="correo_usuario" placeholder="Ingrese su correo" required>
							</div>
							<div class="input-box">
								<i class="fas fa-lock"></i>
								<input type="password" name="password_usuario" placeholder="Ingrese su contraseña" required>
							</div>
							<!-- <div class="text"><a href="#">Olvidé la contraseña</a></div> -->
							<div class="button input-box">
								<input type="submit" value="Submit">
							</div>
							<div class="text sign-up-text">
								Problemas para ingresar? Diríjase a <a href="Contacto">Contacto</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>