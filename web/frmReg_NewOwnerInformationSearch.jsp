<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>PERSON SEARCH</title>
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
<!--<script src="js/jquery.autocomplete.js"></script>-->
<script type='text/javascript' src='AutoComplete/jquery.autocomplete.js'></script>
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
function TitleName()
{
    if(opener.document.forms[0].name=="Person_frm" || opener.document.forms[0].name=="Person_Observation_frm"
    || opener.document.forms[0].name=="Person_ShowHistory_frm")
    {
        document.title="PERSON SEARCH";
        document.getElementById('NewButton').style.visibility="hidden";
    }
    else
    {
         document.title="OWNER SEARCH";
    }
}
function SearchOwnerInformation(objType)
{
    if(opener.document.forms[0].name=="Person_frm")
    {
    document.forms[0].method="post";
    document.forms[0].action="frmReg_NewOwnerInformationSearch.jsp?srch=1&typ=5"
    document.forms[0].submit();
    }
    else if(opener.document.forms[0].name=="Person_Search")
    {
    document.forms[0].method="post";
    document.forms[0].action="frmReg_NewOwnerInformationSearch.jsp?srch=1&typ=5"
    document.forms[0].submit();
    }
    else
    {
    document.forms[0].method="post";
    document.forms[0].action="frmReg_NewOwnerInformationSearch.jsp?srch=1&typ=1&tpe="+objType;
    document.forms[0].submit();
    }
}


function ViewAll_Owner(strName){

    if(strName=="OWNER_NAME")
    {
    document.forms[0].method="post";
    document.forms[0].action="frmReg_NewOwnerInformationSearch.jsp?srch=1&typ=2"
    document.forms[0].target="_self";
    document.forms[0].submit();
    }
    else if(strName=="PERSON_NAME")
    {
    document.forms[0].method="post";
    document.forms[0].action="frmReg_NewOwnerInformationSearch.jsp?srch=1&typ=6"
    document.forms[0].target="_self";
    document.forms[0].submit();
    }
    /* else to display Org names in the result set in th NAME Column */
    else
    {
    document.forms[0].method="post";
    document.forms[0].action="frmReg_NewOwnerInformationSearch.jsp?srch=1&typ=4"
    document.forms[0].target="_self";
    document.forms[0].submit();
    }
}
function Add_NewOwner()
{
    window.resizeTo(700, 500);
    document.forms[0].method="post";
    document.forms[0].action="frmReg_NewOwner_Pop.jsp"
    document.forms[0].target="_self";
    document.forms[0].submit();

}
function Pop_Add_Owner(vartype,varNum)
{

            document.forms[0].method="post";
            document.forms[0].action="frmEntityDetails.jsp?Num="+varNum+"&Type="+vartype
            document.forms[0].submit();

}
function EmptyAll_AutoOwner(Name,No)
{
    if(document.getElementById(Name).value=='')
    {
        document.getElementById(Name).value='';
        document.getElementById(No).value='';
    }
}

function ResetRegOwnerInformationSearch()
{
		document.getElementById("Org_Name").value="";
		document.getElementById("Owner_No").value='';
		document.getElementById("Phone").value='';


	document.forms[0].method="post";
    document.forms[0].action="frmReg_NewOwnerInformationSearch.jsp?tpe=O";
    document.forms[0].target="_self";
    document.forms[0].submit();
}

</script>

</head>
<body onload="TitleName()" >

<form name="Reg_NewOwnerInformationSearch" >

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
String srchType="";

String Form_Name="";

if(request.getParameter("frmType")!=null)
    Form_Name=request.getParameter("frmType");
else
    Form_Name="";

if(request.getParameter("tpe")!=null)
    srchType=request.getParameter("tpe");

if(request.getParameter("FName")!=null)
    strFName=request.getParameter("FName");

if(request.getParameter("LName")!=null)
    strLName=request.getParameter("LName");

if(request.getParameter("Org_Name")!=null)
    strOrgName=request.getParameter("Org_Name");

if(request.getParameter("Phone")!=null)
    strPhone=request.getParameter("Phone");

if(request.getParameter("srch")!=null)
    strSearch=request.getParameter("srch");

if(request.getParameter("typ")!=null)
{
    strType=request.getParameter("typ");
    if(strType.equals("entyseq"))
        strEntitySeq=request.getParameter("enty").trim();
}

if(request.getParameter("Owner_No")!=null)
    strOwnerNo=request.getParameter("Owner_No");

%>
<div id="framecontent">
<div class="innertube">
    <table class="altRow">
        <tr>
            <td nowrap>ID#</td>
            <td >
                <input type="text" value="<%=strOwnerNo%>" size="5" name="Owner_No" id="Owner_No" style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" >
            </td>
            <td nowrap>NAME</td>
            <td >
                <input type="text" name="Org_Name" id="Org_Name"  size="55" value="<%=strOrgName%>"
                style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px;
                border: 1px solid #000000;text-transform: uppercase;height: 16px;padding-left: 18px;"
                onchange="EmptyAll_AutoOwner('Org_Name','Owner_No')">
            </td>
            <td>PHONE</td>
            <td colspan="2">
                <input type="text" name="Phone" id="Phone"   value="<%=strPhone%>" size="15" style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
            </td>
		
        </tr>
        <tr>
		<!--
            <td>F.NAME</td>
            <td colspan="2">
                <input type="hidden" name="FName" id="FName" value="<%=strFName%>" size="18" style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
            </td>
            <td>L.NAME</td>
            <td>
                <input type="hidden" name="LName" id="LName"  value="<%=strLName%>" size="18" style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
            </td>
		-->
            

            <td colspan="6" align="right">

                <input type="button" value="Search" class="button" onclick="SearchOwnerInformation('<%=srchType%>')"/>                
                <input type="button" value="Reset" class="button" onclick="ResetRegOwnerInformationSearch('<%=srchType%>')"/>

                <%if(!Form_Name.equals("SEARCH")){%>
                <input type="button" value="New" id="NewButton" name="NewButton" class="button" onclick="Add_NewOwner()"/>
                <%}%>
                <!--onClick="Pop_Add_Owner('<%--=strType--%>','<%--=strNum--%>')/>-->
            </td>

        </tr>
    </table>
</div>
</div>
<div id="maincontent_Owner">
<div class="innertube">
<br>
 <%@ include file="frmReg_NewOwnerInformationSearchInclude.jsp"%>
</div>
</div>

</form>
</body>
</html>
