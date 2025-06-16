package controller;

import dao.AsistenciaDAO;
import model.Asistencia;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/asistencia")
public class AsistenciaController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AsistenciaController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1) Obtén el id del alumno (aquí fijo a 1; luego puedes leerlo de sesión o parámetro)
        int idAlumno = 1;

        // 2) Llama al DAO para traer la lista
        AsistenciaDAO dao = new AsistenciaDAO();
        List<Asistencia> listaAsistencia = dao.obtenerAsistenciaPorAlumno(idAlumno);

        // 3) Pasa la lista al JSP
        request.setAttribute("listaAsistencia", listaAsistencia);

        // 4) Redirige a asistencia.jsp
        request.getRequestDispatcher("/view/asistencia.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
