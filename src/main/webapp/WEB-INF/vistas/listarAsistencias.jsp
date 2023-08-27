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
<link rel="stylesheet" type="text/css" href="/control.asistencia/res/css/estilo.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<%@ include file='sidebar.jsp'%>
	<div class="container" style="text-align: center;">
		<h1>Listado de Asistencia</h1>
		<table class="table">
			<thead class="thead-dark">
				<tr>
                    <th>ID
					    <a class="btn btn-outline-dark small-btn" href="?orderBy=idAsistencia&amp;orderDir=asc">
					        <i class="fas fa-caret-up CSTitleIcon"></i>
					    </a>
					    <a class="btn btn-outline-dark small-btn" href="?orderBy=idAsistencia&amp;orderDir=desc">
					        <i class="fas fa-caret-down CSTitleIcon"></i>
					    </a>
                    </th>
                    <th>ID Voluntario
					    <a class="btn btn-outline-dark small-btn" href="?orderBy=voluntarioI&amp;orderDir=asc">
					        <i class="fas fa-caret-up CSTitleIcon"></i>
					    </a>
					    <a class="btn btn-outline-dark small-btn" href="?orderBy=voluntarioIa&amp;orderDir=desc">
					        <i class="fas fa-caret-down CSTitleIcon"></i>
					    </a>
                    </th>
                    <th>Fecha Asistencia
					    <a class="btn btn-outline-dark small-btn" href="?orderBy=fechaAsistencia&amp;orderDir=asc">
					        <i class="fas fa-caret-up CSTitleIcon"></i>
					    </a>
					    <a class="btn btn-outline-dark small-btn" href="?orderBy=fechaAsistencia&amp;orderDir=desc">
					        <i class="fas fa-caret-down CSTitleIcon"></i>
					    </a>
                    </th>
                    <th>Detalle</th>
				</tr>
			</thead>
			<tbody>
				<%-- Iterar a través de la lista de asistencias enviada desde el controlador --%>
				<c:forEach var="asistencia" items="${asistencias}">
					<tr>
						<td>${asistencia.idAsistencia}</td>
						<td>${asistencia.voluntarioId}</td>
						<td>${asistencia.fechaAsistencia}</td>
						<td>${asistencia.detalle}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<%@ include file='footer.jsp'%>
</body>
</html>