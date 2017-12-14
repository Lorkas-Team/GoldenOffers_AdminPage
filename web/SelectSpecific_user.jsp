<%-- 
    Document   : SelectSpecific_user
    Created on : 22 Νοε 2017, 5:18:22 πμ
    Author     : evimouth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SELECT A SPECIFIC USER Page</title>
                         <script>
  
function myFunction() {
    var usename = document.getElementById("usename").value;
    
    submitOK = "true";

    if (usename.length > 20) {
        alert("The username may have no more than 20 characters");
        submitOK = "false";
    } 
    if(usename === "")
    {
        alert("The username must not be null");
        submitOK = "false";
    }
     if (submitOK === "false") {
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
    </head>
    <body>
        
        <h1>Search users by username</h1>
        <form name="myform" action="Display_User_from_username.jsp" method="POST" onSubmit="return myFunction();">
        <div class="w3-container">
            <table class="w3-table-all w3-centered">
            
            <tbody>
                <tr>
                    <td>
                        <span class="w3-tag">USERNAME :</span>
                         <input id="usename" type="text" name="username" value="" />
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
