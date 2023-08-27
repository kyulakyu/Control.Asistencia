<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Encabezado y enlaces CSS aquí -->
  <!-- Asegúrate de tener Bootstrap 5.5.0 vinculado -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="/src/main/webapp/recursos/css/estilo.css">
</head>

<body>
  <div class="navbar-container">
    <nav class="navbar navbar-expand-lg navbar-light bg-success">
      <div class="container">
        <a class="navbar-brand" href="#" style="color: white;">Prevención</a>

        <div class="navbar-nav ml-auto" id="navbar-list">
          <a class="nav-link" href="/modulo6/" style="color: white;">Inicio</a>
          <%-- Verificar si el usuario NO está autenticado --%>
          <%
          if (request.getRemoteUser() == null) {
          %>
            <a class="nav-link" href="Contacto" style="color: white;">Contacto</a>
            <a class="nav-link" href="login" style="color: white;">Login</a>
          <%
          }
          %>
          <%-- Verificar si el usuario tiene el rol "cliente" --%>
          <%
          if (request.isUserInRole("ROLE_cliente")) {
          %>
            <a class="nav-link" href="Contacto" style="color: white;">Contacto</a>
            <a class="nav-link" href="CrearCapacitacion" style="color: white;">Crear Capacitación</a>
            <a class="nav-link" href="ListarCapacitaciones" style="color: white;">Listar Capacitaciones</a>
            <form action="${pageContext.request.contextPath}/logout" method="post">
              <button type="submit" class="btn btn-link" style="color: white;">Logout</button>
            </form>
          <%
          }
          %>
          <%-- Verificar si el usuario tiene el rol "administrativo" --%>
          <%
          if (request.isUserInRole("ROLE_administrativo")) {
          %>
					<a class="nav-link" href="Contacto" style="color: white;">Contacto</a>
					<a class="nav-link" href="CrearUsuario" style="color: white;">Crear Usuario</a>
					<a class="nav-link" href="ListarUsuarios" style="color: white;">Listar Usuarios</a> 
					<a class="nav-link" href="CrearPago" style="color: white;">Crear Pago</a>
					<a class="nav-link" href="ListarPagos" style="color: white;">Listar Pagos</a>
					<form action="logout" method="post">
						<button type="submit" class="btn btn-link" style="color: white;">Logout</button>
					</form>
          <%
          }
          %>
          <%-- Verificar si el usuario tiene el rol "profesional" --%>
          <%
          if (request.isUserInRole("ROLE_profesional")) {
          %>
					<a class="nav-link" href="Contacto" style="color: white;">Contacto</a>
					<a class="nav-link" href="CrearVisitas" style="color: white;">Crear Visitas</a>
					<a class="nav-link" href="ListarVisitas" style="color: white;">Listar Visitas</a>
					<form action="logout" method="post">
						<button type="submit" class="btn btn-link" style="color: white;">Logout</button>
					</form>
          <%
          }
          %>
        </div>
      </div>
    </nav>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-N1S0zO3lg8DIWDHN7SxszhGPIAqE0j0jXKufoiJ5O7ALgCE3dRNaJi+od9K0sMOT" crossorigin="anonymous"></script>
</body>
</html>


