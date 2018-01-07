<%-- 
    Document   : purchaseComplete
    Created on : Dec 6, 2017, 6:23:49 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>clariFLY</title>
        <link rel="stylesheet" type="text/css" media="all" href="purchaseComplete.css"> <!-- Connects a style sheet to code-->
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
                        <li><button type = "submit" class = "button" >HELP</button> </li>
                    </form>
                     
                </ul>
            </nav>
        </header>
    <body>
        <div>
            PURCHASE COMPLETE!<br><br><br>
            Enjoy The Trip!
        </div>
    </body>
    

</html>
