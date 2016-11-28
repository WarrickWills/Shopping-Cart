<%-- 
    Document   : cartempty
    Description: Displays a message when cart is empty
    Created on : 27/04/2016
    Authors    : Adam 0813664; Warrick 13831575
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Empty</title>
        <style>
            div {
                background-color: #4ddbff;
                border: 3px solid blue;
                padding: 5px 5px;
                text-align: center;
                margin-left:auto;
                margin-right:auto;
            }
            a {
                background-color: #0000ff;
                color: white;
                padding: 7px 45px;
                text-align: center;
                text-decoration: none;
                border-radius: 5px;
                width: 15%;
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
                <font size="30px" style="font-weight:bold;vertical-align:top;color:white;">Instrument Shopping Cart</font>
            </center>
        </td>
    </tr>
</table>
<XXX style="float:right"><label>Logged in as: <jsp:getProperty name="users" property="fname"/> <jsp:getProperty name="users" property="lname"/></label></XXX><br />
<XXX style="float:right">
    <form action="LogoutServlet" method="GET">
        <input type="submit" name ="logOut" value="Log out" class= "bodyBut">
    </form>
</XXX>        
<br />
<br />
<div style="width:60%;float:center;">
    <p>
        Your cart is empty.
    </p>
    <br />
    <a href="product.jsp">Return to Product list</a>
    <br />
    <br />
</div>
</body>
</html>
