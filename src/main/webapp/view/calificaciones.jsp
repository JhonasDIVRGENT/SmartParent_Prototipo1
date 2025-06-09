<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Calificacion" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Calificaciones - SmartParent</title>
</head>
<body>
    <h1>Calificaciones</h1>

    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>Curso</th>
            <th>Nota Final</th>
        </tr>
        <%
            List<Calificacion> listaCalificaciones = (List<Calificacion>) request.getAttribute("listaCalificaciones");
            if (listaCalificaciones != null) {
                for (Calificacion c : listaCalificaciones) {
        %>
        <tr>
            <td><%= c.getCurso() %></td>
            <td><%= c.getNotaFinal() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="2">No hay registros de calificaciones.</td>
        </tr>
        <%
            }
        %>
    </table>

    <br>
    <a href="home">Volver al menú</a>
</body>
</html>
