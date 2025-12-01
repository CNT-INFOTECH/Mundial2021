<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="javax.sql.rowset.*"%>
<%@ page import="java.util.*" %>
<html>

<head>
<title>OBSERVATIONS</title>

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

<script type="text/javascript" src="jscObservations.js"></script>

<script type="text/javascript" src="jscIndex.js"></script>

 <link href="Registration.css" rel="stylesheet" type="text/css" />
 <link href="style.css" rel="stylesheet" type="text/css" />

 <link href="buttons.css" rel="stylesheet" type="text/css" />


<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/interface.js"></script>
 <script type="text/javascript">
function doAlert(s)
{
		document.all.RecordsSize.innerHTML = s;
}

function Sample(RegNo,mode)//RegNo is observation seq here
{
   // alert(RegNo);
    $('#dialog-Observation').dialog({ autoOpen: false,height: 320,width: 600, modal: true });
    $('#dialog-Observation').dialog('open');
    $("#modalIFrame_Observation").attr('src','frmObservationPopup.jsp?Mode='+mode+'&Seq='+RegNo+'&edit=1');
    return false;
}

function deleteObservation(strRegNo,strRegSeq,showname,showdate,observation,ObsSeq)
{


  var bok=confirm('Do you want to delete this record?')
    if(bok)
     {

        document.forms[0].method="post";
        document.forms[0].action="PasoTrackServletDelete?Delete=yes"+"&strRegNo="+strRegNo+"&strRegSeq="+strRegSeq+"&showname="+showname+"&showdate="+showdate+"&observation="+observation+"&ObsSeq="+ObsSeq;
        document.forms[0].submit();
     }

}

</script>
<style type="text/css">
<!--
@import url("CommonTableStyle.css");
-->

.altRow1
{

}

.altRow1 td
{
	border-bottom:1px dotted #ffffff;
	font-size:9pt;
	color:#000000;
	padding:5px 0 5px 5px;
	vertical-align:top;
	text-align:center;
}



</style>
</head>

<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import= "javax.naming.*" %>
<%@ page import= "javax.sql.rowset.*" %>
<%@ page import= "pasotracker.DBConnection" %>
<%@ page import= "pasotracker.GeneralServlet" %>


<body>

 <form name="Observations_frm">
 <%@ include file="frmReg_ScreenAttributes.jsp"%>
<%
    String REGSEQ="";        
    String strMode="";
    if(request.getParameter("Mode")!=null)
    strMode=request.getParameter("Mode");

    if(strMode.equals("2"))
    {               
    session.removeAttribute("ses_REGSEQ");        
    }
    if(strMode.equals("1"))
    {
        if(request.getParameter("RegSeq")!=null)
        REGSEQ =request.getParameter("RegSeq");
        else
        REGSEQ="";           
    }
    else if(session.getAttribute("ses_REGSEQ")!=null)
        REGSEQ =(String) session.getAttribute("ses_REGSEQ");
    else
        REGSEQ="";  



%>

     <%@ include file="frmObservationsInclude.jsp"%>
     <%

String FontColor="";
        String RegType="";

            if(strRegistration_Type.equals("R"))
            {
               FontColor="blue";
               RegType="R";
            }
            else if(strRegistration_Type.equals("P"))
            {
               FontColor="red";
               RegType="P";
            }
            else if(strRegistration_Type.equals("S"))
            {
               FontColor="green";
               RegType="S";
            }
String Regno="";
    Regno=str_reggno;  //Regno is used in frmReg_Top.jsp
%>

    <div id="container">

        <div id="header">
            <%@ include file="frmHeader.jsp"%>
        </div>
			<%
			if(!bRegistraion)
			response.sendRedirect("login.jsp");
			%>
            <div id="content">

                  <%@ include file="frmReg_Top.jsp"%>       


   <div align="center" >
       <table class="altRow1" width="100%">
           <tr>
               <td colspan="" >
                    <input  type="button" class="button" id="BtnObservation" value="Observation"  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> />
                    <input  type="button" class="button" id="BtnReset"  value="Reset"/>
                    <%--<input  type="button" class="button" id="BtnClose" value="Close"/>--%>
                    <input  type="button" class="button" id="BtnLeftNavi" value="&laquo;" />
                    <input  type="button" class="button" id="BtnRightNavi" value="&raquo;" />
                </td>
            </tr>
        </table>
        </div>

        <br/>


     <%

String str_RegNo="";
int rowCount=0;

