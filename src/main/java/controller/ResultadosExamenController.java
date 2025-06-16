package controller;

import dao.ResultadoExamenDAO;
import model.ResultadoExamen;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/resultadosExamen")
public class ResultadosExamenController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ResultadosExamenController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1) ID del alumno (por ahora fijo; luego lo obtienes de sesión o parámetro)
        int idAlumno = 1;

        // 2) Obtén la lista desde el DAO
        ResultadoExamenDAO dao = new ResultadoExamenDAO();
        List<ResultadoExamen> listaResultados = dao.obtenerResultadosPorAlumno(idAlumno);

        // 3) Pasa la lista al JSP
        request.setAttribute("listaResultadosExamen", listaResultados);

        // 4) Redirige al JSP correspondiente
        request.getRequestDispatcher("/view/resultadosExamen.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

