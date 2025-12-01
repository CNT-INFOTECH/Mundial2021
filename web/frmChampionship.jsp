
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"/>
<html>
<head>
<title>CHAMPIONSHIP</title>

        <link rel="stylesheet" href="Style_Popup.css"/>
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />
        <link href="frmReg_CommonRef.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
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

        <link href="buttons.css" rel="stylesheet" type="text/css" />
        <link href="Registration.css" rel="stylesheet" type="text/css" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/interface.js"></script>
        <script type="text/javascript">
function Reset_Championship()
{
    document.forms[0].method="post";
    document.forms[0].action="frmChampionship.jsp?Mode=1";
    document.forms[0].target="_self";
    document.forms[0].submit();
}


</script>
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

    
 <form name="Championship_frm">
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

            <div id="content">
                    <%@ include file="frmReg_Top.jsp"%>
					<input type="hidden" name="SavedYN" id="SavedYN"  value="Y"/>


            <div align="center">
                <table id="altRow" align="center">
                    <tr>
                    <td align="center" colspan="6">

                    <input type="button" id="Championship" class="button" value="Reset" onclick="Reset_Championship()"/>
                    <input type="button" id="Previous_Championship" onclick="CheckSave('frmShowHistory.jsp')" class="button" value="&laquo;" />
                    <input type="button" id="Next_Championship" onclick="CheckSave('frmDocuments.jsp')" class="button" value="&raquo;" />


                    </td>
                    </tr>
                </table>
            </div>

      <%

      if(strMode.equals("2") || strMode.equals("3") || strMode.equals(""))
	{

	if( !REGSEQ.equals(""))
		{

      List ChampionsList = new ArrayList();
       try
        {
                String ShowSeq="";
                String ShowName="";
                String ShowPlace="";
                String EventDate="";
                String strName="";
                String Placement="";
                String Points="";
                String Rider="";
                String RiderName="";


            GeneralServlet gen=new GeneralServlet();
 RowSetFactory factorycrsGet_ChampionsHistory = RowSetProvider.newFactory();
   CachedRowSet crsGet_ChampionsHistory= factorycrsGet_ChampionsHistory.createCachedRowSet();
            //CachedRowSetImpl crsGet_ChampionsHistory = new CachedRowSetImpl();

            crsGet_ChampionsHistory = gen.Get_ChampionsHistory(REGSEQ);

            Map MpHorseDetails = new TreeMap();

            while (crsGet_ChampionsHistory.next())
            {

                ShowSeq="";
                ShowName="";
                ShowPlace="";
                EventDate="";
                strName="";
                Placement="";
                Points="";
                Rider="";
                RiderName="";

                if(crsGet_ChampionsHistory.getString("Show_Seq")!=null)
                    ShowSeq= crsGet_ChampionsHistory.getString("Show_Seq").trim();

                if(crsGet_ChampionsHistory.getString("Show_Name")!=null)
                    ShowName= crsGet_ChampionsHistory.getString("Show_Name").trim();

                if(crsGet_ChampionsHistory.getString("Show_Place")!=null)
                    ShowPlace= crsGet_ChampionsHistory.getString("Show_Place").trim();

                if(crsGet_ChampionsHistory.getString("Event_Date")!=null)
                    EventDate= crsGet_ChampionsHistory.getString("Event_Date").trim();

                if(crsGet_ChampionsHistory.getString("Name")!=null)
                    strName= crsGet_ChampionsHistory.getString("Name").trim();

                if(crsGet_ChampionsHistory.getString("Rider")!=null)
                    Rider= crsGet_ChampionsHistory.getString("Rider").trim();

                if(crsGet_ChampionsHistory.getString("RiderName")!=null)
                    RiderName= crsGet_ChampionsHistory.getString("RiderName").trim();


                    MpHorseDetails = new TreeMap();
                    MpHorseDetails.put("SHOWSEQ",ShowSeq);
                    MpHorseDetails.put("SHOW",ShowName);
                    MpHorseDetails.put("EVENTNAME",strName);
                    MpHorseDetails.put("PLACE",ShowPlace);
                    MpHorseDetails.put("DATE",EventDate);                    
                    MpHorseDetails.put("RIDER",RiderName);
                   // MpHorseDetails.put("POINTS",Points);
                    ChampionsList.add(MpHorseDetails);
            }

        }
        catch(Exception ex)
        {
                ex.printStackTrace();

        }

        request.setAttribute("ChampionsList", ChampionsList);


    if(ChampionsList.size()>=0)
    {
		%>
    <display:table  id="Details" name="requestScope.ChampionsList"
        pagesize="100"
        class="grid"
        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
       <display:setProperty name="basic.msg.empty_list" value="No Shows found "/>

        <display:column style="width:20%"   title="SHOW" property="SHOW" sortable="true" headerClass="Grid_Header"/>
        <display:column style="width:30%" property="EVENTNAME" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:10%"  title="DATE"   sortable="true" property="DATE" headerClass="Grid_Header"/>
        <display:column style="width:10%"  property="PLACE" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:20%" property="RIDER" sortable="true" headerClass="Grid_Header" />

        </display:table>

       <% }
		}
     %>

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
padding: 4px;text-align: center;" >Show&nbsp;History</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('frmChampionship.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style="cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >&nbsp;&nbsp;Championship&raquo;</div>
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
        <iframe  src="regsearchpopup.jsp"  id="modalIFrame_Show" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="no">
        </iframe>
    </div>
     <div id="dialog-Calculator" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe src="frmCalculator.jsp" id="modalIFrame_Calculator" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
        </iframe>
    </div>
   </form>
</body>
</html>