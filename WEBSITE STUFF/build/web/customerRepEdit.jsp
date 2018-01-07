<%-- 
    Document   : customerRepEdit
    Created on : Dec 5, 2017, 10:38:14 PM
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
        <link rel="stylesheet" type="text/css" media="all" href="cust_rep.css">

    </head>
    <%!
        String fname, lname, address, city, state, telephone, manager, hr;
        String zipcode, updated, empID;
        
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
        empID = (String)request.getAttribute("empID");
        fname = (String)request.getAttribute("fname");
        lname = (String)request.getAttribute("lname");
        address = (String)request.getAttribute("address");
        city = (String)request.getAttribute("city");
        state = (String)request.getAttribute("state");
        telephone = (String)request.getAttribute("telephone");
        zipcode = (String) request.getAttribute("zipcode");
        manager = (String)request.getAttribute("manager");
        updated = (String)request.getAttribute("updated");
        hr = (String)request.getAttribute("hr"); 
        String updated = (String)request.getAttribute("updated");
     %>
     <div style ="margin-left: 35%">
         <h1>Edit Customer Information</h1>
        <form action="EditRepServe2" method="POST">
        <label>Employee ID:</label> <input id="fix" class = "textbox" type = "text" name="Employee ID" value="<%=Integer.parseInt(empID)%>" required maxlength="50"readonly> <br> <!-- "username is just text, input type is an input (can be button/text/etc), name is variable name-->
       <label>First Name:</label> <input id="fix" class = "textbox" type = "text" name="First name" value="<%=fname%>" required maxlength="50"> <br> <!-- "username is just text, input type is an input (can be button/text/etc), name is variable name-->
        <label>Last Name:</label> <input class = "textbox" type = "text" name="Last name" value="<%=lname%>"required maxlength="50"><br>

        <label>Telephone:</label> <input id="fix" class = "textbox" type = "text" name="Telephone" value="<%=telephone%>"  maxlength="12" required> <br> 
        <label>Street:</label> <input id="fix" class = "textbox" type = "text" name="Address" value="<%=address%>"required maxlength="50"> <br>
        <label>City:</label> <input id="fix" class = "textbox" type = "text" name="City" value="<%=city%>"required maxlength="15"> <br>
        <label>State:</label> <input id="fix" class = "textbox" type = "text" name="State" value="<%=state%>"required maxlength="15"> <br>
        <label>Zip Code:</label> <input id="fix" class = "textbox" type = "text" name="Zipcode" value="<%=Integer.parseInt(zipcode)%>"required maxlength="15"> <br>
        <label>Manager (1 - YES, 0 - NO) :</label> <input id="fix" class = "textbox" type = "text" name="Manager" value="<%=Integer.parseInt(manager)%>"   required> <br> 
        <label>Hourly Rate:</label> <input id="fix" class = "textbox" type = "text" name="HR" value="<%=Double.parseDouble(hr)%>"   required> <br> 
       <input <button class = "button" type="Submit" value="Submit"/>
       </form>
       
</div>
        </body>
</html>
