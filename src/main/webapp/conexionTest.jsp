<%@ page import="java.sql.*, db.Conexion" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Prueba SP: Calificaciones del Alumno</title>
</head>
<body>
  <h2>Resultados de <code>sp_VerNotasPorAlumno</code> (idAlumno = 1)</h2>
  <%
    try (Connection con = Conexion.obtenerConexion();
         CallableStatement cs = con.prepareCall("{call sp_VerNotasPorAlumno(?)}")) {

        cs.setInt(1, 1);  // Cambia el ID de alumno si quieres
        boolean hasResult = cs.execute();

        if (hasResult) {
            ResultSet rs = cs.getResultSet();
            out.println("<table border='1'><tr><th>Curso</th><th>Nota Final</th></tr>");
            while (rs.next()) {
                String fila = String.format(
                    "<tr><td>%s</td><td>%.2f</td></tr>",
                    rs.getString("Curso"),
                    rs.getDouble("NotaFinal")
                );
                out.println(fila);
            }
            out.println("</table>");
        } else {
            out.println("<p>No devolvió ningún resultado.</p>");
        }

    } catch (SQLException e) {
        out.println("<p style='color:red;'>Error al ejecutar SP: " + e.getMessage() + "</p>");
    }
  %>
  <p><a href="menu.jsp">Volver al menú</a></p>
</body>
</html>
