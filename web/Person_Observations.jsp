<%-- 
    Document   : Person_Observations
    Created on : Feb 22, 2012, 2:43:44 PM
    Author     : Erzath
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import= "javax.naming.*" %>
<%@ page import= "javax.sql.rowset.*" %>
<%@ page import= "pasotracker.DbConnMngr" %>
<%@ page import= "pasotracker.GeneralServlet" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PERSON OBSERVATIONS</title>
<link rel="stylesheet" href="themes/base/jquery.ui.all.css">
<script type="text/javascript" src="jquery-1.5.1.js"></script>
<script type="text/javascript" src="external/jquery.bgiframe-2.1.2.js"></script>
<script type="text/javascript" src="ui/jquery.ui.core.js"></script>
<script type="text/javascript" src="ui/jquery.ui.widget.js"></script>
<script type="text/javascript" src="ui/jquery.ui.mouse.js"></script>
<script type="text/javascript" src="ui/jquery.ui.button.js"></script>
<script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="ui/jquery.ui.draggable.js"></script>
<script type="text/javascript" src="ui/jquery.ui.position.js"></script>
<script type="text/javascript" src="ui/jquery.ui.resizable.js"></script>
<script type="text/javascript" src="ui/jquery.ui.dialog.js"></script>
<script type="text/javascript" src="ui/jquery.effects.core.js"></script>
<script type="text/javascript" src="jscPerson.js"></script>        
<link href="buttons.css" rel="stylesheet" type="text/css" />
<link href="Style_Popup.css" rel="stylesheet" type="text/css" />
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="Registration.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/interface.js"></script>


<style type="text/css">
<!--
@import url("CommonTableStyle.css");
-->

#footer_Bot {
	clear:both;
	text-align:center;
	/*background: #555;
	color:#fff;*/
	height:50px;
	padding:5px;
         bottom: auto;
}

#BtnStyle {    
    text-align:center;    
}
</style>
</head>
<body>
<%
String strMode="";
String EntitySeq="";

if(request.getParameter("Mode")!=null)
strMode=request.getParameter("Mode");

if(request.getParameter("Enty")!=null)
EntitySeq=request.getParameter("Enty");

String strOWNER_TYPE = "";
String strOwnerName = "";
String strGender = "";
String strDOB = "";
String strASSIGNEDNUM = "";
String strAge="";
String strMonth="";
String strDays="";
String strMemberNum="";
String Age_Years="";
String OrgName="";

int rowCount=0;

