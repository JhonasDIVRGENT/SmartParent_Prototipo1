package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/validarDNI")
public class ValidarDNIController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ValidarDNIController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String dniPadre = request.getParameter("dniPadre");
        String dniHijo = request.getParameter("dniHijo");

        if ("1234".equals(dniPadre) && "1234".equals(dniHijo)) {
            // Simular sesión (solo si luego quieres guardar el DNI)
        	
            request.getSession().setAttribute("dniPadre", dniPadre);
            request.getSession().setAttribute("dniHijo", dniHijo);

            response.sendRedirect("home");
        } else {
            response.sendRedirect("index.jsp?error=1");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }
}
