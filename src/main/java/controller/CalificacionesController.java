package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import model.Calificacion;

@WebServlet("/calificaciones")
public class CalificacionesController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CalificacionesController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Crear lista de calificaciones en memoria
        List<Calificacion> listaCalificaciones = new ArrayList<>();
        
        listaCalificaciones.add(new Calificacion("Matemáticas", 18.5));
        listaCalificaciones.add(new Calificacion("Comunicación", 15.0));
        listaCalificaciones.add(new Calificacion("Historia", 19.2));
        
        // Pasar la lista a la JSP
        request.setAttribute("listaCalificaciones", listaCalificaciones);
        
        // Redirigir a calificaciones.jsp
        request.getRequestDispatcher("/view/calificaciones.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
