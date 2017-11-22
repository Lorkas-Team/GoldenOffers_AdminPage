<%-- 
    Document   : main
    Created on : 21 Νοε 2017, 11:27:26 πμ
    Author     : evimouth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <style>
          a:link, a:visited 
            {
                background-color: #2196F3;
                color: white;
                padding: 14px 25px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
            }


          a:hover, a:active 
            {
                background-color: red;
            }
        </style>
    </head>
    <body>
        <center>
            <h1>Hello There!</h1>
            <ul>
                <a href="users.jsp">Users view</a>
                 <a href="business.jsp">Business view</a>
                  <a href="offers.jsp">Offers view</a>
                  <a href="SelectSpecific.jsp">Search Business from AFM </a>
                  <a href="SelectSpecific_user.jsp">Search Users from username </a>
            </ul>  

        </center>
    </body>
</html>
