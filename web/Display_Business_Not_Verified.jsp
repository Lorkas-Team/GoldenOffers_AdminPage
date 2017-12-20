<%-- 
    Document   : Display_Business_Not_Verified
    Created on : 28 Νοε 2017, 1:29:47 μμ
    Author     : evimouth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Business where not Verified</title>
        
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
        <%!
            public class verified_class
                {
                    String URL ="jdbc:mysql://localhost:3306/goldenoffers_data";
                    String USERNAME="manosm";
                    String PASSWORD="r678CKpFr1SuwAft";
                    Connection connection = null;
                    PreparedStatement prest = null;
                    ResultSet res = null;
                    
                    public verified_class()
                        {
                            try
                                {
                                    connection= DriverManager.getConnection(URL,USERNAME,PASSWORD);
                                    
                                    prest = connection.prepareStatement
                                        (
                                            
                                            "Select id,unique_id,email,created_at,updated_at,name,owner,afm,verified from business WHERE verified like 0 ORDER BY id "

                                        );
                                   
                                }
                            catch(SQLException e)
                            {
                                e.printStackTrace();
                            }
                            
                        }
                    public ResultSet getnotverified()
                    {
                        try
                                {
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
            verified_class business_class= new verified_class();
            ResultSet verified = business_class.getnotverified();
        %>
        <table id="customers" border="2">
            <tbody>
                <tr align="center">
                    <td>id:</td>
                    <td>unique_id:</td>
                    <td>email:</td>
                    <td>created_at:</td>
                    <td>updated_at:</td>
                    <td>name:</td>
                    <td>owner:</td>
                    <td>afm:</td>
                    <td>verified</td>
                </tr>
                <% while(verified.next())
                    { %>
                <tr>
                    <td><%= verified.getInt("id")%>    </td>
                    <td><%= verified.getString("unique_id")%>   </td>
                    <td><%= verified.getString("email")%>   </td>
                    <td><%= verified.getTimestamp ("created_at")%>   </td>
                    <td><%= verified.getTimestamp ("updated_at")%>   </td>
                    <td><%= verified.getString("name")%>   </td>
                    <td><%= verified.getString("owner")%>   </td>
                    <td><%= verified.getString("afm")%>   </td>
                    <td><%= verified.getByte("verified")%> </td>
                    
                   
                </tr>
                <%}%>
            </tbody>
        </table>
            
            <a href="main.jsp">Go back</a>
       
    </body>
</html>
