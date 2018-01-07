<%-- 
    Document   : listOfFlights
    Created on : Dec 3, 2017, 2:17:44 PM
    Author     : sai
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
        ResultSet rs;
    %>
    <header>
         <img style="position: fixed;"id = "logo" src="clariFLY.png" alt="logo">
            <nav>
                <ul>
                        <li><a href="managerHome.jsp"><button class = "button"type="button">Home</button></a></li>
                    <li><a href="customers.jsp"><button class = "button"type="button">Customers</button></a></li>
                    <li><a href="employees.jsp"><button class = "button"type="button">Employees</button></a></li>
                    <li><a href="flights.jsp"><button class = "button"type="button">Flights</button></a></li>
                    <li><a href="reservations.jsp"><button class = "button"type="button">Reservations</button></a></li>
                    <li><a href="sales.jsp"><button class = "button"type="button">Sales</button></a></li>
                    <li><a href="index.jsp"><button class = "button"type="button">Log Out</button></a></li>
                    <li><select name="HELP" value="HELP" onchange="location = this.value;">
                                <option >HELP</option>
                            <option value="https://docs.google.com/a/stonybrook.edu/document/d/1nVfI-FAZMTHMlStglX6QR4O7nQ53vwZxJfIkLLIqYsM/edit?usp=sharing">HELP MANAGER</option>
                            <option value="https://docs.google.com/a/stonybrook.edu/document/d/11Tlfvj21bgbuI-BSpa0dwPs0FJPdm-Jwb-UuyE5EE90/edit?usp=sharing">HELP REP</option>
                            <option value="https://docs.google.com/a/stonybrook.edu/document/d/1NkhBWbFPCjgqBYZgST5U4G-DqHbIpJBcySO1E-jFMrc/edit?usp=sharing">HELP CUSTOMER</option>
                           </select> </li>
                    
                </ul>
            </nav>
        </header>
    <body>
        
        
        <%
            try {
              Class.forName("org.gjt.mm.mysql.Driver");
              con = DriverManager.getConnection("jdbc:mysql://localhost/clarifly","root" , "Brooklyn29!");
              // out.println ("database successfully opened.");
              
              cs = con.prepareCall("{call ListofFlights()}");
              rs = cs.executeQuery();
            }
            catch(SQLException e) {
              out.println("SQLException caught: " +e.getMessage());
            }
        %>
        
        <TABLE BORDER="1">
            <TR>
                <TH>AIRLINE ID</TH>
                <TH>FLIGHT NO</TH>
                <TH>SEATS</TH>
                <TH>DAYS OPERATING</TH>
            </TR>
            <% while(rs.next()){ %>
            <TR>
                <TD> <%= rs.getString(1) %></td>
                <TD> <%= rs.getString(2) %></TD>
                <TD> <%= rs.getString(3) %></TD>
                <TD> <%= rs.getString(4) %></TD>
            </TR>
            <% } %>
        </TABLE>
    </body>
</html>
