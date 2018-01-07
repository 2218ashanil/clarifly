<%-- 
    Document   : customerRepSuccess
    Created on : Dec 6, 2017, 10:40:57 AM
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
        
        <h1>SuccessFully Updated!</h1>
        
    </body>
</html>