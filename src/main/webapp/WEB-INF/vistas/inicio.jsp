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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <%@ include file='sidebar.jsp'%>
	<div class="container" style="text-align: center;">
        <h1>Biemvenidos</h1>
        <table class="table">
            <thead class="thead-dark">
                <tr>Hola, esta es la aplicacion para registrar tu asistencia, reportes o mirar los boletines para ti.</tr>
            </tbody>
        </table>
    </div>
    <%@ include file='footer.jsp'%>
</body>
</html>