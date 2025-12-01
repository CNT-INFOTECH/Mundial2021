<%-- 
    Document   : frmReg_NewAddRegNum_Popup
    Created on : Oct 14, 2011, 4:26:53 PM
    Author     : Erzath
--%>

<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
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
function SAVE_NEWREGNO(regno)
{ 
    var valregno=document.getElementById(regno).value
    if(valregno=='')
    {
        alert('Please enter the value')
        return false
    }            
    parent.PopWin.hide()
}

function fnCancel()
{   
    parent.PopWin.hide()
}
</script>
    <body>
        <%
        String REGSEQ=request.getParameter("Seq");
        String ACTION=request.getParameter("Action");
        %>
        <form id="myform">
            <br>
        <table>
        <tr>
          <td width="41"><font class="label">REG#&nbsp;</font></td>
          <td width="100" nowrap >
           <input type="hidden" id="RegSeq" name="RegSeq" value="<%=REGSEQ%>" >
            <input type="text" id="regnum"  name="regnum" onKeyUp="javascript:this.value=this.value.toUpperCase()"  style="background-color:  #FFF8DC; border:  1px solid #000000;">
          </td>
        </tr>
        <tr>
          <td colspan="2"  align="right">
            <input type="button" class="button" value="<%=ACTION%>" name="Save" onClick="SAVE_NEWREGNO('regnum')" />
            <input type="button" class="button" value="Cancel" name="cancel" onClick="fnCancel()" />
          </td>
        </tr>        
        </table>
	</form>
    </body>
</html>
