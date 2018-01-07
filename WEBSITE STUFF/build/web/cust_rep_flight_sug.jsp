<%-- 
    Document   : cust_rep
    Created on : Nov 16, 2017, 1:12:56 AM
    Author     : Ashley Anil
--%>

<%@page import="java.util.ArrayList"%>
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
        HttpServletRequest request ;
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
            //out.println("here");
            String acct = request.getParameter("AcctNo");
            //out.println("here");
            int acctno = Integer.parseInt(acct);
            request.setAttribute("acctnumber", acctno);
            CallableStatement cs = con.prepareCall("{call clarifly.CustomerPlaces(?)}");
            cs.setInt(1,acctno);
            ResultSet rs = cs.executeQuery();
            ArrayList<String> places = new ArrayList<String>();
            while(rs.next()){
                if(!places.contains(rs.getString(1))){
                    places.add(rs.getString(1));
                }
                if(!places.contains(rs.getString(2))){
                    places.add(rs.getString(2));
                }
            }
            %>
        <h1>Customer Flight Suggestions</h1>
        <%
            for(int i=0; i<places.size(); i++){
               String place = places.get(i);
               cs = con.prepareCall("{call clarifly.FlightsForAirport(?)}");
                cs.setString(1,place);
            rs = cs.executeQuery();
        %>
        <h3> <%=place %> </h3>
        <TABLE BORDER="1">
            <TR>
                <TH>Airline Name</TH>
                <TH>Flight Number</TH>
                <TH>Leg Number</TH>
                <TH>Departing Airport</TH>
                <TH>Arriving Airport</TH>
                <TH>Departing Time</TH>
                <TH>Arriving Time</TH>
                
            </TR>
            <% while(rs.next()){ %>
            <TR>
                <TD> <%= rs.getString(1) %></td>
                <TD> <%= rs.getInt(2) %></TD>
                <TD> <%= rs.getInt(3) %></TD>
                <TD> <%= rs.getString(4) %></TD>
                <TD> <%= rs.getString(5) %></TD>
                <TD> <%= rs.getDate(6) %></TD>
                <TD> <%= rs.getDate(7) %></TD>
            </TR>
            <% } %>

        </TABLE>
               
            <% }
            
            }
            catch(SQLException e) {
              out.println("SQLException caught: " +e.getMessage());
            }
        %>

    </body>
</html>