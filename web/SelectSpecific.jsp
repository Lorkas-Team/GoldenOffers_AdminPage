<%-- 
    Document   : SelectSpecific
    Created on : 21 Νοε 2017, 9:48:54 πμ
    Author     : evimouth
--%>

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
    </head>
    <body>
        <h1>Search Business from afm</h1>
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
