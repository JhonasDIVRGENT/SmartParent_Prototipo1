<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>SmartParent - Acceso</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@700&family=Poppins:wght@300;500;700&family=Roboto+Slab:wght@700&display=swap" rel="stylesheet">

    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Poppins', sans-serif;
        }

        .navbar {
            background-color: #001f3f;
        }

        .navbar-brand {
            font-family: 'Roboto Slab', serif;
            font-size: 24px;
            color: #fff;
            border: 2px solid white;
            padding: 5px 12px;
            border-radius: 10px;
        }

        .navbar-nav .nav-link {
            color: white !important;
            margin-right: 20px;
            font-size: 18px;
            font-weight: 500;
        }

        .navbar-text {
            font-family: 'Raleway', sans-serif;
            font-size: 24px;
            font-weight: bold;
            color: #ffffff;
        }

        .bg-image {
            background-image: url("img/fondo1.jpg");
            background-size: cover;
            background-position: left 20%;
            height: calc(100vh - 56px);
            display: flex;
            align-items: flex-start;
            justify-content: flex-end;
            padding-top: 100px;
            padding-right: 300px;
        }

        .login-box {
            background-color: rgba(255, 255, 255, 0.97);
            padding: 40px;
            border-radius: 10px;
            max-width: 350px;
            width: 100%;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
            text-align: center;
        }

        .login-box h2 {
            font-family: 'Raleway', sans-serif;
            font-size: 28px;
            color: #0066cc;
            margin-bottom: 5px;
        }

        .login-box p {
            font-size: 14px;
            color: #555;
            margin-bottom: 25px;
        }

        .alert {
            margin-top: 15px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">FLEMING</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
            <span class="navbar-text me-5">SmartParent</span>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Nosotros</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Programas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contacto</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="bg-image">
    <div class="login-box">
        <h2>SmartParent</h2>
        <p>Acceso para Padres</p>

        <form action="validarDNI" method="post">
            <div class="mb-3 text-start">
                <label for="dniPadre" class="form-label">DNI del Padre</label>
                <input type="text" class="form-control" id="dniPadre" name="dniPadre" required maxlength="8">
            </div>
            <div class="mb-3 text-start">
                <label for="dniHijo" class="form-label">DNI del Hijo</label>
                <input type="text" class="form-control" id="dniHijo" name="dniHijo" required maxlength="8">
            </div>
            <button type="submit" class="btn btn-primary w-100">Ingresar</button>
        </form>

        <%
            if ("1".equals(request.getParameter("error"))) {
        %>
            <div class="alert alert-danger text-center">DNI incorrecto</div>
        <%
            } else if ("ok".equals(request.getParameter("success"))) {
        %>
            <div class="alert alert-success text-center">Acceso exitoso</div>
        <%
            }
        %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

