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
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author anil
 */
public class cust_rep_reserve extends HttpServlet {

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
            String from = (String )request.getParameter("departAirport");
        String to = (String )request.getParameter("toAirport");
        String date = (String )request.getParameter("departdate");
        String username = (String ) request.getParameter("username");
        if(username == null){
            username = "0";
        }
        int ssn = Integer.parseInt(username);
        Date time = null;
        date = date.replaceAll("-","/");
            DateFormat formatter;
            formatter = new SimpleDateFormat("yyyy/MM/dd");
            try {
               time = (Date) formatter.parse(date);
            } catch (ParseException ex) {
                Logger.getLogger(searchOneWay.class.getName()).log(Level.SEVERE, null, ex);
            }
            java.sql.Timestamp timeStampDate = new Timestamp(time.getTime());
    java.sql.Timestamp ts = timeStampDate ;
       
        int tickets = Integer.parseInt((String)request.getParameter("tickets"));
        String acct = request.getParameter("AccountNo");
        int accNo = Integer.parseInt(acct);
        int flightNo = Integer.parseInt((String )request.getParameter("flightNo"));
        String airlineId = (String )request.getParameter("airlineId");
        int legNo = Integer.parseInt((String ) request.getParameter("legNo"));
        
        MyDB db = new MyDB();                                // OPENING MY DB OBJECT
        java.sql.Connection con = db.getCon();             // MAKING CONNECTION
       
        CallableStatement cs = db.getCon().prepareCall("{call SearchForFlights(?,?,?,?,?)}");
        cs.setString(1,from);
        cs.setString(2,to);
        cs.setTimestamp(3, timeStampDate);
        Calendar cal = Calendar.getInstance();
        cal.setTime(timeStampDate);
        cal.add(Calendar.DATE, 1);
        ts = new Timestamp(cal.getTime().getTime());
        cs.setTimestamp(4, ts);
        cs.setInt(5,tickets);
        ResultSet rs = cs.executeQuery();
        int found = 0;
        while(rs.next()){
            if(rs.getString(1).equals(airlineId) && (rs.getInt(2) == (flightNo)) && (rs.getInt(3) == (legNo)) && (rs.getInt(4) - tickets >= 0)){
                found = 1;
            }
        }
        if(found == 1){
            int Reservation = 0;
            String queryCheck = "select count(*) tables from reservation"; 
            PreparedStatement ps = con.prepareStatement(queryCheck);                                   
            rs = ps.executeQuery();  
            if(rs.next())
                Reservation = Integer.parseInt(rs.getString(1)) + 1;
            double bookingFee = 50.00;
            String cl = "economy";
            String meal = "Airline Selection";
             java.util.Date today = new java.util.Date();

            cs = db.getCon().prepareCall("{call RecordReservation(?,?,?,?,?,?,?,?,?,?,?,?)}");
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
            request.getRequestDispatcher("cust_rep_reservation_success.jsp").forward(request, response);
        }
        else{
            request.setAttribute("username", username);
            request.getRequestDispatcher("cust_rep_reservation_failure.jsp").forward(request, response);
        }
        } catch (SQLException ex) {
            Logger.getLogger(cust_rep_reserve.class.getName()).log(Level.SEVERE, null, ex);
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
