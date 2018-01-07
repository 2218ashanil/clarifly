package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.sql.*;
import java.util.Date;
import java.io.*;

public final class practice_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


        java.sql.Connection con;
        CallableStatement cs;
        PreparedStatement ps;
        ResultSet rs;
        //HttpServletRequest request ;
    
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>clariFLY</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" media=\"all\" href=\"index.css\">\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    ");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <h1>Hello World!</h1>\n");
      out.write("        <form action=\"practice.jsp\" method=\"POST\">\n");
      out.write("        Account Number\n");
      out.write("            <input type=\"number\" id=\"AcctNo\" name=\"AcctNo\"/>\n");
      out.write("            <input type=\"submit\" value=\"Submit\"/>\n");
      out.write("        </form>\n");
      out.write("        ");

            Class.forName("org.gjt.mm.mysql.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/clarifly","root" , "maroon596");
            String acct = request.getParameter("AcctNo");
            //out.println(acct);
            if(acct != null){
              int acctno = Integer.parseInt(acct);
              out.println(acct);
              cs = con.prepareCall("{call clarifly.CustomerInfoByAcctNo(?)}");
              cs.setInt(1,acctno);
              rs = cs.executeQuery();
              while(rs.next()){
                  String fname = rs.getString(1);
                  out.println(fname);
              }
//              
              //out.println(fname);
            }
        
      out.write("\n");
      out.write("        <form action=\"practice.jsp\" method=\"POST\">\n");
      out.write("        First Name\n");
      out.write("            <input type=\"text\" id=\"AcctNo\" name=\"name\"/>\n");
      out.write("            <input type=\"submit\" value=\"Submit\"/>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
