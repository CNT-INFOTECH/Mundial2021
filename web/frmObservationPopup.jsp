<%-- 
    Document   : frmObservationPopup
    Created on : Jun 15, 2011, 11:21:31 AM
    Author     : veera
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

    <head>


 <link href="Tables_style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
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


		<script type="text/javascript" src="ui/jquery.ui.autocomplete.js"></script>
         

         <script type="text/javascript" src="js/jquery.js"></script>
         <script type="text/javascript" src="js/interface.js"></script>
          <script type="text/javascript" src="scripts/Shows_Register.js"></script>
           <script type="text/javascript" src="scripts/jscCommon.js"></script>


<script type='text/javascript' src='AutoComplete/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="AutoComplete/jquery.autocomplete.css" />




<script type="text/javascript" src="jscObservations.js"></script>
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
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
function Search_Shows(fieldName,DescElement)
{

/*
    $('#dialog-Show').dialog({ autoOpen: false,height: 400,width: 800, modal: true,title:"Search Shows" });
    $('#dialog-Show').dialog('open');
    $("#modalIFrame_ShowList").attr('src','frmShows_Serach_Common.jsp?mode=0&selval='+fieldName+'&DescEl='+DescElement);

    return false;*/


var details = 'titlebar=no,status=no,menubar=no,resizable=0,width=750,height=400,scrollbars=no,addressbar=0,left=230,top=150';
childWindow=open("frmShows_Search_Common1.jsp?mode=0&selval="+fieldName+"&DescEl="+DescElement,"mm",details);
childWindow.opener = self;
childWindow.focus();
//window.document.addressbar.enable = false;

}
</script>

<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import= "javax.naming.*" %>
<%@ page import= "javax.sql.rowset.*" %>
<%@ page import= "pasotracker.DBConnection" %>
<%@ page import= "pasotracker.GeneralServlet" %>

    </head>
<style type="text/css">
<!--
@import url("CommonTableStyle.css");
-->

/* kumar */


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
    margin-left:0px;
    margin-top: 0px;
    line-height: 1.0em;
}

</style>

    <body>
        
        <form name="frmObservationPopup">

<%
String strMode="";
String strRegNo="";
String strREGSEQ="";
String strObservationSeq="";
String strSHowName="";
String strShowDate="";
String strObservations="";
String strRegSeq="";
String RegNum="";
String Status="";

String strObsType="";
String strUserName="";
String strObsStatus="";
String strEndDate="";

String strEdit="";



if(request.getParameter("Mode")!=null)
strMode=request.getParameter("Mode");


if(request.getParameter("edit")!=null)
strEdit=request.getParameter("edit");


if(request.getParameter("Seq")!=null)
strObservationSeq=request.getParameter("Seq");
else
strObservationSeq="0";

if(strMode.equals("1") && strEdit.equals("1"))
{
try
{
    GeneralServlet gen=new GeneralServlet();

    RowSetFactory factory = RowSetProvider.newFactory();
CachedRowSet crsGet_Observations = factory.createCachedRowSet();

    // crsGet_Observations = gen.GET_OBSERVATIONS(strObservationSeq,strREGSEQ,strRegNo);
     crsGet_Observations = gen.GET_OBSERVATIONS(strObservationSeq,strREGSEQ,"");

        while(crsGet_Observations.next())
    {
        strSHowName="";
        strShowDate="";
        strObservations="";
        strObservationSeq="";
        strRegSeq="";
        RegNum="";
        Status="";



        strObsType="";
        strUserName="";
        strObsStatus="";
        strEndDate="";


        if(crsGet_Observations.getString("SHOW_NAME")!=null)
        strSHowName= crsGet_Observations.getString("SHOW_NAME").trim();

         if(crsGet_Observations.getString("DATE")!=null)
        strShowDate= crsGet_Observations.getString("DATE").trim();

         if(crsGet_Observations.getString("OBSERVATIONS")!=null)
        strObservations= crsGet_Observations.getString("OBSERVATIONS").trim();

         if(crsGet_Observations.getString("OBSERVATION_SEQ")!=null)
        strObservationSeq= crsGet_Observations.getString("OBSERVATION_SEQ").trim();

         if(crsGet_Observations.getString("REGSEQ")!=null)
        strRegSeq= crsGet_Observations.getString("REGSEQ").trim();

         if(crsGet_Observations.getString("REG_NUM")!=null)
        RegNum= crsGet_Observations.getString("REG_NUM").trim();

        if(crsGet_Observations.getString("STATUS")!=null)
        Status= crsGet_Observations.getString("STATUS").trim();


        /*07072011 kumar-start*/
        if(crsGet_Observations.getString("OBSERVATION_TYPE")!=null)
        strObsType= crsGet_Observations.getString("OBSERVATION_TYPE").trim();

        if(crsGet_Observations.getString("USERNAME")!=null)
        strUserName= crsGet_Observations.getString("USERNAME").trim();

        if(crsGet_Observations.getString("OBSERVATION_STATUS")!=null)
        strObsStatus= crsGet_Observations.getString("OBSERVATION_STATUS").trim();

        if(strObsStatus.equals("TEMPORARY"))
        {
            if(crsGet_Observations.getString("END_DATE")!=null)
            strEndDate= crsGet_Observations.getString("END_DATE").trim();
        }
        else
            strEndDate="";


        /*07072011 kumar-end*/

         }
     }
    catch(Exception e)
    {
        System.out.println("ERROR");
    }

}
%>

            <div id="content">