GeneralServlet genn = new GeneralServlet();
if(strMode.equals("1"))
{
    
 RowSetFactory factorycrsGetPerson = RowSetProvider.newFactory();
   CachedRowSet crsGetPerson= factorycrsGetPerson.createCachedRowSet();
    //CachedRowSetImpl crsGetPerson = new CachedRowSetImpl();  
    if(EntitySeq.length()>0 && EntitySeq!=null)
    crsGetPerson = genn.get_InsUpdRider(EntitySeq);
    while (crsGetPerson.next())
    {
        if (crsGetPerson.getString("OWNER_TYPE") != null) {
            strOWNER_TYPE = crsGetPerson.getString("OWNER_TYPE").trim();
        }
        else
            strOWNER_TYPE = "";
        
        if (crsGetPerson.getString("ENTITYSEQ") != null) {
            EntitySeq = crsGetPerson.getString("ENTITYSEQ").trim();
        }
        else
            EntitySeq = "";
        
        if (crsGetPerson.getString("NAME") != null) {
            strOwnerName = crsGetPerson.getString("NAME").trim();
        }
        else
            strOwnerName = "";
        
        if (crsGetPerson.getString("Gender") != null) {
            strGender = crsGetPerson.getString("Gender").trim();
        }
        else
            strGender = "";
        
        if (crsGetPerson.getString("DOB") != null) {
            strDOB = crsGetPerson.getString("DOB").trim();
        }
        else
            strDOB = "";
        
        if (crsGetPerson.getString("ASSIGNEDNUM") != null) {
            strASSIGNEDNUM = crsGetPerson.getString("ASSIGNEDNUM").trim();
        }
        else
            strASSIGNEDNUM = "";
        
        if (crsGetPerson.getString("MEMBER_NUM") != null) {
            strMemberNum = crsGetPerson.getString("MEMBER_NUM").trim();
        }
        else
            strMemberNum = "";
        
        if (crsGetPerson.getString("MONTH") != null) {
            strMonth = crsGetPerson.getString("MONTH").trim()+"M ";
        }
        else
            strMonth = "";
        
        if (crsGetPerson.getString("DAYS") != null) {
            strDays = crsGetPerson.getString("DAYS").trim()+"D";
        }
        else
            strDays = "";
        
        if (crsGetPerson.getString("AGEINYEARS") != null) {
            Age_Years = crsGetPerson.getString("AGEINYEARS").trim()+" YEARS";
        }
        else
            Age_Years = "";
        
        //Age_Years="";
        strAge=strMonth+strDays;     

        /*****************if owner type is org we are emptying gender,age,dob */
        if (crsGetPerson.getString("ORGANIZATION_NAME") != null) {
            OrgName = crsGetPerson.getString("ORGANIZATION_NAME").trim();
        }
        else
            OrgName = "";
        
        if((strOWNER_TYPE.equals("ORGANIZATION")||strOWNER_TYPE.equals("ORGANISATION")||strOWNER_TYPE.equals("O")
               || strOWNER_TYPE.equals("")) && !OrgName.equals("")) 
        {
            Age_Years = "";    
            strDOB = "";
            strGender = "";            
        }
        /*if(strOWNER_TYPE.equals("")&& !OrgName.equals(""))
            strOWNER_TYPE = "ORGANIZATION";*/
        
    }       
}
String strObservType="";
String strDateObserv="";
String strShowName="";
String strObservationSeq="";
String strShowSeq="";
String strObservations="";
ArrayList ObservationList = new ArrayList();


if(strMode.equals("2"))
{
    EntitySeq = "";
    strOWNER_TYPE = "";
    strOwnerName = "";
    strGender = "";
    strDOB = "";
    strASSIGNEDNUM = "";
    strAge="";
    Age_Years="";
    strMonth="";
    strDays="";
    strMemberNum="";
    strObservType="";
    strDateObserv="";
    strShowName="";
    strObservationSeq="";
    strShowSeq="";
    strObservations="";
    rowCount=0;
}

String FontColor="";

if(strOWNER_TYPE.equals("INDIVIDUAL")||strOWNER_TYPE.equals("I"))
{
FontColor="blue";
}
else if(strOWNER_TYPE.equals("ORGANIZATION")||strOWNER_TYPE.equals("ORGANISATION")||strOWNER_TYPE.equals("O"))
{
FontColor="red";
}
RowSetFactory factory2crsGet_PersonObserv = RowSetProvider.newFactory();
   CachedRowSet crsGet_PersonObserv= factory2crsGet_PersonObserv.createCachedRowSet();

