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
        <%!
            public class userr_class
                {
                    String URL ="jdbc:mysql://localhost:3306/goldenoffers_data";
                    String USERNAME="manosm";
                    String PASSWORD="r678CKpFr1SuwAft";
                    Connection connection = null;
                    PreparedStatement prest,des = null;
                    ResultSet res = null;
                    
                    public userr_class()
                        {
                            try
                                {
                                    connection= DriverManager.getConnection(URL,USERNAME,PASSWORD);
                                    
                                    prest = connection.prepareStatement
                                        (
                                            
                                            "Select id,username,email from users WHERE id like ? "

                                        );
                                    des = connection.prepareStatement("SELECT b.*,a.id FROM desires AS b INNER JOIN users as a ON (b.users_id=a.id)"
                                        + "      where users_id like ?"); 
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
                
                public ResultSet getDesires(String userr)
                    {
                           try
                                {
                                   
                                    des.setString(1, "%" + userr + "%");
                                    res= des.executeQuery();
                                    
                                    
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
            String idd = request.getParameter("users_id");
            if(idd != null)
                {
                    Connection con = null;
                    PreparedStatement ps = null;
                    int iddd = Integer.parseInt(idd);
            try
                    {
                        
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/goldenoffers_data","manosm","r678CKpFr1SuwAft");
                        String sql = "DELETE FROM desires WHERE id="+iddd;
                        
                        ps = con.prepareStatement(sql);
                        int i = ps.executeUpdate();
                        response.sendRedirect("SelectSpecific_user.jsp");
}
                    
                        catch(SQLException sqe)
                            {
                                sqe.printStackTrace();
                            }
                }
           
           
            
            String id = new String();
            if(request.getParameter("id") !=null)
            {
                id = request.getParameter("id");
                
            }
            userr_class userr_class = new userr_class();
            ResultSet res = userr_class.getuserr(id);
            ResultSet dest = userr_class.getDesires(id);
        %>
        <h1>Specific User</h1>
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
            
            <table id="customers" border="1">
                <h1>Desires</h1>
            <tbody>
                <tr>
                    <td>User id:</td>
                    <td>ID:</td>
                    <td>Product_name:</td>
                    <td>Price_low:</td>
                    <td>Price_high:</td>
                </tr>
                <% while(dest.next())
                    { %>
                <tr>
                    <td><%= dest.getInt("users_id")%></td>
                    <td><%= dest.getInt("id")%></td>
                    <td><%= dest.getString("product_name")%></td>
                    <td><%= dest.getDouble("price_low")%></td>
                    <td><%= dest.getDouble("price_high")%></td>
                </tr>
                <%}%>
            </tbody>
           
<form action="Display_User_from_username.jsp" >
    
                    <table id="customers">
        <tr>
            <td>Enter ID To Delete</td>
  
            <td>
                <input 
                       name="users_id" onkeyup="value=isNaN(parseFloat(value))||value<0||value>9999999999999999?value=null:value"
                    type="number"
                    value=""/>
                <input  type="submit" value="Delete" /></td>

                
        </tr>
</table>
</form>            
        </table>
            <a href="main.jsp">Go MAIN</a>
            <a href="SelectSpecific_user.jsp">Go Back</a>
            
    </body>
</html>
