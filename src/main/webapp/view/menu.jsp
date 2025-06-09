<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - SmartParent</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@700&family=Poppins:wght@300;500;700&family=Roboto+Slab:wght@700&display=swap" rel="stylesheet">

    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-image: url("img/fondo2.jpg");
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-repeat: no-repeat;
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

        .welcome-message {
            margin-top: 30px;
            text-align: center;
            color: #ffffff;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.5);
        }

        .welcome-message h2 {
            font-size: 36px;
            font-weight: bold;
        }

        .welcome-message p {
            font-size: 18px;
            margin-top: 10px;
        }

        .dashboard-container {
            padding: 40px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 200px); /* ajustamos porque ahora hay mensaje arriba */
            gap: 20px;
        }

        .dashboard-card {
            background-color: rgba(255, 255, 255, 0.9);
            width: 250px;
            height: 150px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            transition: transform 0.2s, box-shadow 0.2s;
            text-decoration: none;
            color: #0066cc;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            background-color: rgba(0, 102, 204, 0.1);
            color: #004080;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">FLEMING</a>
        <span class="navbar-text">SmartParent</span>
    </div>
</nav>

<div class="container welcome-message">
    <h2>Bienvenido padre de familia</h2>
    <p>Aquí podrás dar seguimiento a tu hijo</p>
</div>

<div class="dashboard-container">
    <a href="asistencia" class="dashboard-card">Ver Asistencia</a>
    <a href="calificaciones" class="dashboard-card">Ver Calificaciones</a>
    <a href="resultadosExamen" class="dashboard-card">Ver Resultados de Examen</a>
    <a href="probabilidadIngreso" class="dashboard-card">Ver Probabilidad de Ingreso</a>
    <a href="cerrarSesion" class="dashboard-card">Cerrar Sesión</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
