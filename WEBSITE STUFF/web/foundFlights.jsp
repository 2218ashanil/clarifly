<%-- 
    Document   : foundFlights
    Created on : Dec 6, 2017, 2:07:49 AM
    Author     : User
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>clariFLY</title>
        <link rel="stylesheet" type="text/css" media="all" href="foundFlights.css"> <!-- Connects a style sheet to code-->
       
    </head>
     <%!
          ArrayList< ArrayList<String> > flights ;
          int amountOfFlights;
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
                        <li><button type = "submit" class = "button" >MY ACCOUNT</button> </li>
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
                        <li><button type = "submit" class = "button" >HELP</button> </li>
                    </form>
                </ul>
            </nav>
        </header>
    <body>
        <div class ="flights">
            <%
                flights = (ArrayList< ArrayList<String> >)request.getAttribute("flights");
                amountOfFlights = flights.size()/2;
                
            for(int i = 0; i<amountOfFlights; i++) {
            %>
            <div class ="flightInfo">
                <form action ="buyOneWay" method = "post"> 
                    <ul>
                        <li><label >Flight <%=flights.get(i).get(1)%> - <%=flights.get(i + 1).get(0)%> | </label></li> 
                        <li><label > From : <%=flights.get(i + 1).get(1)%> | </label></li> 
                        <li><label>To : <%=flights.get(i + 1).get(2)%></label></li> <br><br>
                        <li><label >Seats Left : <%=flights.get(i).get(3)%> | </label></li> 
                        <li><label>Depart : <%=flights.get(i).get(6)%> | </label></li> 
                        <li><label>Arrive : <%=flights.get(i).get(7)%></label></li> 
                        <li><label >Cost : $<%=((Integer.parseInt(flights.get(i+1).get(3)) * 150) + 50) %></label></li> 
                         
                        <input type="hidden" name="username" value="<%=(String )request.getParameter("username") %>"> 
                          <input type="hidden" name="flightNo" value="<%= flights.get(i).get(1) %>"> 
                           <input type="hidden" name="airlineId" value="<%= flights.get(i).get(0) %>"> 
                            <input type="hidden" name="tickets" value="<%=((Integer.parseInt(flights.get(i+1).get(3)))) %>"> 
                             <input type="hidden" name="legNo" value="<%=flights.get(i).get(2) %>"> 
                        <li><input id = "button" type ="submit" value="PURCHASE" > </li>
                    </ul>
                </form>
            </div>
            <% } %>
            
            
        </div>
    </body>
</html>
