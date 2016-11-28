<%-- 
    Document   : purchaseconfirmation
    Description: Displays confirmation message
    Created on : Apr 28, 2016, 2:16:48 PM
    Authors    : Adam 0813664; Warrick 13831575
--%>

<%@page import="beans.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success</title>
        <style>
            a.button:link,
            a.button:visited {
                background-color: #3F95EB;
                color: white;
                padding: 5px 5px;
                text-align: center;
                text-decoration: none;
                border-radius: 5px;
                display: inline-block;
                margin: 2px;
            }
            div {
                margin-left:auto;
                margin-right:auto;
            }
            div.form {
                background-color: #4ddbff;
                border: 3px solid blue;
                padding: 5px 5px;
                text-align: center;
            }
            input.bodyBut {
                background-color: #3F95EB;
                color: white;
                padding: 5px 5px;
                text-align: center;
                text-decoration: none;
                border-radius: 5px;
                display: inline-block;
                margin: 2px;
            }
        </style>
    </head>
    <body style="background-color:#b3ffff;">
        <table style="width:100%;" cellpadding="10">
            <tr>
                <td style="background-color:#3F95EB;" >
            <center>
                <img src="images/musiclogo.jpg" alt="" width="60" height="50">
                <font size="30px" style="font-weight:bold;vertical-align:top;color:white;">Purchase Successful</font>
            </center>
        </td>
    </tr>
</table>
<div style="float:right"><label>Logged in as: <jsp:getProperty name="users" property="fname"/> <jsp:getProperty name="users" property="lname"/></label></div>
<br />
<div style="float:right">
    <form action="LogoutServlet" method="GET">
        <input type="submit" name ="logOut" value="Log out" class= "bodyBut">
    </form>
</div>
<br />
<br />
<div class = "form" style="width:60%;float:center;">
    <p>
        <% User user = (User) session.getAttribute("users"); %>
        <% out.println("Owing: " + user.getOwing()); %><br />
        <% out.println("Paid: " + user.getPaid()); %><br />
        <%out.println("Purchase Total: " + user.getTotal());%>
    </p>
</div>
<br />
<div align="center"><a href="product.jsp" class="button">Return to Product List</a></div>
<div align="center"><a href="home.jsp" class="button">Return to Home</a></div>
</body>
</html>
