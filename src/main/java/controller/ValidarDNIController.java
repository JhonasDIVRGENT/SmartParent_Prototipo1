package controller;

import dao.LoginDAO;
import model.ParentStudent;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/validarDNI")
public class ValidarDNIController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginDAO loginDAO = new LoginDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dniPadre = request.getParameter("dniPadre");
        String dniHijo  = request.getParameter("dniHijo");

        try {
            ParentStudent ps = loginDAO.login(dniPadre, dniHijo);
            if (ps != null) {
                HttpSession session = request.getSession();
                session.setAttribute("parentId",    ps.getParentId());
                session.setAttribute("parentName",  ps.getParentName());
                session.setAttribute("studentId",   ps.getStudentId());
                session.setAttribute("studentName", ps.getStudentName());
                response.sendRedirect("home");
            } else {
                response.sendRedirect("index.jsp?error=1");
            }
        } catch (Exception e) {
            throw new ServletException("Error en login", e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }
}
