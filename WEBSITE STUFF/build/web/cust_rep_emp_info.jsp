<%-- 
    Document   : cust_rep
    Created on : Nov 16, 2017, 1:12:56 AM
    Author     : Ashley Anil
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>clariFLY</title>
         <link rel="stylesheet" type="text/css" media="all" href="customerHome.css">
    </head>
    <%!
        java.sql.Connection con;
        CallableStatement cs;
        PreparedStatement ps;
        ResultSet rs;
    %>
    <body>
        <header>
            <br>
            <nav>
                 <ul>
                    <li><a href="cust_rep.jsp"><button class = "button"type="button">Reservation</button></a></li>
                    <li><a href="cust_rep_main.jsp"><button class = "button"type="button">Customer Info</button></a></li>
                    <li><a href="cust_rep_emp_mailing.jsp"><button class = "button"type="button">Mailing</button></a></li>
                    <li><a href="cust_rep_flight_sug_main.jsp"><button class = "button" type="button">Flight Suggestions</button></a></li>
                    <li><a href="cust_rep_emp_info.jsp"><button class = "button"type="button">Employee Info</button></a></li>
                    <li><a href="index.jsp"><button class = "button" type="button">Log Out</button></a></li>
                    <li><select name="HELP" value="HELP" onchange="location = this.value;">
                                <option >HELP</option>
                            <option value="https://docs.google.com/a/stonybrook.edu/document/d/1nVfI-FAZMTHMlStglX6QR4O7nQ53vwZxJfIkLLIqYsM/edit?usp=sharing">HELP MANAGER</option>
                            <option value="https://docs.google.com/a/stonybrook.edu/document/d/11Tlfvj21bgbuI-BSpa0dwPs0FJPdm-Jwb-UuyE5EE90/edit?usp=sharing">HELP REP</option>
                            <option value="https://docs.google.com/a/stonybrook.edu/document/d/1NkhBWbFPCjgqBYZgST5U4G-DqHbIpJBcySO1E-jFMrc/edit?usp=sharing">HELP CUSTOMER</option>
                           </select> </li>
                </ul>
            </nav>
        </header>
        
        <%
            try {
              Class.forName("org.gjt.mm.mysql.Driver");
              con = DriverManager.getConnection("jdbc:mysql://localhost/clarifly","root" , "Brooklyn29!");
              //ps = con.prepareStatement("SELECT LastName, FirstName, Address, City, State, ZipCode, Telephone, StartDate FROM person P, employee E WHERE P.Id = E.Id ");
              cs = con.prepareCall("{call clarifly.EmployeeInfo()}");
              rs = cs.executeQuery();
              
            }
            catch(SQLException e) {
              out.println("SQLException caught: " +e.getMessage());
            }
        %>
        <br><br>
        <h1>Employee Information</h1>
        <TABLE BORDER="1">
            <TR>
                <TH>First Name</TH>
                <TH>Last Name</TH>
                <TH>Address</TH>
                <TH>City</TH>
                <TH>State</TH>
                <TH>Zip Code</TH>
                <TH>Is Manager</TH>
                <TH>Start Date</TH>
                
            </TR>
            <% while(rs.next()){ %>
            <TR>
                <TD> <%= rs.getString(1) %></td>
                <TD> <%= rs.getString(2) %></TD>
                <TD> <%= rs.getString(3) %></TD>
                <TD> <%= rs.getString(4) %></TD>
                <TD> <%= rs.getString(5) %></TD>
                <TD> <%= rs.getInt(6) %></TD>
                <TD> <%= rs.getInt(7) %></TD>
                <TD> <%= rs.getString(8) %></TD>
            </TR>
            <% } %>

        </TABLE>

    </body>
</html>