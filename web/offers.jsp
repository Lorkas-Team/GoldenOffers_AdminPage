<%-- 
    Document   : offers
    Created on : 21 Νοε 2017, 11:03:15 πμ
    Author     : evimouth
--%>

<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OFFERS</title>
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
    
        <h1>OFFERS</h1>
        <%!
            public class OFFERS_class
                {
                    String URL ="jdbc:mysql://localhost:3306/goldenoffers_data";
                    String USERNAME="manosm";
                    String PASSWORD="r678CKpFr1SuwAft";
                    Connection connection = null;
                    PreparedStatement prest = null;
                    ResultSet res = null;
                    
                    public OFFERS_class()
                        {
                            try
                                {
                                    connection= DriverManager.getConnection(URL,USERNAME,PASSWORD);
                                    
                                    prest = connection.prepareStatement("Select id,business_id,product_name,price,description,photo,regDate,expDate,business_name from offers");
                                    
                                }
                            catch(SQLException e)
                            {
                                e.printStackTrace();
                            }
                            
                        }
                    public ResultSet getOFFERS()
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
            OFFERS_class OFFERS_class= new OFFERS_class();
            ResultSet OFFERS = OFFERS_class.getOFFERS();
            
        %>
<form action="offers.jsp" onSubmit="return myFunction();">        
        <table id="customers" border="1">
            <tbody>
                <tr>
                    <td>id:</td>
                    <td>business_id:</td>
                    <td>product_name:</td>
                    <td>price:</td>
                    <td>description:</td>
                    <td>photo:</td>
                    <td>reqDate:</td>
                    <td>expDate:</td>
                    <td>business_name:</td>
                </tr>
                <% while(OFFERS.next())
                    { %>
                <tr>
                    <td><%= OFFERS.getInt("id")%></td>
                    <td><%= OFFERS.getInt("business_id")%></td>
                    <td><%= OFFERS.getDouble("price")%></td>
                    <td><%= OFFERS.getString("description")%></td>
                    <td><%= OFFERS.getBlob("photo")%></td>
                    <td><%= OFFERS.getDate("reqDate")%></td>
                    <td><%= OFFERS.getDate("expDate")%></td>
                    <td><%= OFFERS.getString("business_name")%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
            <table id="customers">
        <tr>
            <td>Enter ID To Delete</td>
            <td><input type="text" name="id" />
                <input  type="submit" value="Delete"  /></td>
                

                
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
                    int idd = Integer.parseInt(id);
            try
                    {
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection(URL,USERNAME,PASSWORD);
                        String sql = "DELETE FROM offers WHERE id="+idd;
                        
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
            <a href="offers.jsp">REFRESH</a>
            
    </body>
</html>
