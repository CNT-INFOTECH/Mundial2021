<%--
    Document   : frmCommonRef_Pop
    Created on : Jun 9, 2011, 11:30:39 AM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Shows.css" rel="stylesheet" type="text/css" />
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />

    </head>

    <script>

        function fnSave()
        {
            
            if(document.forms[0].Desc.value=='')
             {
                    alert('Please enter the value')
                    return false
             }

            parent.PopWin.hide()
        }

        function fnCancel()
        {
           document.forms[0].Desc.value='';
            parent.PopWin.hide()
        }
    </script>

    <%
        String strHeading=request.getParameter("Action");
        String strFldVal=request.getParameter("fldVal");
        String strFldSeq=request.getParameter("fldSeq");
%>

    <body >


    <form id="myform">

        <br><br>
  <table  width="100%">
    <tr>
      <td width="41"><font class="label">Name&nbsp;</font></td>
      <td width="100" nowrap >
       <input type="hidden" id="RefSeq" name="RefSeq" value="<%=strFldSeq%>" >
        <input class="allcaps" type="text" id="Desc"  name="Desc" value="<%=strFldVal%>" >
      </td>
    </tr>
    <tr>
      <td colspan="2"  align="right">
        <input type="button" class="button" value="<%=strHeading%>" name="Save" onClick="fnSave()" />
        <input type="button" class="button" value="Cancel" name="cancel1" onClick="fnCancel()" />
      </td>
    </tr>
    <tr>
        <td  colspan="2"  align="right">
      

      </td>
    </tr>
  </table>
	</form>
  </body>

</html>
