<%-- 
    Document   : index
    Created on : Dec 3, 2017, 7:56:26 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>clariFLY</title>
         <link rel="stylesheet" type="text/css" media="all" href="indexJSP.css"> <!-- Connects a style sheet to code-->
    </head>
   
    <body> <!-- all real code goes in body-->
           <img id = "logo" src="clariFLY.png" alt="logo">
        <div align="center" class = "formholder">  <!-- a div is just a grouping, class is just a group name for CSS styling-->
            <form class = "form" action ="signin" method = "post"> <!-- action is what page its going to next-->
                <input id="fix" class = "textbox" type = "text" name="username" placeholder="user" maxlength="15"> <br> <!-- "username is just text, input type is an input (can be button/text/etc), name is variable name-->
                <input class = "textbox" type = "password" name="password" placeholder="password" maxlength="15"><br>
                <input class = "button" type ="submit" value="Sign In" >
                <button type = "button" class = "button" onclick="window.location='createAccount.jsp'">Create Account</button> <br><br><!-- button to go to create account page-->
                Forgot Password <br> <br>
                <% if(request.getAttribute("err") != null){ %>
              INCORRECT USER OR PASSWORD 
            <% } %>
             <% if(request.getAttribute("createdAcc") != null){ %>
              ACCOUNT MADE 
            <% } %>
            </form>
            
        </div>
    </body>
</html>

