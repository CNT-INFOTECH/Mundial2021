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
        <title>Search Roles</title>
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



  function returntoMain(varRoleID,varRoleName,varStatus)
  {

//window.parent.document.forms[0].method="post";
//window.parent.document.forms[0].action="frmAccessScreen.jsp?Mode=2&RLD="+varRoleID;
//window.parent.document.forms[0].submit();

if(window.parent.document.forms[0].name=="create_role")
            {
        window.parent.document.forms[0].role_Id.value=varRoleID;
        window.parent.document.forms[0].role_name.value=varRoleName;
        window.parent.document.forms[0].status.value=varStatus;
          window.parent.jQuery('#dialog-Roles').dialog('close');
            }
else if(window.parent.document.forms[0].name=="frmscreensccess")
            {
        window.parent.document.forms[0].method="post";
        window.parent.document.forms[0].action="frmAccessScreen.jsp?Mode=2&RLD="+varRoleID;
        window.parent.document.forms[0].submit();



        
        
        //window.parent.document.forms[0].action="frmAccessScreen.jsp";
          //window.parent.jQuery('#dialog-Roles').dialog('close');
        //  window.parent.document.forms[0].refresh();
          //document.forms[0].action="frmAccessScreen.jsp";
         //  window.document.forms[0].status.action="111.jsp"

        
            }
else if(window.parent.document.forms[0].name=="usercreate")
            {

var str_rtnId=document.forms[0].Retn_Id.value;
var str_rtnSeqId=document.forms[0].Retn_SeqId.value;

//        window.parent.document.forms[0].str_rtnId.value=varRoleID;
		window.parent.document.getElementById(str_rtnId).value=varRoleID;
//        window.parent.document.forms[0].str_rtnSeqId.value=varRoleName;
      window.parent.document.getElementById(str_rtnSeqId).value=varRoleName;
        //window.parent.document.forms[0].status.value=varStatus
		  window.parent.jQuery('#dialog-Roles').dialog('close');
            }

  }

 function RoleList()
 {


roleid=document.forms[0].RI.value
rolename=document.forms[0].RN.value
status=document.forms[0].status.value
/* added by erzath for return id & seq field name*/
Retn_RoleId=document.forms[0].Retn_Id.value
Retn_RoleSeqId=document.forms[0].Retn_SeqId.value
/** end of erzath**/

document.forms[0].method="post";
document.forms[0].action="ModalPop_Roles.jsp?mode=1&RI="+roleid+"&RN="+rolename+"&status="+status+"&RetnID="+Retn_RoleId+"&RetnSeqID="+Retn_RoleSeqId;
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
/*** added by erzath for returing the id and seq  */
		String strRetn_RoleId="";
		String strRetn_RoleSeqId="";
		if(request.getParameter("RetnID")!=null)
            strRetn_RoleId=request.getParameter("RetnID");
        if(request.getParameter("RetnSeqID")!=null)
            strRetn_RoleSeqId=request.getParameter("RetnSeqID");
/** end of erzath **/



		String strRoleId="";
        String strRoleName="";
        String strStatus="";
        if(request.getParameter("RI")!=null)
            strRoleId=request.getParameter("RI");
        if(request.getParameter("RN")!=null)
            strRoleName=request.getParameter("RN");
        if(request.getParameter("status")!=null)
            strStatus=request.getParameter("status");
%>


        <form>
<table class="altRow" width="100%">
  <tr>
    <td width="81"><font class="label">ROLE&nbsp;ID</font></td>
    <td width="137" nowrap >
      <input type="text"  style="text-transform:uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" name="RI" value="<%=strRoleId%>">
    </td>
    <td width="42"><font class="label">ROLE&nbsp;NAME</font></td>
    <td width="144">
      <input type="text"  style="text-transform:uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" name="RN" value="<%=strRoleName%>">
    </td>
    <td width="43"><font class="label">STATUS</font></td>
    <td width="60"  >
      <input type="text"  style="text-transform:uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" name="status" size="10" value="<%=strStatus%>">
    </td>
    <td width="102"  >
      <input class="button" type="button" name="Search" value="Search" onClick="RoleList()">
    </td>
  </tr>
<!-- added by erzath , for returning to the specific id-->
<input type="hidden"  name="Retn_Id" id="Retn_Id" size="10" value="<%=strRetn_RoleId%>">
<input type="hidden"  name="Retn_SeqId" id="Retn_SeqId" size="10" value="<%=strRetn_RoleSeqId%>">
<!-- end of erzath -->

</table>

<%@ include file="ModalPop_RoleList.jsp"%>

<link href="Shows_Pop.css" rel="stylesheet" type="text/css" />
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />











            </form>
    </body>
</html>
 