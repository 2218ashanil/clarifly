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
    </head>
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
                        <li><button type = "submit" class = "button" >MY RECCOMENDATIONS</button> </li>
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
        
        <div class = "Search">
            <ul>
             <li><button type = "button" class = "button" onclick="showOne()">One Way</button> </li>
             <li><button type = "button" class = "button" onclick="showRound()">Roundtrip</button> </li>
             <li><button type = "button" class = "button" onclick="showMulti()" >Multi-City</button> </li>
             </ul>
        </div>
         
        <div id = "One" class = "Items" style="visibility: visible;">
            <form action ="searchOneWay" method = "post"> 
            <ul>
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
                     </select></li> <br><br><br><br><br><br><br><br>
                     
                      <input type="hidden" name="username" value="<%=(String )request.getParameter("username") %>"> 
                 <li><input id = "button" type ="submit" value="SEARCH ONE WAY" > </li>
            </ul>
            </form>
        </div>
        
        <div id = "Round" class = "Items" style="visibility: hidden">
            <form action ="searchRoundTrip" method = "post"> 
            <ul>
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
                  <li><label>Return Date</label></li> 
                  <li><label>Tickets</label></li><br> <br>
                 <li><input id="date" type="date" name= "departdate"value="departdate" required></li>
                 <li><input id="date" type="date" name = "returndate" value="returndate" required></li> 
                 
                 <li><select name="tickets" required>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                     </select></li> <br><br><br><br><br><br><br><br>
                      <input type="hidden" name="username" value="<%=(String )request.getParameter("username") %>"> 
                 <li><input id = "button" type ="submit" value="SEARCH ROUNDTRIP" > </li>
            </ul>
            </form>
        </div>
        
        <div id = "Multi" class = "Items" style="visibility: hidden">
            <form action ="searchMultiTrip" method = "post"> 
                <ul>
                     <input type="hidden" name="username" value="<%=(String )request.getParameter("username") %>"> 
                <li><label>Flying From</label></li> 
                <li><label>Flying To</label></li> <br> <br>
             <li><select name="departAirport1" required>
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
             <li><select name="toAirport1" required>
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
                     </select></li> <br> <hr>
                     
                     <li><label>Flying From</label></li> 
                <li><label>Flying To</label></li>
                <li><label>Depart Date</label></li>  <br> <br>
             <li><select name="departAirport2" required>
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
             <li><select name="toAirport2" required>
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
                 <li><input id="date" type="date" name= "departdate"value="departdate" required></li> <hr>
                 
                 <li><label>Flying From</label></li> 
                <li><label>Flying To</label></li>
                <li><label>Depart Date</label></li>  <br> <br>
             <li><select name="departAirport3" required>
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
             <li><select name="toAirport3" required>
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
                 <li><input id="date" type="date" name= "departdate"value="departdate" required></li>
                 
                </select></li> <br><br><br><br>
                 <li><input id = "button" type ="submit" value="SEARCH MULTI FLIGHT" > </li>
            </ul>
            </form>
        </div>
        
        
        <script type="text/javascript" >
        function showOne()
        {
            var x = document.getElementById("Round");
            var y = document.getElementById("One");
            var z = document.getElementById("Multi");
            if (y.style.visibility === "hidden") {
                y.style.visibility = "visible";
                x.style.visibility = "hidden";
                z.style.visibility = "hidden";
            }
        
        }
        function showRound()
        {
            var x = document.getElementById("Round");
            var y = document.getElementById("One");
            var z = document.getElementById("Multi");
            if (x.style.visibility === "hidden") {
                x.style.visibility = "visible";
                y.style.visibility = "hidden";
                z.style.visibility = "hidden";
            }
        }
        function showMulti()
        {
            var x = document.getElementById("Round");
            var y = document.getElementById("One");
            var z = document.getElementById("Multi");
            if (z.style.visibility === "hidden") {
                z.style.visibility = "visible";
                x.style.visibility = "hidden";
                y.style.visibility = "hidden";
            }
        }
            
        </script>
    </body>
</html>
