<%-- 
    Document   : createAccount
    Created on : Dec 3, 2017, 8:08:15 PM
    Author     : User
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
            <form class = "form" action ="createAccount" method = "post"> <!-- action is what page its going to next-->
                <label>First Name:</label> <input id="fix" class = "textbox" type = "text" name="First name" placeholder="Jane"required maxlength="15"> <br> <!-- "username is just text, input type is an input (can be button/text/etc), name is variable name-->
                <label>Last Name:</label> <input class = "textbox" type = "text" name="Last name" placeholder="Doe"required maxlength="15"><br>
                <label>Email:</label> <input id="fix" class = "textbox" type = "email" name="Email" placeholder="email"required maxlength="50"> <br>
                <label>Username:</label> <input id="fix" class = "textbox" type = "text" name="Username" placeholder="username"required maxlength="10" minlength="3"> <br> 
                <label>Password:</label> <input id="fix" class = "textbox" type = "password" name="Password" placeholder="password"required maxlength="15"> <br> 
                <label>Telephone:</label> <input id="fix" class = "textbox" type = "text" name="Telephone" placeholder="xxx-xxx-xxxx"required maxlength="12"  onkeypress='return event.charCode >= 48 && event.charCode <= 57'> <br> 
                <label>Street:</label> <input id="fix" class = "textbox" type = "text" name="Address" placeholder="123 elm Street"required maxlength="50"> <br>
                <label>City:</label> <input id="fix" class = "textbox" type = "text" name="City" placeholder="Brooklyn"required maxlength="15"> <br>
                <label>State:</label> <input id="fix" class = "textbox" type = "text" name="State" placeholder="NY"required maxlength="15"> <br>
                <label>Zip Code:</label> <input id="fix" class = "textbox" type = "text" name="Zipcode" placeholder="11111" required maxlength="15"  onkeypress='return event.charCode >= 48 && event.charCode <= 57'> <br>
                <label>Credit card:</label> <input id="fix" class = "textbox" type = "text" name="Credit" placeholder="xxxxxxxxxxxxxxxx"  maxlength="16" required  onkeypress='return event.charCode >= 48 && event.charCode <= 57'> <br> 
                 <button type = "button" class = "button" onclick="window.location='index.jsp'">Go Back</button> 
                <input class = "button" type ="submit" value="Create" > 
                <br><br>
            </form>
    </body>
</html>
