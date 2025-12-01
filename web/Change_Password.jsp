<%-- 
    Document   : Change_Password
    Created on : Sep 30, 2011, 4:58:07 PM
    Author     : dp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link href="Shows_Pop.css" rel="stylesheet" type="text/css" />
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
        <%@ page import = "java.util.*" %>

    <script type="text/javascript" src="scripts/jscCommon.js"></script>

 <link rel="stylesheet" href="windowfiles/dhtmlwindow.css" type="text/css" />
 <script type="text/javascript" src="windowfiles/dhtmlwindow.js">
/***********************************************
* DHTML Window Widget- © Dynamic Drive (www.dynamicdrive.com)
* This notice must stay intact for legal use.
* Visit http://www.dynamicdrive.com/ for full source code
***********************************************/

</script>
<link rel="stylesheet" href="modalfiles/modal.css" type="text/css" />
<script type="text/javascript" src="modalfiles/modal.js"></script>
<script>
   
    function change_password_final()
{


            	document.forms[0].action="ChangePassword";
		document.forms[0].method= "post";
		document.forms[0].submit();

 window.parent.jQuery('#dialog-CmmnRef').dialog('close');
}


    function newpassword_chk(){
var password=document.ChangePassword.chgpassword.value;
var check_pass=document.ChangePassword.chk_chgpassword.value;

if(password != check_pass){
    alert('Your passwords do not match. Please type more carefully.');
    return false;
                          }
else{
    change_password_final();
}

    }


    function validate1(){
var password=document.ChangePassword.chgpassword.value;
var check_pass=document.ChangePassword.chk_chgpassword.value;

if(password=="" ){
 alert("Enter New password!");
  return false;
                 }


if(check_pass==""){
    alert("Enter Confirm Password! ");
    return false;
                  }

if(password!="" & check_pass!=""){
    return newpassword_chk();
}
}
</script>
    </head>
    <body>
        <%
String StrUserId="";
if (request.getParameter("userid")!=null)
                StrUserId=request.getParameter("userid");

session.setAttribute("StrUserId",StrUserId);

%>


   <form name="ChangePassword" method=post  >
<table class="altRow" width="100%">
  <tr>
    <td width="42"><font class="label">NEW&nbsp;PASSWORD</font></td>
    <td width="60">
      <input type="password"  style="background-color:  #FFF8DC; border:  1px solid #000000;"  name="chgpassword" value="">
    </td>
  </tr>
  <tr>
    <td width="42"><font class="label">CONFIRM&nbsp;PASSWORD</font></td>
    <td width="60">
      <input type="password"  style="background-color:  #FFF8DC; border:  1px solid #000000;" name="chk_chgpassword" value="">
    </td>
  </tr>

 </table>
            <br/>
            <span style="margin-left: 150px;"><input class="button" type="Submit"  value="Submit" onclick="return validate1();" >
             <input type="RESET" class="button" value="Reset"></span>
            
<br/>
<br/>

<input type="hidden" name="password11" size="18" value='<%=StrUserId%>' maxlength="20" style="border: 1px solid #000000;">
</form>

        
    </body>
</html>
