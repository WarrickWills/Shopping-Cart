<%-- 
    Document   : signout
    Description: Displays signout message
    Created on : 22/04/2016, 10:47:18 AM
    Authors    : Adam 0813664; Warrick 13831575
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            // Stops ability to go back as user signed out and session is finished
            window.location.hash = "no-back-button";
            window.location.hash = "Again-No-back-button"; //For chrome, first hash not in history
            window.onhashchange = function () {
                window.location.hash = "no-back-button";
            };
        </script>
        <title>Signed Out</title>
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
<br />
<div style="width:60%;float:center;">
    <p>
        Sign out successful.
    </p>
    <br />
    <a href="index.html">Sign In</a>
    <br />
    <br />
</div>
</body>
</html>