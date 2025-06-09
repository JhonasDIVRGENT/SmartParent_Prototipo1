<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/style.css">
    <title>Probabilidad de Ingreso - SmartParent</title>
</head>
<body>
    <h1>Probabilidad de Ingreso</h1>

    <%
        Double probabilidadIngreso = (Double) request.getAttribute("probabilidadIngreso");
        if (probabilidadIngreso != null) {
    %>
        <p>Probabilidad estimada de ingreso: <strong><%= probabilidadIngreso %> %</strong></p>
    <%
        } else {
    %>
        <p>No se pudo calcular la probabilidad de ingreso.</p>
    <%
        }
    %>

    <br>
    <a href="home">Volver al menú</a>
</body>
</html>
