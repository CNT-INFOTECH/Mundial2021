<%--
    Document   : frmRegister
    Created on : May 26, 2011, 11:11:45 PM
    Author     : CNT
--%>


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
<script type="text/javascript" src="scripts/jscRegister_Horse_Shows.js"></script>


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
        String strRegNum_Top="";
        String strRegNumHidden_Top="";
        

         if(request.getParameter("ShowSeq")!=null )
            strShowSeq=request.getParameter("ShowSeq");
        
        if(request.getParameter("EventSeq")!=null )
            strEventSeq=request.getParameter("EventSeq");

        if(request.getParameter("EventName")!=null )
            strEvnName=request.getParameter("EventName");


        GetInterface GUI1=new GetInterface();
        ArrayList AlEventInfo=GUI1.GET_EVENT_INFORMATION(strShowSeq,strEventSeq);
        String strEventOrder=""+AlEventInfo.get(1);
        String strEventDate=""+AlEventInfo.get(2);
        String strEventGender=""+AlEventInfo.get(5);
        String strEventName=""+AlEventInfo.get(6);
        String strShowName=""+AlEventInfo.get(8);




        String strRegNum="";
        if(request.getParameter("RegNum")!=null && !request.getParameter("RegNum").equals("null") )
         strRegNum=request.getParameter("RegNum");


        String strHorseName="";
        if(request.getParameter("HorseName")!=null && !(request.getParameter("HorseName").equals("null")) )
          strHorseName=request.getParameter("HorseName");

        String strHDOB="";
        if(request.getParameter("HDOB")!=null && !(request.getParameter("HDOB").equals("null")) )
          strHDOB=request.getParameter("HDOB");

        String strOwner="";
        if(request.getParameter("Owner_Top")!=null && !(request.getParameter("Owner_Top").equals("null")) )
          strOwner=request.getParameter("Owner_Top");

        String strMchip="";
        if(request.getParameter("Mchip")!=null && !(request.getParameter("Mchip").equals("null")) )
          strMchip=request.getParameter("Mchip");

        if(request.getParameter("RegNum_Top")!=null && !(request.getParameter("RegNum_Top").equals("null")) )
        strRegNum_Top=request.getParameter("RegNum_Top");


        if(request.getParameter("RegNumHidden_Top")!=null && !request.getParameter("RegNumHidden_Top").equals("null") )
         strRegNumHidden_Top=request.getParameter("RegNumHidden_Top");

%>
    <body>
        <form name="frmRegister_Horse_Shows">
 <table width="100%" align="center" bgcolor="white">
        <td><span id="EventName"><font><h3><font color="RED"> <%=strEventOrder %> </font> <%=strEventName %> <font color="RED"> <%=strEventDate %> </font> (<%=strShowName%>)  </h3></font></span></td>
            <input type="hidden" id="EventSeq" Name="EventSeq" value="<%=strEventSeq%>">
            <input type="hidden" id="EventName" Name="EventName" value="<%=strEvnName%>">
        
    </table>

  <table width="100%">
    <tr>
      <td width="79"><font class="label">HORSE&nbsp;NAME</font></td>
      <td nowrap colspan="5" >
        <input type="hidden" name="RegNumHidden_Top" id="RegNumHidden_Top" value="<%=strRegNumHidden_Top%>">
        <input id="ShowHorses" type="text"  name="HorseName" id="HorseName"size="70" value="<%=strHorseName%>"
            
            style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
            height: 16px;
            padding-left: 18px;
            ">
      </td>
      <td width="79"><font class="label">REGISTRATION#</font></td>
      <td width="139">
        <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
               name="RegNum_Top" id="RegNum_Top" size="12" value="<%=strRegNum_Top%>" onBlur="AssginHiddenReg()">
      </td>
    </tr>
    <tr>
      
      <td width="48"><font class="label">DOB </font></td>
      <td width="60"><font class="label">
        <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
            name="HDOB" size="10"   id="datepicker" value="<%=strHDOB%>" >
        </font></td>
      <td width="56">OWNER </td>
      <td width="135">
        <input type="text"  value="<%=strOwner%>"  style="background-color:  #FFF8DC; border:  1px solid #000000;" 
               name="Owner_Top" id="OwOwner_Topner" size="25"
     value="<%=strOwner%>" >
      </td>
      <td width="79">MCHIP#</td>
      <td width="711">
        <input type="text"  value="<%=strMchip%>"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
               name="Mchip" id="Mchip" size="12"
    >
      </td>
    </tr>
  </table>
   
    <table width="30%" align="right">
    <tr>
    <td ><input class="button" type="button" name="Search" value="Search" onClick="ListHorses()"> </td>
    <!--<td><input class="button" type="button" name="Search" value="Register" onClick="Register_Event_horse('<%=strEventSeq%>','')"></td>-->
    <td ><input class="button" type="button" name="Search" value="New Horse" onClick="AddNewHorse('<%=strEventSeq%>')">
    <td ><input class="button" type="button" name="Reset" value="Reset" onClick="ResetSearch('<%=strEventSeq%>')"/>
    <input type="hidden" name="CheckRider" value="N"/></td>
    </tr>
    </table>
     <br>
     <table width="100%">
         <tr> <td>
                  <%@ include file="frmRegister_Horse_Shows_HSearch.jsp"%>
             </td>
            
         </tr>
     </table>



        </form>
    </body>
</html>
