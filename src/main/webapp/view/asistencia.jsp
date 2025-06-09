<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Asistencia" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Asistencia - SmartParent</title>
</head>
<body>
    <h1>Registro de Asistencia</h1>

    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>Fecha</th>
            <th>Curso</th>
            <th>Estado</th>
        </tr>
        <%
            List<Asistencia> listaAsistencia = (List<Asistencia>) request.getAttribute("listaAsistencia");
            if (listaAsistencia != null) {
                for (Asistencia a : listaAsistencia) {
        %>
        <tr>
            <td><%= a.getFecha() %></td>
            <td><%= a.getCurso() %></td>
            <td><%= a.getEstado() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="3">No hay registros de asistencia.</td>
        </tr>
        <%
            }
        %>
    </table>

    <br>
    <a href="home">Volver al menú</a>
</body>
</html>
