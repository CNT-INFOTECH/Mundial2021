<%--
    Document   : Show History
    Created on : July 18, 2011, 3:46:48 PM
    Author     : Veera
--%>



<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<title>SHOW HISTORY</title>

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

        <script type="text/javascript" src="jscShowHistory.js"></script> 
        <script type="text/javascript" src="jscIndex.js"></script> 
        
        <link href="Registration.css" rel="stylesheet" type="text/css" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery.js"></script>
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
</style>
</head>

<body>
<%
String strEventFrom="";
String strYear="";
String strEventTo="";

%>
    
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.DBConnection" %>
<%@ page import="pasotracker.GeneralServlet" %>

<%
        String FontColor="";
        String RegType="";                
        %>
        

 <form name="ShowHistory_frm">
 <%@ include file="frmReg_ScreenAttributes.jsp"%>
<%       
    String REGSEQ="";        
    String strMode="";
    String SaveYN="N";
    if(request.getParameter("Mode")!=null)
        strMode=request.getParameter("Mode");

    if(strMode.equals("1"))
    {
    SaveYN="N";            
    session.removeAttribute("ses_REGSEQ");        
    }
    if(strMode.equals("2"))
    {
        if(request.getParameter("RegNo")!=null)
        REGSEQ =request.getParameter("RegNo");
        else
        REGSEQ="";           
    }
    else if(session.getAttribute("ses_REGSEQ")!=null)
        REGSEQ =(String) session.getAttribute("ses_REGSEQ");
    else
        REGSEQ="";                
