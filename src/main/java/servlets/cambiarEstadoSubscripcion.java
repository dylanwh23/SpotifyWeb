 /* Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import controllers.Fabrica;
import controllers.IPlaylistController;
import controllers.IUsuarioController;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import static java.lang.System.out;
import java.time.LocalDate;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;
import models.Album;

/**
 *
 * @author dylan
 */
@WebServlet(name = "cambiarEstadoSubscripcion", urlPatterns = {"/cambiarEstadoSubscripcion"})
@MultipartConfig
public class cambiarEstadoSubscripcion extends HttpServlet {
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("grupo6_Spotify");
        EntityManager em = emf.createEntityManager();
        HttpSession session = request.getSession();
        int tipo = 0;
        if(null != request.getParameter("planSub")){
            String planSeleccionado = request.getParameter("planSub");
            tipo = Integer.valueOf(planSeleccionado);
        }

        LocalDate fechaActual = LocalDate.now();
        String usuario = (String) session.getAttribute("nick");
        String estado = (String) request.getParameter("estado");


        try {
            ICU.CambiarEstadosubscripcion(usuario,estado,tipo,null);
            out.println("Anduvo");
        } catch (Exception ex) {
            ex.printStackTrace(); // Imprime la traza completa del error en la consola del servidor.
            out.println("Error: " + ex.getMessage());
        }

       response.sendRedirect("index.jsp?");

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
