<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Asistencia" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Asistencia - SmartParent</title>

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

        .content-container {
            padding: 40px;
            min-height: calc(100vh - 200px);
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .table {
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
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
    <h2>Registro de Asistencia</h2>
    <p>Aquí podrás revisar la asistencia de tu hijo</p>
</div>

<div class="content-container">
    <table class="table table-striped table-hover w-75">
        <thead class="table-primary">
            <tr>
                <th>Fecha</th>
                <th>Curso</th>
                <th>Estado</th>
            </tr>
        </thead>
        <tbody>
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
        </tbody>
    </table>

    <div class="mt-4">
        <a href="home" class="btn btn-primary">Volver al Menú</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

