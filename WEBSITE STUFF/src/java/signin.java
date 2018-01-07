/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.console;
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
public class signin extends HttpServlet {

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
           //-------------------------------------------------------------------------------------------------
           String username = request.getParameter("username");   //GETTING VARIABLES FROM LAST FORM
           String password = request.getParameter("password");   //GETTING VARIABLES FROM LAST FORM
           MyDB db = new MyDB();                                // OPENING MY DB OBJECT
           java.sql.Connection con = db.getCon();               // MAKING CONNECTION
           
            String queryCheck = "SELECT SSN from employee WHERE SSN = ? and Password = ?"; //GET EMPLOYEE
            PreparedStatement ps = con.prepareStatement(queryCheck);    //Prepared statements are new commands we didnt make
            ps.setString(1, username);                                   //set the SSN as the first ?
            ps.setString(2, password);                                  //set the pass as the 2nd ?
            ResultSet rs = ps.executeQuery();                       // results from db search
            
            boolean isEmployee ;
            if(!rs.isBeforeFirst())                     // CHECK IF RESULT SET IS EMPTY
                isEmployee = false;
            else
                isEmployee = true;
           
            if(isEmployee == true)
            {
                boolean manager = false;
                queryCheck = "SELECT IsManager from employee WHERE SSN = ?"; //GET Customer
                ps = con.prepareStatement(queryCheck);    //Prepared statements are new commands we didnt make
                ps.setInt(1, Integer.parseInt(username));   
                //ps.setInt(1, 1); 
                rs = ps.executeQuery();    
                
                while(rs.next()){
                if(rs.getInt(1) == 0)                     // CHECK IF RESULT SET IS EMPTY
                    manager = false;
                else
                    manager = true;
                }
                if(manager){
                    request.getRequestDispatcher("managerHome.jsp").forward(request, response);
                }else{
                    request.setAttribute("username", username);
                    
                   request.getRequestDispatcher("cust_rep.jsp").forward(request, response);
                }
            }
            else
            {
                
                boolean customerLogin;
                queryCheck = "SELECT Username from customer WHERE Username = ? and Password = ?"; //GET Customer
                ps = con.prepareStatement(queryCheck);    //Prepared statements are new commands we didnt make
                ps.setString(1, username);                        
                ps.setString(2, password);
                rs = ps.executeQuery();    
                
                if(!rs.isBeforeFirst())                     // CHECK IF RESULT SET IS EMPTY
                    customerLogin = false;
                else
                    customerLogin = true;
                
                
                if(customerLogin == true)                   // IF CUSTOMER LOGIN MATCHES
                {   
                  
                   request.setAttribute("username", username);
                   
                   request.getRequestDispatcher("customerHome.jsp").forward(request, response);
                }
                else
                {
                    String err = "Incorrect Login Information";
                    request.setAttribute("err", err);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                   
                }
            }
            
            
           
            
        } catch (SQLException ex) {
            Logger.getLogger(signin.class.getName()).log(Level.SEVERE, null, ex);
        }
        //---------------------------------------------------------------------------------------------------------------
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