//CachedRowSetImpl crsGet_PersonObserv = new CachedRowSetImpl();
if(EntitySeq!=null && !EntitySeq.equals(""))
{
    try{               
        
        crsGet_PersonObserv = genn.Person_GET_OBSERVATIONS("", EntitySeq);

        while(crsGet_PersonObserv.next())
        {
            rowCount=crsGet_PersonObserv.size();
            strObservType="";
            strDateObserv="";
            strShowName="";
            strObservationSeq="";
            strShowSeq="";
            strObservations="";


            if(crsGet_PersonObserv.getString("SHOW_NAME")!=null)
            strShowName= crsGet_PersonObserv.getString("SHOW_NAME");

            if(crsGet_PersonObserv.getString("DATE")!=null)
            strDateObserv= crsGet_PersonObserv.getString("DATE");

            if(crsGet_PersonObserv.getString("OBSERVATIONS")!=null)
            strObservations= crsGet_PersonObserv.getString("OBSERVATIONS");

            if(crsGet_PersonObserv.getString("OBSERVATION_SEQ")!=null)
            strObservationSeq= crsGet_PersonObserv.getString("OBSERVATION_SEQ");


            if(crsGet_PersonObserv.getString("OBSERVATION_TYPE")!=null)
            strObservType= crsGet_PersonObserv.getString("OBSERVATION_TYPE");
            else 
            strObservType=" ";

            String strList=strShowName+"@#@"+strDateObserv+"@#@"+strObservations+"@#@"+strObservationSeq+"@#@"+strObservType;

            ObservationList.add(strList);
        }
    }
    catch(Exception e)
    {
        System.out.println("ERROR");
    }
}


%>
<form name="Person_Observation_frm">     
    <div id="container">    
        <div id="header">
        <%@ include file="frmHeader.jsp"%>
        </div>  
		<%
		if(!bPersons)
		response.sendRedirect("login.jsp");

		%>
        <div id="content">
        <table class="altRow" width="100%">
            <tr> 
              <td width="44" style="font-weight:bold;">NAME:</td>
              <td colspan="5" > 
                <label  id="LblOwnerName"  style="color: <%=FontColor%>;  text-transform: uppercase;font-size: 18px;font-weight:bold;"> <%=strOwnerName%></label>
                <input type="hidden" name="Enty" id="Enty" value="<%=EntitySeq%>" size="5" />
                <img src="Images/Find1.jpg" name="orgSearch" id="orgSearch"  onClick='PersonSearch()' />
              </td>
              <td colspan="2" style="font-weight:bold;" nowrap>PERSON TYPE:</td>
              <td width="218"> <label  id="LblOwnerType"  style="color: <%=FontColor%>;  text-transform: uppercase;font-size: 18px;font-weight:bold;"> 
                <%=strOWNER_TYPE%></label> </td>
            </tr>
            <tr> 
              <td width="44" style="font-weight:bold;">ID#:</td>
              <td width="153"> <label  id="LblAssignedNum"  style="color: <%=FontColor%>;  text-transform: uppercase;font-size: 18px;font-weight:bold;"> 
                <%=strASSIGNEDNUM%></label> </td>
              <td width="57" style="font-weight:bold;">GENDER:</td>
              <td width="164" > <label  id="LblGender"  style="color: <%=FontColor%>;  text-transform: uppercase;font-size: 18px;font-weight:bold;"> 
                <%=strGender%></label> </td>
              <td width="100" style="font-weight:bold;">DOB:</td>
              <td width="131"> <label  id="Lbldob"  style="color: <%=FontColor%>;  text-transform: uppercase;font-size: 18px;font-weight:bold;"> 
                <%=strDOB%></label> </td>
              <td colspan="2" style="font-weight:bold;">AGE:</td>
              <td width="218"> <label  id="LblAge"  style="color: <%=FontColor%>;  text-transform: uppercase;font-size: 18px;font-weight:bold;"> 
                <%=Age_Years%></label> </td>
            </tr>       

            <tr>
                <td colspan="9" id="BtnStyle">  
                    <input type="button" id="PersonObservations" class="button" value="Observation" onclick="DisplayPersonObservation('<%=EntitySeq%>','')" />                
                    <input type="button" id="Person_ObservationReset" class="button" value="Reset" onclick="Reset_PersonObservation()"/>                
                    <input type="button" id="Previous_Observation" class="button" value="&laquo;"
                    <%if(EntitySeq.length()>0){%>
                    onclick="Person_BottomNavigation('Person_ShowHistory.jsp?Mode=1&Enty=<%=EntitySeq%>')"
                    <%}else{%>
                    onclick="Person_BottomNavigation('Person_ShowHistory.jsp')" 
                    <%}%> />
                    <input type="button" id="Next_Observation" class="button" value="&raquo;" 
                    <%if(EntitySeq.length()>0){%>
                    onclick="Person_BottomNavigation('frmPerson.jsp?Mode=2&Assigned=<%=EntitySeq%>')"
                    <%}else{%>
                    onclick="Person_BottomNavigation('frmPerson.jsp')" 
                    <%}%> />
                    <%             
                    if(rowCount>0)
                    {
                    %>           
                    <img src="Images/Obsev_Loader.gif"  alt="O" align="right" />
                    <%}%>
                </td>
            </tr>
            
  <input type="hidden" name="ShowName" id="ShowName" value="" />
  <input type="hidden" name="ShowSeq" id="ShowSeq" value="" />
  <input type="hidden" name="dateObserv" id="dateObserv"  value="" />
  <input type="hidden" name="Observation" id="Observation" value="" />
  <input type="hidden" name="ObservationSeq" id="ObservationSeq" value="" />
  <input type="hidden" name="ObservationType" id="ObservationType" value="" />
  <input type="hidden" name="obsStatus" id="obsStatus"  value="" />
  <input type="hidden" name="EnddateObserv" id="EnddateObserv" value="" />
  <input type="hidden" name="UserName" id="UserName" value="" />
        </table>
