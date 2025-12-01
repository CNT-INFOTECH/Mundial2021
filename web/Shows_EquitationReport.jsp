<%-- 
    Document   : Shows_EquitationReport
    Created on : Jun 28, 2012, 8:14:34 AM
    Author     : erzath
--%>


<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EQUITATION SEARCH</title>
<link rel="stylesheet" href="Style_Popup.css">
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
<link href="frmReg_CommonRef.css" rel="stylesheet" type="text/css" />                
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
<script src="js/jquery.autocomplete.js"></script>

<script type="text/javascript" src="js/interface.js"></script>
<script type="text/javascript" src="JscEquitationReport.js"></script>
<script type="text/javascript" src="scripts/jscCommon.js"></script>
<script type="text/javascript" src="scripts/Shows_Register.js"></script>

<style type="text/CSS">
<!--
@import url("CommonTableStyle.css");
-->
.dateStyle_Event
{
	font-size: 8px;
	font-family: Verdana, arial, helvetica, sans-serif;
	font-weight: bold;
	FONT-STYLE: italic;
	color: maroon; /* before 7/17/2006 maroon; */
        vertical-align:top;
}
.ui-datepicker
{
    font-family:TimesNewRoman;
    font-size: 10px;
    margin-left:1px;    
    margin-top: 0px;     
    line-height: 1.0em;
}

#content_PS {
float:right;
width:820px;
text-align:center;
}
.Grid_Header
{
	padding-top: 2px;
	padding-bottom: 2px;
	color: #ffffff;
	background-color:#4e738f;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
}
/* This section is used for the GridViews */
table.grid
{
	margin: 0px 0px 0px 0px;
	padding: 0em 0em;
	font-family: Verdana, Arial, Helvetica, Sans Serif;
	font-size: 12px;
	color: black;
	text-decoration: none;
	vertical-align: middle;
        text-align:center; 
	font-weight: normal;
	letter-spacing: 0px;
	border: none;
      
}

table.grid a:link
{
	margin: 0px 0px 0px 0px;
	padding: 0em 0em;
	font-family: Verdana, Arial, Helvetica, Sans Serif;
	font-size: 12px;
	color: black;
	text-decoration: none;
	/*text-align: left;*/
	vertical-align: middle;
	font-weight: normal;
	letter-spacing: 0px;
}

table.grid a:visited
{
	margin: 0px 0px 0px 0px;
	padding: 0em 0em;
	font-family: Verdana, Arial, Helvetica, Sans Serif;
	font-size: 12px;
	color: black;
	text-decoration: none;
	/*text-align: left;*/
	vertical-align: middle;
	font-weight: normal;
	letter-spacing: 0px;
}

table.grid a:hover
{
	margin: 0px 0px 0px 0px;
	padding: 0em 0em;
	font-family: Verdana, Arial, Helvetica, Sans Serif;
	font-size: 12px;
	color: black;
	text-decoration: underline;
	/*text-align: left;*/
	vertical-align: middle;
	font-weight: normal;
	letter-spacing: 0px;
}

.grid tr:hover td
{
	background: #4e738f ;
	color: #339;
        cursor : pointer;
}

.grid th.sorted a, th.sortable a {
        font-size: 12px;
        font-weight: bold;
        color: #ffffff;
        background-color:#4e738f;
        font-family: Verdana, Arial, Helvetica, sans-serif;
        background-position: center;
        background-repeat: no-repeat;
        display: block;
        text-decoration:none


 }
 .grid th.sortable a {
        font-size: 12px;
        font-weight: bold;
        color: #ffffff;
        background-color:#4e738f;
        font-family: Verdana, Arial, Helvetica, sans-serif;
        text-decoration:none
 }
 .grid th.order1 a {
     background-position: right 50%;
      background-image: url(Images/sort_dn_1.gif);
 }
 .grid th.order2 a {
     background-position: right 50%;
      background-image: url(Images/sort_up_1.gif);
 }

.grid th
{
	background: #4e738f ;
	color: white;
        cursor : pointer;
        padding: 0.5em 0.5em;
       
}

</style>
</head>
<body>
<form name="Shows_EquitationReport">

