<%@ page import="java.sql.*, db.Conexion" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Diagnóstico SP</title>
</head>
<body>
  <h3>Prueba SP: sp_VerResultadosExamen(1)</h3>
  <%
    try (Connection con = Conexion.obtenerConexion();
         CallableStatement cs = con.prepareCall("{call sp_VerResultadosExamen(?)}")) {

        cs.setInt(1, 1);  
        try (ResultSet rs = cs.executeQuery()) {
            boolean any = false;
            while (rs.next()) {
                any = true;
                // Formateamos la línea manualmente
                String linea = String.format(
                    "<p>%s | %s | %s | %.2f</p>",
                    rs.getString("NombreExamen"),
                    rs.getString("Tipo"),
                    rs.getDate("FechaAplicacion"),
                    rs.getDouble("NotaObtenida")
                );
                out.println(linea);
            }
            if (!any) {
                out.println("<p style='color:red;'>-- ningún registro devuelto --</p>");
            }
        }

    } catch (Exception e) {
        out.println("<p style='color:red;'>Error al ejecutar SP: " + e.getMessage() + "</p>");
    }
  %>
</body>
</html>
