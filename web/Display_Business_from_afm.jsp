<%-- 
    Document   : Display_Business_from_afm
    Created on : 21 Νοε 2017, 12:12:38 μμ
    Author     : evimouth
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Business from afm</title>
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
            #photo
{
    padding: 0px;
    vertical-align: middle;
    text-align: center;
    width: 50px;
    height: 50px;
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
                    PreparedStatement prest,des = null;
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
                                    des = connection.prepareStatement("SELECT b.*,a.afm FROM offers AS b INNER JOIN business as a ON (b.business_id=a.id)"
                                    + "  where afm like ?");
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
                   
                    public ResultSet getOffers(String afmm)
                    {
                           try
                                {
                                   
                                        des.setString(1, "%" + afmm + "%");
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
            String id = request.getParameter("id");
            if(id != null)
                {
                    Connection con = null;
                    PreparedStatement ps = null;
                    int idd = Integer.parseInt(id);
            try
                    {
                        
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/goldenoffers_data","manosm","r678CKpFr1SuwAft");
                        String sql = "DELETE FROM offers WHERE id="+idd;
                        
                        ps = con.prepareStatement(sql);
                        int i = ps.executeUpdate();
                        response.sendRedirect("SelectSpecific.jsp");
}
                    
                        catch(SQLException sqe)
                            {
                                sqe.printStackTrace();
                            }
                }
            String afm = new String();
            if(request.getParameter("afm") !=null)
            {
                afm = request.getParameter("afm");
                
            }
            afm_class afm_class = new afm_class();
            ResultSet res = afm_class.getafm(afm);
            ResultSet dest = afm_class.getOffers(afm);
        %>
        <h1>This Business</h1>

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
            <h1>OFFERS</h1>
           <table id="customers" border="2"> 
               <tbody>
                   <tr>
                    <td>id:</td>
                    <td>business_id:</td>
                    <td>uid:</td>
                    <td>product_name:</td>
                    <td>description:</td>
                    <td>image:</td>
                    <td>regDate:</td>
                    <td>expDate:</td>
                    <td>business_name:</td>
                   </tr>
                   <% while(dest.next())
                    {
                        byte[] imgData = dest.getBytes("image"); // blob field 
           
             String encode = Base64.getEncoder().encodeToString(imgData);
            request.setAttribute("imgBase", encode);
                   %>
                <tr>
                    <td><%= dest.getInt("id")%>    </td>
                    <td><%= dest.getInt("business_id")%>   </td>
                    <td><%= dest.getString("uid")%>   </td>
                    <td><%= dest.getString ("product_name")%>   </td>
                    <td><%= dest.getString ("description")%>   </td>
                    <td>
                        <img id="photo" src="data:image/jpeg;base64,${imgBase}" />
                    </td>
                    <td><%= dest.getTimestamp("regDate")%>   </td>
                    <td><%= dest.getTimestamp("expDate")%>   </td>
                    <td><%= dest.getString("business_name")%>   </td>
                    
                   
                </tr>
                <%}%>
               </tbody>
           </table>
<form action="Display_Business_from_afm.jsp" >
                    <table id="customers">
        <tr>
            <td>Enter ID To Delete</td>
  
            <td>
                <input 
                       name="id" onkeyup="value=isNaN(parseFloat(value))||value<0||value>9999999999999999?value=null:value"
                    type="number"
                    value=""/>
                <input  type="submit" value="Delete" /></td>

                
        </tr>
</table>
</form> 
            <a href="main.jsp">Go MAIN</a>
            <a href="SelectSpecific.jsp">Go Back</a>
            
    </body>
</html>
