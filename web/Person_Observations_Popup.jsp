<%-- 
    Document   : Person_Observations_Popup
    Created on : Feb 23, 2012, 3:12:52 PM
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
<script type="text/javascript" src="js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="js/interface.js"></script>
<script type="text/javascript" src="jscPerson.js"></script>     
<script type="text/javascript" src="scripts/Shows_Register.js"></script>
<script type="text/javascript" src="scripts/jscCommon.js"></script>

<link href="buttons.css" rel="stylesheet" type="text/css" />
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="Style_Popup.css">
<link href="style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
$(document).ready(
    function()
    {
        function formatItem(row) {
		finalVal_formatItem=row[0].split('#@#')
		return finalVal_formatItem[0] ;
	}
	function formatResult(row) {
		finalVal_formatResult=row[0].split('#@#')
		return finalVal_formatResult[0].replace(/(<.+?>)/gi, '');
	}


	$("#ShowName").autocomplete('Auto_ShowsList.jsp', {
		width: 200,
		matchContains: true,
		formatItem: formatItem,
		formatResult: formatResult
	});

        $("#ShowName").result(function(event, data, formatted) {
            var hiddenShowSeq = $("#ShowSeq");
            var value = data.toString().split('#@#');
            hiddenShowSeq.val(value[1]);
        });

    }
);
function CheckObsStatus(type)
{
   
    ObsStatus_Val=document.getElementById("obsStatus").value;
    
    if((ObsStatus_Val=='TEMPORARY' || type=='T') && type!='P')
    {
        document.getElementById("LblEndDate").style.visibility='visible'; 
        document.getElementById("EnddateObserv").style.visibility='visible';
    }
    else //if(ObsStatus_Val=='PERMANENT')
    {
        document.getElementById("LblEndDate").style.visibility='hidden'; 
        document.getElementById("EnddateObserv").style.visibility='hidden';
        document.getElementById("EnddateObserv").value="";
    }    
}
function Search_Shows(fieldName,DescElement)
{
    var details = 'titlebar=no,status=no,menubar=no,resizable=0,width=750,height=400,scrollbars=no,addressbar=0,left=230,top=150';
    childWindow=open("frmShows_Search_Common1.jsp?mode=0&selval="+fieldName+"&DescEl="+DescElement,"mm",details);
    childWindow.opener = self;
    childWindow.focus();
}
</script>
<style type="text/css">
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
.ui-datepicker
{
    font-family:TimesNewRoman;
    font-size: 10px;
    margin-left:1px;    
    margin-top: 0px;     
    line-height: 1.0em;
}
</style>
</head>
<body onload="CheckObsStatus()">
<%--@ include file="Common_UserScreenAccess.jsp" --%>
<form name="PersonObservationPopup">
<%
String EntitySeq="";
String strObservType="";
String strUserName="";
String strDateObserv="";
String strShowName="";
String strObservationSeq="";
String strShowSeq="";
String strObservations="";
String strObsStatus="";
String EndDateObserv="";

if(request.getParameter("Enty")!=null)
    EntitySeq=request.getParameter("Enty");
else
    EntitySeq="";

if(request.getParameter("ObsvSeq")!=null)
    strObservationSeq=request.getParameter("ObsvSeq");
else
    strObservationSeq="";

GeneralServlet genn = new GeneralServlet();


 RowSetFactory factory27 = RowSetProvider.newFactory();
   CachedRowSet crsGet_PersonObserv= factory27.createCachedRowSet();
//CachedRowSetImpl crsGet_PersonObserv = new CachedRowSetImpl();
if(EntitySeq.length()>0 && strObservationSeq.length()>0)
{
    try{       
        
        crsGet_PersonObserv = genn.Person_GET_OBSERVATIONS(strObservationSeq, EntitySeq);


        while(crsGet_PersonObserv.next())
        {                        

            if(crsGet_PersonObserv.getString("SHOW_NAME")!=null)
                strShowName= crsGet_PersonObserv.getString("SHOW_NAME");
            else
                strShowName="";
            
            if(crsGet_PersonObserv.getString("DATE")!=null)
                strDateObserv= crsGet_PersonObserv.getString("DATE");
            else
                strDateObserv="";

            if(crsGet_PersonObserv.getString("OBSERVATIONS")!=null)
                strObservations= crsGet_PersonObserv.getString("OBSERVATIONS");
            else
                strObservations="";

            if(crsGet_PersonObserv.getString("OBSERVATION_SEQ")!=null)
                strObservationSeq= crsGet_PersonObserv.getString("OBSERVATION_SEQ");
            else
                strObservationSeq="";

            if(crsGet_PersonObserv.getString("OBSERVATION_TYPE")!=null)
                strObservType= crsGet_PersonObserv.getString("OBSERVATION_TYPE");
            else 
                strObservType=" ";
            
            if(crsGet_PersonObserv.getString("USERNAME")!=null)
                strUserName= crsGet_PersonObserv.getString("USERNAME");
            else 
                strUserName=" ";
            
            if(crsGet_PersonObserv.getString("OBSERVATION_STATUS")!=null)
                strObsStatus= crsGet_PersonObserv.getString("OBSERVATION_STATUS");
            else 
                strObsStatus=" ";
            
            if(crsGet_PersonObserv.getString("END_DATE")!=null)
                EndDateObserv= crsGet_PersonObserv.getString("END_DATE");
            else 
                EndDateObserv=" ";
                        
        }
    }
    catch(Exception e)
    {
        System.out.println("ERROR");
    }
}




