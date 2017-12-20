<%-- 
    Document   : SelectSpecific_user
    Created on : 22 Νοε 2017, 5:18:22 πμ
    Author     : evimouth
--%>
<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SELECT A SPECIFIC USER Page</title>
                         <script>
  
function myFunction() {
    var id = document.getElementById("id").value;
    
    submitOK = "true";

    if (id.length > 11) {
        alert("The id may have no more than 11 characters");
        submitOK = "false";
    } 
    if(id === "")
    {
        alert("The id must not be null");
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
        </style>
        <style>
.button {
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
    </head>
    <body>
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
        <h1>Select a user by id</h1>
        <form name="myform" action="Display_User_from_username.jsp" method="POST" onSubmit="return myFunction();">
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
        <div class="w3-container">
            <table class="w3-table-all w3-centered">
            
            <tbody>
                <tr>
                    <td>
                        <span class="w3-tag">Put id :</span>
                         <input id="id" type="text" name="id" value="" />
                    </td>
                
                </tr>
                <tr>
                    <td>
                        <div class="w3-container">
                                <input  type="reset" class="w3-button w3-black" value="Clear" name="clear" />
                    
                                <input  type="submit" class="w3-button w3-black" value="Submit" name="submit"  />
                        </div>
                    </td>     
                </tr>
            </tbody>
            
        </table>
        </div>    
        </form>
        <a href="main.jsp">Go back</a>
    </body>
</html>
