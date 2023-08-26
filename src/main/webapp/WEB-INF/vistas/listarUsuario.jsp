<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="model.entity.Usuario"%>
<%@ page import="model.entity.Cliente"%>
<%@ page import="model.entity.Voluntario"%>
<%@ page import="model.entity.Administrativo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listado de Usuarios</title>
<script	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.all.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/control.asistencia/res/css/estilo.css">
</head>
<body>

	<%@ include file='sidebar.jsp'%>
	<div class="container" style="text-align: center;">
		<h1 style="text-align: center; margin-bottom: 20px;">Usuarios:</h1>
		<form id="tipoForm" action="ListarUsuario" method="get">
			<label for="tipo">Selecciona un Tipo:</label> <select id="tipo"
				name="tipo" onchange="document.getElementById('tipoForm').submit();">
				<option value="todos">Seleccione</option>
				<option value="Cliente">Cliente</option>
				<option value="Voluntario">Voluntario</option>
				<option value="Administrativo">Administrativo</option>
			</select>
		</form>
		<%
		if (request.getAttribute("listarUsuario") != null) {
			String tipoSeleccionado = request.getParameter("tipo");
			if (tipoSeleccionado == null || tipoSeleccionado.isEmpty()) {
				tipoSeleccionado = "todos"; // Establece un valor predeterminado si no se proporciona el parámetro "tipo"
			}
			HashMap<String, List<? extends Usuario>> usuariosMap = (HashMap<String, List<? extends Usuario>>) request
			.getAttribute("listarUsuario");
			List<? extends Usuario> usuarios = usuariosMap.get(tipoSeleccionado);
		%>
		<table id="tablaUsuarios" class="table">
			<thead>
				<tr>
					<%
					if (tipoSeleccionado.equals("Cliente")) {
					%>
					<th>F. nacimiento</th>
					<th>Rut</th>
					<th>Nombre</th>
					<th>Telefono</th>
					<th>Direccion</th>
					<th>Comuna</th>
					<th>Editar</th>
					<%
					} else if (tipoSeleccionado.equals("Voluntario")) {
					%>
					<th>F. nacimiento</th>
					<th>Run</th>
					<th>Nombres</th>
					<th>Apellidos</th>
					<th>Telefono</th>
					<th>Direccion</th>
					<th>Comuna</th>
					<th>F. Ingreso</th>
					<th>Cargo</th>
					<th>Editar</th>
					<%
					} else if (tipoSeleccionado.equals("Administrativo")) {
					%>
					<th>F. nacimiento</th>
					<th>Run</th>
					<th>Nombres</th>
					<th>Apellidos</th>
					<th>Telefono</th>
					<th>Direccion</th>
					<th>Comuna</th>
					<th>Cliente</th>
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
					<td><%=cliente.getFechaNacimiento()%></td>
					<td><%=cliente.getRut()%></td>
					<td><%=cliente.getNombre()%></td>
					<td><%=cliente.getTelefono()%></td>
					<td><%=cliente.getDireccion()%></td>
					<td><%=cliente.getComuna()%></td>
					<td><a href="/control.asistencia/EditarCliente?id=<%=cliente.getId()%>">Editar</a></td>
					</tr>
				<%
				} else if (tipoSeleccionado.equals("Voluntario") && usuario instanceof Voluntario) {
				Voluntario voluntario = (Voluntario) usuario;
				%>
				<tr>
					<td><%=voluntario.getFechaNacimiento()%></td>
					<td><%=voluntario.getRunVoluntario()%></td>
					<td><%=voluntario.getNombresV()%></td>
					<td><%=voluntario.getApellidosV()%></td>
					<td><%=voluntario.getTelefono()%></td>
					<td><%=voluntario.getDireccion()%></td>
					<td><%=voluntario.getComuna()%></td>
					<td><%=voluntario.getFechaDeIngreso()%></td>
					<td><%=voluntario.getCargo()%></td>

					<td><a href="/control.asistencia/EditarVoluntario?id=<%=voluntario.getId()%>">Editar</a></td>
				</tr>
				<%
				} else if (tipoSeleccionado.equals("Administrativo")
						|| (tipoSeleccionado.equals("Administrativo") && usuario instanceof Administrativo)) {
				Administrativo administrativo = (Administrativo) usuario;
				%>
				<tr>
					<td><%=administrativo.getFechaNacimiento()%></td>
					<td><%=administrativo.getRun()%></td>
					<td><%=administrativo.getNombres()%></td>
					<td><%=administrativo.getApellidos()%></td>
					<td><%=administrativo.getTelefono()%></td>
					<td><%=administrativo.getDireccion()%></td>
					<td><%=administrativo.getComuna()%></td>
					<td><%=administrativo.getClienteAdministrativo()%></td>
					
					
					<td><a href="/control.asistencia/EditarAdministrativo?id=<%=administrativo.getId()%>">Editar</a></td>
					
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