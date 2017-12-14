<%-- 
    Document   : desires
    Created on : 13 Δεκ 2017, 2:10:43 πμ
    Author     : evimouth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DESIRES</title>
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
        <h1>DESIRES</h1>
        <%!
            public class desires_class
                {
                    String URL ="jdbc:mysql://localhost:3306/goldenoffers_data";
                    String USERNAME="manosm";
                    String PASSWORD="r678CKpFr1SuwAft";
                    Connection connection = null;
                    PreparedStatement prest = null;
                    ResultSet res = null;
                    
                    public desires_class()
                        {
                            try
                                {
                                    connection= DriverManager.getConnection(URL,USERNAME,PASSWORD);
                                    
                                    prest = connection.prepareStatement("Select * from desires");
                                    
                                }
                            catch(SQLException e)
                            {
                                e.printStackTrace();
                            }
                            
                        }
                        
                    public ResultSet getdesires()
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
            desires_class desires_class= new desires_class();
            ResultSet desires = desires_class.getdesires();
            
        %>
<form action="users.jsp" >
            <table id="customers" border="1">
            <tbody>
                <tr>
                    <td>User id:</td>
                    <td>ID:</td>
                    <td>Product_name:</td>
                    <td>Price_low:</td>
                    <td>Price_high:</td>
                </tr>
                <% while(desires.next())
                    { %>
                <tr>
                    <td><%= desires.getInt("users_id")%></td>
                    <td><%= desires.getInt("id")%></td>
                    <td><%= desires.getString("product_name")%></td>
                    <td><%= desires.getDouble("price_low")%></td>
                    <td><%= desires.getDouble("price_high")%></td>
                </tr>
                <%}%>
            </tbody>
            
            
        </table>
<table id="customers">
        <tr>
            <td>Enter ID To Delete</td>
            <td><input 
                       name="id" onkeyup="value=isNaN(parseFloat(value))||value<0||value>9999999999999999?value=null:value"
                    type="number"
                    value=""/>
                <input id="ID"  type="submit" value="Delete"  /></td>
                

                
        </tr>
</table>
</form>
                
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String URL ="jdbc:mysql://localhost:3306/goldenoffers_data";%>
<%! String USERNAME="manosm";%>
<%!  String PASSWORD="r678CKpFr1SuwAft";%>

<%
            String id = request.getParameter("id");
            if(id != null)
                {
                    Connection con = null;
                    PreparedStatement ps = null;
                    int id_u = Integer.parseInt(id);
            try
                    {
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection(URL,USERNAME,PASSWORD);
                        String sql = "DELETE FROM desires WHERE id="+id_u;
                        ps = con.prepareStatement(sql);
                        int i = ps.executeUpdate();
                        response.sendRedirect("desires.jsp");
}
                    
                        catch(SQLException sqe)
                            {
                                sqe.printStackTrace();
                            }
                }               
%>


<a href="main.jsp">Go back</a>
<a href="desires.jsp">REFRESH</a>
</body>
</html>
