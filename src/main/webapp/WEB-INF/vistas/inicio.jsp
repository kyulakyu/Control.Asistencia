<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Boletines</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/control.asistencia/res/css/estilo.css">
</head>
<body>
    <%@ include file='sidebar.jsp'%>
    <div class="container">
        <h1>Boletines</h1>
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Titulo</th>
                    <th>Fecha Boletin</th>
                    <th>Detalle</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="boletin" items="${boletines}">
                    <tr>
                        <td>${boletin.idBoletin}</td>
                        <td>${boletin.titulo}</td>
                        <td>${boletin.fechaBoletin}</td>
                        <td>${boletin.detalle}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <%@ include file='footer.jsp'%>
</body>
</html>