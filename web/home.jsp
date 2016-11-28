<%-- 
    Document   : home
    Description: Homepage
    Created on : 23/04/2016, 5:52:27 PM
    Authors    : Adam 0813664; Warrick 13831575
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="beans.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
        <style>
            a.bodyBut {
                background-color: #0000ff;
                color: white;
                padding: 7px 45px;
                text-align: center;
                text-decoration: none;
                border-radius: 5px;
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
<div style="float:right"><label>Logged in as: <jsp:getProperty name="users" property="fname"/> <jsp:getProperty name="users" property="lname"/></label></div><br />
<div style="float:right">
    <form action="LogoutServlet" method="GET">
        <input type="submit" name ="logOut" value="Log out" class= "bodyBut">
    </form>
</div>
<marquee scrollamount="30" behavior="slide"><H1>Welcome <jsp:getProperty name="users" property="fname"/> <jsp:getProperty name="users" property="lname"/>  !!</H1></marquee>
<div style="width:60%;float:center;">
    <p>
        <br />
        <a href="product.jsp" class= "bodyBut">View All Products</a><br /><br />
        <a href="searchproduct.jsp" class= "bodyBut">Search Product Name</a><br /><br />
        <a href="accountinfo.jsp" class ="bodyBut">Account Details</a><br /><br />
        <a href="payment.jsp" class ="bodyBut">Make Payment</a><br /><br />
    </p>
</div>
</body>
</html>
