
<%--
    Document   : ModalPop_Show
    Created on : May 18, 2011, 3:22:48 PM
    Author     : raju
--%>

<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <script type="text/javascript" src="jscIndex.js"></script>
<!--<script src="js/jquery.autocomplete.js"></script>-->
<script type='text/javascript' src='AutoComplete/jquery.autocomplete.js'></script>
                 <script type="text/javascript" src="js/interface.js"></script>
		<script type="text/javascript" src="jscReg_AutoComplete.js"></script>
    </head>


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
</style>


<script type="text/javascript">
function SearchBreederInformation()
{
    document.forms[0].method="post";
    document.forms[0].action="BreederPopup_Reg.jsp?srch=1&Type=1"
    document.forms[0].target="_self";
    document.forms[0].submit();
}
function viewAll_Breeder()
{
    document.forms[0].method="post";
    document.forms[0].action="BreederPopup_Reg.jsp?srch=1&Type=2"
    document.forms[0].target="_self";
    document.forms[0].submit();
    document.forms[0].submit();
}
function countLetterOccurences(str,letter,replacableChar){
    count = 0;
    pos = str.indexOf(letter);
    while ( pos != -1 ) {
    count++;
    pos = str.indexOf(letter,pos+1);
    }
    //return count;
    var i=0;
    for(i=0;i<count;i++)
    {
    str=str.replace(letter,replacableChar);
    }
    return str;

}
function returnBreederValue(BreederName,EntitySeq)
{
	
letter='%22';
BreederName=countLetterOccurences(BreederName,letter,'"');

    //window.parent.document.getElementById("breeder").value=varHrsName
    if(window.parent.document.forms[0].name=="Registrationform")
    {
		window.parent.document.getElementById("breeder").value=BreederName;
		window.parent.document.getElementById("breeder_Lbl").innerHTML=BreederName;
		window.parent.document.getElementById("breederSeq").value=EntitySeq;
		window.parent.document.getElementById("SavedYN").value='N';

	
		var ownSeq=window.parent.document.getElementById("HDNENTITYSEQ").value;

        if(ownSeq==EntitySeq)
        window.parent.document.getElementById("OWNER_NAME_VAL").innerHTML='<a onclick="EditOwner('+trimRegister(ownSeq)+')">'+trimRegister(BreederName)+'</a>';
        

    }
    /***********Veera Start*****************/
    else if(window.parent.document.forms[0].name=="frmRegistrationSearch")
    {
        window.parent.document.getElementById("Breeder").value=EntitySeq;
        window.parent.document.getElementById("BreederName").value=BreederName;
    }
    /***********Veera End*******************/
    //window.location.reload();
    reload_popup();
    window.parent.jQuery('#dialog-Breeder').dialog('close')
}
function reload_popup()
{
    document.forms[0].method="post";
    document.forms[0].action="BreederPopup_Reg.jsp?srch="
    document.forms[0].submit();
}
function EmptyAll_AutoBreeder(Name,No)
{
    if(document.getElementById(Name).value=='')
    {
        document.getElementById(Name).value='';
        document.getElementById(No).value='';
    }
}
function ResetBreederInformation()
{
	document.getElementById("Owner_No").value='';
	document.getElementById("Org_Name").value='';
	document.getElementById("phone").value='';

    document.forms[0].method="post";
    document.forms[0].action="BreederPopup_Reg.jsp?srch="
    document.forms[0].target="_self";
    document.forms[0].submit();
}

</script>

<body>
<form name="BreederPopUp">
<div id="framecontent_addPlace">
<div class="innertube">
<%
    String strBreederName="";
    String strBreederLName="";
    String strOrgName="";
    String strFirstName="";
    String strLastName="";
    String strAddress="";
    String strAddress1="";
    String strAddress2="";
    String strPhone="";
    String strMiddleName="";
    String city="";
    String state="";
    String zip="";
    String country="";
    String strEntitySeq="";
    String strSrch="";
    String strType="";
    String strBreederNo="";

    if(strSrch.equals("0"))
    {
        strBreederName="";
        strFirstName="";
        strLastName="";
        strMiddleName="";
        strAddress="";
        strAddress1="";
        strAddress2="";
        strPhone="";
        city="";
        state="";
        zip="";
        country="";
        strEntitySeq="";
        strBreederNo="";
        strOrgName="";
        strType="";
        strSrch="";
    }

    if(request.getParameter("breederfname")!=null)
        strBreederName=request.getParameter("breederfname");

    if(request.getParameter("breederlname")!=null)
        strBreederLName=request.getParameter("breederlname");

    if(request.getParameter("Org_Name")!=null)
        strOrgName=request.getParameter("Org_Name");

    if(request.getParameter("phone")!=null)
        strPhone=request.getParameter("phone");

    if(request.getParameter("srch")!=null)
        strSrch=request.getParameter("srch");

    if(request.getParameter("Type")!=null)
        strType=request.getParameter("Type");

    if(request.getParameter("Breeder_No")!=null)
        strBreederNo=request.getParameter("Breeder_No");


%>
    <table class="altRow" width="100%">
        <tr>
            <td>ID#</td>
            <td>
                <input type="text" value="<%=strBreederNo%>"  size="10" name="Breeder_No" id="Owner_No" style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" >
            </td>
            <td nowrap align="right">NAME</td>
            <td >
                <input type="text" name="Org_Name" id="Org_Name"  size="45" value="<%=strOrgName%>"
                style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border:  1px solid #000000;
                text-transform: uppercase;height: 16px;padding-left: 18px;"
                onchange="EmptyAll_AutoBreeder('Org_Name','Owner_No')">
            </td>
            <td >PHONE</td>
            <td >
              <input type="text"  value="<%=strPhone%>"   style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" name="phone" id="phone">
            </td>
        </tr>
		<!--
        <tr>
            <td colspan="2">BREEDER&nbsp;NAME(F,L)</td>
            <td  nowrap >
              <input type="text"  value="<%=strBreederName%>"    style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" name="breederfname" id="breederfname">
            </td>
            <td>
                <input type="text"  value="<%=strBreederLName%>"    style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" name="breederlname" id="breederlname">
            </td>

        </tr>
        -->
        <tr>


            <td colspan="6" align="right" >
              <input class="button" type="button" name="Search" value="Search" onclick="SearchBreederInformation()" >
              <input class="button" type="button" name="Reset" value="Reset" onclick="ResetBreederInformation()" >
              <input class="button" type="button" name="New" value="New" onclick="BreederAddPopUp('breederfname','breederlname','phone','New','')" >
              <!--<input type="button" value="Edit" class="button" onclick="BreederAddPopUp('breederfname','breederlname','phone','Modify')" >-->
            </td>
        </tr>

    </table>
</div>
</div>
<%--
if(strSrch.length()>0)
    {
--%>
<div id="maincontent_Breeder_Search">
<div class="innertube">
    <%@ include file="BreederPopup_RegList.jsp" %>
</div>
</div>
<%--}--%>

<div id="dialog-BreederAdd" title="BREEDER" style="text-transform: uppercase;display:none; background:url('Images/trans-wood-1.png')" >
    <iframe id="modalIFrame_BreederAdd" width="100%"  height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
    </iframe>
</div>
</form>
</body>
</html>
