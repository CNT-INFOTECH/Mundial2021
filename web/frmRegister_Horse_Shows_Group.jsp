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
                String strGroupSeq="";

                if(request.getParameter("ShowSeq")!=null )
                strShowSeq=request.getParameter("ShowSeq");

                if(request.getParameter("EventSeq")!=null )
                strEventSeqMain=request.getParameter("EventSeq");

                if(request.getParameter("EventName")!=null )
                strEvnName=request.getParameter("EventName");

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

                String strTotalCharges="";
            String strCC="";
            String strATM="";
            String strCash="";
            String strCheck="";
            String strMO="";
            String strPaidAmt="";
            String strBalanceAmt="";

            String strOwnerSeq_Main="";
            String Owner_Assigned_Main="";
            String owner_Main_Name="";
             String strRegType="";



            if(today.before(Dt_Event_Date))
                strRegType="Pre";
            else
                strRegType="Spot";

            String strIsMember="";


                String strMode="";
                String strMare1="";
                String strMare2="";
                String strMare3="";

                 if(request.getParameter("mode")!=null )
                strMode=request.getParameter("mode");

                 if(request.getParameter("Mare1")!=null )
                strMare1=request.getParameter("Mare1");

                 if(request.getParameter("Mare2")!=null )
                strMare2=request.getParameter("Mare2");

                if(request.getParameter("Mare3")!=null )
                strMare3=request.getParameter("Mare3");


                if(request.getParameter("GroupSeq")!=null )
                     {
                           strGroupSeq=request.getParameter("GroupSeq");


                           GetInterface GUI_Main=new GetInterface();
                           ArrayList AlRows=GUI_Main.GET_GROUP_REGISTRATIONS(strGroupSeq);
                           for(int i=0;i<AlRows.size();i++)
                           {
                               ArrayList AlGetRow=(ArrayList)AlRows.get(i);
                               strEventSeqMain=""+AlGetRow.get(0);
                               strEvnName=""+AlGetRow.get(1);
                               if(i==0)
                                   strMare1=""+AlGetRow.get(2);
                               else if(i==1)
                                   strMare2=""+AlGetRow.get(2);
                                else if(i==2)
                                   strMare3=""+AlGetRow.get(2);

                               strOwnerSeq_Main=""+AlGetRow.get(3);
                               Owner_Assigned_Main=""+AlGetRow.get(4);
                               owner_Main_Name=""+AlGetRow.get(5);
                           }
                     }
                
                
            %>
        <table width="100%" align="center" bgcolor="white">
         <tr>
        <td width="50">
         <span id="EventName"><font><h2><font color="RED"> <%=strEventOrder %> </font> <%=strEventName %> <font color="RED"> <%=strEventDate %> </font> (<%=strShowName%>)  </h2></font></span>
        <input type="hidden" id="EventSeq" Name="EventSeq" value="<%=strEventSeqMain%>">
        <input type="hidden" id="EventName" Name="EventName" value="<%=strEvnName%>"></td>
        </tr>
         </table>
  <table width="100%" align="center" >
         <tr>
          <td width="96">OWNER#
        <input type="hidden" name="OwnerSeq_Main"  id="OwnerSeq_Main" size="10"  value="<%=strOwnerSeq_Main%>">

        <input type="text" name="Owner_Assigned_Main"  size="10" class="allcaps"  id="Owner_Assigned_Main"
                    value="<%=Owner_Assigned_Main%>"
                    onBlur="GetPersonByAssignedNum_Grp(this.value,'OwnerSeq_Main','Owner_Assigned_Main','owner_Label_Main')">
         <img src="Images/Find.gif" onClick="SearchOwner('Owner',600,600,'yes','1','11')">
        <span id="owner_Label_Main" style="color :blue;"><%=owner_Main_Name%></span>


        <input type="hidden"  class="allcaps" name="owner_Main" id="owner_Main" size="40"
           >
        <input type="hidden"  class="allcaps" name="Mowner_Main" id="Mowner_Main" size="2"
            >
        <input type="hidden"  class="allcaps" name="Lowner_Main" id="Lowner_Main" size="40"
            >

      </td>
        </tr>

        </table>
          <table width="100%" align="center" >
        <tr><td>
                <div id="Mare1" >
                    <jsp:include page="frmShortRegistration_Off_G.jsp" flush="true" >
                        <jsp:param name="mode" value="<%=strMode%>"></jsp:param>
                        <jsp:param name="Reg" value="<%=strMare1%>"></jsp:param>
                        
                    </jsp:include>
        </div>
        </td></tr>
        <tr><td>
        <div id="Mare2" >
                    <jsp:include page="frmShortRegistration_Off_G2.jsp" flush="true" >
                        <jsp:param name="mode" value="<%=strMode%>"></jsp:param>
                        <jsp:param name="Reg" value="<%=strMare2%>"></jsp:param>
                    </jsp:include>
        </div>
        </td>
        </tr>
         <tr><td>
        <div id="Mare3" >
                    <jsp:include page="frmShortRegistration_Off3.jsp" flush="true" >
                        <jsp:param name="mode" value="<%=strMode%>"></jsp:param>
                        <jsp:param name="Reg" value="<%=strMare3%>"></jsp:param>
                    </jsp:include>
        </div>
        </td>
        </tr>
</table>



 <%@ include file="frmGroup_paymentDetails.jsp"%>


