<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
      <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="estilos.css">
    
    <!----===== Boxicons CSS ===== -->
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    
    <!--<title>Dashboard Sidebar Menu</title>--> 
</head>
<body>
    <nav class="sidebar close">
        <header>
            <div class="image-text">
                <span class="image">
                    <!--<img src="logo.png" alt="">-->
                </span>
                <div class="text logo-text">
                    <span class="name">Bomberos</span>
                    <span class="profession">Control Asistencia</span>
                </div>
            </div>
            <i class='bx bx-chevron-right toggle'></i>
        </header>
        <div class="menu-bar">
            <div class="menu">
                <li class="search-box">
                    <i class='bx bx-search icon'></i>
                    <input type="text" placeholder="Buscar...">
                </li>
                <ul class="menu-links">
                    <li class="nav-link">
                        <a href="/control.asistencia">
                            <i class='bx bx-bar-chart-alt-2 icon' ></i>
                            <span class="text nav-text">Inicio</span>
                        </a>
                    </li>
					<%-- Verificar si el usuario NO está autenticado --%>
					<%
          			if (request.getRemoteUser() == null) {
          			%>
					<li class="nav-link">
                        <a href="#">
                            <i class='bx bx-wallet icon' ></i>
                            <span class="text nav-text">Contacto</span>
                        </a>
                    </li>   
                 	<div class="bottom-content">
                	<li class="">
                    	<a href="#">
                        	<i class='bx bx-log-out icon' ></i>
                        	<span class="text nav-text">Iniciar Sesion</span>
                    	</a>
                	</li>
                    </div>
          			<%
          			}
          			%>
          			<%-- Verificar si el usuario tiene el rol "administrativo" --%>
          			<%
          			if (request.isUserInRole("ROLE_administrativo")) {
          			%>
                    <li class="nav-link">
                        <a href="crearUsuario">
                            <i class='bx bx-bar-chart-alt-2 icon' ></i>
                            <span class="text nav-text">Crear Usuario</span>
                        </a>
                    </li>
                    <li class="nav-link">
                        <a href="listarUsuario">
                            <i class='bx bx-bar-chart-alt-2 icon' ></i>
                            <span class="text nav-text">Listar Usuario</span>
                        </a>
                    </li>
                    <li class="nav-link">
                        <a href="listarAsistencia">
                            <i class='bx bx-heart icon' ></i>
                            <span class="text nav-text">Listado Asistencia</span>
                        </a>
                    </li>
                    <li class="nav-link">
                        <a href="listarReportes">
                            <i class='bx bx-bar-chart-alt-2 icon' ></i>
                            <span class="text nav-text">Listado Reportes</span>
                        </a>
                    </li>
                    <div class="bottom-content">
               			<li class="">
                    		<a href="#">
                        		<i class='bx bx-log-out icon' ></i>
                        		<span class="text nav-text">Cerrar Sesion</span>
                    		</a>
                		</li>
                	<li class="mode">
                    	<div class="sun-moon">
                        	<i class='bx bx-moon icon moon'></i>
                        	<i class='bx bx-sun icon sun'></i>
                    	</div>
                    	<span class="mode-text text">Modo Oscuro</span>
                    	<div class="toggle-switch">
                        	<span class="switch"></span>
                    	</div>
                	</li>
            		</div>
          			<%
          			}
          			%>
          			<%-- Verificar si el usuario tiene el rol "usuario" --%>
          			<%
          			if (request.isUserInRole("ROLE_usuario")) {
          			%>            
                    <li class="nav-link">
                        <a href="cuenta">
                            <i class='bx bx-bell icon'></i>
                            <span class="text nav-text">Cuenta</span>
                        </a>
                    </li>
                    <li class="nav-link">
                        <a href="marcarAsistencia">
                            <i class='bx bx-pie-chart-alt icon' ></i>
                            <span class="text nav-text">Marcar Asistencia</span>
                        </a>
                    </li>
                    <li class="nav-link">
                        <a href="reportarIncidente">
                            <i class='bx bx-wallet icon' ></i>
                            <span class="text nav-text">Reporte de incidentes</span>
                        </a>
                    </li>
                </ul>
            </div>
            		<div class="bottom-content">
                		<li class="">
                    		<a href="#">
                        		<i class='bx bx-log-out icon' ></i>
                        		<span class="text nav-text">Cerrar Sesion</span>
                    		</a>
                		</li>
                		<li class="mode">
                    		<div class="sun-moon">
                        		<i class='bx bx-moon icon moon'></i>
                        		<i class='bx bx-sun icon sun'></i>
                    		</div>
                    		<span class="mode-text text">Modo Oscuro</span>
                    		<div class="toggle-switch">
                        		<span class="switch"></span>
                    		</div>
                		</li>
            		</div>
                    <%
          			}
          			%>
        </div>
    </nav>
    <section class="home">
        <div class="text">Dashboard Sidebar</div>
    </section>
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
})
modeSwitch.addEventListener("click" , () =>{
    body.classList.toggle("dark");
    
    if(body.classList.contains("dark")){
        modeText.innerText = "Light mode";
    }else{
        modeText.innerText = "Dark mode";
        
    }
});
    </script>
</body>
</html>