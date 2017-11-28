<%-- 
    Document   : Delete_user
    Created on : 28 Νοε 2017, 1:50:57 μμ
    Author     : evimouth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <%@ page import="java.sql.*" %>
    <% Class.forName("com.mysql.jdbc.Driver"); %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete user!!</title>
        
        
        
<style>
        .button 
        {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }
</style>
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
    
        <%!
            public class users_class
                {
                    String URL ="jdbc:mysql://localhost:3306/goldenoffers_data";
                    String USERNAME="manosm";
                    String PASSWORD="r678CKpFr1SuwAft";
                    Connection connection = null;
                    PreparedStatement prest = null;
                    ResultSet res = null;
                    
                    public users_class()
                        {
                            try
                                {
                                    connection= DriverManager.getConnection(URL,USERNAME,PASSWORD);
                                    
                                    prest = connection.prepareStatement("Select * from users");
                                    
                                }
                            catch(SQLException e)
                            {
                                e.printStackTrace();
                            }
                            
                        }
                        
                    public ResultSet getusers()
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
            users_class users_class= new users_class();
            ResultSet users = users_class.getusers();
            
        %>
    
        <h1>USERS TABLE</h1>
        
        <%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/record";%>
<%!String user = "root";%>
<%!String psw = "root";%>
<%
    String id = request.getParameter("id");
    if(id != null)
    {
        Connection con = null;
    PreparedStatement ps = null;
    int personID = Integer.parseInt(id);
    try
    {
        Class.forName(driverName);
        con = DriverManager.getConnection(url,user,psw);
        String sql = "DELETE FROM person WHERE personID="+personID;
        ps = con.prepareStatement(sql);
        int i = ps.executeUpdate();
        if(i > 0)
            {%>
        <jsp:forward page="/users.jsp"/>
        <% 
            }
            else
        %>
        <jsp:forward page="/failure.jsp"/>
<% }

catch(SQLException sqe)
{
request.setAttribute("error", sqe);
out.println(sqe);
}
}
%>
    
    
        
    

