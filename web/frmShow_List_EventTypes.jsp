<%-- 
    Document   : frmShow_List_EventTypes
    Created on : Jun 6, 2011, 10:11:14 PM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>

        <link href="Shows_Pop.css" rel="stylesheet" type="text/css" />
         <link href="buttons.css" rel="stylesheet" type="text/css" />
    </head>
    <script>
  function Continue_Register(varEventSeq)
  {
         /*var myIFrame = document.getElementById('IFRegister')
         var content = myIFrame.contentWindow.document.forms[0].group1.length

            for (i = 0; i <content; i++) {
                if (myIFrame.contentWindow.document.forms[0].group1[i].checked) {
                   chosen = myIFrame.contentWindow.document.forms[0].group1[i].value
                   myIFrame.src="frmRegister_Horse_Shows.jsp";

                }
            }
            */
            document.forms[0].method="post";
            document.forms[0].action="frmRegister_Horse_Shows.jsp?EventSeq="+varEventSeq
            document.forms[0].submit();
  }
        </script>
    <body>
          <%
        String strEventSeq=request.getParameter("EventSeq");

%>
        <form>
<table width="600" height="34">
    <tr>
<td width=300>&nbsp;</td>
<td width=300>
  <div align="left"><br>
    <input type="radio" name="group1" value="0" checked>
    COMPETENCIAS REGULARES<br>
    <br>
    <input type="radio" name="group1" value="1">
    GRUPO DE YEGUAS CON CRIA<br>
    <br>
    <input type="radio" name="group1" value="2">
    GRUPO DE YEGUAS PARA CRIA<br>
    <br>
    <input type="radio" name="group1" value="3">
    MEJOR DESCENDENCIA DE UNA YEGUA<br>
    <br>
    <input type="radio" name="group1" value="4">
    JEFE DE RAZA<br>
    <br>
  </div>
  </td>
  <td>&nbsp;</td>
  </tr>
  <tr>
      <td width=300>&nbsp;</td>
      <td width=300>  <input class='button' type="button" name="Register" value="Continue" onClick="Continue_Register('<%=strEventSeq%>')">
      <input class='button' type="button" name="Close" value="Close"></td>
  </tr>
</table>
</form>
    </body>
</html>
