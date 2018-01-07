/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class betAuction extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            
        String username = (String )request.getParameter("username");
        
        int is = Integer.parseInt((String )request.getParameter("id"));
        String clas = (String )request.getParameter("class");
        double bid = Double.parseDouble(request.getParameter("bid"));
        java.util.Date today = new java.util.Date();
        double old =Double.parseDouble(request.getParameter("old"));
        MyDB db = new MyDB();                                // OPENING MY DB OBJECT
        java.sql.Connection con = db.getCon();               // MAKING CONNECTION
        
         CallableStatement cs = db.getCon().prepareCall("{call EditAuction(?,?,?,?)}");
        cs.setInt(1, is);
        cs.setDouble(2,old+bid);
        cs.setString(3,username);
        cs.setTimestamp(4, new java.sql.Timestamp(today.getTime()));
        
        cs.execute();
        
        
        request.setAttribute("username", username);           
        request.getRequestDispatcher("myAuctions.jsp").forward(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(betAuction.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        processRequest(request, response);
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
