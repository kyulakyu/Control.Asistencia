<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Listado de Asistencia</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/control.asistencia/res/css/styles.css">
</head>

<body>
	<%@ include file='sidebar.jsp'%>
	<div class="container">
		<h1>Listado de Asistencia</h1>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>ID</th>
					<th>ID Voluntario</th>
					<th>Fecha Asistencia</th>
					<th>Detalle</th>
				</tr>
			</thead>
			<tbody>
				<%-- Iterar a través de la lista de capacitaciones enviada desde el controlador --%>
				<c:forEach var="asistencia" items="${asistencias}">
					<tr>
						<td>${asistencia.id}</td>
						<td>${asistencia.voluntarioId}</td>
						<td>${asistencia.fechaAsistencia}</td>
						<td>${asistencia.mostrarDetalle()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<%@ include file='footer.jsp'%>
</body>
</html>