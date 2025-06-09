<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.ResultadoExamen" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/style.css">
    <title>Resultados de Examen - SmartParent</title>
</head>
<body>
    <h1>Resultados de Examen</h1>

    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>Examen</th>
            <th>Tipo de Examen</th>
            <th>Nota Obtenida</th>
        </tr>
        <%
            List<ResultadoExamen> listaResultados = (List<ResultadoExamen>) request.getAttribute("listaResultados");
            if (listaResultados != null) {
                for (ResultadoExamen r : listaResultados) {
        %>
        <tr>
            <td><%= r.getExamen() %></td>
            <td><%= r.getTipoExamen() %></td>
            <td><%= r.getNotaObtenida() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="3">No hay registros de resultados de examen.</td>
        </tr>
        <%
            }
        %>
    </table>

    <br>
    <a href="home">Volver al menú</a>
</body>
</html>
