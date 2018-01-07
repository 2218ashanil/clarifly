<%-- 
    Document   : practice
    Created on : Dec 3, 2017, 3:17:28 PM
    Author     : anil
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
    <body>
        
        <h2 style="font-size: 2em; margin-left: 35%;">Reservation Successfully Added</h2>       
        </body>
</html>
