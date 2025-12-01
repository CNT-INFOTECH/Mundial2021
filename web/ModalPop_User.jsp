<%--
    Document   : ModalPop_Roles
    Created on : Aug 9, 2011, 2:19:05 PM
    Author     : dp
--%>

<!--<%@page contentType="text/html" pageEncoding="UTF-8"%> -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search User</title>
         <link rel="stylesheet" href="Shows_Pop.css">
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />

        <link rel="stylesheet" href="themes/base/jquery.ui.all.css">

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
        <script>
            <%--
function returnValues(strValues,strHorseName,strREGSEQ)
       {

            if(window.parent.document.forms[0].name=="Registrationform")
            {
                window.parent.document.forms[0].target="_self";
                window.parent.document.forms[0].method="post";
                window.parent.document.forms[0].action="index.jsp?Mode=2&RegNo="+strREGSEQ;
                window.parent.document.forms[0].submit();
            }
---%>



  function returntoMain(varUserId)
  {

        
        window.parent.document.forms[0].method="post"
         window.parent.document.forms[0].action="User_Selected.jsp?userID="+varUserId;
        window.parent.document.forms[0].submit();
        
          window.parent.jQuery('#dialog-User').dialog('close');

  }

 function UserList()
 {


userid=document.forms[0].UI.value
firstname=document.forms[0].FN.value
lastname=document.forms[0].LN.value
status=document.forms[0].status.value


document.forms[0].method="post";
document.forms[0].action="ModalPop_User.jsp?mode=1&UI="+userid+"&FN="+firstname+"&LN="+lastname+"&status="+status
document.forms[0].submit();
   }

 /* $(document).ready(
function() {
        $( "#datepicker" ).datepicker();
});
      */
 </script>
    </head>
    <body>

        <%
        String strUserId="";
        String strFirstName="";
        String strLastName="";
        String strStatus="";
        if(request.getParameter("UI")!=null)
            strUserId=request.getParameter("UI");
        if(request.getParameter("FN")!=null)
            strFirstName=request.getParameter("FN");
        if(request.getParameter("LN")!=null)
            strLastName=request.getParameter("LN");
        if(request.getParameter("status")!=null)
            strStatus=request.getParameter("status");


%>


        <form>
<table class="altRow" width="100%">
  <tr>
    <td width="70"><font class="label">USER&nbsp;ID</font></td>
    <td width="60">
      <input type="text"  style="text-transform:uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" size="10" name="UI" value="<%=strUserId%>">
    </td>
    <td width="42"><font class="label">F&nbsp;NAME</font></td>
    <td width="60">
      <input type="text"  style="text-transform:uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" name="FN" value="<%=strFirstName%>">
    </td>
    
    <td width="42"><font class="label">L&nbsp;NAME</font></td>
    <td width="60">
      <input type="text"  style="text-transform:uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" name="LN" value="<%=strLastName%>">
    </td>


    <td width="43"><font class="label">STATUS</font></td>
    <td width="60"  >
      <input type="text"  style="text-transform:uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" size="10" name="status" value="<%=strStatus%>">
    </td>
  </tr>
 </table>
            <br/>
            <span style="margin-left: 350px;"><input class="button" type="button" name="Search" value="Search" onClick="UserList() "></span>
    
<br/>
<br/>



<%@ include file="ModalPop_UserList.jsp"%>

<link href="Shows_Pop.css" rel="stylesheet" type="text/css" />
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />



            </form>
    </body>
</html>