<%

if(ObservationList.size()>0)
{
%>
        <table class="grid" style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;" >
            <thead>
                <tr>
                <th class="Grid_Header"  width="105px">OBS TYPE</th>
                <th class="Grid_Header" width="200px">SHOW NAME</th>
                <th class="Grid_Header"  width="90px">DATE</th>
                <th class="Grid_Header"  width="" nowrap>OBSERVATION</th>
                <th class="Grid_Header"  width=""></th>
                </tr>
            </thead>
            <tbody>
<%
    for(int i=0;i <ObservationList.size();i++)
    {
    String strClass="";
    if( i%2 ==0 )
    strClass="even";
    else
    strClass="odd";

    String str=ObservationList.get(i).toString();

    String[] strSplit= str.split("@#@");

%>
                <tr class="<%=strClass%>">

                    <td height="20" size="30" ><%= strSplit[4].trim()%></td>
                    <td height="20" size="30"  style="text-transform: uppercase;"><%= strSplit[0]%></td>

                    <td  size="15"><%= strSplit[1]%></td>

                    <td nowrap size=""  style="text-transform: uppercase;"><%= strSplit[2]%></td>
                    <%--

					if(crsGetUserAccess.size()>0)
					{
					String [] ScreenList = (String[])ArScreenName.toArray(new String[ArScreenName.size()]);
					String [] ScreenStatus = (String[])Screen_InsUpd.toArray(new String[Screen_InsUpd.size()]);

					for(int j=0;j<ScreenList.length;j++)
					{
					if( ScreenList[j].equals("REGISTRATION") && ScreenStatus[j].equals("InsUpd") )
					{

					--%>
					<td align="right" size="">
                        <img src="Images/pencil_icon.gif"  onclick="DisplayPersonObservation('<%=EntitySeq%>','<%= strSplit[3]%>')">&nbsp;&nbsp;
                        <img src="Images/delete.png" onclick="DeletePersonObservation('<%=EntitySeq%>','<%= strSplit[3]%>')"/>
					</td>
					<%--}}}--%>
                    <td>           
                    </td>
                </tr>
<%  }%>
            </tbody>
        </table>
<% 
}
%>
        </div>
        
        <div id="sidebar">                
            <%@ include file="Person_Observations_Side.jsp"%>
        </div>

        <div id="footer_Bot" align="bottom">
        <jsp:include page="/frmBottom_Registration.jsp"/>
        </div>  
    </div>
    <div id="dialog-PersonObservation" title="PERSON OBSERVATION" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  id="modalIFrame_PersonObservation" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="no">
        </iframe>
    </div>
</form>
</body>
</html>