<!-- 06072011 kumar-->

            <table class="altRow">
                <tr>
                    <td width="122">OBSERVATION TYPE</td>
                    <td width="215" colspan="4"> 
                    <select name="ObservationType" id="ObservationType"  style="width:200px;background-color:  #FFF8DC; border:  1px solid #000000;" >

                    <%
                   if(strObsType!=null)
                   {%>
                   <option
                    <%if (strObsType.trim().equals("Select")) {
                        %> selected <%}%> >Select</option>

                     <option
                         <%if (strObsType.trim().equalsIgnoreCase("Excused")) {
                        %> selected <%}%> >EXCUSED</option>

                     <option
                    <%if (strObsType.trim().equalsIgnoreCase("Disqualified")) {
                        %> selected <%}%> >DISQUALIFIED</option>

                      <option
                    <%if (strObsType.trim().equalsIgnoreCase("Medical")) {
                        %> selected <%}%> >MEDICAL</option>

						 <option
                    <%if (strObsType.trim().equalsIgnoreCase("Registration")) {
                        %> selected <%}%> >REGISTRATION</option>

						 <option
                    <%if (strObsType.trim().equalsIgnoreCase("Other")) {
                        %> selected <%}%> >OTHER</option>

         <!--      <option selected>Select</option>
               <option >Excused</option>
               <option >Disqualified</option>
               <option >Medical</option>  -->

                      </select>
                    </td><%}%>
                </tr>
            
                <tr>
                    <td width="122">USER NAME</td>
                    <td width="215"> 
                        <input type="text" name="UserName" id="UserName" value="<%=strUserName%>"  size="18" maxlength="25" 
                        style="width:200px;text-transform: uppercase; background-color:  #FFF8DC; border:  1px solid #000000;"/>
                    </td>
                    <td Style="text-align:right;">DATE</td>
                    <td colspan="2" width="200"> 
                        <input type="text" name="ShowDate" id="ShowDate" value="<%=strShowDate%>" maxlength="15" 
                        placeholder="MM/DD/YYYY" style=" background-color:  #FFF8DC; border:  1px solid #000000;width:130px;"/>
                    </td>
                </tr>
                <tr>
                    <td width="122">SHOW NAME</td>
                    <td colspan="4"> 
                        <input type="text" name="ShowName" id="ShowName" value="<%=strSHowName%>" onKeyUp="javascript:this.value=this.value.toUpperCase()" size="30" maxlength="30" style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
                        height: 16px;
                        padding-left: 18px;
                        width: 380px;"/>
                    <input type="hidden" name="ObservationSeq" id="ObservationSeq" value="<%=strObservationSeq%>" />
                    <input type="hidden" name="ShowSeq" id="ShowSeq" value="" />
                    <img src="Images/Find.gif" onClick="Search_Shows('ShowSeq','ShowName')">
                </td>						                
            </tr>
            <tr>
                <td>OBSERVATION</td>           
                <td COLSPAN="4">
                    <input type="text" name="Observation" id="Observation" size="75" maxlength="50" 
                    value="<%=strObservations%>"  style="text-transform: uppercase; background-color:  #FFF8DC;
                    border:  1px solid #000000;width:420px;"/>
                </td>
            </tr>
                    <!-- 06072011 kumar-->
            <tr>
                <td colspan="2">
                    <INPUT  name="obsStatus" id="obsStatus" type="radio" value="<%=strObsStatus%>" 
                    onclick="fnEndDate()" 
                    <% if(strObsStatus.equalsIgnoreCase("PERMANENT")){%> checked <%}%> />PERMANENT
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <INPUT  name="obsStatus" id="obsStatus" type="radio" value="<%=strObsStatus%>" 
                    onclick="fnEndDate()" 
                    <% if(strObsStatus.equalsIgnoreCase("TEMPORARY")){%> checked <%}%>/>TEMPORARY                
                </td>
		<td width="61" nowrap >
                      <label id="LblEndDate">END DATE</label>
                </td>
                <td colspan="2" width="200"> 
                    <input type="text" name="EndDate" id="EndDate" value="<%=strEndDate%>" maxlength="15" 
                    placeholder="MM/DD/YYYY"
                    style=" background-color:  #FFF8DC; border:  1px solid #000000;width:130px;"/>
                </td>
            </tr><!--

            <tr>
                <td></td>
                <td colspan="7">
                    <INPUT  name="obsStatus" id="obsStatus" type="radio" value="<%=strObsStatus%>" onclick="fnEndDate()" <% if(strObsStatus.equalsIgnoreCase("PERMANENT")){%>checked<%}%> />Permanent
                </td>
            </tr> -->

            <tr>
                <td colspan="5"  align="center">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" id="BtnSavePopup" value="Save" class="button"/>
                    <input type="button" id="BtnCancel" value="Cancel" class="button"/>
                </td>
            </tr>

                <input type="hidden" name="HdnRegNo1" id="HdnRegNo1"/>
                <input type="hidden" name="HdnRegSeq1" id="HdnRegSeq1"/>


        </table>
            </div>



        </form>
    </body>
</html>