if(request.getParameter("HdnRegNo")!=null)
    {
        str_RegNo=request.getParameter("HdnRegNo");
    }

     //List ObservationList = new ArrayList();

        ArrayList ObservationList = new ArrayList();

        String strSHowName="";
        String strShowDate="";
        String strObservations="";
        String strObservationSeq="";

        //added on 24062011
        String strRegNo="";
        String strRegSeq="";

        String strObsType="";

 GeneralServlet gen=new GeneralServlet();
            RowSetFactory factory = RowSetProvider.newFactory();
CachedRowSet crsGet_Observations = factory.createCachedRowSet();

if(strMode.equals("1") || strMode.equals(""))
{

       try
         {
           


 if(str_reggno!=null && str_reggno!="" )
            crsGet_Observations = gen.GET_OBSERVATIONS(strObservationSeq,REGSEQ,"");


            Map MpHorseDetails = new TreeMap();

            while(crsGet_Observations.next())
            {
	rowCount=crsGet_Observations.size();
                strSHowName="";
                strShowDate="";
                strObservations="";

                strObsType="";

                MpHorseDetails = new TreeMap();

                if(crsGet_Observations.getString("SHOW_NAME")!=null)
                strSHowName= crsGet_Observations.getString("SHOW_NAME");

                 if(crsGet_Observations.getString("DATE")!=null)
                strShowDate= crsGet_Observations.getString("DATE");

                 if(crsGet_Observations.getString("OBSERVATIONS")!=null)
                strObservations= crsGet_Observations.getString("OBSERVATIONS");

                 if(crsGet_Observations.getString("OBSERVATION_SEQ")!=null)
                strObservationSeq= crsGet_Observations.getString("OBSERVATION_SEQ");

//added on 24062011

                if(crsGet_Observations.getString("REGSEQ")!=null)
                strRegSeq=crsGet_Observations.getString("REGSEQ");

                if(crsGet_Observations.getString("REG_NUM")!=null)
                strRegNo=crsGet_Observations.getString("REG_NUM");
//added on 12072011 by kumar

                if(crsGet_Observations.getString("OBSERVATION_TYPE")!=null)
                strObsType= crsGet_Observations.getString("OBSERVATION_TYPE");
				else 
				strObsType=" ";

                ///String strList=strRegNo+"@#@"+strRegSeq+"@#@"+strSHowName+"@#@"+strShowDate+"@#@"+strObservations+"@#@"+strObservationSeq+"@#@"+strObsType;
                String strList=strRegNo+"@#@"+REGSEQ+"@#@"+strSHowName+"@#@"+strShowDate+"@#@"+strObservations+"@#@"+strObservationSeq+"@#@"+strObsType;


                MpHorseDetails.put("SHOWNAME",strSHowName);
                MpHorseDetails.put("DATE",strShowDate);
                MpHorseDetails.put("OBSERVATION",strObservations);

                //ObservationList.add(MpHorseDetails);

                ObservationList.add(strList);
//				out.println(strList);
                }
             }
            catch(Exception e)
            {
                System.out.println("ERROR");
            }
}

            request.setAttribute("HorseList", ObservationList);

           %>

                <%--
            <display:table  id="Details" name="requestScope.HorseList"
                            pagesize="10" defaultsort="1" defaultorder="ascending"
                            class="grid"
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;overflow-x:scroll;">
            <display:column style="width:10%;Height:40px;" property="SHOWNAME" sortable="true"  headerClass="Grid_Header" />
            <display:column style="width:10%;Height:30px;" property="DATE" sortable="true" headerClass="Grid_Header"/>
            <display:column style="width:10%;Height:30px;" property="OBSERVATION"  sortable="true" headerClass="Grid_Header" />
            </display:table>
                --%>


     <%

    if(ObservationList.size()>0)
    {
	
     %>
	 <table>
    <tr>
        <td>
            <div>No. of records:&nbsp;<font ID ="RecordsSize"></font></div>
        </td>
    </tr>
</table>


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
            <% for(int i=0;i <ObservationList.size();i++)
            {
                String strClass="";
                if( i%2 ==0 )
                    strClass="even";
                else
                    strClass="odd";

                String str=ObservationList.get(i).toString();


                String[] strSplit= str.split("@#@");


//out.println("*****strObsType******"+strSplit[5]);
            //ArrayList AlGetRows=(ArrayList)ObservationList.get(i);
%>
            <tr class="<%=strClass%>">

                <td height="20" size="30" ><%= strSplit[6].trim()%></td>
                <td height="20" size="30"  style="text-transform: uppercase;"><%= strSplit[2]%></td>

                <td  size="15"><%= strSplit[3]%></td>

                <td nowrap size=""  style="text-transform: uppercase;"><%= strSplit[4]%></td>
                <td align="right" size="">
				
				<img src="Images/pencil_icon.gif"  onclick="Sample(<%=strSplit[5]%>,'1')">&nbsp;&nbsp;
				<!-- Commented by Raju on 11/06/2013 requested by jose
				<img src="Images/delete.png"  onclick="deleteObservation('<%=strSplit[0]%>','<%=strSplit[1]%>','<%=strSplit[2]%>','<%=strSplit[3]%>','<%=strSplit[4]%>','<%=strSplit[5]%>')" />
				--> 
				
				</td>
                <td>
                <input type="hidden" name="HdnRegNo" id="HdnRegNo"value="<%= strSplit[0]%>"/>
                </td>
            </tr>
            <%}%>
        </tbody>
            </table>

	<script language="javascript" >
<%if(crsGet_Observations.size() > 0)
{%>
    doAlert(<%= rowCount %>);

<%}%>
</script>

         <%} %>

        <input type="hidden" name="HdnRegNo" id="HdnRegNo"value="<%=str_reggno%>"/>
        <input type="hidden" name="HdnRegSeq" id="HdnRegSeq"value="<%=REGSEQ%>"/>
        <input type="hidden" id="PAGEID" name="PAGEID" value="OBSERVATIONS"/>