<%
String strSearch="";
String strCountry="";
String strShowName="";
String strShowSeq="";
String strEventOrder="";
String strEvents="";
String strEventSeq="";
String strEventFromDate="";
String strEventToDate="";
String strSchoolName="";
String strSchoolSeq="";
String SearchType="";
String strDetailed="";
String strHdnSrch="Country";

if(request.getParameter("Srch")!=null)
    strSearch=request.getParameter("Srch");
else
    strSearch="";

//Fetching the value only if  they press search, else we dont get any values
if(strSearch.equals("1"))
{
    if(request.getParameter("ShowName")!=null)
        strShowName=request.getParameter("ShowName");
    else
        strShowName="";
    
    if(request.getParameter("ShowSeq")!=null)
        strShowSeq=request.getParameter("ShowSeq");
    else
        strShowSeq="";
    
    if(request.getParameter("EventOrder")!=null)
        strEventOrder=request.getParameter("EventOrder");
    else
        strEventOrder="";
    
    if(request.getParameter("Events")!=null)
        strEvents=request.getParameter("Events");
    else
        strEvents="";
    
    if(request.getParameter("EventSeq")!=null)
        strEventSeq=request.getParameter("EventSeq");
    else
        strEventSeq="";
    
    if(request.getParameter("Event_dateFrom")!=null)
        strEventFromDate=request.getParameter("Event_dateFrom");
    else
        strEventFromDate="";
    
    if(request.getParameter("Event_dateTo")!=null)
        strEventToDate=request.getParameter("Event_dateTo");
    else
        strEventToDate="";
    
    if(request.getParameter("Country")!=null)
    {
       strCountry=request.getParameter("Country");
       if(strCountry.equals("Country"))
			strCountry="Y";
              //SearchType="Country";                
    }
    else
    {
          strCountry="";          
    }
    
    if(request.getParameter("School")!=null)
    {
       strSchoolName=request.getParameter("School");
       if(strSchoolName.equals("School"))
              strSchoolSeq="Y";
              //SearchType="School";
    }
    else
    {
       strSchoolName="";
       strSchoolSeq="";       
    }
        
    
    if(request.getParameter("HdnSrch")!=null)
        strHdnSrch=request.getParameter("HdnSrch");
    else
        strHdnSrch="";
    
    if(request.getParameter("SrchType")!=null)
        SearchType=request.getParameter("SrchType");
    else
        SearchType="";
    
          
}
%>
<div id="container">
    
    <div id="header">
        <%@ include file="frmHeader.jsp"%>
    </div>
    
    <div id="content">
        <fieldset> <legend>EQUITATION SEARCH</legend>
        <table class="altRow">    
            <tr>
                <td>SHOWS</td>
                <td nowrap>
                    <input type="text" name="ShowName" id="ShowName" size="25px" value="<%=strShowName%>"
                    style="background:#FFF8DC url(Images/magnifier.png) no-repeat 1px 1px;
                    text-transform: uppercase;border: 1px solid #000000;height: 16px;padding-left: 18px;">
                    <img src="Images/Find12.jpg" name="ShowSearch" id="ShowSearch"  onClick="Search_Shows('ShowSeq','ShowName')" />
                    <input type="hidden" name="ShowSeq" id="ShowSeq" value="<%=strShowSeq%>">
                </td>
                <td >EVENTS</td>
                <td nowrap>
                    <input type="text" size="2" id="EventOrder" name="EventOrder"  value="<%=strEventOrder%>"
                    style="background-color:  #FFF8DC; border:  1px solid #000000;" 
                     onBlur="getEventName(ShowSeq,ShowName,this,EventSeq,Events)"/>                     
                    <input type="text" name="Events" id="Events" size="50px" value="<%=strEvents%>"
                    style="background:#FFF8DC url(Images/magnifier.png) no-repeat 1px 1px;
                    text-transform: uppercase;border: 1px solid #000000;height: 16px;padding-left: 18px;">                    
                    <input type="hidden" name="EventSeq" id="EventSeq" value="<%=strEventSeq%>">
                </td>
            </tr>
            <tr>
                <td nowrap>EVENT DATE</td>
                <td>
                    <font class="dateStyle_Event" align="top" >FROM</font>
                    <input type="text" id="Event_dateFrom" placeholder="MM/DD/YYYY"
                    name="Event_dateFrom" size="10"    value="<%=strEventFromDate%>"               
                    style="background-color:  #FFF8DC; 
                    border:  1px solid #000000;text-transform: uppercase;width:85px;">                    
                
                    <font class="dateStyle_Event" align="top" >TO</font>
                    <input type="text" id="Event_dateTo" placeholder="MM/DD/YYYY" 
                    name="Event_dateTo" size="10" value="<%=strEventToDate%>"
                    style="background-color:  #FFF8DC; border:  1px solid #000000;
                    text-transform: uppercase;width:85px;">
                </td>
                <td></td>
                <td colspan="2">
                    <input type="checkbox" id="Country"  name="Country" value="Country" 
                    onclick="fn_SelectCheckBox(this)"
                    <%if(strCountry.equals("Y"))
                        out.println("Checked");
                    %>  >&nbsp;BY COUNTRY
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="checkbox" id="School"  name="School" value="School" 
                    onclick="fn_SelectCheckBox(this)"
                    <%if(strSchoolSeq.equals("Y"))
                        out.println("Checked");
                    %>  >&nbsp;BY SCHOOL
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="checkbox" id="Detailed"  name="Detailed" value="Detailed"  
                    onclick="fnMakeDetailView(this,'SrchType')"
                    <%if(SearchType.equals("Detailed"))
                        out.println("Checked");
                    %>  >&nbsp;DETAILED
                </td>
                <!--<td colspan="2" >
                    <input type="text" name="Country" id="Country" value="<%=strCountry%>"
                    style="background-color:#FFF8DC;border:1px solid #000000;
                    text-transform:uppercase;width:90px;">
                SCHOOL
                    <input type="text" name="SchoolName" id="SchoolName" value="<%=strSchoolName%>"
                    style="background-color:#FFF8DC;
                    border:  1px solid #000000;text-transform: uppercase;width:252px;">
                    <input type="hidden" name="SchoolSeq" id="SchoolSeq" size="5" value="<%=strSchoolSeq%>"
                    style="background-color:#FFF8DC;
                    border:  1px solid #000000;text-transform: uppercase;">
                </td>-->
            </tr>            
        </table>
        <div align="RIGHT">
            <input type="button" id="EquitationSearch" name="EquitationSearch" class="button" value="Search" onclick="fnSearch()" />
            <input type="button" id="ResetEquiSearch" class="button" value="Reset" onclick="fnReset()"/>
            <input type="button" id="ReportEquiSearch" class="button" value="Report" onclick="fnOpenReport()" />            
        <div>
        </fieldset>
        <input type="hidden" value="EQUITATION_REPORT" id="PageID" name="PageID"/>
        <input type="hidden" id="SrchType" name="SrchType" value="<%=SearchType%>" />
        <input type="hidden" id="HdnSrch" name="HdnSrch" value="<%=strHdnSrch%>" />
        <div id="content_PS">
        <%@ include file="Shows_EquitationBottomListReport.jsp" %>
    </div>
                                               
    </div>
   
    
    <div id="sidebar">
        <%--@ include file="PersonSearch_Side.jsp" --%>
    </div>    
   
    <div id="footer_Bot" align="bottom">    
    <jsp:include page="/frmBottom_Registration.jsp"/>
    </div>
</div>
<!--
<div id="dialog-ShowSearch" title="Shows Search" style="display:none; background:url('Images/trans-wood-1.png');" >
    <iframe  src="regsearchpopup.jsp"  id="modalIFrame_Show" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
    </iframe>
</div>
-->
<!----- This is for the Country/School Points Detailed Pop Up -->
<div id="dialog-PointDetails" style="display:none; background:url('Images/trans-wood-1.png')" >
    <iframe id="modalIFrame_PointDetails" width="100%" height="100%" marginwidth="0" marginheight="0"  frameborder="0" >
    </iframe>
</div>
<!----- This is for the Show Pop Up -->
<div id="dialog-Show" name="dialog-Show"  style="display:none; background:url('Images/trans-wood-1.png')">
<iframe  src="blank.jsp"  id="modalIFrame_ShowList" width="100%" height="100%" marginwidth="0" marginheight="0"
         frameborder="0"  >
</iframe>
</div>

</form>
    
    </body>
</html>


