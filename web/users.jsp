<%-- 
    Document   : main
    Created on : 21 Νοε 2017, 8:57:31 πμ
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
        <script>
   function myFunction() {
    var ID = document.getElementById("ID").value;
   

     submitOK = "true";

    if (ID.length >11 || inNaN(ID)  ) {
        alert("The ID may have no more than 11 numbers");
        submitOK = "false";
    }
    
     if (submitOK === "false") {
        return false;
    }
   


}
</script>

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
        <h1>USERS</h1>
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
                                    
                                    prest = connection.prepareStatement("Select id,username,email from users");
                                    
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
<form action="users.jsp" onSubmit="return myFunction();">
            <table id="customers" border="1">
            <tbody>
                <tr>
                    <td>User id:</td>
                    <td>Username:</td>
                    <td>Email:</td>
                </tr>
                <% while(users.next())
                    { %>
                <tr>
                    <td><%= users.getInt("id")%></td>
                    <td><%= users.getString("username")%></td>
                    <td><%= users.getString("email")%></td>
                </tr>
                <%}%>
            </tbody>
            
            
        </table>
<table id="customers">
        <tr>
            <td>Enter ID To Delete</td>
            <td><input  type="text" name="id" />
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
                        String sql = "DELETE FROM users WHERE id="+id_u;
                        ps = con.prepareStatement(sql);
                        int i = ps.executeUpdate();
                        
}
                    
                        catch(SQLException sqe)
                            {
                                sqe.printStackTrace();
                            }
                }               
%>


<a href="main.jsp">Go back</a>
<a href="users.jsp">REFRESH</a>
</body>
</html>
