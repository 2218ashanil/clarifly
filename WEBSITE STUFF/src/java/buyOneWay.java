/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class buyOneWay extends HttpServlet {

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
        MyDB db = new MyDB();                                // OPENING MY DB OBJECT
        java.sql.Connection con = db.getCon();               // MAKING CONNECTION
        
        int flightNo = Integer.parseInt((String )request.getParameter("flightNo"));
        String airlineId = (String )request.getParameter("airlineId");
        int tickets = Integer.parseInt((String )request.getParameter("tickets"));
        String username = (String ) request.getParameter("username");
        int legNo = Integer.parseInt((String ) request.getParameter("legNo"));
        //ResrNo1 INTEGER, AccountNo1 INTEGER, ResrDate1 DATETIME, BookingFee1 DECIMAL, NumPassengers int(11), 
        //class CHAR(20), TotalFare1 DECIMAL, Meal1 CHAR(50), RepSSN1 INTEGER, AirlineID1 CHAR(2), FlightNo1 int(11), LegNo1 int(11))
       
        int Reservation = 0;
        String queryCheck = "select count(*) tables from reservation"; 
        PreparedStatement ps = con.prepareStatement(queryCheck);                                   
        ResultSet rs = ps.executeQuery();  
        if(rs.next())
            Reservation = Integer.parseInt(rs.getString(1)) + 1;
        
        int accNo = 0;
        queryCheck = "SELECT AccountNo from customer WHERE Username = ?";  
        ps = con.prepareStatement(queryCheck);       
        ps.setString(1, username);   
        rs = ps.executeQuery();  
        if(rs.next())
            accNo = rs.getInt(1);
        
        double bookingFee = 50.00;
        String cl = "economy";
        String meal = "Airline Selection";
        int ssn = 1;
         java.util.Date today = new java.util.Date();
         
        CallableStatement cs = db.getCon().prepareCall("{call RecordReservation(?,?,?,?,?,?,?,?,?,?,?,?)}");
        cs.setInt(1,Reservation);
        cs.setInt(2,accNo);
        cs.setTimestamp(3, new java.sql.Timestamp(today.getTime()));
        cs.setDouble(4,bookingFee);
        cs.setInt(5,tickets);
        cs.setString(6,cl);
        cs.setDouble(7, tickets*150 + 50);
        cs.setString(8,meal);
        cs.setInt(9,ssn);
        cs.setString(10, airlineId);
        cs.setInt(11,flightNo);
        cs.setInt(12,legNo);
        
        cs.executeQuery();
        
        cs = db.getCon().prepareCall("{call EditSeatsRemaining(?,?,?,?)}");
        cs.setString(1,airlineId);
        cs.setInt(2,flightNo);
        cs.setInt(3,legNo);
        cs.setInt(4,tickets);
        cs.executeQuery();
        
        request.setAttribute("username", username);
        request.setAttribute("reservationNo", Reservation);
                   
        request.getRequestDispatcher("purchaseComplete.jsp").forward(request, response);
        
        } catch (SQLException ex) {
            Logger.getLogger(buyOneWay.class.getName()).log(Level.SEVERE, null, ex);
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
