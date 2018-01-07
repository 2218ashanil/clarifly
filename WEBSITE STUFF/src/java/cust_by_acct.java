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
public class cust_by_acct extends HttpServlet {

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
            java.sql.Connection con = db.getCon(); 
            String acct = request.getParameter("AcctNo");
            out.println("here");
            int acctno = Integer.parseInt(acct);
            request.setAttribute("acctnumber", acctno);
            CallableStatement cs = con.prepareCall("{call clarifly.CustomerInfoByAcctNo(?)}");
            cs.setInt(1,acctno);
            out.println(acctno);
            ResultSet rs = cs.executeQuery();
            String updated = "not";
            out.println("here");
            while(rs.next()){
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
                out.println("here1");
                request.setAttribute("acctno", acct);
                request.setAttribute("fname", rs.getString(1));
                request.setAttribute("lname", rs.getString(2));
                request.setAttribute("address", rs.getString(3));
                request.setAttribute("city", rs.getString(4));
                request.setAttribute("state", rs.getString(5));
                request.setAttribute("zipcode", rs.getString(6));
                request.setAttribute("telephone", rs.getString(7));
                request.setAttribute("credit", rs.getString(8));
                request.setAttribute("email", rs.getString(9));
                request.setAttribute("rating", rs.getString(10));
                request.setAttribute("preference", rs.getString(11));
                //out.println(request.getAttribute("preference"));
                request.setAttribute("updated", updated);
                out.println("7000");
                request.getRequestDispatcher("cust_rep_main2.jsp").forward(request, response);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(cust_by_acct.class.getName()).log(Level.SEVERE, null, ex);
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