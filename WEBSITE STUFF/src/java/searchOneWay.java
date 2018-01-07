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
import java.util.ArrayList;
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
 * @author User
 */
public class searchOneWay extends HttpServlet {

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
        
        MyDB db = new MyDB();                                // OPENING MY DB OBJECT
        java.sql.Connection con = db.getCon();               // MAKING CONNECTION
       
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
        
        ArrayList< ArrayList<String> > table = new ArrayList();
       
        if(rs.next()){
            ArrayList<String> temp = new ArrayList();
            ArrayList<String> temp2 = new ArrayList();
            
            String queryCheck = "SELECT Name from airline WHERE Id = ?"; 
            PreparedStatement ps = con.prepareStatement(queryCheck);   
            ps.setString(1, rs.getString(1));                                 
            ResultSet ss = ps.executeQuery();  
            
            if(ss.next())
                temp2.add(ss.getString(1)); 
            
            temp.add(rs.getString(1));
            temp.add(rs.getString(2));
            temp.add(rs.getString(3));
            temp.add(rs.getString(4));
          
            queryCheck = "SELECT Name from airport WHERE Id = ?"; 
            ps = con.prepareStatement(queryCheck);   
            ps.setString(1, rs.getString(5));                                 
            ss = ps.executeQuery(); 
             if(ss.next())
            temp2.add(ss.getString(1));//
           
            temp.add(rs.getString(5));//
            
            queryCheck = "SELECT Name from airport WHERE Id = ?"; 
            ps = con.prepareStatement(queryCheck);   
            ps.setString(1, rs.getString(6));                                 
            ss = ps.executeQuery(); 
             if(ss.next())
            temp2.add(ss.getString(1));//
            
            
            temp.add(rs.getString(6));//
            temp.add(rs.getString(7));
            temp.add(rs.getString(8));
            table.add(temp);
            
            temp2.add(Integer.toString(tickets));
            temp2.add(username);
            table.add(temp2);
        }
        
        
        request.setAttribute("flights", table);          
        request.getRequestDispatcher("foundFlights.jsp").forward(request, response);
        
        } catch (SQLException ex) {
            Logger.getLogger(searchOneWay.class.getName()).log(Level.SEVERE, null, ex);
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


