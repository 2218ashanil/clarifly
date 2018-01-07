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
    <%!
        String fname, lname, email, address, city, state, credit, telephone;
        String zipcode, rating, updated, acctno, preference;
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
        <h1>Edit Customer Information</h1>
        
        <%
        acctno = (String)request.getAttribute("acctno");
        fname = (String)request.getAttribute("fname");
        lname = (String)request.getAttribute("lname");
        email = (String)request.getAttribute("email");
        address = (String)request.getAttribute("address");
        city = (String)request.getAttribute("city");
        state = (String)request.getAttribute("state");
        credit = (String)request.getAttribute("credit");
        telephone = (String)request.getAttribute("telephone");
        zipcode = (String) request.getAttribute("zipcode");
        rating = (String)request.getAttribute("rating");
        updated = (String)request.getAttribute("updated");
        preference = (String)request.getAttribute("preference"); 
     %>
     <div class="Items">
        <form action="cust_by_acct2" method="POST">
            
        <label style="margin-left: 300px; margin-top: 100px;">Account Number:</label> <input id="fix" class = "textbox" type = "text" name="Account Number" value="<%=Integer.parseInt(acctno)%>" required maxlength="50"readonly> <br> <!-- "username is just text, input type is an input (can be button/text/etc), name is variable name-->
       <label style="margin-left: 300px; margin-top: 100px;">First Name:</label> <input id="fix" class = "textbox" type = "text" name="First name" value="<%=fname%>" required maxlength="50"> <br> <!-- "username is just text, input type is an input (can be button/text/etc), name is variable name-->
        <label style="margin-left: 300px; margin-top: 100px;">Last Name:</label> <input class = "textbox" type = "text" name="Last name" value="<%=lname%>"required maxlength="50"><br>
        <label style="margin-left: 300px; margin-top: 100px;">Email:</label> <input id="fix" class = "textbox" type = "email" name="Email" value="<%=email%>"required maxlength="50"> <br>
        <label style="margin-left: 300px; margin-top: 100px;">Telephone:</label> <input id="fix" class = "textbox" type = "text" name="Telephone" value="<%=telephone%>"  maxlength="12" required> <br> 
        <label style="margin-left: 300px; margin-top: 100px;">Street:</label> <input id="fix" class = "textbox" type = "text" name="Address" value="<%=address%>"required maxlength="50"> <br>
        <label style="margin-left: 300px; margin-top: 100px;">City:</label> <input id="fix" class = "textbox" type = "text" name="City" value="<%=city%>"required maxlength="15"> <br>
        <label style="margin-left: 300px; margin-top: 100px;">State:</label> <input id="fix" class = "textbox" type = "text" name="State" value="<%=state%>"required maxlength="15"> <br>
        <label style="margin-left: 300px; margin-top: 100px;">Zip Code:</label> <input id="fix" class = "textbox" type = "text" name="Zipcode" value="<%=Integer.parseInt(zipcode)%>"required maxlength="15"> <br>
        <label style="margin-left: 300px; margin-top: 100px;">Credit card:</label> <input id="fix" class = "textbox" type = "text" name="Credit" value="<%=credit%>"  maxlength="16" required> <br> 
        <label style="margin-left: 300px; margin-top: 100px;">Preference:</label> <input id="fix" class = "textbox" type = "text" name="Preference" value="<%=preference%>"  maxlength="50" required> <br> 
       <input style="margin-left: 300px; margin-top: 100px;" class = "button"type="Submit" value="Submit"/>
       </form>
        <%
           if(!request.getAttribute("updated").equals("not")){
       %>
       UPDATE SUCCESS
       <% } %>
    </div>
        </body>
</html>
