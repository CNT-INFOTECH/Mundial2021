<%--
    Document   : ModalPop_Show
    Created on : May 18, 2011, 3:22:48 PM
    Author     : raju
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="Style_Popup.css">
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />
        <link href="Registration.css" rel="stylesheet" type="text/css" />
        
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
<style type="text/css"> 
.altRow
{

}

.altRow td
{
	border-bottom:1px dotted #ffffff;
	font-size:9pt;
	color:#000000;
	padding:5px 0 5px 5px;
	vertical-align:top;
	text-align:left;
}


.altRow  th
{
	background:#4e738f;
	color:#fff;
	font-weight:bold;
	font-size:9pt;
	text-align:center;
}
</style>
        <script>

  function return_OrgValues()
  {
         //window.parent.location.href = "Shows_Selected.jsp?Seq="+SelValue;
//         childWindow=close("BreederPopup_Reg.jsp"); 
         //$( "#dialog-Breeder" ).dialog( "close" );
         $( "#dialog-Breeder" ).dialog( "close" );
         /*        document.forms[0].method="post";
		  document.forms[0].action="Shows.jsp"
		  document.forms[0].submit();
           */
  }
  function SearchOrganizationInformation() {   
            document.forms[0].method="post";
            document.forms[0].action="OrganisationPopup_RegList.jsp"
            document.forms[0].submit();

}
function viewall()
{
    document.forms[0].orgname.value="";    

    document.forms[0].method="post";
    document.forms[0].action="frmReg_OrganizationPopup_ViewAll.jsp";
    document.forms[0].target="_self";
    document.forms[0].submit();
}

/*   
function OrgList()
{
var xmlhttp;
if (window.XMLHttpRequest)
{// code for IE7+, Firefox, Chrome, Opera, Safari
xmlhttp=new XMLHttpRequest();
}
else
{// code for IE6, IE5
xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
}
xmlhttp.onreadystatechange=function()
{
if (xmlhttp.readyState==4 && xmlhttp.status==200)
{
document.getElementById("OrgListDetails").innerHTML=xmlhttp.responseText;
}
}
xmlhttp.open("GET","OrganisationPopup_RegList.jsp",true);
xmlhttp.send();
}*/
        </script>
    </head>
    <body>
        <form name="OrganizationPopup_Reg">
            <div id="framecontent">
            <div class="innertube">
<%
String strOrgName="";
String RefType="ORGANIZATION";
String Seqno="";

if(request.getParameter("orgname")!=null)
    strOrgName=request.getParameter("orgname");
%>
                <table class="altRow" width="100%">
                    <tr>
                        <td width="81"><font class="label">ORGANIZATION&nbsp;NAME</font></td>
                        <td width="137" nowrap >
                        <input type="text" value="<%=strOrgName%>"  onKeyUp="javascript:this.value=this.value.toUpperCase()" style="background-color:  #FFF8DC; border:  1px solid #000000;" name="orgname"  id="orgname" />
                        </td>
                        <%--<td width="42"><font class="label">Place</font></td>
                        <td width="144">
                        <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;" name="place"
                        >
                        </td>--%>
                        <td width="102"  >
                        <input class="button" type="button" name="Search" value="Search" onClick="SearchOrganizationInformation()">
                        </td>                        
                    </tr>
                    <tr>
                        <td colspan="3">
                            <input type="radio" name="view" id="view" onclick="viewall()" />   VIEW  ALL
                        </td>
                    </tr>
                </table>
        </div>
        </div>
 <div  id="OrgListDetails">

 </div>
            </form>
    </body>
</html>
