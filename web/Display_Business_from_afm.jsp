<%-- 
    Document   : Display_Business_from_afm
    Created on : 21 Νοε 2017, 12:12:38 μμ
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
            public class afm_class
                {
                    String URL ="jdbc:mysql://localhost:3306/goldenoffers_data";
                    String USERNAME="manosm";
                    String PASSWORD="r678CKpFr1SuwAft";
                    Connection connection = null;
                    PreparedStatement prest = null;
                    ResultSet res = null;
                    
                    public afm_class()
                        {
                            try
                                {
                                    connection= DriverManager.getConnection(URL,USERNAME,PASSWORD);
                                    
                                    prest = connection.prepareStatement
                                        (
                                            
                                            "Select id,unique_id,email,created_at,updated_at,name,owner,afm from business WHERE afm like ? ORDER BY id "

                                        );
                                    
                                }
                            catch(SQLException e)
                            {
                                e.printStackTrace();
                            }
                            
                        }
                    public ResultSet getafm(String afmm)
                    {
                        try
                                {
                                   prest.setString(1, "%" + afmm + "%");
                                    
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
            String afm = new String();
            if(request.getParameter("afm") !=null)
            {
                afm = request.getParameter("afm");
                
            }
            afm_class afm_class = new afm_class();
            ResultSet res = afm_class.getafm(afm);
        %>
        <table id="customers" border="2">
            <tbody>
                <tr>
                    <td>id:</td>
                    <td>unique_id:</td>
                    <td>email:</td>
                    <td>created_at:</td>
                    <td>updated_at:</td>
                    <td>name:</td>
                    <td>owner:</td>
                    <td>afm:</td>
                    
                </tr>
                <% while(res.next())
                    { %>
                <tr>
                    <td><%= res.getInt("id")%>    </td>
                    <td><%= res.getString("unique_id")%>   </td>
                    <td><%= res.getString("email")%>   </td>
                    <td><%= res.getTimestamp ("created_at")%>   </td>
                    <td><%= res.getTimestamp ("updated_at")%>   </td>
                    <td><%= res.getString("name")%>   </td>
                    <td><%= res.getString("owner")%>   </td>
                    <td><%= res.getString("afm")%>   </td>
                    
                   
                </tr>
                <%}%>
            </tbody>
        </table>
            <a href="main.jsp">Go MAIN</a>
            <a href="SelectSpecific.jsp">Go Back</a>
            
    </body>
</html>
