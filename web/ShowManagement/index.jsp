<%-- 
    Document   : index
    Created on : Oct 30, 2017, 6:27:49 PM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script>
        function PrintParticipants(varPagID) { // Print F2 Placements

              
               document.forms[0].method = "post";
               document.forms[0].action = "../Participants?PageID="+varPagID;
               document.forms[0].target = "_blank";
               document.forms[0].submit();
            }
    </script>
    <body>
        <h1>Hello World!</h1>
        <form>
       
         <input type="text" name ="EventSeq" value="2392">
         <input type="text" name ="ShowSeq" value="61">
         <input type="button" value="PARTICIPANTS" onClick="PrintParticipants('PARTICIPANTS')">
          <input type="button" value="SHOWS_REGISTER" onClick="PrintParticipants('SHOWS_REGISTER')">
         
         
         
         </form>
    </body>
</html>
