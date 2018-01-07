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
public class tabs extends HttpServlet {

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
              MyDB db = new MyDB();                                // OPENING MY DB OBJECT
        java.sql.Connection con = db.getCon();     
            /* TODO output your page here. You may use following sample code. */
        String tab = (String )request.getParameter("tab");
        String username = (String )request.getParameter("username");
        
        if(tab.equals("home"))
        {
             request.setAttribute("username", username);
             request.getRequestDispatcher("customerHome.jsp").forward(request, response);
        }
        else if(tab.equals("acc"))
        {
            request.setAttribute("username", username);
            request.getRequestDispatcher("myAccount.jsp").forward(request, response);
            
        }
        else if(tab.equals("res"))
        {
            ArrayList<ArrayList<String>> output = new ArrayList();
            
            int id = 0;
            String queryCheck = "SELECT Id from customer WHERE Username = ?";  
            PreparedStatement ps = con.prepareStatement(queryCheck);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();  
            if(rs.next())
                id = rs.getInt(1);
            
            CallableStatement cs = db.getCon().prepareCall("{call ReservationsByCustomer(?)}");
            cs.setInt(1,id);
            rs = cs.executeQuery();
            while(rs.next())
            {
                ArrayList<String> temp = new ArrayList();
                ArrayList<String> temp2 = new ArrayList();
                
                temp.add(rs.getString(1));
                temp.add(rs.getString(2));
                temp.add(rs.getString(3));
                temp.add(rs.getString(4));
                temp.add(rs.getString(5));
                temp.add(rs.getString(6));
                temp.add(rs.getString(7));
                temp.add(rs.getString(8));
                    
                    cs = db.getCon().prepareCall("{call TravelItinerary(?)}");
                    cs.setInt(1,Integer.parseInt(rs.getString(1)));
                    ResultSet ss = cs.executeQuery();
                    while(ss.next()){
                        temp2.add(ss.getString(1));
                        temp2.add(ss.getString(2));
                        temp2.add(ss.getString(3));
                        temp2.add(ss.getString(4));
                        temp2.add(ss.getString(5));
                        temp2.add(ss.getString(6));
                        temp2.add(ss.getString(7));
                        temp2.add(ss.getString(8));
                        temp2.add(ss.getString(9));
                        temp2.add(ss.getString(10));
                        temp2.add(ss.getString(11));
                        temp2.add(ss.getString(12));
                        temp2.add(ss.getString(13));
                    }
                output.add(temp);
              output.add(temp2);
            }
            
             request.setAttribute("res", output);
             request.setAttribute("username", username);
             request.getRequestDispatcher("myReservations.jsp").forward(request, response);
        }
        else if(tab.equals("auc"))
        {
            request.setAttribute("username", username);
            request.getRequestDispatcher("myAuctions.jsp").forward(request, response);
            
        }
        else if(tab.equals("help"))
        {
            
        }
        
        
        
        } catch (SQLException ex) {
            Logger.getLogger(tabs.class.getName()).log(Level.SEVERE, null, ex);
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
