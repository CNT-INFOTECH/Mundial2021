<%-- 
    Document   : Person_Search
    Created on : Dec 22, 2011, 3:12:51 PM
    Author     : Erzath
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
<%@ page import="pasotracker.GeneralServlet" %>  
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>PERSON SEARCH</title>
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
        <script src="jscIndex.js"></script>
        <script type="text/javascript" src="js/interface.js"></script>
        <script type="text/javascript" src="jscReg_AutoComplete.js"></script>
        <script type="text/javascript" src="jscPersonSearch.js"></script>
        <script type="text/javascript" src="jscPerson.js"></script>

<style type="text/CSS">
<!--
@import url("CommonTableStyle.css");
-->
#content_PS {
float:right;
width:820px;
}

#footer_Bot {        
	clear:both;
	text-align:center;
	/*background: #555;
	color:#fff;*/
	height:50px;
	padding:5px;
         bottom: auto;
}
#JDate
{
    text-align:right;
}
.dateStyleBody
{
	font-size: 8px;
	font-family: Verdana, arial, helvetica, sans-serif;
	font-weight: bold;
	FONT-STYLE: italic;
	color: maroon; /* before 7/17/2006 maroon; */
        vertical-align:top;
}
.RangeListStyle
{
	font-size: 8px;
	font-family: Verdana, arial, helvetica, sans-serif;
	font-weight: bold;
	FONT-STYLE: italic;
	color: blue; /* before 7/17/2006 maroon; */
        vertical-align:top;        
        padding-left:231px;
        
}
.RangeListStyle_Mem
{
	font-size: 8px;
	font-family: Verdana, arial, helvetica, sans-serif;
	font-weight: bold;
	FONT-STYLE: italic;
	color: blue; /* before 7/17/2006 maroon; */
        vertical-align:top;        
        padding-left:288px;
        
}
.RangeListStyle_Best
{
	font-size: 8px;
	font-family: Verdana, arial, helvetica, sans-serif;
	font-weight: bold;
	FONT-STYLE: italic;
	color: blue; /* before 7/17/2006 maroon; */
        vertical-align:top;        
        padding-left:320px;
        
}
.ListStyle_Best
{
	font-size: 8px;
	font-family: Verdana, arial, helvetica, sans-serif;
	font-weight: bold;
	FONT-STYLE: italic;
	color: blue; /* before 7/17/2006 maroon; */
        vertical-align:top;                
        
}
.BestHdnStyle
{
	font-size: 8px;
	font-family: Verdana, arial, helvetica, sans-serif;
	font-weight: bold;
	FONT-STYLE: italic;
	color: blue; /* before 7/17/2006 maroon; */
        vertical-align:top;
        visibility: hidden;
}
.Btn
{

}
.Btn td
{
	
	font-size:9pt;
	color:#000000;
	padding:5px 0 5px 5px;
	vertical-align:top;
	text-align:center;
}


</style>
    </head>
<%
String JD_Status="";
String Best_Status="";
String MemPart_Status="";
String Mem_State="";

if(request.getParameter("JD")!=null)
    JD_Status=request.getParameter("JD");

if(request.getParameter("B")!=null)
    Best_Status=request.getParameter("B");

if(request.getParameter("M")!=null)
    MemPart_Status=request.getParameter("M");

if(request.getParameter("MS")!=null)
    Mem_State=request.getParameter("MS");
%>
    <body onload="CheckFields(),Display_MemStatusRange('Mem_State')" >
<form name="Person_Search">

<div id="container">
    
    <div id="header">
        <%@ include file="frmHeader.jsp"%>
    </div>
	<%
		if(!bPersons)
		response.sendRedirect("login.jsp");

String Member_id="";
String strEntitySeq="";
String strName="";
String strGender="";

String strJoinPeriod="";
String strJoining_From="";
String strJoining_To="";

String strMemberType="";

String strBestVal="";
String strBest_Type="";
String strBest_Show="";
String strBest_ShowSeq="";
String strBest_From="";
String strBest_To="";
String ExpType="";

String strMemberStatus="";
String strMemStatus_Opr="";
String strMemStatus_Val="";
String strMemStatus_Type="";

String strPersonType="";

String strDob_From="";
String strDob_To="";

String strAge_Opr="";
String strAge_Val="";
String strAge_Type="";
String strAge_Months="";
String strAge_Days="";
String Age_Years="";