<!-- kumar added 26032011 -->
        <input type="hidden" name="Status" value=" " />
  <!-- kumar added -->


  <input type="hidden" name="HdnRegNo1"  id="HdnRegNo1"  value='<%=str_reggno%>' />
  <input type="hidden" name="HdnRegSeq1" id="HdnRegSeq1" value="<%=REGSEQ%>" />
  <input type="hidden" name="ShowName1" id="ShowName1" value=" " />
  <input type="hidden" name="ShowDate1" id="ShowDate1"  value=" " />
  <input type="hidden" name="Observation1" id="Observation1" value=" " />
  <input type="hidden" name="ObservationSeq1" id="ObservationSeq1" value=" " />


  <input type="hidden" name="ObservationType1" id="ObservationType1" value=" " />
  <input type="hidden" name="obsStatus1" id="obsStatus1"  value=" " />
  <input type="hidden" name="EndDate1" id="EndDate1" value=" " />
  <input type="hidden" name="UserName1" id="UserName1" value=" " />
<input type="hidden" name="SavedYN" id="SavedYN" value="Y" />

        </div>


       <div id="sidebar">
<table style="border-collapse:collapse;">
  <tr>
    <td>
      <div onclick="CheckSave('index.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;width:120px;" >General</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('Images.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Images</div>
    </td>
  </tr>
  <tr>
    <td>
      <div  onclick="CheckSave('Markings.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Markings</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('frmPedigree.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Pedigree</div>
    </td>
  </tr>

  <tr>
    <td>
      <div onclick="CheckSave('frmReg_Descendants.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Descendants</div>
    </td>
  </tr>

  <tr>
    <td>
      <div onclick="CheckSave('frmReg_Siblings.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Siblings</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('frmOwnersHistory.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Owner's&nbsp;History</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('frmShowHistory.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Show&nbsp;History</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('frmChampionship.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style="cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Championship</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('frmDocuments.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Documents</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('frmObservations.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >&nbsp;&nbsp;Observations&raquo;</div>
    </td>
  </tr>
   <tr>
    <td>
      <div onclick="CalculatorPopUp()"  style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Calculator</div>
    </td>
  </tr>

  <tr>
    <td>
      <div onclick="CheckSave('frmRegistrationSearch.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Search</div>
    </td>
  </tr>

  <tr>
    <td>
      <div onclick="CheckSave('frmReg_SearchHorseDetails.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Age&nbsp;Verify</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('Admn_UserProfile.jsp?ty=R&<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >User&nbsp;Profile</div>
    </td>
  </tr>

</table>
       
    </div>
    <div id="footer_Bot" align="bottom">
    <jsp:include page="/frmBottom_Registration.jsp"/>
    </div>


    </div>
        <!-- kumar 23062011 -->
    <div id="dialog-Reg" title="Search Registration" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="regsearchpopup.jsp"  id="modalIFrame_Show" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="no">
        </iframe>
    </div>

    <div id="dialog-Observation" title="OBSERVATION" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="frmObservationPopup.jsp"  id="modalIFrame_Observation" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="no">
        </iframe>
    </div>

    <div id="dialog-Calculator" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe src="frmCalculator.jsp" id="modalIFrame_Calculator" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
        </iframe>
    </div>

   </form>



</body>
</html>