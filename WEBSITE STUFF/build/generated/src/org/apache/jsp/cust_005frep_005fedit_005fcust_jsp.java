package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.sql.*;
import java.util.Date;
import java.io.*;

public final class cust_005frep_005fedit_005fcust_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


        java.sql.Connection con;
        CallableStatement cs;
        PreparedStatement stmt;
        ResultSet rs;
    
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>clariFLY</title>\n");
      out.write("         <link rel=\"stylesheet\" type=\"text/css\" media=\"all\" href=\"index.css\">\n");
      out.write("    </head>\n");
      out.write("    ");
      out.write("\n");
      out.write("    <body style=\"background-color: skyblue; align-content: center\">\n");
      out.write("        <header>\n");
      out.write("            <br>\n");
      out.write("            <nav>\n");
      out.write("                <ul>\n");
      out.write("                    <li><a href=\"cust_rep.jsp\">Reservation</a></li>\n");
      out.write("                    <li><a href=\"emp_edit_cust.jsp\">Customer Info</a></li>\n");
      out.write("                    <li><a href=\"emp_mailing.jsp\">Mailing</a></li>\n");
      out.write("                    <li><a href=\"flight_sug.jsp\">Flight Suggestions</a></li>\n");
      out.write("                    <li><a href=\"emp_info.jsp\">Employee Info</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </nav>\n");
      out.write("        </header>\n");
      out.write("        <form>\n");
      out.write("        Account Number\n");
      out.write("            <input type=\"text\" name=\"AcctNo\"/>\n");
      out.write("            <input type=\"submit\" value=\"Submit\"/>\n");
      out.write("        </form>\n");
      out.write("        ");

            try {
              Class.forName("org.gjt.mm.mysql.Driver");
              con = DriverManager.getConnection("jdbc:mysql://localhost/clarifly","root" , "maroon596");
              String acctno_str = request.getParameter("AcctNo");
              int acctno = Integer.parseInt(acctno_str);
              stmt = con.prepareStatement("SELECT Id FROM customer WHERE AccntNo =?");
              stmt.setInt(1,acctno);
              rs = stmt.executeQuery();
              int id = rs.getInt("Id");
              stmt = con.prepareStatement("SELECT FirstName, LastName, Address, City, State, ZipCode FROM person WHERE Id= ?");
              stmt.setInt(1,id);
              rs = stmt.executeQuery();
              String fname, lname, address, city, state;
              int zipcode;
              while (rs.next()) {
                  fname = rs.getString(1);
                  lname = rs.getString(2);
                  address = rs.getString(3);
                  city = rs.getString(4);
                  state = rs.getString(5);
                  zipcode = rs.getInt(6);
              }
            }
            catch(SQLException e) {
              out.println("SQLException caught: " +e.getMessage());
            }
        
      out.write("\n");
      out.write("       <form>\n");
      out.write("        First Name <input type=\"text\" name=\"fname\" value=%=fname%>\n");
      out.write("        Last Name <input type=\"text\" name=\"lname\" value=%=lname%>\n");
      out.write("        Address <input type=\"text\" name=\"address\" value=%=address%>\n");
      out.write("        City <input type=\"text\" name=\"city\" value=%=city%>\n");
      out.write("        State <input type=\"text\" name=\"state\" value=%=state%>\n");
      out.write("        Zip Code <input type=\"text\" name=\"zipcode\" value=%=zipcode%>\n");
      out.write("        </form>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
