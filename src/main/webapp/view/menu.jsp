<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Dashboard - SmartParent</title>
  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome para iconos -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

  <style>
    /* Fondo original */
    body, html {
      height: 100%;
      margin: 0;
      font-family: 'Poppins', sans-serif;
      background-image: url("img/fondo2.jpg");
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      background-attachment: fixed;
    }

    .navbar {
      background-color: rgba(0, 51, 102, 0.3);
    }
    .navbar-brand {
      font-family: 'Roboto Slab', serif;
      font-size: 24px;
      color: #fff;
      border: 2px solid white;
      padding: 5px 12px;
      border-radius: 10px;
    }
    .navbar-text {
      font-family: 'Raleway', sans-serif;
      font-size: 24px;
      font-weight: bold;
      color: #ffffff;
    }

    /* Saludo */
    .welcome-parent {
      text-align: center;
      margin: 20px 0 10px;
      color: #fff;
      text-shadow: 1px 1px 3px rgba(0,0,0,0.7);
    }
    .welcome-parent h2 {
      font-size: 2rem;
      font-weight: bold;
    }

    /* Datos del alumno */
    .student-card {
      background-color: rgba(255,255,255,0.9);
      border-radius: .75rem;
      box-shadow: 0 4px 12px rgba(0,0,0,.15);
      margin: 20px auto 40px;
      max-width: 600px;
      padding: 20px;
      color: #333;
    }
    .student-card h3 {
      margin-bottom: 1rem;
      font-weight: bold;
      color: #005f99;
    }
    .student-card .list-group-item {
      background: transparent;
      border: none;
      padding-left: 0;
    }

    /* Nuevo diseño de tarjetas */
    .dashboard-card {
      transition: transform .3s, box-shadow .3s;
      border: none;
      border-radius: .75rem;
      background-color: rgba(255,255,255,0.9);
    }
    .dashboard-card:hover {
      transform: translateY(-8px);
      box-shadow: 0 8px 20px rgba(0,0,0,.15);
    }
    .dashboard-card .card-body {
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 2rem;
    }
    .dashboard-card .card-body i {
      font-size: 2.5rem;
      margin-bottom: 1rem;
      color: #0077cc;
    }
    .dashboard-card .card-body h5 {
      font-size: 1.1rem;
      margin-bottom: 0;
      color: #333;
    }
  </style>
</head>
<body>

  <!-- Navbar original -->
  <nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">FLEMING</a>
      <span class="navbar-text">SmartParent</span>
    </div>
  </nav>

  <!-- Saludo al padre -->
  <div class="welcome-parent">
    <h2>Bienvenido, <%= session.getAttribute("parentName") %>!</h2>
  </div>

  <!-- Datos del alumno (si existen) -->
  <%
    model.Student alumno = (model.Student) request.getAttribute("alumno");
    if (alumno != null) {
  %>
    <div class="student-card">
      <h3>Datos del Alumno</h3>
      <ul class="list-group list-group-flush">
        <li class="list-group-item"><strong>ID:</strong> <%= alumno.getId() %></li>
        <li class="list-group-item"><strong>DNI:</strong> <%= alumno.getDni() %></li>
        <li class="list-group-item"><strong>Nombre:</strong> <%= alumno.getNombreCompleto() %></li>
        <li class="list-group-item"><strong>Fecha Nac.:</strong> <%= alumno.getFechaNacimiento() %></li>
        <li class="list-group-item"><strong>Fecha Registro:</strong> <%= alumno.getFechaRegistro() %></li>
      </ul>
    </div>
  <%
    } else {
  %>
    <div class="alert alert-warning text-center mt-4">
      No se encontraron datos del alumno.
    </div>
  <%
    }
  %>

  <!-- Nuevo diseño de tarjetas -->
  <div class="container my-5">
    <div class="row g-4 justify-content-center">
      <!-- Ver Asistencia -->
      <div class="col-6 col-sm-4 col-md-3 col-lg-2">
        <a href="asistencia" class="text-decoration-none">
          <div class="card dashboard-card h-100">
            <div class="card-body">
              <i class="fa-solid fa-calendar-check"></i>
              <h5 class="card-title">Ver Asistencia</h5>
            </div>
          </div>
        </a>
      </div>

      <!-- Ver Calificaciones -->
      <div class="col-6 col-sm-4 col-md-3 col-lg-2">
        <a href="calificaciones" class="text-decoration-none">
          <div class="card dashboard-card h-100">
            <div class="card-body">
              <i class="fa-solid fa-graduation-cap"></i>
              <h5 class="card-title">Ver Calificaciones</h5>
            </div>
          </div>
        </a>
      </div>

      <!-- Resultados Examen -->
      <div class="col-6 col-sm-4 col-md-3 col-lg-2">
        <a href="resultadosExamen" class="text-decoration-none">
          <div class="card dashboard-card h-100">
            <div class="card-body">
              <i class="fa-solid fa-file-lines"></i>
              <h5 class="card-title">Resultados Examen</h5>
            </div>
          </div>
        </a>
      </div>

      <!-- Probabilidad Ingreso -->
      <div class="col-6 col-sm-4 col-md-3 col-lg-2">
        <a href="probabilidadIngreso" class="text-decoration-none">
          <div class="card dashboard-card h-100">
            <div class="card-body">
              <i class="fa-solid fa-chart-line"></i>
              <h5 class="card-title">Probabilidad Ingreso</h5>
            </div>
          </div>
        </a>
      </div>

      <!-- Cerrar Sesión -->
      <div class="col-6 col-sm-4 col-md-3 col-lg-2">
        <a href="cerrarSesion" class="text-decoration-none">
          <div class="card dashboard-card h-100">
            <div class="card-body">
              <i class="fa-solid fa-right-from-bracket"></i>
              <h5 class="card-title">Cerrar Sesión</h5>
            </div>
          </div>
        </a>
      </div>

      <!-- Descargar Resumen -->
     <div class="col-6 col-sm-4 col-md-3 col-lg-2">
  		<a href="testDownload.jsp" class="text-decoration-none" target="_blank">
  		 	 <div class="card dashboard-card h-100">
    	  		<div class="card-body">
        			<i class="fa-solid fa-file-pdf"></i>
        			<h5 class="card-title">Descargar Resumen</h5>
     		 	</div>
    		</div>
 		 </a>
	</div>
    </div>
  </div>

  <!-- Bootstrap JS Bundle -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


