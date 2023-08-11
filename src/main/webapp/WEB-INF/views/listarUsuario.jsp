<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="model.entity.Usuario"%>
<%@ page import="model.entity.Cliente"%>
<%@ page import="model.entity.Profesional"%>
<%@ page import="model.entity.Administrativo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listado de Usuarios</title>
<link rel="stylesheet" type="text/css"
	href="/modulo6/res/css/styles.css">
<%@ page
	import="java.util.ArrayList, model.entity.Usuario, model.entity.Cliente, model.entity.Profesional, model.entity.Administrativo"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.all.min.js"></script>

</head>
<body>

	<%@ include file='sidebar.jsp'%>
	<img class="imagen-zoom" src="/modulo6/res/img/logogrupo4.png"
		alt="Logo de la empresa">

	<div class="container" style="text-align: center;">
		<h1 style="text-align: center; margin-bottom: 20px;">Usuarios:</h1>
		<form id="tipoForm" action="ListarUsuarios" method="get">
			<label for="tipo">Selecciona un Tipo:</label> <select id="tipo"
				name="tipo" onchange="document.getElementById('tipoForm').submit();">
				<option value="todos">Seleccione</option>
				<option value="Cliente">Cliente</option>
				<option value="Profesional">Profesional</option>
				<option value="Administrativo">Administrativo</option>
			</select>
		</form>
		<%
		if (request.getAttribute("listarUsuarios") != null) {
			String tipoSeleccionado = request.getParameter("tipo");
			if (tipoSeleccionado == null || tipoSeleccionado.isEmpty()) {
				tipoSeleccionado = "todos"; // Establece un valor predeterminado si no se proporciona el parámetro "tipo"
			}
			HashMap<String, List<? extends Usuario>> usuariosMap = (HashMap<String, List<? extends Usuario>>) request
			.getAttribute("listarUsuarios");
			List<? extends Usuario> usuarios = usuariosMap.get(tipoSeleccionado);
		%>

		
		<table id="tablaUsuarios" class="table table-striped">
			<thead>
				<tr>
					<%
					if (tipoSeleccionado.equals("Cliente")) {
					%>
					
					
					
					<th>Usuario</th>
					<th>Tipo</th>
					<th>F. nacimiento</th>
					<th>Run</th>
					<%-- <% } else if (tipoSeleccionado.equals("Cliente")) { %> --%>
					<th>Rut</th>
					<th>Nombre</th>
					<th>Apellidos</th>
					<th>Telefono</th>
					<th>AFP</th>
					<th>Sistema de salud</th>
					<th>Direccion</th>
					<th>Comuna</th>
					<th>Edad</th>
					<th>Editar</th>
					<%
					} else if (tipoSeleccionado.equals("Profesional")) {
					%>
					
					<th>Usuario</th>
					<th>Tipo</th>
					<th>F. nacimiento</th>
					<th>Run</th>
					<th>Titulo</th>
					<th>F. Ingreso</th>
					<th>Editar</th>
					<%
					} else if (tipoSeleccionado.equals("Administrativo")) {
					%>
					<th>Usuario</th>
					<th>Tipo</th>
					<th>F. nacimiento</th>
					<th>Run</th>
					<th>Area</th>
					<th>Experiencia P.</th>
					<th>Editar</th>
					<%
					}
					%>
				</tr>
			</thead>
			<tbody>
				<%
				if (usuarios != null) {
					for (Usuario usuario : usuarios) {
						if (tipoSeleccionado.equals("Cliente") || (tipoSeleccionado.equals("Cliente") && usuario instanceof Cliente)) {
					Cliente cliente = (Cliente) usuario;
				%>
				<tr>

					<td><%=cliente.getNombre()%></td>
					<td><%=cliente.getTipo()%></td>
					<td><%=cliente.getFechaNacimiento()%></td>
					<td><%=cliente.getRun()%></td>
					<%-- Agrega aquí las demás celdas para Cliente --%>

					<td><%=cliente.getRut()%></td>
					<td><%=cliente.getNombres()%></td>
					<td><%=cliente.getApellidos()%></td>
					<td><%=cliente.getTelefono()%></td>
					<td><%=cliente.getAfp()%></td>
					<td><%=cliente.getSistemaDeSalud()%></td>
					<td><%=cliente.getDireccion()%></td>
					<td><%=cliente.getComuna()%></td>
					<td><%=cliente.getEdad()%></td>
					<td><a href="/modulo6/EditarCliente?id=<%=cliente.getId()%>">Editar</a></td>
					</tr>
				<%
				} else if (tipoSeleccionado.equals("Profesional") && usuario instanceof Profesional) {
				Profesional profesional = (Profesional) usuario;
				%>
				<tr>

					<td><%=profesional.getNombre()%></td>
					<td><%=profesional.getTipo()%></td>
					<td><%=profesional.getFechaNacimiento()%></td>
					<td><%=profesional.getRun()%></td>
					<%-- Agrega aquí las demás celdas para Profesional --%>

					<td><%=profesional.getTitulo()%></td>
					<td><%=profesional.getFechaDeIngreso()%></td>

					<td><a href="/modulo6/EditarProfesional?id=<%=profesional.getId()%>">Editar</a></td>
				</tr>
				<%
				} else if (tipoSeleccionado.equals("Administrativo")
						|| (tipoSeleccionado.equals("Administrativo") && usuario instanceof Administrativo)) {
				Administrativo administrativo = (Administrativo) usuario;
				%>
				<tr>

					<td><%=administrativo.getNombre()%></td>
					<td><%=administrativo.getTipo()%></td>
					<td><%=administrativo.getFechaNacimiento()%></td>
					<td><%=administrativo.getRun()%></td>
					<%-- Agrega aquí las demás celdas para Administrativo --%>

					<td><%=administrativo.getArea()%></td>
					<td><%=administrativo.getExperienciaPrevia()%></td>
					
					
					<td><a href="/modulo6/EditarAdministrativo?id=<%=administrativo.getId()%>">Editar</a></td>
					
					
					
				</tr>
				<%
				}

				}
				}
				}
				%>
			</tbody>
		</table>

	</div>
	<script>
		// Resto del código JavaScript
	</script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
	<%@ include file='footer.jsp'%>
</body>
</html>