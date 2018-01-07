<%-- 
    Document   : customerHome
    Created on : Dec 4, 2017, 4:38:06 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>clariFLY</title>
        <link rel="stylesheet" type="text/css" media="all" href="customerHome.css"> <!-- Connects a style sheet to code-->
    <%! String user;%>
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
        <% user = (String )request.getParameter("username"); %>
        <div id = "One" class = "Items" style="visibility: visible;">
            <form action ="cust_rep_reserve" method = "post"> 
            <ul>
                <label>Account Number</label>
                <input id="fix" type = "text" name="AccountNo" value="" required maxlength="50"> <br><br><br>
                <li><label>Flying From</label></li> 
                <li><label>Flying To</label></li> <br> <br>
             <li><select name="departAirport" required>
                    <option value="1">Berlin Tegel</option>
                    <option value="2">Chicago O'Hare Int.</option>
                    <option value="3">Atlanta Int.</option>
                    <option value="4">Ivato Int.</option>
                    <option value="5">JFK</option>
                    <option value="6">LaGuardia</option>
                    <option value="7">Logan Int.</option>
                    <option value="8">London Heathrow</option>
                    <option value="9">Lax</option>
                    <option value="10">San Francisco Int.</option>
                    <option value="11">Tokyo Int.</option>
                    
                 </select></li>
             <li><select name="toAirport" required>
                    <option value="1">Berlin Tegel</option>
                    <option value="2">Chicago O'Hare Int.</option>
                    <option value="3">Atlanta Int.</option>
                    <option value="4">Ivato Int.</option>
                    <option value="5">JFK</option>
                    <option value="6">LaGuardia</option>
                    <option value="7">Logan Int.</option>
                    <option value="8">London Heathrow</option>
                    <option value="9">Lax</option>
                    <option value="10">San Francisco Int.</option>
                    <option value="11">Tokyo Int.</option>
                 </select></li> <br><br>
                  <li><label>Depart Date</label></li> 
                  
                  <li><label>Tickets</label></li><br> <br>
                 <li><input id="date" type="date" name= "departdate"value="departdate" required></li>
                 
                 
                 <li><select name="tickets" required>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                     </select></li> <br><br><br>
                     
                     <li><label>Airline</label>
                         
                     <li><label>Flight</label>
                         
                     <li><label>Leg</label></li><br><br> 
                 <li><select name="airlineId" required>
                    <option value="1">Air Berlin</option>
                    <option value="2">Air Japan</option>
                    <option value="3">Air Madagascar</option>
                    <option value="4">American Airlines</option>
                    <option value="5">British Airways</option>
                    <option value="6">Delta Airlines</option>
                    <option value="7">JetBlue Airways</option>
                    <option value="8">Lufthansa</option>
                    <option value="9">Southwest Airlines</option>
                    </select></li> 
                     
                    <li><select name="flightNo" required>
                    <option value="111">111</option>
                    <option value="133">133</option>
                     </select></li> 
                     
                     <li><select name="legNo" required>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                         </select></li> <br><br><br><br><br>
                     
                      <input type="hidden" name="username" value="<%=(String )request.getParameter("username") %>"> 
                 <li><input id = "button" type ="submit" value="Reserve" > </li>
            </ul>
            </form>
        </div>
        
    </body>
</html>