%>
     <%@ include file="frmOwnersHistoryInclude.jsp"%>
    <div id="container">
        <div id="header">
            <%@ include file="frmHeader.jsp"%>
        </div>
        <%

		if(!bRegistraion)
		response.sendRedirect("login.jsp");
		
       // if(request.getParameter("HdnRegSeq")!=null)
        //    REGSEQ=request.getParameter("HdnRegSeq");
                     
        if(request.getParameter("TxtShowYear")!=null)
            strYear=request.getParameter("TxtShowYear");
        
        if(request.getParameter("TxtEventFrom")!=null)
            strEventFrom=request.getParameter("TxtEventFrom");
        
        if(request.getParameter("TxtEventTo")!=null)
            strEventTo=request.getParameter("TxtEventTo");
        

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
            <div id="content">
                <%@ include file="frmReg_Top.jsp"%>
           <table class="altRow">                                                                       
            <tr>               
                <td style="font-weight:bold;">YEAR :</td>
                <td>
            <input type="text"  name="TxtShowYear" id="TxtShowYear" size="10" value="<%=strYear%>"  style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/>
                </td>
                
                <td style="font-weight:bold;" nowrap>EVENT DATE :</td>
                
                <td nowrap ><font class="dateStyleBody" align="top" >FROM</font>
                  <input type="text" id="TxtEventFrom" name="TxtEventFrom" size="10" value="<%=strEventFrom%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/>
                 </td>
                 <td nowrap colspan="3">
                    <font class="dateStyleBody" align="top" >TO</font>&nbsp;&nbsp;
                    <input type="text" id="TxtEventTo" name="TxtEventTo" size="10" value="<%=strEventTo%>" style="background-color:  #FFF8DC; border:  1px solid #000000;"/>
                </td>                  
                <td width="330"></td>
            </tr>
            
               </table>
               
            <br>
                <div align="center">
                        <table id="altRow" align="center">            
                            <tr>
                                <td><input type="button" id="ShowHistorySearch" class="button" value="Search" /></td>
                                <td><input type="button" id="ShowHistoryReset" class="button" value="Reset" /></td>                                
                                <td><input type="button" id="PreviousShow_History" class="button" value="&laquo;" /></td>
                                <td><input type="button" id="NextShow_History" class="button" value="&raquo;" /></td>
                            </tr>
                        </table>
                         <input type="hidden" name="SavedYN" id="SavedYN" value="Y" />
                    </div>
     <br>
            
            
      <%      
	  
      if(strMode.equals("2") || strMode.equals("3") || strMode.equals(""))
	{
		
	if( !REGSEQ.equals(""))
		{

      List HorseList = new ArrayList();
            try
        {
                String ShowSeq="";
                String ShowName="";
                String ShowPlace="";
                String EventDate="";
                String strName="";
                String Placement="";
                String Points="";
                
                
                  
            GeneralServlet gen=new GeneralServlet();
 RowSetFactory factory25 = RowSetProvider.newFactory();
   CachedRowSet crsGetShowHistory= factory25.createCachedRowSet();
          //  CachedRowSetImpl crsGetShowHistory = new CachedRowSetImpl();

            crsGetShowHistory = gen.Get_ShowHistory(REGSEQ,strYear,strEventFrom,strEventTo);

            Map MpHorseDetails = new TreeMap();

            while (crsGetShowHistory.next())
            {
                 ShowSeq="";
                ShowName="";
                ShowPlace="";
                EventDate="";
                strName="";
                Placement="";
                Points="";

                if(crsGetShowHistory.getString("Show_Seq")!=null)
                    ShowSeq= crsGetShowHistory.getString("Show_Seq").trim();

                if(crsGetShowHistory.getString("Show_Name")!=null)
                    ShowName= crsGetShowHistory.getString("Show_Name").trim();

                if(crsGetShowHistory.getString("Show_Place")!=null)
                    ShowPlace= crsGetShowHistory.getString("Show_Place").trim();

                if(crsGetShowHistory.getString("EventDate")!=null)
                    EventDate= crsGetShowHistory.getString("EventDate").trim();

                if(crsGetShowHistory.getString("Name")!=null)
                    strName= crsGetShowHistory.getString("Name").trim();

                if(crsGetShowHistory.getString("Placement")!=null)
                    Placement= crsGetShowHistory.getString("Placement").trim();

                if(crsGetShowHistory.getString("Points")!=null)
                    Points= crsGetShowHistory.getString("Points").trim();
                

                    MpHorseDetails = new TreeMap();
                    MpHorseDetails.put("SHOWSEQ",ShowSeq);
                    MpHorseDetails.put("SHOW",ShowName);
                    MpHorseDetails.put("PLACE",ShowPlace);
                    MpHorseDetails.put("DATE",EventDate);
                    MpHorseDetails.put("EVENT",strName);

					if(Placement.equals("-1"))
						Placement="B";

                    MpHorseDetails.put("STANDING",Placement);
                    MpHorseDetails.put("POINTS",Points);

                    HorseList.add(MpHorseDetails);

                    
            }

        }
        catch(Exception ex)
        {
                ex.printStackTrace();

        }

        request.setAttribute("HorseList", HorseList);

	
    if(HorseList.size()>=0)
    {
		%>
    <display:table  id="Details" name="requestScope.HorseList"
        pagesize="100" 
        class="grid" 
        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
       <display:setProperty name="basic.msg.empty_list" value="No Shows found "/>
       
        <display:column style="width:15%"   title="SHOW" property="SHOW" sortable="true" headerClass="Grid_Header"/> 
        <display:column style="width:10%"  property="PLACE" sortable="true" headerClass="Grid_Header" />        
        <display:column style="width:5%"  title="DATE"   sortable="true" property="DATE" headerClass="Grid_Header"/>
        <display:column style="width:25%" property="EVENT" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:5%;text-align:center;" property="STANDING" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:5%;text-align:center;" property="POINTS" sortable="true"  headerClass="Grid_Header" />
       
        </display:table>
    
       <% }
        }
}%>



<%if(strMode.equals("2") || strMode.equals("1"))
    {   %>
<script language="javascript">
    document.forms[0].TxtShowYear.value="";
    document.forms[0].TxtEventFrom.value="";
    document.forms[0].TxtEventTo.value="";
     document.forms[0].HdnRegSeq.value="";
    
</script>
<%}%>

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
padding: 4px;text-align: center;" >&nbsp;&nbsp;Show&nbsp;History&raquo;</div>
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
padding: 4px;text-align: center;" >Observations</div>
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
    <div id="dialog-Reg" title="SEARCH REGISTRATION" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="regsearchpopup.jsp"  id="modalIFrame_Show" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
        </iframe>
    </div>
    <div id="dialog-Calculator" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe src="frmCalculator.jsp" id="modalIFrame_Calculator" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
        </iframe>
    </div>
   
    </form>



</body>
</html>