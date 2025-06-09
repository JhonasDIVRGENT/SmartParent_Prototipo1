package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import model.ResultadoExamen;

@WebServlet("/resultadosExamen")
public class ResultadosExamenController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ResultadosExamenController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Crear lista de resultados en memoria
        List<ResultadoExamen> listaResultados = new ArrayList<>();
        
        listaResultados.add(new ResultadoExamen("Examen de Ranking 1", "Ranking", 17.8));
        listaResultados.add(new ResultadoExamen("Simulacro 1", "Simulacro", 16.5));
        listaResultados.add(new ResultadoExamen("Diagnóstico", "Diagnóstico", 19.0));
        
        // Pasar la lista a la JSP
        request.setAttribute("listaResultados", listaResultados);
        
        // Redirigir a resultadosExamen.jsp
        request.getRequestDispatcher("/view/resultadosExamen.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
