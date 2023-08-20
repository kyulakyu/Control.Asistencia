  <!--<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!----======== CSS ======== -->
<link rel="stylesheet" href="/src/main/webapp/recursos/css/estilo.css">
<!----======== Booststrap ======== -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/css/bootstrap.min.css">
<!----===== Boxicons CSS ===== -->
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>

<!--<title>Dashboard Sidebar Menu</title>-->
</head>
<body>
	<nav class="sidebar close">
		<header>
			<div class="image-text">
				<span class="image"> <img
					src="/control.asistencia/res/img/logo.png"
					alt="Compañia de Bomberos de Chile">
				</span>
				<div class="text logo-text">
					<span class="name">Bomberos</span><span class="profession">Control Asistencia</span>
				</div>
			</div>
			<i class='bx bx-chevron-right toggle'></i>
		</header>
		<div class="menu-bar">
			<div class="menu">
				<li class="search-box"><i class='bx bx-search icon'></i> 
				<input type="text" placeholder="Buscar..."></li>
				<li class="nav-link"><a href="inicio"> 
				<i class='bx bx-home icon'></i>
				<span class="text nav-text">Inicio</span>
				</a></li>
				<%-- Verificar si el usuario tiene el rol "administrativo" --%>
				<%--           			<%
          			if (request.isUserInRole("Administrativo")) {
          			%> --%>
				<li class="nav-link"><a href="CrearUsuario"> 
				<i class='bx bx-user-check icon'></i>
				<span class="text nav-text">Crear Usuario</span>
				</a></li>
				<li class="nav-link"><a href="ListarUsuarios"> 
				<i class='bx bx-list-ul icon'></i>
				<span class="text nav-text">Listado Usuarios</span>
				</a></li>
				<%--           			<%
          			}
          			%>
          			Verificar si el usuario tiene el rol "administrativo"
          			<%
          			if (request.isUserInRole("Cliente")) {
          			%> --%>
          		<li class="nav-link"><a href="CrearBoletin"> 
				<i class='bx bx-news icon'></i>
				<span class="text nav-text">Crear Boletin</span>
				</a></li>
				<li class="nav-link"><a href="ListarAsistencia"> 
				<i class='bx bx-list-ul icon'></i>
				<span class="text nav-text">Listado Asistencia</span>
				</a></li>
				<li class="nav-link"><a href="ListarReportes"> 
				<i class='bx bx-list-ul icon'></i>
				<span class="text nav-text">Listado Reportes</span>
				</a></li>
				<%--           			<%
          			}
          			%>
          			Verificar si el usuario tiene el rol "usuario"
          			<%
          			if (request.isUserInRole("Voluntario")) {
          			%>  --%>
<!-- 			<li class="nav-link"><a href="Cuenta"> 
				<i class='bx bx-user-circle icon'></i>
				<span class="text nav-text">Cuenta</span>
				</a></li> -->
				<li class="nav-link"><a href="CrearAsistencia"> 
				<i class='bx bx-calendar-check icon'></i>
				<span class="text nav-text">Marcar Asistencia</span>
				</a></li>
				<li class="nav-link"><a href="CrearReporte"> 
				<i class='bx bx-error-alt icon'></i>
				<span class="text nav-text">Reportar incidentes</span>
				</a></li>
				<%--                     <%
          			}
          			%> --%>
				<li class="nav-link"><a href="Contacto"> 
				<i class='bx bx-mail-send icon'></i>
				<span class="text nav-text">Contacto</span>
				</a></li>
			</div>
			<div class="bottom-content">
				<li class=""><a	href="${pageContext.request.contextPath}/logout"> 
				<i class='bx bx-log-out icon'></i> 
				<span class="text nav-text">Cerrar Sesion</span>
				</a></li>
			</div>
		</div>
	</nav>
	<script>
		const body = document.querySelector('body'),
		sidebar = body.querySelector('nav'),
		toggle = body.querySelector(".toggle"),
		searchBtn = body.querySelector(".search-box"),
		modeSwitch = body.querySelector(".toggle-switch"),
		modeText = body.querySelector(".mode-text");
		toggle.addEventListener("click" , () =>{
		sidebar.classList.toggle("close");
		})
		searchBtn.addEventListener("click" , () =>{
		sidebar.classList.remove("close");
		});
</script>
</body>
</html>