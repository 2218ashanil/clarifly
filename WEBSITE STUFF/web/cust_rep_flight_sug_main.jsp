<%-- 
    Document   : cust_rep_flight_sug_main
    Created on : Dec 6, 2017, 10:51:16 PM
    Author     : anil
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>clariFLY</title>
        <link rel="stylesheet" type="text/css" media="all" href="customerHome.css">

    </head>
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
     
       
        <h1>Flight Suggestions</h1>
        <h3>Customer Information</h3>
         <div class = "Items">
         <br><br>
        
         <form action="cust_rep_flight_sug.jsp" method="POST">
            <label style="margin-left: 7%">Account Number</label> 
            <input style =" margin-top: 12px; font-size: 2em;"type="number" name="AcctNo"/> 
            <input class = "button" style="margin-left: 5%;"type="submit" value="Submit"/>
        </form>
        </div>
    </body>
</html>
