package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.sql.*;
import java.util.Date;
import java.io.*;

public final class flight_005fsug_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


        java.sql.Connection con;
        CallableStatement cs;
        PreparedStatement ps;
        ResultSet rs;
        HttpServletRequest request ;
    
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
      out.write("        <form action=\"flight_sug.jsp\" method=\"POST\">\n");
      out.write("        Account Number\n");
      out.write("            <input type=\"text\" id=\"AcctNo\" name=\"AcctNo\"/>\n");
      out.write("            <input type=\"submit\" value=\"Submit\">\n");
      out.write("        </form>\n");
      out.write("        ");

            try {
              Class.forName("org.gjt.mm.mysql.Driver");
              con = DriverManager.getConnection("jdbc:mysql://localhost/clarifly","root" , "maroon596");
              //ps = con.prepareStatement("SELECT LastName, FirstName, Address, City, State, ZipCode, Telephone, StartDate FROM person P, employee E WHERE P.Id = E.Id ");
              String acctno_str = request.getParameter("AcctNo");
              int acctno = Integer.parseInt(acctno_str);
              out.println(acctno_str);
//              cs = con.prepareCall("{call FlightSuggestions(?)}");
//              cs.setInt(1,acctno);
              //rs = cs.executeQuery();
            }
            catch(SQLException e) {
              out.println("SQLException caught: " +e.getMessage());
            }
        
      out.write("\n");
      out.write("        <br><br>\n");
      out.write("        <h1>Customer Flight Suggestions</h1>\n");
      out.write("        <TABLE BORDER=\"1\">\n");
      out.write("            <TR>\n");
      out.write("                <TH>First Name</TH>\n");
      out.write("                <TH>Last Name</TH>\n");
      out.write("                <TH>Address</TH>\n");
      out.write("                <TH>City</TH>\n");
      out.write("                <TH>State</TH>\n");
      out.write("                <TH>Zip Code</TH>\n");
      out.write("                <TH>Email</TH>\n");
      out.write("                \n");
      out.write("            </TR>\n");
      out.write("            ");
 while(rs.next()){ 
      out.write("\n");
      out.write("            <TR>\n");
      out.write("                <TD> ");
      out.print( rs.getString(1) );
      out.write("</td>\n");
      out.write("                <TD> ");
      out.print( rs.getString(2) );
      out.write("</TD>\n");
      out.write("                <TD> ");
      out.print( rs.getString(3) );
      out.write("</TD>\n");
      out.write("                <TD> ");
      out.print( rs.getString(4) );
      out.write("</TD>\n");
      out.write("                <TD> ");
      out.print( rs.getString(5) );
      out.write("</TD>\n");
      out.write("                <TD> ");
      out.print( rs.getInt(6) );
      out.write("</TD>\n");
      out.write("                <TD> ");
      out.print( rs.getString(7) );
      out.write("</TD>\n");
      out.write("            </TR>\n");
      out.write("            ");
 } 
      out.write("\n");
      out.write("\n");
      out.write("        </TABLE>\n");
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
