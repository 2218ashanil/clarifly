/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
public class sendAuction extends HttpServlet {

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
        
        int accNo = Integer.parseInt((String )request.getParameter("accNo"));
        String clas = (String )request.getParameter("class");
        String airline = (String )request.getParameter("airlineName");
        int flightNo = Integer.parseInt((String )request.getParameter("flightNo"));
        int res = Integer.parseInt((String) request.getParameter("res"));
        String airId = "";
        java.util.Date today = new java.util.Date();
        
        MyDB db = new MyDB();                                // OPENING MY DB OBJECT
        java.sql.Connection con = db.getCon();               // MAKING CONNECTION
            
            //acc INTEGER,  airID CHAR(2), flightNumber INTEGER, class1 CHAR(15), cDate DATETIME, NYOP1 DOUBLE, bidder CHAR(15), aucId INTEGER
            String queryCheck = "SELECT Id from airline WHERE Name = ?"; 
            PreparedStatement ps = con.prepareStatement(queryCheck);   
            ps.setString(1,airline);                                 
            ResultSet ss = ps.executeQuery();  
            if(ss.next())
                 airId = ss.getString(1);
        
            int aucId = 0;
            queryCheck = "select count(*) tables from auctions"; 
            ps = con.prepareStatement(queryCheck);                             
            ss = ps.executeQuery();  
            if(ss.next())
                 aucId = ss.getInt(1) + 1;
        
        CallableStatement cs = db.getCon().prepareCall("{call AddAuction(?,?,?,?,?,?,?,?)}");
        cs.setInt(1, accNo);
        cs.setString(2, airId);
        cs.setInt(3, flightNo);
        cs.setString(4, clas);
        cs.setDouble(6,0);
        cs.setString(7,"Be The First!");
        cs.setInt(8,aucId);
        cs.setTimestamp(5, new java.sql.Timestamp(today.getTime()));
        
        cs.execute();
        
        cs = db.getCon().prepareCall("{call deleteReservation(?)}");
        cs.setInt(1, res);
        
        cs.execute();
        
        request.setAttribute("username", username);           
        request.getRequestDispatcher("myAuctions.jsp").forward(request, response);
            
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(sendAuction.class.getName()).log(Level.SEVERE, null, ex);
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
