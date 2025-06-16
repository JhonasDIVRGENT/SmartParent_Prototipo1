<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, model.ResultadoExamen" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Resultados de Examen - SmartParent</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@700&family=Poppins:wght@300;500;700&family=Roboto+Slab:wght@700&display=swap" rel="stylesheet">

    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-image: url("<%= request.getContextPath() %>/img/fondo2.jpg");
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-repeat: no-repeat;
        }
        .navbar { background-color: rgba(0, 51, 102, 0.3); }
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
        .content-container {
            padding: 40px;
            min-height: calc(100vh - 200px);
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .table-container {
            width: 75%;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            overflow: hidden;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="<%= request.getContextPath() %>/home">FLEMING</a>
        <span class="navbar-text">SmartParent</span>
    </div>
</nav>

<div class="container welcome-message">
    <h2>Resultados de Examen</h2>
    <p>Aquí podrás revisar los resultados de los exámenes de tu hijo</p>
</div>

<div class="content-container">
    <div class="table-container">
        <table class="table table-striped table-hover mb-0">
            <thead class="table-primary">
                <tr>
                    <th>Examen</th>
                    <th>Tipo de Examen</th>
                    <th>Fecha Aplicación</th>
                    <th>Nota Obtenida</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<ResultadoExamen> listaResultados = 
                        (List<ResultadoExamen>) request.getAttribute("listaResultadosExamen");
                    if (listaResultados != null && !listaResultados.isEmpty()) {
                        for (ResultadoExamen r : listaResultados) {
                %>
                <tr>
                    <td><%= r.getNombreExamen() %></td>
                    <td><%= r.getTipo() %></td>
                    <td><%= r.getFechaAplicacion() %></td>
                    <td><%= r.getNotaObtenida() %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="4" class="text-center">No hay registros de resultados de examen.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <div class="mt-4">
        <a href="<%= request.getContextPath() %>/home" class="btn btn-primary">Volver al Menú</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
