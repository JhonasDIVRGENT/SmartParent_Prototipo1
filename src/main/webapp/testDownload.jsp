<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="java.sql.*, java.util.ArrayList, java.util.List"
         session="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Descarga de Resumen PDF</title>
  <!-- Bootstrap 5 y Font Awesome -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f0f2f5;
      font-family: 'Poppins', sans-serif;
      padding: 2rem 0;
    }
    .card-wrapper {
      max-width: 900px;
      margin: auto;
    }
    .btn-pdf, .btn-back {
      width: 100%;
      padding: 0.75rem;
      font-size: 1rem;
      border-radius: 0.5rem;
    }
    #report {
      background-color: #fff;
      padding: 2rem;
      border-radius: 0.5rem;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      margin-top: 2rem;
    }
    #report h2 {
      font-weight: 600;
      margin-bottom: 1rem;
    }
    #report hr {
      border-top: 2px solid #e9ecef;
    }
    #report h4 {
      margin-top: 1.5rem;
      font-size: 1.25rem;
      font-weight: 500;
    }
    table {
      margin-top: 0.75rem;
    }
  </style>
</head>
<body>
  <div class="container card-wrapper">
    <div class="card shadow-sm mb-4">
      <div class="card-body">
        <h1 class="card-title text-center mb-4">
          <i class="fa-solid fa-file-pdf text-danger me-2"></i>
          Generar Resumen en PDF
        </h1>

        <!-- Botón Volver al Dashboard -->
        <div class="d-grid mb-3">
          <a href="<%= request.getContextPath() %>/home"
             class="btn btn-outline-secondary btn-back">
            <i class="fa-solid fa-arrow-left me-2"></i>Volver al Dashboard
          </a>
        </div>

        <%
          // 1) Pedir DNI del alumno si no viene por parámetro
          String dniHijo = request.getParameter("dniHijo");
          if (dniHijo == null || dniHijo.trim().isEmpty()) {
        %>
          <p class="text-center text-muted mb-4">
            Ingresa el DNI de tu hijo para cargar el resumen.
          </p>
          <form class="row g-3 justify-content-center" method="get">
            <div class="col-md-6">
              <label class="form-label">DNI del Alumno</label>
              <input type="text"
                     name="dniHijo"
                     class="form-control"
                     placeholder="00011122"
                     required maxlength="8">
            </div>
            <div class="col-md-2 d-grid">
              <button type="submit" class="btn btn-primary">Cargar</button>
            </div>
          </form>
        <%
            return;
          }

          // 2) Conexión JDBC
          Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
          Connection conn = DriverManager.getConnection(
            "jdbc:sqlserver://DESKTOP-HVD5TEJ;instanceName=SQLEXPRESS;encrypt=false;trustServerCertificate=true",
            "sa", "sql"
          );

          // 3) Obtener IdAlumno y nombre
          int studentId = 0;
          String alumnoNombre = "";
          try (PreparedStatement ps = conn.prepareStatement(
                "SELECT IdAlumno, Nombres, Apellidos FROM Alumnos WHERE DniAlumno = ?")) {
            ps.setString(1, dniHijo);
            try (ResultSet rs = ps.executeQuery()) {
              if (rs.next()) {
                studentId    = rs.getInt("IdAlumno");
                alumnoNombre = rs.getString("Nombres") + " " + rs.getString("Apellidos");
              }
            }
          }

          // 4) Llamar SPs y recolectar datos
          List<String[]> listAsis = new ArrayList<>();
          try (CallableStatement cs = conn.prepareCall("{call sp_VerAsistenciaPorAlumno(?)}")) {
            cs.setInt(1, studentId);
            try (ResultSet rs = cs.executeQuery()) {
              while (rs.next()) {
                listAsis.add(new String[]{
                  rs.getString("Curso"),
                  rs.getDate("Fecha").toString(),
                  rs.getString("EstadoAsistencia")
                });
              }
            }
          }

          List<String[]> listCal = new ArrayList<>();
          try (CallableStatement cs = conn.prepareCall("{call sp_VerNotasPorAlumno(?)}")) {
            cs.setInt(1, studentId);
            try (ResultSet rs = cs.executeQuery()) {
              while (rs.next()) {
                listCal.add(new String[]{
                  rs.getString("Curso"),
                  rs.getBigDecimal("NotaFinal").toString()
                });
              }
            }
          }

          List<String[]> listEx = new ArrayList<>();
          try (CallableStatement cs = conn.prepareCall("{call sp_VerResultadosExamen(?)}")) {
            cs.setInt(1, studentId);
            try (ResultSet rs = cs.executeQuery()) {
              while (rs.next()) {
                listEx.add(new String[]{
                  rs.getString("NombreExamen"),
                  rs.getString("Tipo"),
                  rs.getDate("FechaAplicacion").toString(),
                  rs.getBigDecimal("NotaObtenida").toString()
                });
              }
            }
          }

          String prom = "", cat = "";
          try (CallableStatement cs = conn.prepareCall("{call sp_ProbabilidadIngreso(?)}")) {
            cs.setInt(1, studentId);
            try (ResultSet rs = cs.executeQuery()) {
              if (rs.next()) {
                prom = rs.getBigDecimal("Promedio").toString();
                cat  = rs.getString("ProbabilidadIngreso");
              }
            }
          }
          conn.close();
        %>

        <div class="text-center">
          <button id="btnExport" class="btn btn-danger btn-pdf">
            <i class="fa-solid fa-download me-2"></i>Descargar PDF
          </button>
        </div>

        <div id="report">
          <h2>Alumno: <%= alumnoNombre %></h2>
          <p class="text-muted">DNI: <%= dniHijo %></p>
          <hr/>

          <h4>Asistencia</h4>
          <div class="table-responsive">
            <table class="table table-sm table-bordered">
              <thead class="table-light">
                <tr><th>Curso</th><th>Fecha</th><th>Estado</th></tr>
              </thead>
              <tbody>
                <% for (String[] a : listAsis) { %>
                  <tr>
                    <td><%= a[0] %></td>
                    <td><%= a[1] %></td>
                    <td><%= a[2] %></td>
                  </tr>
                <% } %>
              </tbody>
            </table>
          </div>

          <h4>Calificaciones</h4>
          <div class="table-responsive">
            <table class="table table-sm table-bordered">
              <thead class="table-light">
                <tr><th>Curso</th><th>Nota Final</th></tr>
              </thead>
              <tbody>
                <% for (String[] c : listCal) { %>
                  <tr>
                    <td><%= c[0] %></td>
                    <td><%= c[1] %></td>
                  </tr>
                <% } %>
              </tbody>
            </table>
          </div>

          <h4>Resultados de Examen</h4>
          <div class="table-responsive">
            <table class="table table-sm table-bordered">
              <thead class="table-light">
                <tr><th>Examen</th><th>Tipo</th><th>Fecha</th><th>Nota</th></tr>
              </thead>
              <tbody>
                <% for (String[] e : listEx) { %>
                  <tr>
                    <td><%= e[0] %></td>
                    <td><%= e[1] %></td>
                    <td><%= e[2] %></td>
                    <td><%= e[3] %></td>
                  </tr>
                <% } %>
              </tbody>
            </table>
          </div>

          <h4>Probabilidad de Ingreso</h4>
          <p>
            <strong>Promedio:</strong> <%= prom %> &nbsp; | &nbsp;
            <strong>Categoría:</strong> <%= cat %>
          </p>
        </div>
      </div>
    </div>
  </div>

  <!-- html2canvas + jsPDF desde CDN -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
  <script>
  const { jsPDF } = window.jspdf;

  document.getElementById('btnExport').onclick = () => {
    const report = document.getElementById('report');

    html2canvas(report, { scale: 2 }).then(canvas => {
      const imgData    = canvas.toDataURL('image/png');
      const pdf        = new jsPDF('p','pt','a4');
      const pdfWidth   = pdf.internal.pageSize.getWidth();
      const pdfHeight  = pdf.internal.pageSize.getHeight();
      const imgProps   = pdf.getImageProperties(imgData);
      const imgHeight  = imgProps.height * pdfWidth / imgProps.width;

      let heightLeft = imgHeight;
      let position   = 0;

      // Primera página
      pdf.addImage(imgData, 'PNG', 0, position, pdfWidth, imgHeight);
      heightLeft -= pdfHeight;

      // Páginas siguientes
      while (heightLeft > 0) {
        position   = position - pdfHeight;
        pdf.addPage();
        pdf.addImage(imgData, 'PNG', 0, position, pdfWidth, imgHeight);
        heightLeft -= pdfHeight;
      }

      pdf.save('resumen_<%= studentId %>.pdf');
    });
  };
</script>

</body>
</html>

