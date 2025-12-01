<%--
    Document   : frmRegister_Horse_Shows_Group_OffSprings
    Created on : Jul 7, 2011, 4:04:14 PM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

        <script type="text/javascript" src="scripts/jscShortRegistration_Off.js"></script>
    </head>
<%@ page import = "model.GetInterface" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
    <body>
        <form name="frmRegister_Horse_Shows">

            <%
                String strShowSeq="";
                String strEventSeqMain="";
                String strEvnName="";
                String strGroupSeq="0";

                if(request.getParameter("ShowSeq")!=null )
                    strShowSeq=request.getParameter("ShowSeq");

                if(request.getParameter("EventSeq")!=null )
                    strEventSeqMain=request.getParameter("EventSeq");

                if(request.getParameter("EventName")!=null )
                    strEvnName=request.getParameter("EventName");
                
                 if(request.getParameter("GroupSeq")!=null )
                    strGroupSeq=request.getParameter("GroupSeq");




                 GetInterface GUI1=new GetInterface();
                ArrayList AlEventInfo=GUI1.GET_EVENT_INFORMATION(strShowSeq,strEventSeqMain);
                String strEventOrder=""+AlEventInfo.get(1);
                String strEventDate=""+AlEventInfo.get(2);
                String strEventGender=""+AlEventInfo.get(5);
                String strEventName=""+AlEventInfo.get(6);
                String strShowName=""+AlEventInfo.get(8);

                Calendar cal = Calendar.getInstance();
                int day = cal.get(Calendar.DATE);
                int month = cal.get(Calendar.MONTH) + 1;
                int year = cal.get(Calendar.YEAR);
                String strCurrentDate=month+"/"+day+"/"+year;

                DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
                java.util.Date today = df.parse(strCurrentDate);
                java.util.Date Dt_Event_Date = df.parse(strEventDate);

                String strRegType="";
                if(today.before(Dt_Event_Date))
                    strRegType="Pre";
                else
                    strRegType="Spot";

                String strMode="";
                String strMare1="";
              
                 if(request.getParameter("mode")!=null )
                    strMode=request.getParameter("mode");

                 if(request.getParameter("Mare1")!=null )
                    strMare1=request.getParameter("Mare1");

                     if(request.getParameter("GroupSeq")!=null )
                     {
                           strGroupSeq=request.getParameter("GroupSeq");

                           GetInterface GUI_Main=new GetInterface();
                           ArrayList AlRows=GUI_Main.GET_GROUP_REGISTRATIONS(strGroupSeq);
                           for(int i=0;i<AlRows.size();i++)
                           {
                               ArrayList AlGetRow=(ArrayList)AlRows.get(i);

                               if(i==0)
                                   strMare1=""+AlGetRow.get(2);

                           }
                     }

               

            %>
        <table width="100%" align="center" bgcolor="white">
         <tr>
        <td width="50"><span ><font><h2><font color="RED"> <%=strEventOrder %> </font> <%=strEventName %> <font color="RED"> <%=strEventDate %> </font> (<%=strShowName%>)  </h2></font></span>
        <input type="hidden" id="EventSeq" Name="EventSeq" value="<%=strEventSeqMain%>">
        <input type="hidden" id="EventName" Name="EventName" value="<%=strEvnName%>">
        <input type="hidden" Name="GroupSeq_S" value="<%=strGroupSeq%>"></td>

        </tr>
         </table>
        <table width="100%" cellspacing="0px" cellpadding="3px" border="0px">
        <tr><td>
                <div id="Mare1" >
                    <jsp:include page="frmShortRegistration_Off_D.jsp" flush="true" >
                        <jsp:param name="mode" value="<%=strMode%>"></jsp:param>
                        <jsp:param name="Reg" value="<%=strMare1%>"></jsp:param>
                    </jsp:include>
        </div>
        </td></tr>
        </table>
      


<br>




 <table width="30%" align="right">
    <tr>
    <td >
    <!--<input class="button" type="button" name="Search" value="Save" onClick="SRSubmit(sire,sireName,dam,damName,'winRegPop','800','500','yes')"> -->
    <input class="button" type="button" name="Search" value="Save" onClick="SRSubmit()">
     <input class="button" type="button" name="Search" value="Reset" onClick="SRReset_3D(EventSeq,EventName)">
      <input class="button" type="button" name="Search" value="Close" onClick="JQueryClose_Short()">
      <input type="hidden" name="PageID" value="SPECIAL_EVENTS_DESCEND"/>
    </td>

    </tr>
    </table>

<div id="dialog-CmmnRef" style="display:none; background:url('Images/trans-wood-1.png')" >
<iframe id="modalIFrame_CmmnRef" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
</iframe>
</div>
        </form>
    </body>
</html>
