<%--
    Document   : createuser
    Created on : Jul 21, 2011, 2:28:58 PM
    Author     : dp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="role" class="login.SessionRoleBean" scope="session"/>
<jsp:setProperty name="role" property="*"/>
<%@ page import = "java.util.*" %>
<html>
    <head>
<title>ROLE SETUP</title>

<link href="Registration.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="Style_Popup.css" rel="stylesheet" type="text/css" />
<script src="getevent.js"></script>


       <link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
        <script src="jquery-1.5.1.js"></script>
	<script src="external/jquery.bgiframe-2.1.2.js"></script>
	<script src="ui/jquery.ui.core.js"></script>
	<script src="ui/jquery.ui.widget.js"></script>
	<script src="ui/jquery.ui.mouse.js"></script>
	<script src="ui/jquery.ui.button.js"></script>
	<script src="ui/jquery.ui.draggable.js"></script>
	<script src="ui/jquery.ui.position.js"></script>
	<script src="ui/jquery.ui.resizable.js"></script>
	<script src="ui/jquery.ui.dialog.js"></script>
	<script src="ui/jquery.effects.core.js"></script>
	<script src="ui/jquery.ui.datepicker.js"></script>
        <script type="text/javascript" src="js/interface.js"></script>

 <script>

 function fncreateuser()
{


            	document.forms[0].action="saveuserrolevalue";
		document.forms[0].method= "post";
		document.forms[0].submit();


}

function checkIt(evt) {
    evt = (evt) ? evt : window.event
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        //status = "This field accepts numbers only."
        alert("This field accepts only Numbers.")
        return false
    }
    
    return true
}
function validate(){
var roleid=document.create_role.role_Id.value;
var rolename=document.create_role.role_name.value;
if(roleid=="" ){
 alert("Enter Role ID!");
  return false;
}
if(rolename==""){
 alert("Enter Role Name!");
  return false;
}
if(roleid!="" & rolename!=""){
    return fncreateuser();
    
}
return true;
}

function callmode(){
     
  var strMode=request.getParameter("mode");
     if (strMode!=null)
       {
         if(strMode.equals("1"))
             alert("Saved Successfully");
         return false;
         }
}

function Reset(){
    document.forms[0].action="User_Reset.jsp";
		document.forms[0].method= "post";
		document.forms[0].submit();
}
function OpenUserSearch()
{

    $('#dialog-Roles').dialog({ autoOpen: false,height: 400,width: 800, modal: true });
    $('#dialog-Roles').dialog('open');
    return false;

}


function Reset()
{


document.forms[0].method="post";
document.forms[0].action="resetrole.jsp"
document.forms[0].submit();
}



</script>

 
</head>
<body>
 <form name="create_role">
<div id="container">
    <div id="header">
               <%@ include file="frmHeader.jsp"%>
    </div>
	<%
		if(!bAdmin)
		response.sendRedirect("login.jsp");
	%>

<div id="content">
    <fieldset><legend>User Roles:</legend>
<table class="altRow" width="100%">
       <%--<%
      System.out.println("JSP::ROLEID_SESSION::"+session.getAttribute("ses_roleid"));
     String strMode=request.getParameter("mode");
     if (strMode!=null)
       {
         if(strMode.equals("1"))
             out.println("Saved Successfully");
         }
    %>  --%>

<br>

<tr><td width="80" >
        <font class="label">ROLE ID<span style="color:red;">*</span></font></td>

    <td width="150"> <input type="text" name="role_Id" size="18"  maxlength=35 
                            onBlur="getRoleDetails(this)" style="background-color:  #FFF8DC; border:  1px solid #000000;"
                            onpaste="return false;" onKeyPress="return checkIt(event)" value='<%if (role.getRole_Id()!=null){ out.println(role.getRole_Id());}%>'>
<img src="Images/Find12.jpg" onclick="OpenUserSearch()"/></td>
<td colspan="2"> </td>
</tr>
<tr><td width="80">
        <font class="label">ROLE NAME<span style="color:red;">*</span></font></td>
<td width="140"> <input type="text" name="role_name" size="60" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" value="<%if (role.getRole_name()!=null){ out.println(role.getRole_name());}%>" maxlength ="60" style="border: 1px solid #000000;"></td>
<td colspan="2"> </td>
</tr>

<tr><td width="80">
        <font class="label">STATUS</font></td>
    <td width="170"><select name="status" id="option" style="width:140px;background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
            <%  String strSelectedActive="selected";
        String strSelectedInActive="";
        if ((role.getStatus()!=null) && (role.getStatus().equals("Active")))
        {

            strSelectedActive="selected";
        }
       else if ((role.getStatus()!=null) && (role.getStatus().equals("Inactive")))
       {
           strSelectedInActive="selected";
}%>
    <option value="select">Select </option>
    <option <%=strSelectedActive%>  value="Active">Active</option>
    <option <%=strSelectedInActive%>  value="Inactive">Inactive</option>
</select>
</td>
<td colspan="2"> </td>
</tr></table></fieldset>
<div align="center">
    <table ><tr>
            
<td>

   <input type="button" class="button" value="Submit" onclick="return validate();" ></td>
<!--      style="visibility:<%=Adm_BtnStatus%>;" -->
<td><input type="button" class="button" value="Reset" onClick="return Reset();" ></td> </tr></table></div>
</div>



<div id="sidebar">
        <table style="border-collapse:collapse;">
  <tr>
    <td>
      <div onclick="location.href='createuser.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >User SetUp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="location.href='user_role.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >Role SetUp&raquo;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
    </td>
  </tr>
  <tr>
    <td>
      <div  onclick="location.href='frmAccessScreen.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >Screen Access&nbsp;&nbsp;&nbsp;&nbsp;</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="location.href='frmPointSystem.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >Point System&nbsp;&nbsp;&nbsp;&nbsp;</div>
    </td>
  </tr>
  <tr>
    <td>
      <div  onclick="location.href='frmWho_Gets_Point.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >Who Gets Points&nbsp;&nbsp;</div>
    </td>
  </tr>
  <tr>
    <td>
      <div  onclick="location.href='frmAdmn_Others.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >Others&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
    </td>
  </tr>
</table>
    </div>

</div>


<div id="dialog-Roles" title="Search Roles" style="display:none; background:url('Images/trans-wood-1.png'); " >
    <iframe  src="ModalPop_Roles.jsp"  id="modalIFrame_Roles" height="100%" width="100%" marginheight="0" marginwidth="0" frameborder="0" >
</iframe>
</div>


<%
String strMode=request.getParameter("mode");
if (strMode!=null)
       {
         if(strMode.equals("1"))
             {
             %>
             <script>
                 alert("Saved Successfully.")
                
             </script>
             <%
                     }
         }
%>
</form>

</body>

</html>