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
        <title>JSP Page</title>
                         <script>
  
 function trim(s) 
    {
        return s.replace( /^s*/, "" ).replace( /s*$/, "" );
    }
    function validate()
    {
        
        if(trim(document.myform.username.value)==="")
        {
          alert("Text empty");
          document.myform.username.focus();
          return false;
        }//else if (trim(document.myform.afm.value)===^[A-Za-z]+$)
         //{
         //    alert("PLEASE ENTER ONLY NUMS");
         //    document.myform.afm.focus();
         //    return false;
        // }
          
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
        <form name="myform" action="Display_User_from_username.jsp" method="POST" onSubmit="return validate();">
        <div class="w3-container">
            <table class="w3-table-all w3-centered">
            
            <tbody>
                <tr>
                    <td>
                        <span class="w3-tag">USERNAME :</span>
                         <input type="text" name="username" value="" />
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
    </body>
</html>
