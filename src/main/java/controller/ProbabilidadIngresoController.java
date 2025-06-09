package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/probabilidadIngreso")
public class ProbabilidadIngresoController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ProbabilidadIngresoController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Simulación de valores en memoria
        double porcentajeAsistencia = 90.0; // % de asistencia
        double promedioCalificaciones = 85.0; // Promedio de calificaciones (sobre 100)
        double promedioResultadosExamen = 80.0; // Promedio resultados exámenes (sobre 100)

        // Fórmula simple
        double probabilidadIngreso = (porcentajeAsistencia * 0.4)
                                    + (promedioCalificaciones * 0.4)
                                    + (promedioResultadosExamen * 0.2);

        // Redondear a 2 decimales
        probabilidadIngreso = Math.round(probabilidadIngreso * 100.0) / 100.0;

        // Pasar el resultado a la JSP
        request.setAttribute("probabilidadIngreso", probabilidadIngreso);

        // Redirigir a probabilidadIngreso.jsp
        request.getRequestDispatcher("/view/probabilidadIngreso.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
