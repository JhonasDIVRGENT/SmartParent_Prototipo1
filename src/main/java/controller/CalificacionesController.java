package controller;

import dao.CalificacionDAO;
import model.Calificacion;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/calificaciones")
public class CalificacionesController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CalificacionesController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1) ID del alumno (por ahora fijo)
        int idAlumno = 1;

        // 2) Llamada al DAO
        CalificacionDAO dao = new CalificacionDAO();
        List<Calificacion> listaCalificaciones = dao.obtenerNotasPorAlumno(idAlumno);

        // 3) Pongo la lista en request
        request.setAttribute("listaCalificaciones", listaCalificaciones);

        // 4) Redirijo al JSP
        request.getRequestDispatcher("/view/calificaciones.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