%>
  <table class="altRow">
    <tr>         
      <td width="122">OBSERVATION TYPE</td>
      <td width="215" colspan="4"> 
        <select name="ObservationType" id="ObservationType"               
                style="background-color:#FFF8DC;text-transform:uppercase;border:1px solid #000000;width:200px;" >
            <option value=''>Select</option>
        <%        
            String strSelected_ObsType1="";
            String strSelected_ObsType2="";      
            String strSelected_ObsType3="";
            String strSelected_ObsType4="";
            String strSelected_ObsType5="";
            
            if(strObservType.equals("EXCUSED"))
                strSelected_ObsType1="SELECTED";
            else  if(strObservType.equals("DISQUALIFIED"))
                strSelected_ObsType2="SELECTED";  
            else  if(strObservType.equals("MEDICAL"))
                strSelected_ObsType3="SELECTED";
            else  if(strObservType.equals("REGISTRATION"))
                strSelected_ObsType4="SELECTED";
            else  if(strObservType.equals("OTHER"))
                strSelected_ObsType5="SELECTED";
        %>                      
            <option value='EXCUSED' <%=strSelected_ObsType1%> >EXCUSED</option>
            <option value='DISQUALIFIED' <%=strSelected_ObsType2%> >DISQUALIFIED</option>
            <option value='MEDICAL' <%=strSelected_ObsType3%> >MEDICAL</option>
            <option value='REGISTRATION' <%=strSelected_ObsType4%> >REGISTRATION</option>
            <option value='OTHER' <%=strSelected_ObsType5%> >OTHER</option>
            
        </select>
      </td>
    </tr>
    <tr> 
      <td width="122">USER NAME</td>
      <td width="215"> 
        <input type="text" name="UserName" id="UserName" value="<%=strUserName%>"  maxlength="25" 
                style="text-transform:uppercase;background-color:#FFF8DC;border:1px solid #000000;width:200px;"/>
      </td>
      <td Style="text-align:right;">DATE</td>
      <td colspan="2" width="200"> 
        <input type="text" name="dateObserv" id="dateObserv" value="<%=strDateObserv%>" 
                placeholder="MM/DD/YYYY" onchange="CheckDate('dateObserv','EnddateObserv')"
                style="text-transform:uppercase;background-color:#FFF8DC;border:1px solid #000000;width:130px;"/>
      </td>
    </tr>
    <tr> 
      <td width="122">SHOW NAME</td>
      <td colspan="4"> 
        <input type="text" name="ShowName" id="ShowName" value="<%=strShowName%>" 
                maxlength="30" style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px;
                text-transform:uppercase;border: 1px solid #000000;height: 16px;
                padding-left: 18px;width: 380px;"/>        
        <input type="hidden" name="ShowSeq" id="ShowSeq" value="" />
        <img src="Images/Find.gif" onClick="Search_Shows('ShowSeq','ShowName')"> 
      </td>
    </tr>
    <tr>
        <td>OBSERVATION</td>           
        <td COLSPAN="4">
            <input type="text" name="Observation" id="Observation" maxlength="50" 
            value="<%=strObservations%>"  
            style="text-transform:uppercase;background-color:#FFF8DC;border:1px solid #000000;width:420px;"/>
        </td>   
    </tr>
    <tr> 
      <td colspan="2">
          <input  name="obsStatus" id="obsStatus" type="radio" value="<%=strObsStatus%>" onclick="CheckObsStatus('P')" 
          <% if(strObsStatus.equalsIgnoreCase("PERMANENT")){%> checked <%}%> />PERMANENT
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input  name="obsStatus" id="obsStatus" type="radio" value="<%=strObsStatus%>" onclick="CheckObsStatus('T')" 
          <% if(strObsStatus.equalsIgnoreCase("TEMPORARY")){%> checked <%}%> />TEMPORARY                
      </td>
      <td width="61" nowrap >
          <label id="LblEndDate">END DATE</label>
      </td>
      <td colspan="2" width="200"> 
          <input type="text" name="EnddateObserv" id="EnddateObserv" value="<%=EndDateObserv%>" 
          placeholder="MM/DD/YYYY"  onchange="CheckDate('dateObserv','EnddateObserv')"
          style="text-transform:uppercase;background-color:#FFF8DC;border:1px solid #000000;width:130px;"/>
      </td>
    </tr>
    <tr>
        <td id="BtnStyle" colspan="5" >
			<%--

			if(crsGetUserAccess.size()>0)
			{
			String [] ScreenList = (String[])ArScreenName.toArray(new String[ArScreenName.size()]);
			String [] ScreenStatus = (String[])Screen_InsUpd.toArray(new String[Screen_InsUpd.size()]);

			for(int i=0;i<ScreenList.length;i++)
			{
			if( ScreenList[i].equals("REGISTRATION") && ScreenStatus[i].equals("InsUpd") )
			{

			--%>
            <input type="button" id="Btn_ObservSavePopup" value="Save" class="button" onclick="Save_PersonObservation()"/>
			<%--}}}--%>
            <input type="button" id="Btn_ObservCancel" value="Cancel" class="button" onclick="Cancel_PersonObservation()"/>
        </td>
    </tr>
    <input type="hidden" id="EntySeq" name="EntySeq" size="4" value="<%=EntitySeq%>" />
    <input type="hidden" name="ObservationSeq" id="ObservationSeq" size="4"  value="<%=strObservationSeq%>" />
    <input type="hidden" id="PAGEID" name="PAGEID" value="PersonObservaitonPopUp" />
  </table>
</form>
</body>
</html>


