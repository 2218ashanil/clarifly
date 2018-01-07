<%-- 
    Document   : myReservations
    Created on : Dec 6, 2017, 7:34:17 AM
    Author     : User
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.CallableStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>clariFLY</title>
        <link rel="stylesheet" type="text/css" media="all" href="foundFlights.css"> 
    </head>
    <%!
          ArrayList< ArrayList<String> > res ;
          int amountOfFlights;
          int index;
      %>
    <header>
            <img id = "logo" src="clariFLY.png" alt="logo">
            <nav>
                <ul>
                    <form action ="tabs" method = "post"> 
                         <input type="hidden" name="username" value="<%=(String )request.getParameter("username") %>"> 
                         <input type="hidden" name="tab" value="home"> 
                        <li><button type = "submit" class = "button" >HOME</button> </li>
                     </form>
                    <form action ="tabs" method = "post"> 
                         <input type="hidden" name="username" value="<%=(String )request.getParameter("username") %>">
                         <input type="hidden" name="tab" value="acc"> 
                        <li><button type = "submit" class = "button" >MY RECOMMENDATIONS</button> </li>
                    </form>
                    <form action ="tabs" method = "post"> 
                         <input type="hidden" name="username" value="<%=(String )request.getParameter("username") %>"> 
                         <input type="hidden" name="tab" value="res"> 
                        <li><button type = "submit" class = "button" >MY RESERVATIONS</button> </li>
                    </form>
                    <form action ="tabs" method = "post"> 
                         <input type="hidden" name="username" value="<%=(String )request.getParameter("username") %>"> 
                         <input type="hidden" name="tab" value="auc"> 
                        <li><button type = "submit" class = "button" >MY AUCTIONS</button> </li>
                    </form>
                    <form action ="tabs" method = "post"> 
                       
                         <li><button type = "button" class = "button" onclick="window.location='index.jsp'">LOG OUT</button> </li>
                    </form>
                    <form action ="tabs" method = "post"> 
                         <input type="hidden" name="username" value="<%=(String )request.getParameter("username") %>"> 
                          <input type="hidden" name="tab" value="help"> 
                        <li><select name="HELP" value="HELP" onchange="location = this.value;">
                                <option >HELP</option>
                            <option value="https://docs.google.com/a/stonybrook.edu/document/d/1nVfI-FAZMTHMlStglX6QR4O7nQ53vwZxJfIkLLIqYsM/edit?usp=sharing">HELP MANAGER</option>
                            <option value="https://docs.google.com/a/stonybrook.edu/document/d/11Tlfvj21bgbuI-BSpa0dwPs0FJPdm-Jwb-UuyE5EE90/edit?usp=sharing">HELP REP</option>
                            <option value="https://docs.google.com/a/stonybrook.edu/document/d/1NkhBWbFPCjgqBYZgST5U4G-DqHbIpJBcySO1E-jFMrc/edit?usp=sharing">HELP CUSTOMER</option>
                           </select> </li>
                    </form>
                     
                </ul>
            </nav>
        </header>
    <body>
       <div class =" flights">
        <%
             res = (ArrayList< ArrayList<String> >)request.getAttribute("res");
             amountOfFlights = res.size()/2;
                int poop = 0;
            for(int i = 0; i<amountOfFlights*2; i+=2) {
            %>
             
            <div class ="flightInfo">
                <form action ="sendAuction" method = "post"> 
                    <ul>
                        <li><label>Res#: <%= res.get(i).get(0) %> </label></li> 
                        <li><label>Acc#: <%= res.get(i).get(1) %></label></li> 
                        <li><label>Date: <%= res.get(i).get(2) %></label></li>
                        <li><label>Fee:$ <%= res.get(i).get(3) %></label></li> 
                        <li><label>Tickets:<%= res.get(i).get(4) %> </label></li> 
                        <li><label>Class:<%= res.get(i).get(5) %> </label></li> 
                        <li><label>Total:$ <%= res.get(i).get(6) %></label></li> 
                        <li><label>Meal: <%= res.get(i).get(7) %></label></li> 
                        <input type="hidden" name="username" value="<%=(String )request.getParameter("username") %>"> 
                         <input type="hidden" name="accNo" value="<%= res.get(i).get(1) %>"> 
                         <input type="hidden" name="class" value="<%= res.get(i).get(5) %>"> 
                         <input type="hidden" name="flightNo" value="<%=res.get(i+1).get(7)%>"> 
                         <input type="hidden" name="airlineName" value="<%=res.get(i+1).get(6)%>">  
                         <input type="hidden" name="res" value="<%= res.get(i).get(0) %>">  
                        <li><input id = "button" type ="submit" value="SEND TO AUCTION" > </li>
                        
                    </ul>
                </form>
              </div>
                <div class ="flightInfo">
                    <ul>
                        <li> <label>ITINERARY : </li> <br>
                          <li><label>  FIRST NAME:   <%=res.get(i+1).get(0)%></label> </li>    
                         <li> <label>  LAST NAME:   <%=res.get(i+1).get(1)%> </label></li>  
                        <li> <label>   ACC NO:   <%=res.get(i+1).get(2)%> </label> </li> 
                       <li>  <label>   RESR NO:   <%=res.get(i+1).get(3)%></label> </li>  
                        <li> <label>   TICKETS:  <%=res.get(i+1).get(4)%> </label> </li>  
                        <li> <label>   CLASS:  <%=res.get(i+1).get(5)%>   </label></li> 
                        <li>  <label>  DEPART:  <%=res.get(i+1).get(6)%>  </label>  </li>
                        <li>  <label>  FLIGHT NO:  <%=res.get(i+1).get(7)%>  </label> </li>
                        <li>  <label>  LEG #  <%=res.get(i+1).get(8)%> </label>  </li>
                        <li>  <label>  DEPART TIME:   <%=res.get(i+1).get(9)%> </label></li>  
                        <li>  <label>  FROM:   <%=res.get(i+1).get(10)%>   </label></li>
                        <li>  <label> TIME:   <%=res.get(i+1).get(11)%> </label> </li> 
                        <li>  <label> TO:   <%=res.get(i+1).get(12)%> </label>  </li> 
                    </ul>
              </div>    
           <% poop++;} %>
             </div>
    </body>

    
</html>
