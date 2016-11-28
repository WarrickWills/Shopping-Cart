<%-- 
    Document   : searchresults
    Description: Displays table of results from search
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
<a href="home.jsp" class="button">Return to Home</a>
<div style="float:right"><label>Logged in as: <jsp:getProperty name="users" property="fname"/> <jsp:getProperty name="users" property="lname"/></label></div>
<br />
<a href="searchproduct.jsp" class="button">Search Product Name</a>
<div style="float:right">
    <form action="LogoutServlet" method="GET">
        <input type="submit" name ="logOut" value="Log out" class= "bodyBut">
    </form>
</div>
<br />
<a href="product.jsp" class="button">View Product List</a>
<br />
<a href="CartServlet" class="button">View Cart</a>
<br />
<table border="10" style="width:100%">
    <tr>
        <td style="background-color:#3F95EB;" colspan="5">
    <center>
        <font size="5px" style="font-weight:bold;vertical-align:top;color:white;">Queried Products</font>
    </center>
</td>
</tr>
<tr>
    <th>
        ID
    </th>
    <th>
        Name
    </th>
    <th>
        Description
    </th>
    <th>
        Price($)
    </th>
    <th>
        Add to Cart
    </th>
</tr>
<% ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("productsearch");
    for (Product p : products) {%>
<tr>
    <td>
        <% out.println(p.getId());%>
    </td>
    <td>
        <% out.println(p.getProduct());%>
    </td>
    <td>
        <% out.println(p.getDescription());%>
    </td>
    <td>
        <% out.println(p.getPrice());%>
    </td>
    <td>
        <form action="CartAddToServlet" method="POST">
            <input type="submit" value="Add to Cart" style="width:100%;">
            <input type="hidden" name="addBut" value="<%out.println(p.getId());%>">
        </form>
    </td>
</tr>
<%}%>
</table>
</body>
</html>
