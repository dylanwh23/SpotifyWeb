/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import controllers.Fabrica;
import controllers.IUsuarioController;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Map;
import models.Usuario;
import persistence.UsuarioJpaController;

/**
 *
 * @author dylan
 */
@WebServlet(name = "verificarInicioSesion", urlPatterns = {"/verify"})
public class verificarInicioSesion extends HttpServlet {
    Fabrica fabrica = Fabrica.getInstance();
    private IUsuarioController ICU = fabrica.getIUsuarioController();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String username = request.getParameter("email");
        String password = request.getParameter("password");
        if(username.contains("@")){
            username=ICU.getNickPorMail(username);
        }
        
        if(ICU.inicioSesion(username, password)){
            HttpSession session = request.getSession();
            Map<String, String> datos = ICU.getDatosUsuario(username);
            for (Map.Entry<String, String> entry : datos.entrySet()) {
                session.setAttribute(entry.getKey(), entry.getValue());            
            }
            response.sendRedirect("index.jsp?");           
        }else{
            response.sendRedirect("login.jsp?credencialesInvalidas=1");
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