String strMemPart_Show="";
String strMemPart_ShowSeq="";
String strMemPart_From="";
String strMemPart_To="";
String strMemPart_Type="";

String strSrchType="";
String strViewAll="";

/**** this seq & id is used only for navigation to other screens***/
String Seq="";
String IdNum="";

if(request.getParameter("Seq")!=null)
    Seq=request.getParameter("Seq");

if(request.getParameter("Id")!=null)
    IdNum=request.getParameter("Id");
/**********************----------------------------****************/


if(request.getParameter("srch")!=null)
    strSrchType=request.getParameter("srch");

if(request.getParameter("view")!=null)
    strViewAll=request.getParameter("view").trim();

if(request.getParameter("Owner_No")!=null)
    Member_id=request.getParameter("Owner_No");
else
    Member_id="";

if(request.getParameter("EntitySeq")!=null)
    strEntitySeq=request.getParameter("EntitySeq");
else
    strEntitySeq="";

if(request.getParameter("Org_Name")!=null)
    strName=request.getParameter("Org_Name");
else
    strName="";

if(request.getParameter("Gender")!=null)
    strGender=request.getParameter("Gender");
else
    strGender="";

if(request.getParameter("dateFrom_JOINING")!=null)
    strJoining_From=request.getParameter("dateFrom_JOINING");
else
    strJoining_From="";

if(request.getParameter("dateTo_JOINING")!=null)
    strJoining_To=request.getParameter("dateTo_JOINING");
else
    strJoining_To="";

if(request.getParameter("Mem_Type")!=null)
    strMemberType=request.getParameter("Mem_Type");
else
    strMemberType="";



if(request.getParameter("BestVal")!=null)
{
    strBestVal=request.getParameter("BestVal");
    ExpType="2";
}
else
{
    strBestVal="";
    ExpType="";
}

if(request.getParameter("BEST")!=null)
{    
    strBest_Type=request.getParameter("BEST");
    ExpType="2";
}
else
{
    strBest_Type="";
    ExpType="";
}

if(request.getParameter("BestShowName")!=null)
{
    strBest_Show=request.getParameter("BestShowName");
    ExpType="2";
}
else
{
    strBest_Show="";
    ExpType="";
}

if(request.getParameter("BestShowSeq")!=null)
    strBest_ShowSeq=request.getParameter("BestShowSeq");
else
    strBest_ShowSeq="";

if(request.getParameter("dateFrom_Best")!=null)
{
    strBest_From=request.getParameter("dateFrom_Best");
    ExpType="3";
}
else
{
    strBest_From="";
    ExpType="";
}

if(request.getParameter("dateTo_Best")!=null)
{
    strBest_To=request.getParameter("dateTo_Best");
    ExpType="3";
}
else
{
    strBest_To="";
    ExpType="";
}


if(request.getParameter("MEM_STATUS")!=null)
    strMemberStatus=request.getParameter("MEM_STATUS");
else
    strMemberStatus="";

if(request.getParameter("Mem_StatusOperator")!=null)
    strMemStatus_Opr=request.getParameter("Mem_StatusOperator");
else
    strMemStatus_Opr="";

if(request.getParameter("Mem_StatusVal")!=null)
    strMemStatus_Val=request.getParameter("Mem_StatusVal");
else
    strMemStatus_Val="";

if(request.getParameter("Mem_StatusType")!=null)
    strMemStatus_Type=request.getParameter("Mem_StatusType");
else
    strMemStatus_Type="";

if(request.getParameter("Person_Type")!=null)
    strPersonType=request.getParameter("Person_Type");
else
    strPersonType="";

if(request.getParameter("dateFrom_DOB")!=null)
    strDob_From=request.getParameter("dateFrom_DOB");
else
    strDob_From="";

if(request.getParameter("dateTo_DOB")!=null)
    strDob_To=request.getParameter("dateTo_DOB");
else
    strDob_To="";

if(request.getParameter("Age_StatusOperator")!=null)
    strAge_Opr=request.getParameter("Age_StatusOperator");
else
    strAge_Opr="";

if(request.getParameter("Age_StatusVal")!=null)
    strAge_Val=request.getParameter("Age_StatusVal");
else
    strAge_Val="";

if(request.getParameter("Age_StatusType")!=null)
    strAge_Type=request.getParameter("Age_StatusType");
else
    strAge_Type="";

if(request.getParameter("ShowName")!=null)
    strMemPart_Show=request.getParameter("ShowName");
