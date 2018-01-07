<%-- 
    Document   : myAccount
    Created on : Dec 7, 2017, 4:59:22 AM
    Author     : User
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
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
        <link rel="stylesheet" type="text/css" media="all" href="customerHome.css"> 
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
    <div class = "hi"> 
         <%
            try {
              Class.forName("org.gjt.mm.mysql.Driver");
              con = DriverManager.getConnection("jdbc:mysql://localhost/clarifly","root" , "Brooklyn29!");
            
            String queryCheck = "SELECT Id from customer WHERE Username = ?"; 
            PreparedStatement ps = con.prepareStatement(queryCheck);   
            ps.setString(1,(String )request.getParameter("username") );                                 
            ResultSet ss = ps.executeQuery();  
            String acct="";
            if(ss.next())
                acct = (ss.getString(1)); 
            
            //out.println("here");
            int acctno = Integer.parseInt(acct);
            request.setAttribute("acctnumber", acctno);
            CallableStatement cs = con.prepareCall("{call clarifly.CustomerPlaces(?)}");
            cs.setInt(1,acctno);
            ResultSet rs = cs.executeQuery();
            ArrayList<String> places = new ArrayList<String>();
            while(rs.next()){
                if(!places.contains(rs.getString(1))){
                    places.add(rs.getString(1));
                }
                if(!places.contains(rs.getString(2))){
                    places.add(rs.getString(2));
                }
            }
            %>
        <h1>Customer Flight Suggestions</h1>
        <%
            for(int i=0; i<places.size(); i++){
               String place = places.get(i);
               cs = con.prepareCall("{call clarifly.FlightsForAirport(?)}");
                cs.setString(1,place);
            rs = cs.executeQuery();
        %>
        <h2> <%=place %> </h2>
        <TABLE BORDER="1">
            <TR>
                <TH>Airline Name</TH>
                <TH>Flight Number</TH>
                <TH>Leg Number</TH>
                <TH>Departing Airport</TH>
                <TH>Arriving Airport</TH>
                <TH>Departing Time</TH>
                <TH>Arriving Time</TH>
                
            </TR>
            <% while(rs.next()){ %>
            <TR>
                <TD> <%= rs.getString(1) %></td>
                <TD> <%= rs.getInt(2) %></TD>
                <TD> <%= rs.getInt(3) %></TD>
                <TD> <%= rs.getString(4) %></TD>
                <TD> <%= rs.getString(5) %></TD>
                <TD> <%= rs.getDate(6) %></TD>
                <TD> <%= rs.getDate(7) %></TD>
            </TR>
            <% } %>

        </TABLE>
               
            <% }
            
            }
            catch(SQLException e) {
              out.println("SQLException caught: " +e.getMessage());
            }
        %>
</div> 
    </body>
</html>
