<%-- 
    Document   : SelectSpecific
    Created on : 21 Νοε 2017, 9:48:54 πμ
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
        <title>SELECT A SPECIFIC AFM</title>
<script>
   function myFunction() {
    var AFM = document.getElementById("AFM").value;
 

    if (AFM.length !== 9 || isNaN(AFM)) {
        alert("The AFM must be 9 numbers");
        return false;
    } 


}
</script>
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
        <h1>Business!</h1>
        <%!
            public class business_class
                {
                    String URL ="jdbc:mysql://localhost:3306/goldenoffers_data";
                   
                    String USERNAME="manosm";
                    String PASSWORD="r678CKpFr1SuwAft";
                    Connection connection = null;
                    PreparedStatement prest = null;
                    ResultSet res = null;
                    
                    public business_class()
                        {
                            try
                                {
                                    connection= DriverManager.getConnection(URL,USERNAME,PASSWORD);
                                    
                                    prest = connection.prepareStatement
                                    (
                                        "Select id,unique_id,email,created_at,updated_at,name,owner,afm,verified from business"
                                        
                                    );
                                    
                                }
                            catch(SQLException e)
                            {
                                e.printStackTrace();
                            }
                            
                        }
                    public ResultSet getbusiness()
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
            
            business_class business_class= new business_class();
            ResultSet business = business_class.getbusiness();
            //<input id="ID"  type="submit" value="Delete" onClick="window.location.reload();"
        %>
        <form name="myform" action="Display_Business_from_afm.jsp" method="POST" onSubmit="return myFunction();"  >
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
                    <td>verified (0=NO 1=YES ):</td>
                </tr>
                <% while(business.next())
                    { %>
                <tr>
                    <td><%= business.getInt("id")%>    </td>
                    <td><%= business.getString("unique_id")%>   </td>
                    <td><%= business.getString("email")%>   </td>
                    <td><%= business.getTimestamp ("created_at")%>   </td>
                    <td><%= business.getTimestamp ("updated_at")%>   </td>
                    <td><%= business.getString("name")%>   </td>
                    <td><%= business.getString("owner")%>   </td>
                    <td><%= business.getString("afm")%>   </td>
                    <td><%= business.getByte("verified")%> </td>
                    
                   
                </tr>
                <%}%>
            </tbody>
        </table>
        <h1>Select a specific Business by afm
            for view its offers
        </h1>
        <form name="myform" action="Display_Business_from_afm.jsp" method="POST" onSubmit="return myFunction();">
        <div class="w3-container">
            <table class="w3-table-all w3-centered">
            
            <tbody>
                <tr>
                    <td>
                        <span class="w3-tag">AFM</span>
                         <input id="AFM"  type="text" name="afm" value="" />
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
