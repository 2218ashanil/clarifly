<%-- 
    Document   : createEmployee
    Created on : Dec 5, 2017, 8:55:07 PM
    Author     : sai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
        <link rel="stylesheet" type="text/css" media="all" href="createAcc.css"> <!-- Connects a style sheet to code-->
    </head>
    <body>
        <img id = "logo" src="clariFLY.png" alt="logo">

        <div align="center" class = "formholder">  <!-- a div is just a grouping, class is just a group name for CSS styling-->
            <form class = "form" action ="createEmployee" method = "post"> <!-- action is what page its going to next-->
                <label>First Name:</label> <input id="fix" class = "textbox" type = "text" name="First name" placeholder="Jane"required maxlength="15"> <br> <!-- "username is just text, input type is an input (can be button/text/etc), name is variable name-->
                <label>Last Name:</label> <input class = "textbox" type = "text" name="Last name" placeholder="Doe"required maxlength="15"><br>
                <label>Telephone:</label> <input id="fix" class = "textbox" type = "text" name="Telephone" placeholder="xxx-xxx-xxxx"required maxlength="12"  onkeypress='return event.charCode >= 48 && event.charCode <= 57'> <br> 
                <label>Street:</label> <input id="fix" class = "textbox" type = "text" name="Address" placeholder="123 elm Street"required maxlength="50"> <br>
                <label>City:</label> <input id="fix" class = "textbox" type = "text" name="City" placeholder="Brooklyn"required maxlength="15"> <br>
                <label>State:</label> <input id="fix" class = "textbox" type = "text" name="State" placeholder="NY"required maxlength="15"> <br>
                <label>Zip Code:</label> <input id="fix" class = "textbox" type = "text" name="Zipcode" placeholder="11111" required maxlength="15"  onkeypress='return event.charCode >= 48 && event.charCode <= 57'> <br>
                <label>SSN:</label> <input id="fix" class = "textbox" type = "text" name="SSN" placeholder="xxxxxxxxx"  maxlength="9" required  onkeypress='return event.charCode >= 48 && event.charCode <= 57'> <br> 
                <label>Manager (1 - YES, 0 - NO):</label> <input id="fix" class = "textbox" type = "text" name="Manager" placeholder="0"> <br>
                <label>Hourly Rate (00.00):</label> <input id="fix" class = "textbox" type = "text" name="HR" placeholder="00.00"> <br>
                <!--<button type = "button" class = "button" onclick="window.location='employees.jsp'">Go Back</button>--> 
                <input class = "button" type ="submit" value="Create" > 
                <br><br>
            </form>
            
            
    </body>
</html>
