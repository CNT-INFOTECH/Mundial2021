<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head> <title>MEMBER SEARCH</title>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="Style_Popup.css">
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />
        <link href="frmReg_CommonRef.css" rel="stylesheet" type="text/css" />
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
        <script src="js/jquery.autocomplete.js"></script>
        <script type="text/javascript" src="jscReg_AutoComplete.js"></script>

<style type="text/css">
.altRow
{

}

.altRow td
{
	border-bottom:1px dotted #ffffff;
	font-size:9pt;
	color:#000000;
	/*padding:5px 0 5px 5px;*/
	vertical-align:top;
	/*text-align:left;*/
}


.altRow  th
{
	background:#4e738f;
	color:#fff;
	font-weight:bold;
	font-size:9pt;
	/*text-align:center;*/
}

body {  background:url("Images/trans-wood-1.png"); font: .89em "Trebuchet MS", Arial, Sans-Serif;}

</style>
<script type="text/javascript">

function MemberSearchInclude()
{
    if(opener.document.forms[0].name=="frmMember")
    {
            document.forms[0].method="post";
            document.forms[0].action="frmMemberPopup.jsp?srch=1&typ=1"
            document.forms[0].submit();
    }
  
}

function Reset_Member(Name,No,phone)
{
    document.getElementById(Name).value='';
    document.getElementById(No).value='';
    document.getElementById(phone).value='';

    document.forms[0].method="post";
    document.forms[0].action="frmMemberPopup.jsp"
    document.forms[0].target="_self";
    document.forms[0].submit();

}
function ViewAll_Member()
{
    document.forms[0].method="post";
    document.forms[0].action="frmMemberPopup.jsp?srch=1&typ=2"
    document.forms[0].target="_self";
    document.forms[0].submit();
}


</script>
</head>
<body>
<form>

<%
String strFName="";
String strLName="";
String strOrgName="";
String strPhone="";
String strEntitySeq="";
String strSearch="";
String strType="";
String strOwnerNo="";
String strOwnerName="";
String strMName="";
String strAddress="";
String strAddress1="";
String strAddress2="";
String city="";
String state="";
String zip="";
String country="";
String strMemberNum="";
String Name="";
String strOwn_Type="";
//if(request.getParameter("FName")!=null)
   // strFName=request.getParameter("FName");

if(request.getParameter("LName")!=null)
    strLName=request.getParameter("LName");

if(request.getParameter("Org_Name")!=null)
    strOrgName=request.getParameter("Org_Name");

if(request.getParameter("Phone")!=null)
    strPhone=request.getParameter("Phone");

if(request.getParameter("srch")!=null)
    strSearch=request.getParameter("srch");

if(request.getParameter("typ")!=null)
    strType=request.getParameter("typ");

if(request.getParameter("Owner_No")!=null)
    strOwnerNo=request.getParameter("Owner_No");

if(request.getParameter("MemberNum")!=null)
    strMemberNum=request.getParameter("MemberNum");

if(request.getParameter("Name")!=null)
    strFName=request.getParameter("Name").trim();
%>
<div id="framecontent">
<div class="innertube">
    <table class="altRow">
        <tr>
            <td nowrap>ID#</td>
            <td>
                <input type="text" value="<%=strMemberNum%>" size="5" name="MemberNum" id="MemberNum" style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" >
            </td>
            <td nowrap>NAME</td>
            <td>
               <!--<input type="text" name="Name" id="Name"  size="30" value="<%=strFName%>" style="  background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;text-transform: uppercase;">-->
                 <input type="text" name="Name" id="Name"  size="55" value="<%=strFName%>"  style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;text-transform: uppercase;
                    height: 16px;
                    padding-left: 18px;">
            </td>
            <td>PHONE</td>
            <td>
                <input type="text" name="Phone" id="Phone"   value="<%=strPhone%>" size="15" style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
            </td> 
        </tr>
        <tr>                   
            <td   colspan="6" align="right">
                <input type="button" value="Search" class="button" onclick="MemberSearchInclude()"/>
                <input type="button" value="Reset" class="button" onclick="Reset_Member('Name','MemberNum','Phone')"/>
            </td>
        </tr>
    </table>
</div>
</div>
<div id="maincontent_Owner">
<div class="innertube">
<br>
 <%@ include file="frmMemberInclude.jsp"%>
</div>
</div>

</form>
</body>
</html>