<fieldset><Legend>Payment Info</Legend>
<table  width="100%" align="center">
  <tr>
    <td>
      <table  style="border-right: thin solid white;" width="90% "cellspacing="0px" cellpadding="3px">
        <tr>
          <td align="left">
            <input name="RegType" value="Pre" type="radio"   <% if(strRegType.equals("Pre")){%> checked <%}%>
                   onClick="PostAmount(RegType,MemYN,AmountVal)"/>
            <label>Pre Regisrtaion</label></td>
          <td align="left">
            <input name="RegType" value="Spot" type="radio" <% if(strRegType.equals("Spot")){%> checked <%}%>
                   onClick="PostAmount(RegType,MemYN,AmountVal)"/>
            <label>Regisrtaion</label></td>
        </tr>
        <tr>
          <td align="left" >
            <input name="MemYN" value="Member" type="radio"  <% if(strIsMember.equals("Member")){%> checked <%}%>
                   onClick="PostAmount(RegType,MemYN,AmountVal)"/>
            <label>Member </label></td>
          <td>
            <input name="MemYN" value="NonMember" type="radio"  <% if(strIsMember.equals("NonMember")){%> checked <%}%>
                   onClick="PostAmount(RegType,MemYN,AmountVal)"/>
            <label>Non-Member </label></td>
        </tr>
      </table>
    </td>
    <td>
      <table width="100%" cellspacing="0px" cellpadding="3px" border="0px">
        <tr>
          <td align="left" width="10%">Total&nbsp;Amount</td>
          <td align="left" width="0%">&nbsp;&nbsp;</td>
          <td align="left" width="3%">

            <label>CC</label></td>
          <td align="left" width="0%">&nbsp;</td>
          <td align="left" width="3%">

            <label>ATM</label></td>
          <td align="left" width="0%">&nbsp;</td>
          <td align="left" width="5%">

            <label >Cheque</label></td>
          <td align="left" width="0%">&nbsp;</td>
          <td align="left" width="3%">

            <label>Cash</label></td>
          <td align="left" width="0%">&nbsp;</td>
          <td align="left" width="3%">

            <label >MO</label></td>
          <td align="left" width="0%">&nbsp;</td>
          <td align="left" width="3%">Total Paid </td>
          <td align="left" width="0%">&nbsp;</td>
          <td align="left" width="75%">Balance Amt</td>
        </tr>
        <tr>
          <td align="left" width="10%">
            $<input type="text" class="allcaps"
                                style="text-align:right" name="AmountVal" size="4" maxlength="15"
                                 value="<%=strTotalCharges%>">
            </td>
          <td align="left" width="0%">&nbsp;</td>
          <td align="left" width="3%">
            <input type="text" name="CCAmount" size="4" maxlength="15"
                      class="allcaps"  style="text-align:right"
                      onBlur="PostTotalAmount(CCAmount,ATMAmount,ChkAmount,CashAmount,MOAmount)"
                       value="<%=strCC%>" >
          </td>
          <td align="left" width="0%">&nbsp;</td>
          <td align="left" width="3%">
            <input type="text" name="ATMAmount" size="4" maxlength="15"
                      class="allcaps"  style="text-align:right"
                      onBlur="PostTotalAmount(CCAmount,ATMAmount,ChkAmount,CashAmount,MOAmount)"
                       value="<%=strATM%>">
          </td>
          <td align="left" width="0%">&nbsp;</td>
          <td align="left" width="5%">
            <input type="text" name="ChkAmount" size="4" maxlength="15"
                      class="allcaps"  style="text-align:right"
                      onBlur="PostTotalAmount(CCAmount,ATMAmount,ChkAmount,CashAmount,MOAmount)"
                     value="<%=strCheck%>">
          </td>
          <td align="left" width="0%">&nbsp;</td>
          <td align="left" width="3%">
            <input type="text" name="CashAmount" size="4" maxlength="15"
                      class="allcaps"  style="text-align:right"
                      onBlur="PostTotalAmount(CCAmount,ATMAmount,ChkAmount,CashAmount,MOAmount)"
                     value="<%=strCash%>">
          </td>
          <td align="left" width="0%">&nbsp;</td>
          <td align="left" width="3%" >
            <input type="text" name="MOAmount" size="4" maxlength="15"
                      class="allcaps" style="text-align:right"
                      onBlur="PostTotalAmount(CCAmount,ATMAmount,ChkAmount,CashAmount,MOAmount)"
                      value="<%=strMO%>">
          </td>
          <td align="left" width="0%" >&nbsp;</td>
          <td align="left" width="3%" >
            <input type="text" name="TotalPaid" size="4" maxlength="15"
                      class="allcaps"  style="text-align:right"
                       value="<%=strPaidAmt%>">
          </td>
          <td align="left" width="0%" >&nbsp;</td>
          <td align="left" width="75%" >
            <input type="text" name="Balance" size="4" maxlength="15" class="allcaps"
                          style="text-align:right"
                           value="<%=strBalanceAmt%>">
          </td>
        </tr>
      </table>

  </tr>
</table>
</fieldset>
 <table width="30%" align="right">
    <tr>
    <td >
    <!--<input class="button" type="button" name="Search" value="Save" onClick="SRSubmit(sire,sireName,dam,damName,'winRegPop','800','500','yes')"> -->
    <input class="button" type="button" name="Search" value="Save" onClick="SRSubmit()">
     <input class="button" type="button" name="Search" value="Reset" onClick="SRReset_Group(EventSeq,EventName)">
      <input class="button" type="button" name="Search" value="Close" onClick="JQueryClose_Short()">
      <input type="hidden" name="PageID" value="SPECIAL_EVENTS_GROUP"/>
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
