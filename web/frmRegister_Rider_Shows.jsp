<%--
    Document   : frmRegister
    Created on : May 26, 2011, 11:11:45 PM
    Author     : CNT
--%>

<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
        <head>
        <link href="Shows_Pop.css" rel="stylesheet" type="text/css" />
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />

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

 <script type="text/javascript" src="AutoComplete/jquery.js"></script>
<script type='text/javascript' src='AutoComplete/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="AutoComplete/jquery.autocomplete.css" />
<script type="text/javascript" src="scripts/jscRegister_Rider_Shows.js"></script>


<link rel="stylesheet" href="windowfiles/dhtmlwindow.css" type="text/css" />
 <script type="text/javascript" src="windowfiles/dhtmlwindow.js">
/***********************************************
* DHTML Window Widget- © Dynamic Drive (www.dynamicdrive.com)
* This notice must stay intact for legal use.
* Visit http://www.dynamicdrive.com/ for full source code
***********************************************/

</script>
<link rel="stylesheet" href="modalfiles/modal.css" type="text/css" />
<script type="text/javascript" src="modalfiles/modal.js"></script>





    </head>

    <%
        String strShowSeq="";
        String strEventSeq="";
        String strEvnName="";
      
        int intPageSize=15;
        String strViewAll="N";
        if(request.getParameter("FlgViewAll")!=null)
            strViewAll=request.getParameter("FlgViewAll");
        if(strViewAll.equals("Y"))
            intPageSize=99999;

        
      
        if(request.getParameter("EventSeq")!=null )
            strEventSeq=request.getParameter("EventSeq");

        GetInterface GUI=new GetInterface();
        ArrayList AlEventInfo=GUI.GET_EVENT_INFORMATION(strShowSeq,strEventSeq);
        String strEventOrder=""+AlEventInfo.get(1);
        String strEventDate=""+AlEventInfo.get(2);
        String strEventGender=""+AlEventInfo.get(5);
        String strEventName=""+AlEventInfo.get(6);
        String strShowName=""+AlEventInfo.get(8);

       

        if(request.getParameter("EventName")!=null )
            strEvnName=request.getParameter("EventName");

        String strAssigned_Top="";
        if(request.getParameter("Assigned_Top")!=null && !request.getParameter("Assigned_Top").equals("null") )
         strAssigned_Top=request.getParameter("Assigned_Top");

         String strRiderName_Top="";
        if(request.getParameter("YouthRider_Top")!=null && !request.getParameter("YouthRider_Top").equals("null") )
         strRiderName_Top=request.getParameter("YouthRider_Top");

          String strYouthRider_Seq_Top="";
        if(request.getParameter("YouthRider_Seq_Top")!=null && !request.getParameter("YouthRider_Seq_Top").equals("null") )
         strYouthRider_Seq_Top=request.getParameter("YouthRider_Seq_Top");



         String strYouthRider_DOB_Top="";
        if(request.getParameter("YouthRider_DOB_Top")!=null && !request.getParameter("YouthRider_DOB_Top").equals("null") )
         strYouthRider_DOB_Top=request.getParameter("YouthRider_DOB_Top");
         
         String strGender_Top="";
        if(request.getParameter("Gender_Top")!=null && !request.getParameter("Gender_Top").equals("null") )
         strGender_Top=request.getParameter("Gender_Top");


       

        
%>
    <body>
        <form name="frmRegister_Rider_Shows">
 <table width="100%" align="center" bgcolor="white">
     <td><span id="EventName"><font><h2><font color="RED"> <%=strEventOrder %> </font> <%=strEventName %> <font color="RED"> <%=strEventDate %> </font> (<%=strShowName%>)  </h2></font></span></td>
            <input type="hidden" id="EventSeq" Name="EventSeq" value="<%=strEventSeq%>">
            <input type="hidden" id="EventName" Name="EventName" value="<%=strEvnName%>">

    </table>

  <table width="100%">
    <tr>
      <td width="79"><font class="label">YOUTH&nbsp;RIDER&nbsp;NAME</font></td>
      <td nowrap colspan="5" >
        <input type="hidden" name="YouthRider_Seq_Top" id="YouthRider_Seq_Top" value="<%=strAssigned_Top%>" >
        <input id="YouthRider_Top" type="text"  name="YouthRider_Top" size="45" value="<%=strRiderName_Top%>"
    style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
    height: 16px;
    padding-left: 18px;
    ">
      </td>
      <td width="79"><font class="label">ID#</font></td>
      <td width="139">
        <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
               name="Assigned_Top" id="Assigned_Top" size="12"  value="<%=strAssigned_Top%>" >
      </td>
    </tr>
    <tr>

      <td width="48"><font class="label">DOB </font></td>
      <td width="60">
        <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
            name="YouthRider_DOB_Top" size="10"   id="datepicker"  value="<%=strYouthRider_DOB_Top%>">
        </td>
        
       <td width="48"><font class="label">GENDER </font></td>
      <td width="60">
        <select  style="background-color:  #FFF8DC; border:  1px solid #000000;" class="allcaps" name="Gender_Top">
       <option value="">Select</option>
        <option <% if(strGender_Top.equalsIgnoreCase("MALE")) { %> Selected <%}%>>MALE</option>
        <option <% if(strGender_Top.equalsIgnoreCase("FEMALE")) { %> Selected <%}%>>FEMALE</option>
        </select></td>

  </table>

    <table width="30%" align="right">
    <tr>
    <td ><input class="button" type="button" name="Search" value="Search" onClick="ListYouthRiders()"> </td>
    <td ><input class="button" type="button" name="Search" value="New Rider" onClick="AddNewYouthRider('<%=strEventSeq%>')">
    <td ><input class="button" type="button" name="Reset" value="Reset" onClick="ResetSearch('<%=strEventSeq%>')"/>
    <input type="hidden" name="CheckRider" value="N"/>
    <input type="hidden" name="FlgViewAll" value="<%=strViewAll%>" ></td>
      
    </tr>
    </table>
   
     <table width="100%">
         <tr> <td>
                  <%@ include file="frmRegister_Rider_Shows_HSearch.jsp"%>
             </td>

         </tr>
     </table>



        </form>
    </body>
</html>
