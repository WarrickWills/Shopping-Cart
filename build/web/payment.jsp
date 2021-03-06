<%-- 
    Document   : payment
    Description: Displays form to enter amount to pay
    Created on : 25/04/2016, 10:31:39 PM
    Authors    : Adam 0813664; Warrick 13831575
--%>

<%@page import="beans.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
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
            input.formBut {
                background-color: #0000ff;
                color: white;
                padding: 7px 15px;
                text-align: center;
                text-decoration: none;
                border-radius: 5px;
                display: inline-block;
            }
            p {
                background-color: #4ddbff;
                border: 3px solid blue;
                padding: 5px 5px;
                text-align: center;
            }
            div {
                margin-left:auto;
                margin-right:auto;
            }
            input.textIn {
                width: 60%;
                padding: 8px 15px;
                margin: 8px 0;
                display: inline-block;
                text-align: left;
            }
        </style>
    </head>
    <jsp:useBean id="users" class="beans.User" scope="session"/>
    <body style="background-color:#b3ffff;">
        <table style="width:100%;" cellpadding="10">
            <tr>
                <td style="background-color:#3F95EB;" >
            <center>
                <img src="images/musiclogo.jpg" alt="" width="60" height="50">
                <font size="30px" style="font-weight:bold;vertical-align:top;color:white;">Instrument Shopping Cart</font>
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
<div style="width:60%;float:center;">

    <form action="PaymentServlet" method="POST" align="center">
        <p>
            <label><b>How much do you want to pay($):</b><br />
                <% User user = (User) session.getAttribute("users"); %>
                <input type="number" step ="0.01" name="payAmount" pattern ="^\d+((\.)\d{2})?$" min ="0" max ="<% out.print(user.getOwing()); %>" placeholder ="Enter number here (You currently owe: <% out.print(user.getOwing());%>)" class = "textIn" required>
            </label>
            <br />
            <input type="submit" value="Pay" class= "formBut">
        </p>
    </form>
    <br />
    <div align="center"><a href="home.jsp" class="button">Return to Home</a>
    </div>
</div>
</body>

</html>