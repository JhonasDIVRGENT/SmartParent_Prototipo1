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
        
        listaAsistencia.add(new Asistencia("2025-06-01", "Razonamiento Matemático", "Presente"));
        listaAsistencia.add(new Asistencia("2025-06-02", "Razonamiento Verbal", "Tardanza"));
        listaAsistencia.add(new Asistencia("2025-06-03", "Aritmética", "Presente"));
        listaAsistencia.add(new Asistencia("2025-06-04", "Álgebra", "Presente"));
        listaAsistencia.add(new Asistencia("2025-06-05", "Geometría", "Ausente"));
        listaAsistencia.add(new Asistencia("2025-06-06", "Trigonometría", "Presente"));
        listaAsistencia.add(new Asistencia("2025-06-07", "Física", "Tardanza"));
        listaAsistencia.add(new Asistencia("2025-06-08", "Química", "Presente"));
        listaAsistencia.add(new Asistencia("2025-06-09", "Biología", "Ausente"));
        listaAsistencia.add(new Asistencia("2025-06-10", "Historia del Perú", "Presente"));
        
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
