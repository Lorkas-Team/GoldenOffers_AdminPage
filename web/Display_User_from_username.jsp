<%-- 
    Document   : Display_User_from_username
    Created on : 22 Νοε 2017, 5:22:14 πμ
    Author     : evimouth
--%>

<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USERS</title>
        <style>
                #customers 
                {
                    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                    border-collapse: collapse;
                    width: 100%;
                }

                #customers td, #customers th 
                {
                    border: 1px solid #ddd;
                    padding: 8px;
                }

                #customers tr:nth-child(even){background-color: #f2f2f2;}

                #customers tr:hover {background-color: #ddd;}

                #customers th 
                {
                    padding-top: 12px;
                    padding-bottom: 12px;
                    text-align: left;
                    background-color: #4CAF50;
                    color: white;
                }
        </style>
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
    
        <h1>Business search by afm</h1>
        <%!
            public class userr_class
                {
                    String URL ="jdbc:mysql://localhost:3306/goldenoffers_data";
                    String USERNAME="manosm";
                    String PASSWORD="r678CKpFr1SuwAft";
                    Connection connection = null;
                    PreparedStatement prest = null;
                    ResultSet res = null;
                    
                    public userr_class()
                        {
                            try
                                {
                                    connection= DriverManager.getConnection(URL,USERNAME,PASSWORD);
                                    
                                    prest = connection.prepareStatement
                                        (
                                            
                                            "Select id,username,email from users WHERE username like ? ORDER BY id "

                                        );
                                    
                                }
                            catch(SQLException e)
                            {
                                e.printStackTrace();
                            }
                            
                        }
                    public ResultSet getuserr(String userr)
                    {
                        try
                                {
                                   prest.setString(1, "%" + userr + "%");
                                    
                                    res= prest.executeQuery();
                                    
                                    
                                }
                            catch(SQLException e)
                            {
                                e.printStackTrace();
                            }
                        
                        return res;
                    }
                }
        %>
        <%
            String username = new String();
            if(request.getParameter("username") !=null)
            {
                username = request.getParameter("username");
                
            }
            userr_class userr_class = new userr_class();
            ResultSet res = userr_class.getuserr(username);
        %>
        <table id="customers" border="2">
            <tbody>
                <tr>
                    <td>id:</td>
                    <td>username:</td>
                    <td>email:</td>
                   
                    
                </tr>
                <% while(res.next())
                    { %>
                <tr>
                    <td><%= res.getInt("id")%>    </td>
                    <td><%= res.getString("username")%>   </td>
                    <td><%= res.getString("email")%>   </td>
                    
                    
                   
                </tr>
                <%}%>
            </tbody>
        </table>
            <a href="main.jsp">Go MAIN</a>
            <a href="SelectSpecific_user.jsp">Go Back</a>
            
    </body>
</html>
