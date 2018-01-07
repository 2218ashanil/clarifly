<%-- 
    Document   : myAuctions
    Created on : Dec 7, 2017, 2:34:52 AM
    Author     : User
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.CallableStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>clariFLY</title>
        <link rel="stylesheet" type="text/css" media="all" href="foundFlights.css"> 
    </head>
      <%!
        java.sql.Connection con;
        CallableStatement cs;
        PreparedStatement ps;
        ResultSet rs;
        HttpServletRequest request ;
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
      <%
            try {
              Class.forName("org.gjt.mm.mysql.Driver");
              con = DriverManager.getConnection("jdbc:mysql://localhost/clarifly","root" , "Brooklyn29!");
              
            PreparedStatement ps = con.prepareCall("SELECT * from auctions ");
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) { %>
           <div class =" flights">
            <div class ="flightInfo">
                <form action ="betAuction" method = "post"> 
                    <ul>
                        <li><label>Auction Id#: <%= rs.getString(8) %> </label></li> 
                        <li><label>Host #: <%= rs.getString(1) %> </label></li> 
                        <li><label>Airline #: <%= rs.getString(2) %> </label></li> 
                        <li><label>Flight #: <%= rs.getString(3) %> </label></li> 
                        <li><label>Class: <%= rs.getString(4) %> </label></li> 
                         <li><label>Date Bid: <%= rs.getString(5) %> </label></li> 
                        <li><label>Top Bid:$ <%= rs.getString(6) %> </label></li> 
                         <li><label>Top Bidder : <%= rs.getString(7) %> </label></li> 
                        
                        <input type="hidden" name="username" value="<%=(String )request.getParameter("username") %>"> 
                         <input type="hidden" name="bid" value="10">  
                         <input type="hidden" name="id" value="<%= rs.getString(8) %>">  
                         <input type="hidden" name="old" value="<%= rs.getString(6) %>">  
                        <li><input id = "button" type ="submit" value="BID 10!" > </li>
                        <li><iframe src="http://free.timeanddate.com/countdown/i60hxt8n/n179/cf12/cm0/cu4/ct0/cs0/ca0/co0/cr0/ss0/cac000/cpc000/pcfff/tcfff/fs100/szw320/szh135/iso2017-12-15T01:00:00/bo2/pd2" allowTransparency="true" frameborder="0" width="122" height="33"></iframe></li>
                        
                    </ul>
                </form>
              </div>
           </div>
            
        
        
        
        
        
        
        <%}
        }catch(SQLException e) {
              out.println("SQLException caught: " +e.getMessage());
            }
            %>
    </body>
</html>
