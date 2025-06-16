package controller;

import dao.ProbabilidadIngresoDAO;
import model.ProbabilidadIngreso;

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 1) ID del alumno (por ahora fijo; luego de sesión o parámetro)
        int idAlumno = 1;

        // 2) Llamada al DAO
        ProbabilidadIngresoDAO dao = new ProbabilidadIngresoDAO();
        ProbabilidadIngreso pi = dao.obtenerProbabilidad(idAlumno);

        // 3) Paso el resultado al JSP
        request.setAttribute("probabilidadIngreso", pi);

        // 4) Redirijo al JSP
        request.getRequestDispatcher("/view/probabilidadIngreso.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
