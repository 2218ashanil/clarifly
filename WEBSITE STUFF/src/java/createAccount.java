/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.util.Date;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
public class createAccount extends HttpServlet {

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
        String fname = (String )request.getParameter("First name");
        String lname = (String )request.getParameter("Last name");
        String email = (String )request.getParameter("Email");
        String username = (String )request.getParameter("Username");
        String password = (String )request.getParameter("Password");
        String telephone = (String )request.getParameter("Telephone");
        String address = (String )request.getParameter("Address");
        String city = (String )request.getParameter("City");
        String state = (String )request.getParameter("State");
        String zip = (String )request.getParameter("Zipcode");
        String credit = (String )request.getParameter("Credit");
        int rating=0;
        int id= 0;
        
        java.util.Date today = new java.util.Date();
        //System.out.println(dateFormat.format(date)); //2016/11/16 12:08:43

        MyDB db = new MyDB();                                // OPENING MY DB OBJECT
        java.sql.Connection con = db.getCon();               // MAKING CONNECTION
           
        String queryCheck = "select count(*) tables from Person";
        PreparedStatement ps = con.prepareStatement(queryCheck);   
        ResultSet rs = ps.executeQuery(); 
        
        if(rs.next()){
        id = rs.getInt(1);  
        }
        id++;
        CallableStatement cs = db.getCon().prepareCall("{call AddCustomer(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
        cs.setInt(1, id);
        cs.setString(2, fname);
        cs.setString(3, lname);
        cs.setString(4, address);
        cs.setString(5,city);
        cs.setString(6,state);
        cs.setInt(7,Integer.parseInt(zip));
        cs.setInt(8,id);
        cs.setString(9,credit);
        cs.setString(10,email);
        cs.setTimestamp(11, new java.sql.Timestamp(today.getTime()));
        cs.setInt(12,rating);
        cs.setString(13,password);
        cs.setString(14,username);
        cs.setString(15,"none");
        cs.setString(16, telephone);
        cs.execute();
        
        String createdAcc = "Account Made";
        request.setAttribute("createdAcc", createdAcc);
                   
        request.getRequestDispatcher("index.jsp").forward(request, response);
        
                
        } catch (SQLException ex) {
            Logger.getLogger(createAccount.class.getName()).log(Level.SEVERE, null, ex);
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
