<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, model.Asistencia" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Asistencia - SmartParent</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html { height: 100%; margin: 0; background: url("img/fondo2.jpg") center/cover no-repeat fixed; font-family: 'Poppins', sans-serif; }
        .navbar { background-color: rgba(0, 51, 102, 0.3); }
        .navbar-brand { color: #fff; border: 2px solid #fff; padding: 5px 12px; border-radius: 10px; }
        .navbar-text { color: #fff; font-weight: bold; }
        .welcome-message { text-align: center; color: #fff; padding: 30px 0; text-shadow: 1px 1px 3px rgba(0,0,0,0.5); }
        .content-container { padding: 40px; display: flex; flex-direction: column; align-items: center; }
        .table-container { width: 75%; background: rgba(255,255,255,0.95); border-radius: 12px; box-shadow: 0 0 10px rgba(0,0,0,0.2); overflow: hidden; }
    </style>
</head>
<body>
<nav class="navbar">
  <div class="container-fluid">
    <a class="navbar-brand" href="home">FLEMING</a>
    <span class="navbar-text">SmartParent</span>
  </div>
</nav>

<div class="welcome-message">
  <h2>Registro de Asistencia</h2>
  <p>Aquí podrás revisar la asistencia de tu hijo</p>
</div>

<div class="content-container">
  <div class="table-container">
    <table class="table table-striped table-hover mb-0">
      <thead class="table-primary">
        <tr>
          <th>Fecha</th>
          <th>Curso</th>
          <th>Estado</th>
        </tr>
      </thead>
      <tbody>
        <%
          List<Asistencia> lista = (List<Asistencia>) request.getAttribute("listaAsistencia");
          if (lista != null && !lista.isEmpty()) {
            for (Asistencia a : lista) {
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
            <td colspan="3" class="text-center">No hay registros de asistencia.</td>
          </tr>
        <%
          }
        %>
      </tbody>
    </table>
  </div>

  <div class="mt-4">
    <a href="home" class="btn btn-primary">Volver al Menú</a>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