else
    strMemPart_Show="";

if(request.getParameter("ShowSeq")!=null)
    strMemPart_ShowSeq=request.getParameter("ShowSeq");
else
    strMemPart_ShowSeq="";

if(request.getParameter("dateFrom_MemPart")!=null)
    strMemPart_From=request.getParameter("dateFrom_MemPart");
else
    strMemPart_From="";

if(request.getParameter("dateTo_MemPart")!=null)
    strMemPart_To=request.getParameter("dateTo_MemPart");
else
    strMemPart_To="";

if(request.getParameter("MemPart_Type")!=null)
    strMemPart_Type=request.getParameter("MemPart_Type");
else
    strMemPart_Type="";

if(strBest_From.length()>0 || strBest_To.length()>0)
{
    ExpType="3";
}
else if(strBest_Show.length()>0 || strBest_Type.length()>0)
{
    ExpType="2";
}
else
    ExpType="";

if(strAge_Val.length()>0 || strAge_Opr.length()>0)
{
    strAge_Type="years";
}
else
    strAge_Type="";



//System.out.println("ExpType"+ExpType);
if(strSrchType.equals("0"))
{
    Member_id="";
    strEntitySeq="";
    strName="";
    strGender="";
    strJoinPeriod="";
    strJoining_From="";
    strJoining_To="";
    strMemberType="";
    strBestVal="";
    strBest_Type="";
    strBest_Show="";
    strBest_ShowSeq="";
    strBest_From="";
    strBest_To="";
    strMemberStatus="";
    strMemStatus_Opr="";
    strMemStatus_Val="";
    strMemStatus_Type="";
    strPersonType="";
    strDob_From="";
    strDob_To="";
    strAge_Opr="";
    strAge_Val="";
    strAge_Type="";
    strMemPart_Show="";
    strMemPart_ShowSeq="";
    strMemPart_From="";
    strMemPart_To="";
    strMemPart_Type="";
    strAge_Months="";
    strAge_Days="";
    ExpType="";
    Age_Years="";
}
%>
    <div id="content">
    
        <fieldset>
        <legend>Person Search:</legend>  
        
        <table class="altRow">
            <tr>
                <td width="70px" id="td_1stRow_1" nowrap>PERSON ID#</td>
                <td width="115px"  id="td_1stRow_2" nowrap colspan="2">
                    <input type="text" name="Owner_No" id="Owner_No" size="9" value="<%=Member_id%>" 
                    style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/>
                    <img src="Images/Find12.jpg" name="PersonSearch" id="PersonSearch"  onClick="Person_OwnerSearch('','pop','1','O')" />
                    <input type="hidden" name="EntitySeq" id="EntitySeq" value="<%=strEntitySeq%>" size="5" />
                </td>                
                <td width="84px" id="td_1stRow_3" nowrap>NAME</td>
                <td colspan="3" nowrap width="251px">
                    <input type="text" name="Org_Name" id="Org_Name" value="<%=strName%>" 
                    style="background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px;
                    padding-left: 18px;width:250px; border:  1px solid #000000;text-transform: uppercase;">
                </td>
                <td nowrap>GENDER</td>
                <td nowrap>
                    <select name="Gender"  onchange="SaveMode()"  style="background-color:  #FFF8DC; 
                    border:  1px solid #000000;width:108px;" >
                    <option value=''>Select</option>
                    <%
                    String strSelected_Male="";
                    String strSelected_Female="";  
                    if(strGender.equals("MALE"))
                        strSelected_Male="SELECTED";
                    else  if(strGender.equals("FEMALE"))
                        strSelected_Female="SELECTED";                                     
                    %>
                    <option value='MALE' <%=strSelected_Male%> >MALE</option>
                    <option value='FEMALE'<%=strSelected_Female%>>FEMALE</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td nowrap>PERSON TYPE</td>
                <td nowrap colspan="2">
                    <select name="Person_Type"  style="background-color:  #FFF8DC; border:  1px solid #000000;
                    width:121px;" >
                    <option value=''>Select</option>
                    <%
                    String strSelected_Individual="";
                    String strSelected_Organization="";
                    String strSelected_YouthRider="";
                    
                    if(strPersonType.equals("INDIVIDUAL"))
                        strSelected_Individual="SELECTED";
                    else if(strPersonType.equals("ORGANIZATION"))
                        strSelected_Organization="SELECTED";
                    else  if(strPersonType.equals("YOUTH RIDER"))
                        strSelected_YouthRider="SELECTED";
                    %>
                    <option value='INDIVIDUAL' <%=strSelected_Individual%>>INDIVIDUAL</option>
                    <option value='ORGANIZATION' <%=strSelected_Organization%>>ORGANIZATION</option>
                    <option value='YOUTH RIDER' <%=strSelected_YouthRider%>>YOUTH RIDER</option>
                    </select>
                </td>
                <td nowrap >
                    DOB
                </td>
                <td colspan="3" >                                          
                    <font class="dateStyleBody" align="top" >FROM</font>
                    <input type="text" id="dateFrom_DOB" placeholder="MM/DD/YYYY" name="dateFrom_DOB" size="10" 
                    onchange="CheckDate('dateFrom_DOB','dateTo_DOB')"
                    value="<%=strDob_From%>" style="background-color:  #FFF8DC; 
                    border:  1px solid #000000;text-transform: uppercase;width:108px;">
                
                    <font class="dateStyleBody" align="top" >TO</font>
                    <input type="text" id="dateTo_DOB" placeholder="MM/DD/YYYY" name="dateTo_DOB" size="10" 
                    onchange="CheckDate('dateFrom_DOB','dateTo_DOB')"
                    value="<%=strDob_To%>" style="background-color:  #FFF8DC; border:  1px solid #000000;
                    text-transform: uppercase;width:108px;">
                </td> 
                <td>
                    AGE
                </td>
                <td>
                    <select name="Age_StatusOperator" id="Age_StatusOperator"  style="background-color:  #FFF8DC; 
                    border:  1px solid #000000;width:76px;" >
                    <option value=''>Select</option>  
                    <%
                    String strSelected_Eql_Age="";  
                    String strSelected_NotEql_Age="";
                    String strSelected_Greater_Age="";                    
                    String strSelected_Les_Age="";  
                    String strSelected_GreOrEql_Age="";                    
                    String strSelected_LesOrEql_Age="";                    
                    
                    if(strAge_Opr.equals("EQUAL"))
                        strSelected_Eql_Age="SELECTED";
                    else if(strAge_Opr.equals("NOTEQUAL"))
                        strSelected_NotEql_Age="SELECTED";
                    else  if(strAge_Opr.equals("GREATERTHAN"))
                        strSelected_Greater_Age="SELECTED";
                    else if(strAge_Opr.equals("LESSERTHAN"))
                        strSelected_Les_Age="SELECTED";
                    else  if(strAge_Opr.equals("GREATERTHANEQL"))
                        strSelected_GreOrEql_Age="SELECTED";
                    else if(strAge_Opr.equals("LESSERTHANEQL"))
                        strSelected_LesOrEql_Age="SELECTED";
                    
                    %>
                    <option value='EQUAL' <%=strSelected_Eql_Age%>>==</option>
                    <option value='NOTEQUAL' <%=strSelected_NotEql_Age%>>!=</option>
                    <option value='GREATERTHAN' <%=strSelected_Greater_Age%>>></option>
                    <option value='LESSERTHAN' <%=strSelected_Les_Age%>><</option>
                    <option value='GREATERTHANEQL' <%=strSelected_GreOrEql_Age%>>>=</option>
                    <option value='LESSERTHANEQL' <%=strSelected_LesOrEql_Age%>><=</option>
                    </select>
                
                    <input type="text"  name="Age_StatusVal" id="Age_StatusVal" maxlength="15" value="<%=strAge_Val%>"  
                    style="background-color:  #FFF8DC;border:  1px solid #000000;text-transform: uppercase;width:30px;"/>                     
                </td>
            </tr>
            <tr>
                <td nowrap ><font class="dateStyleBody" style="visibility:hidden;" id="Rang_JD" >
                        SPACE
                    </font><br>MEMBER TYPE</td>
                <td colspan="2"><font class="dateStyleBody" style="visibility:hidden;" id="Rang_JD" >
                        SPACE
                    </font><br>
                    <select name="Mem_Type"    style="background-color:  #FFF8DC; border:  1px solid #000000;
                    width:121px;" >
                    <option value=''>Select</option>
                    <%
                    String strSelected_Y="";
                    String strSelected_L="";  
                    if(strMemberType.equalsIgnoreCase("REGULAR"))
                        strSelected_Y="SELECTED";
                    else  if(strMemberType.equalsIgnoreCase("FUNDADOR"))
                        strSelected_L="SELECTED";                                     
                    %>
                    <option value='REGULAR' <%=strSelected_Y%> >Regular</option>
                    <option value='FUNDADOR'<%=strSelected_L%>>Fundador</option>
                    </select>
                </td>
                <td nowrap>
                    <font class="dateStyleBody" style="visibility:hidden;" id="Rang_JD" >
                        SPACE
                    </font><br>   
                    JOINING DATE
                </td> 
                <td nowrap id="td_1stRow_4" colspan="5">
                    <font class="RangeListStyle" id="RangeType_JD" >
                        <a onclick="ConvertRangeList('Range','RangeType_JD','ListType_JD','JoinPeriod','LblJoinFrom','dateFrom_JOINING','LblJoinTo','dateTo_JOINING','Rang_JD_Space')">RANGE</a>
                    </font>
                    <font style="visibility:hidden;font-size: 8px;
                    font-family: Verdana, arial, helvetica, sans-serif;
                    font-weight: bold;FONT-STYLE: italic;color: blue;vertical-align:top; " id="ListType_JD" >
                        <a onclick="ConvertRangeList('List','RangeType_JD','ListType_JD','JoinPeriod','LblJoinFrom','dateFrom_JOINING','LblJoinTo','dateTo_JOINING','Rang_JD_Space')">LIST</a>
                    </font>
                    <br>                    
                    <select name="JoinPeriod" id="JoinPeriod" style="width:270px;background-color:  #FFF8DC; 
                    border:  1px solid #000000;" >
                    <option value=''>Select</option>
                    <%
                    String strSelected_Today_JD="";
                    String strSelected_CurntM_JD="";
                    String strSelected_LstM_JD="";
                    String strSelected_CurntY_JD="";
                    String strSelected_LstY_JD="";
                    
                    if(strJoinPeriod.equals("TODAY"))
                        strSelected_Today_JD="SELECTED";
                    else if(strJoinPeriod.equals("CURRENTMONTH"))
                        strSelected_CurntM_JD="SELECTED";
                    else  if(strJoinPeriod.equals("LASTMONTH"))
                        strSelected_LstM_JD="SELECTED";
                    else if(strJoinPeriod.equals("CURRENTYEAR"))
                        strSelected_CurntY_JD="SELECTED";
                    else  if(strJoinPeriod.equals("LASTYEAR"))
                        strSelected_LstY_JD="SELECTED";
                    %>
                    <option value='TODAY' <%=strSelected_Today_JD%>>TODAY</option>
                    <option value='CURRENTMONTH' <%=strSelected_CurntM_JD%>>CURRENT MONTH</option>
                    <option value='LASTMONTH' <%=strSelected_LstM_JD%>>LAST MONTH</option>
                    <option value='CURRENTYEAR' <%=strSelected_CurntY_JD%>>CURRENT YEAR</option>
                    <option value='LASTYEAR' <%=strSelected_LstY_JD%>>LAST YEAR</option>
                    </select>                                 
                    <font class="dateStyleBody" align="top" id="LblJoinFrom" style="visibility:hidden;">FROM</font>                    
                    <input type="hidden" id="dateFrom_JOINING" placeholder="MM/DD/YYYY" name="dateFrom_JOINING" 
                    value="<%=strJoining_From%>" onchange="CheckDate('dateFrom_JOINING','dateTo_JOINING')"
                    style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:105px;">                                        
                <!--</td>
                <td nowrap >-->                    
                    <font class="dateStyleBody" align="top" id="LblJoinTo" style="visibility:hidden;" >TO</font>
                    <input type="text" id="dateTo_JOINING" placeholder="MM/DD/YYYY" name="dateTo_JOINING"  
                    value="<%=strJoining_To%>" onchange="CheckDate('dateFrom_JOINING','dateTo_JOINING')"
                    style="visibility:hidden;background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:105px;">                                        
                    <input type="hidden" id="JoiningStatus" name="JoiningStatus" value="<%=JD_Status%>" />
                </td>                  
            </tr>
            <tr>
                <td nowrap>
                    <font class="dateStyleBody" style="visibility:hidden;" id="Rang_JD" >
                        SPACE
                    </font><br>BEST
                    <input type="text"  name="BestVal" id="BestVal" maxlength="10" value="<%=strBestVal%>"  
                    style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;
                    width:40px;" />
                </td>
                <td nowrap colspan="2"> 
                    <font class="dateStyleBody" style="visibility:hidden;" id="Rang_JD" >
                        SPACE
                    </font><br>
                    
                    <select name="BEST"  style="width:121px;background-color:#FFF8DC; border:1px solid #000000;" >
                    <option value=''>Select</option>
                    <%
                    String strSelected_BestO="";
                    String strSelected_BestB="";
                    String strSelected_BestR="";
                    
                    if(strBest_Type.equals("OWNER"))
                        strSelected_BestO="SELECTED";
                    else if(strBest_Type.equals("BREEDER"))
                        strSelected_BestB="SELECTED";
                    else  if(strBest_Type.equals("RIDER"))
                        strSelected_BestR="SELECTED";
                    %>
                    <option value='OWNER' <%=strSelected_BestO%>>OWNER</option>
                    <option value='BREEDER' <%=strSelected_BestB%>>BREEDER</option>
                    <option value='RIDER' <%=strSelected_BestR%>>RIDER</option>
                    </select>
                </td>
                <td colspan="6" width="560px" >
                    <font class="RangeListStyle_Best" id="RangeType_Best" >
                        <a onclick="ConvertRangeList('Range','RangeType_Best','ListType_Best','BestShowName','LblBestFrom','dateFrom_Best','LblBestTo','dateTo_Best','')">RANGE</a>
                    </font>
                    <font class="ListStyle_Best" style="visibility:hidden;" id="ListType_Best" >
                        <a onclick="ConvertRangeList('List','RangeType_Best','ListType_Best','BestShowName','LblBestFrom','dateFrom_Best','LblBestTo','dateTo_Best','')">LIST</a>
                    </font><br>
                    <input type="text" name="BestShowName" id="BestShowName" value="<%=strBest_Show%>" size="30" maxlength="30" 
                    style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px;
                    text-transform: uppercase;border: 1px solid #000000;height: 16px;padding-left: 18px;width: 339px;"/>                    
                        
                    <font class="dateStyleBody" align="top" id="LblBestFrom" style="visibility:hidden;">FROM</font>                    
                    <input type="hidden" id="dateFrom_Best" placeholder="MM/DD/YYYY" name="dateFrom_Best"  
                    value="<%=strBest_From%>" onchange="CheckDate('dateFrom_Best','dateTo_Best')"
                    style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:108px;">                                        
                    <font class="dateStyleBody" align="top" id="LblBestTo" style="visibility:hidden;" >TO</font>
                    <input type="text" id="dateTo_Best" placeholder="MM/DD/YYYY" name="dateTo_Best"  
                    value="<%=strBest_To%>" onchange="CheckDate('dateFrom_Best','dateTo_Best')"
                    style="visibility:hidden;background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:108px;">                                        
                    
                    <input type="hidden" name="BestShowSeq" id="BestShowSeq" value="<%=strBest_ShowSeq%>" />  
                    <input type="hidden" id="BestStatus" name="BestStatus" value="<%=Best_Status%>" />
                </td>
            </tr>
            <tr>
                <td colspan="3" width="250px">
                    <font class="dateStyleBody" style="visibility:hidden;" id="Rang_JD" >
                        SPACE
                    </font><br>MEMBER PARTICIPATED
                    <%
                    String Mem_Owner="";
                    String Mem_Rider="";
                    if(strMemPart_Type.equals("OWNER"))
                        Mem_Owner="checked";
                    else if(strMemPart_Type.equals("RIDER"))
                        Mem_Rider="checked";
                    %> 
                    <input type="checkbox" value="OWNER"  name="MemPart_Type"  id="MemPart_Type" 
                    <%=Mem_Owner%> >OWNER
                    <input type="checkbox" value="RIDER" name="MemPart_Type" id="MemPart_Type"
                    <%=Mem_Rider%> >RIDER    
                </td>
                <td colspan="6" width="570px">
                    <font class="dateStyleBody" style="visibility:hidden;" id="Rang_JD" >
                        SPACE
                    </font>
                    
                    <font class="RangeListStyle_Mem" id="RangeType_MemPart" >
                        <a onclick="ConvertRangeList('Range','RangeType_MemPart','ListType_MemPart','ShowName','LblMemPartFrom','dateFrom_MemPart','LblMemPartTo','dateTo_MemPart','Rang_MemPart_Space')">RANGE</a>
                    </font>
                    <font  style="visibility:hidden;font-size: 8px;
                    font-family: Verdana, arial, helvetica, sans-serif;
                    font-weight: bold;FONT-STYLE: italic;color: blue;vertical-align:top; " 
                    id="ListType_MemPart" >
                        <a onclick="ConvertRangeList('List','RangeType_MemPart','ListType_MemPart','ShowName','LblMemPartFrom','dateFrom_MemPart','LblMemPartTo','dateTo_MemPart','Rang_MemPart_Space')">LIST</a>
                    </font>
                    <br>
                    <input type="text" name="ShowName" id="ShowName" value="<%=strMemPart_Show%>" size="30" maxlength="30" 
                    style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px;
                    text-transform: uppercase;border: 1px solid #000000;height: 16px;padding-left: 18px;width: 339px;"/>                    
                    <input type="hidden" name="ShowSeq" id="ShowSeq" value="<%=strMemPart_ShowSeq%>" />
                
                    <img src="Images/Find.gif" id="MemPart_Search" onClick="Search_Shows('ShowSeq','ShowName')">
                                                     
                    <font class="dateStyleBody" align="top" id="LblMemPartFrom" style="visibility:hidden;">FROM</font>
                    <input type="hidden" id="dateFrom_MemPart" placeholder="MM/DD/YYYY" name="dateFrom_MemPart"
                    onchange="CheckDate('dateFrom_MemPart','dateTo_MemPart')"
                    style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;
                    width:108px;" value="<%=strMemPart_From%>" >                    
                <!--</td>
                <td colspan="2">
                    <font class="RangeListStyle" style="visibility:hidden;" id="ListType_MemPart" >
                        <a onclick="ConvertRangeList('List','RangeType_MemPart','ListType_MemPart','ShowName','LblMemPartFrom','dateFrom_MemPart','LblMemPartTo','dateTo_MemPart','Rang_MemPart_Space')">LIST</a>
                    </font><br>-->
                    <font class="dateStyleBody" align="top" id="LblMemPartTo" style="visibility:hidden;" >TO</font>
                    <input type="text" id="dateTo_MemPart" placeholder="MM/DD/YYYY" name="dateTo_MemPart"  
                    onchange="CheckDate('dateFrom_MemPart','dateTo_MemPart')"
                    style="visibility:hidden;background-color:  #FFF8DC; border:  1px solid #000000;
                    text-transform: uppercase;width:108px;" value="<%=strMemPart_To%>" >                    
                    <!--<br>
                    <font class="dateStyleBody" style="visibility:hidden;" id="Rang_MemPart_Space" >SPACE</font>-->
                    <input type="hidden" id="MemPartStatus" name="MemPartStatus" value="<%=MemPart_Status%>" />
                </td>
            </tr>
            <tr>
                <td colspan="4">MEMBERSHIP STATUS
                    <select name="MEM_STATUS" id="MEM_STATUS"    onchange="Display_MemStatusRange('MEM_STATUS')" 
                    style="background-color:  #FFF8DC; border:  1px solid #000000;
                    width:165px;" >
                    <option value=''>Select</option>
                    <%
                    String strSelected_Due="";
                    String strSelected_Active="";
                    String strSelected_INACT="";
                    String strSelected_DELI="";
                    
                    if(strMemberStatus.equals("WITH DUE"))
                        strSelected_Due="SELECTED";
                    else if(strMemberStatus.equals("ACTIVE"))
                        strSelected_Active="SELECTED";
                    else  if(strMemberStatus.equals("INACTIVE"))
                        strSelected_INACT="SELECTED";
                    else if(strMemberStatus.equals("DELINQUENT"))
                        strSelected_DELI="SELECTED";
                    %>
                    <option value='WITH DUE' <%=strSelected_Due%>>WITH DUE</option>
                    <option value='ACTIVE' <%=strSelected_Active%>>ACTIVE</option>
                    <option value='INACTIVE' <%=strSelected_INACT%>>INACTIVE</option>
                    <option value='DELINQUENT' <%=strSelected_DELI%>>DELINQUENT</option>
                    </select>
                </td>
                <td colspan="5">
                    <select name="Mem_StatusOperator" id="Mem_StatusOperator"  style="background-color:  #FFF8DC; 
                    border:  1px;visibility:hidden;width:50px;" >
                    <option value=''>Select</option>  
                    <%
                    String strSelected_Eql_Mem="";  
                    String strSelected_NotEql_Mem="";
                    String strSelected_Greater_Mem="";                    
                    String strSelected_Les_Mem="";  
                    String strSelected_GreOrEql_Mem="";                    
                    String strSelected_LesOrEql_Mem="";                    
                    
                    if(strMemStatus_Opr.equals("EQUAL"))
                        strSelected_Eql_Mem="SELECTED";
                    else if(strMemStatus_Opr.equals("NOTEQUAL"))
                        strSelected_NotEql_Mem="SELECTED";
                    else  if(strMemStatus_Opr.equals("GREATERTHAN"))
                        strSelected_Greater_Mem="SELECTED";
                    else if(strMemStatus_Opr.equals("LESSERTHAN"))
                        strSelected_Les_Mem="SELECTED";
                    else  if(strMemStatus_Opr.equals("GREATERTHANEQL"))
                        strSelected_GreOrEql_Mem="SELECTED";
                    else if(strMemStatus_Opr.equals("LESSERTHANEQL"))
                        strSelected_LesOrEql_Mem="SELECTED";
                    
                    %>
                    <option value='EQUAL' <%=strSelected_Eql_Mem%>>==</option>
                    <option value='NOTEQUAL' <%=strSelected_NotEql_Mem%>>!=</option>
                    <option value='GREATERTHAN' <%=strSelected_Greater_Mem%>>></option>
                    <option value='LESSERTHAN' <%=strSelected_Les_Mem%>><</option>
                    <option value='GREATERTHANEQL' <%=strSelected_GreOrEql_Mem%>>>=</option>
                    <option value='LESSERTHANEQL' <%=strSelected_LesOrEql_Mem%>><=</option>
                    </select>
                    <input type="text"  name="Mem_StatusVal" id="Mem_StatusVal" maxlength="15" value="<%=strMemStatus_Val%>"  
                    style="background-color:  #FFF8DC; border:  1px;text-transform: uppercase;visibility:hidden;width:80px;"/>
                        
                    <select name="Mem_StatusType" id="Mem_StatusType"  style="background-color:  #FFF8DC; 
                    border:  1px;visibility:hidden;width:80px;" >
                    <option value=''>Select</option>  
                    <%
                    String strSelected_Day_Mem="";
                    String strSelected_Month_Mem="";                    
                    String strSelected_Year_Mem="";  
                    
                    if(strMemStatus_Type.equals("DAYS"))
                        strSelected_Day_Mem="SELECTED";
                    else if(strMemStatus_Type.equals("MONTHS"))
                        strSelected_Month_Mem="SELECTED";
                    else  if(strMemStatus_Type.equals("YEARS"))
                        strSelected_Year_Mem="SELECTED";
                    %>
                    <option value='DAYS' <%=strSelected_Day_Mem%>>DAYS</option>
                    <option value='MONTHS' <%=strSelected_Month_Mem%>>MONTHS</option>
                    <option value='YEARS' <%=strSelected_Year_Mem%>>YEARS</option>
                    </select>
                    <input type="hidden" id="Mem_State" name="Mem_State" value="<%=Mem_State%>"/> 
                </td>                
            </tr>     
            
            <input type="hidden" id="PAGEID" name="PAGEID" value="PERSON_PERSONSEARCH"/>   
        </table>                    
        </fieldset>
        <div align="center">
            <table class="altRow">      
                <tr>                
                    <td>
                        <input type="button" id="Print" class="button" value="Print" onclick="Print_PersonSearch()" />
                        <input type="button" id="SearchPerson" name="SearchPerson" class="button" value="Search" onclick="Populate_PersonSearch()" />
                        <input type="button" id="ResetPerSearch" class="button" value="Reset" onclick="ResetPersonSearch()"/>
                        <input type="button" id="ExcelPerSearch" class="button" value="Export to Excel" onclick="DisplayPersonExcel()" />                                        
                    </td>                
                </tr>
            </table>
        </div>                                          
    </div>
        
    <div id="sidebar">
        <%@ include file="PersonSearch_Side.jsp" %>
    </div>    
    <div id="content_PS" >
<%
System.out.println("srch1---"+strSrchType);            
   if(strSrchType.equals("1"))
    {         
System.out.println("srch2---"+strSrchType);            
%>
    <%@ include file="Person_SearchBottomList.jsp" %>
<%  }%>  
    </div>
    <div id="footer_Bot" align="bottom">    
    <jsp:include page="/frmBottom_Registration.jsp"/>
    </div>
</div>
</form>
    
    </body>
</html>
