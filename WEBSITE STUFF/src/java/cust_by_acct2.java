/*
Ashley Anil
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
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
 * @author anil
 */
public class cust_by_acct2 extends HttpServlet {

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
            String acct = request.getParameter("Account Number");
            int acctno= Integer.parseInt(request.getParameter("Account Number"));
            String fname= request.getParameter("First name");
            String lname= request.getParameter("Last name");
            String email= request.getParameter("Email");
            String telephone = request.getParameter("Telephone");
            String address = request.getParameter("Address");
            String city = request.getParameter("City");
            String state = request.getParameter("State");
            int zipcode = (Integer.parseInt(request.getParameter("Zipcode")));
            String credit = request.getParameter("Credit");
            String preference = request.getParameter("Preference");
            /* TODO output your page here. You may use following sample code. */
            CallableStatement cs = con.prepareCall("{call clarifly.EditPersonFName(?, ?)}");
            cs.setInt(1,acctno);
            cs.setString(2, fname);
            cs.executeQuery();
            cs = con.prepareCall("{call clarifly.EditPersonLName(?, ?)}");
            cs.setInt(1,acctno);
            cs.setString(2, lname);
            cs.executeQuery();
            cs = con.prepareCall("{call clarifly.EditCustomerEmail(?, ?)}");
            cs.setInt(1,acctno);
            cs.setString(2, email);
            cs.executeQuery();
            cs = con.prepareCall("{call clarifly.EditPersonTelephone(?, ?)}");
            cs.setInt(1,acctno);
            cs.setString(2, telephone);
            cs.executeQuery();
            cs = con.prepareCall("{call clarifly.EditPersonAddress(?, ?)}");
            cs.setInt(1,acctno);
            cs.setString(2, address);
            cs.executeQuery();
            cs = con.prepareCall("{call clarifly.EditPersonCity(?, ?)}");
            cs.setInt(1,acctno);
            cs.setString(2, city);
            cs.executeQuery();
            cs = con.prepareCall("{call clarifly.EditPersonState(?, ?)}");
            cs.setInt(1,acctno);
            cs.setString(2, state);
            cs.executeQuery();
            cs = con.prepareCall("{call clarifly.EditPersonZipCode(?, ?)}");
            cs.setInt(1,acctno);
            cs.setInt(2, zipcode);
            cs.executeQuery();
            cs = con.prepareCall("{call clarifly.EditCustomerCredCardNum(?, ?)}");
            cs.setInt(1,acctno);
            cs.setString(2, credit);
            cs.executeQuery();
            cs = con.prepareCall("{call clarifly.EditCustomerPreference(?, ?)}");
            cs.setInt(1,acctno);
            cs.setString(2, preference);
            cs.executeQuery();
            //request.getRequestDispatcher("cust_rep_success.html").forward(request, response);

        
            cs = con.prepareCall("{call clarifly.CustomerInfoByAcctNo(?)}");
            cs.setInt(1,acctno);
            ResultSet rs = cs.executeQuery();
            //out.println(email);
            String updated = "true";
            while(rs.next()){
                out.println(email);
//                String fname = rs.getString(1);
//                String lname = rs.getString(2);
//                String address = rs.getString(3);
//                String city = rs.getString(4);
//                String state = rs.getString(5);
//                int zipcode = rs.getInt(6);
//                String telephone = rs.getString(7);
//                String creditcard = rs.getString(8);
//                String email = rs.getString(9);
//                int rating = rs.getInt(10);
                request.setAttribute("acctno", acct);
                out.println("1");
                request.setAttribute("fname", rs.getString(1));
                request.setAttribute("lname", rs.getString(2));
                request.setAttribute("address", rs.getString(3));
                request.setAttribute("city", rs.getString(4));
                out.println("1");

                request.setAttribute("state", rs.getString(5));
                request.setAttribute("zipcode", rs.getString(6));
                request.setAttribute("telephone", rs.getString(7));
                request.setAttribute("credit", rs.getString(8));
                out.println("1");

                request.setAttribute("email", rs.getString(9));
                request.setAttribute("rating", rs.getString(10));
                request.setAttribute("preference", rs.getString(11));
                request.setAttribute("updated", updated);
                out.println("1");
                out.println(request.getAttribute("email"));
                request.getRequestDispatcher("cust_rep_success.jsp").forward(request, response);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(cust_by_acct2.class.getName()).log(Level.SEVERE, null, ex);
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
