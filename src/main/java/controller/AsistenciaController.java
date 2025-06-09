package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import model.Asistencia;

@WebServlet("/asistencia")
public class AsistenciaController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AsistenciaController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Crear lista de asistencias en memoria
        List<Asistencia> listaAsistencia = new ArrayList<>();
        
        listaAsistencia.add(new Asistencia("2025-06-01", "Matemáticas", "Presente"));
        listaAsistencia.add(new Asistencia("2025-06-02", "Comunicación", "Tardanza"));
        listaAsistencia.add(new Asistencia("2025-06-03", "Historia", "Ausente"));
        
        // Pasar la lista a la JSP
        request.setAttribute("listaAsistencia", listaAsistencia);
        
        // Redirigir a asistencia.jsp
        request.getRequestDispatcher("/view/asistencia.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
