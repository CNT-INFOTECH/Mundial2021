<%--
    Document   : frmRegister
    Created on : May 26, 2011, 11:11:45 PM
    Author     : CNT
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="beans.SRegistrationBean" %>
<jsp:useBean id="RegDetails" class="beans.SRegistrationBean" scope="session" />
<html>
        <head>
            <title>HORSE REGISTRATION</title>
         <link href="Shows.css" rel="stylesheet" type="text/css" />
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

 <script type="text/javascript" src="scripts/SRegistraion.js"></script>
 <style>
.ui-datepicker
{
    font-family:TimesNewRoman;
    font-size: 10px;
    margin-left:0px;
    margin-top: 0px;
    line-height: 1.0em;
}
</style>
</head>
 <body>
 <form>
  <%

        String strEventSeq="";  //1
        String strRegNum="";
        String strType="";
        String strNum="";
        if(request.getParameter("RegNum")!=null)//1
            strRegNum=request.getParameter("RegNum");
        if(request.getParameter("Type")!=null)
            strType=request.getParameter("Type");
        if(request.getParameter("Num")!=null)
            strNum=request.getParameter("Num");
        
     
     %>

  <%@ include file="frmHrsRegistration_Include.jsp"%>
  <%
          String strRetnFn="SireList";
         if(strType.equals("2"))
            strType="MALE";

         else if (strType.equals("3"))
            strType="FEMALE";
           else
          strType=strSht_Gender;



        if(strType.equals("MALE"))
              strRetnFn="SireList";
        else
             strRetnFn="DamList";


   %>


  <table width="100%" border="0" cellspacing="1" cellpadding="2">
    <th colspan="4" class="Grid_Header" > HORSE INFORMATION&nbsp;&nbsp;</th>
    <tr>

        <td width="96"><font class="label">REG#</font></td>
      <td width="88">
        <input type="text"  ReadOnly style="background-color:  #FFF8DC; border:  1px solid #000000;"
               name="RegNum_S" id="RegNum_S" size="15" onChange="CheckRegNumExists(RegNum_S)"
               value="<%=strSht_RegNum.trim()%>">
        <img alt="" src="Images/pencil_icon.gif" onClick="ChageEditable(RegNum_S)"/>
      </td>

    </tr>
    <tr>
      <td width="96"><font class="label">NAME</font></td>
      <td nowrap colspan="4" >
        <input type="hidden" name="RegSeq_S" id="RegSeq_S"
            value="<%=strSht_RegSeq.trim()%>">
        <input type="text"  name="HorseName_S" size="50"
        class="allcaps"
         value="<%=strSht_HorseName.trim()%>">
    </tr>
    <tr>
      
      <td width="129"><font class="label"></font> </td>
      <td width="1009" colspan="-4">
          <input type="hidden" name="HGender" value="<%=strType%>">
          
      </td>
    </tr>
    <tr>
      <td width="96"><font class="label">BIRTH DATE</font></td>
      <td width="88">
        <input type="text"  class="allcaps"
               name="Sreg_HDOB" id="Sreg_HDOB" size="6"
               value="<%=strSht_DOB%>" placeholder="MM/DD/YYYY"
               onChange="getAge_Months(Sreg_HDOB.value,Sreg_HAGE)">
        <input type="text"  class="allcaps" ReadOnly name="Sreg_HAGE"  size="1" value="<%=strSht_Age%>" >
        <font class="dateStyleBody"></font></td>
      <td width="129"><font class="label">PLACE&nbsp;OF&nbsp;BIRTH</font> </td>
      <td colspan="-2" width="1009"><img alt="" src="Images/dropdown_icon4.gif" onClick="OpenPlaceofBirth()"/>
        <input type="hidden"   class="allcaps"
               name="Place" id="place" size="1"
               value="<%=strSht_POB%>">
        <!--  <input type="text"   class="allcaps"
               name="PlaceVal" id="PlaceVal" size="15"
               value="<%=strREGISTRY_PLACE_VAL%>"> -->
        <input type="hidden" name="SavedYN" id="SavedYN">
        <font color="blue"><span id="place_Lbl" name="place_Lbl" ><%=strSht_POB%>
        </span></font></td>
    </tr>
    <tr>
      <td width="96"><font class="label">COLOR</font></td>
      <td width="88"> <img alt="" src="Images/dropdown_icon4.gif"
                            onClick="OpenCommonRef('Color','Color','ColorID')"/>
        <input type="hidden"  id="ColorValue"  class="allcaps"
            name="colorValue" size="12"   value="<%=strSht_HORSE_COLOR_VAL%>">
        <input type="hidden"   class="allcaps"
            name="color" id="Color" size="10"   value="<%=strSht_COLOR%>">
        <font color="blue"><span id="ColorID" name="ColorID"><%=strSht_HORSE_COLOR_VAL%> </span></font>
      </td>
      <td width="129"><font class="label"> ASSOCIATION</font> </td>
      <td colspan="-2" width="1009">
        <input type="hidden"  class="allcaps"
                name="AssoNum" id="AssoNum" size="2"
                value="<%=strSht_Asso%>">
        <img alt="" src="Images/dropdown_icon4.gif"
                            onClick="OpenCommonRef('ORGANIZATION','AssoNum','AssoName')"/>
        <input type="hidden"  class="allcaps"
                name="AssoNum_Value" id="AssoNum_Value"  size="20"
                value="<%=strORGNAME%>">
        <font color="blue"><span id="AssoName" name="AssoName"><%=strORGNAME%> </span></font>
        </td>
    </tr>
    <tr>
      <td width="96"><font class="label">MICROCHIP#</font></td>
      <td width="88">
        <input type="text" style="background-color:  #FFF8DC; border:  1px solid #000000;" name="Mchip_S" id="Mchip" size="15"
            value="<%=strSht_Chip%>">
      </td>
      <td width="129"><font class="label">MODALITY</font><font class="label"></font></td>
      <td width="1009">
        <select  style="background-color:  #FFF8DC; border:  1px solid #000000;"
                 name="modality" >
          <option value="">Select</option>
          <% String[] strModOption={"PASOFINO","TROCHA","TROCHA Y GALOPE","TROTE Y GALOPE"};
           for(int mod=0;mod <strModOption.length;mod++)
            {
                       if( strModOption[mod].equalsIgnoreCase(strSht_Modality))
                        { %>
          <option selected><%=strSht_Modality%></option>
          <% }
                     else{%>
          <option><%=strModOption[mod]%></option>
          <% }
            }%>
        </select>
         </td>
    </tr>
    
    
    <tr>
      <td width="96"><font class="label">OWNER#</font></td>
      <td colspan="3">
        <input type="hidden" name="OwnerSeq"  size="10" id="OwnerSeq"
                    value="<%=strSht_OwnerSeq%>">
        <input type="text" name="Owner_Assigned"  size="10" class="allcaps"  id="Owner_Assigned"
                    value="<%=strSht_OwnerSeq_AssignedNum%>" onBlur="GetPersonByAssignedNum(this.value,'OwnerSeq','Owner_Assigned','owner_Label')">
        <img src="Images/Find.gif" onClick="SearchOwner('Owner',600,550,'yes','1','1')">
        <span id="owner_Label" style="color :blue;"><%=strSht_OwnerFName%> </span>
        <input type="hidden"  class="allcaps" name="owner" id="owner" size="40"
            value="<%=strSht_OwnerFName%>">
        <input type="hidden"  class="allcaps" name="Mowner" id="Mowner" size="2"

        <input type="hidden"  class="allcaps" name="Lowner" id="Lowner" size="40"
           >
      </td>
    </tr>
    <td width="96"><font class="label">BREEDER#</font></td>
    <td colspan="3">
      <input type="hidden" name="BreederSeq" size="10" id="BreederSeq"
                    value="<%=strSht_BreederSeq%>" >
      <input type="text" name="Breeder_Assigned"  size="10" class="allcaps" id="Breeder_Assigned"
                    value="<%=strSht_BreederSeq_AssignedNum%>" onBlur="GetPersonByAssignedNum(this.value,'BreederSeq','Breeder_Assigned','Breeder_Label')">
      <img src="Images/Find.gif" onClick="SearchOwner('Owner',600,550,'yes','2','1')">
      <span id="Breeder_Label" style="color :blue;"><%=strSht_BreederFName%> </span>
      <input type="hidden"   class="allcaps"
                name="breeder" size="40"
                value="<%=strSht_BreederFName%>">
      <input type="hidden"   class="allcaps"
                name="Mbreeder" size="2">
      <input type="hidden"   class="allcaps"
                name="Lbreeder" size="40">
    </td>
	<tr>


    <table width="30%" align="right">
    <tr>
    <td >
    <!--<input class="button" type="button" name="Search" value="Save" onClick="SRSubmit(sire,sireName,dam,damName,'winRegPop','800','500','yes')"> -->
    <input class="button" type="button" name="Search" value="Save" onClick="SR_Hrs_Submit('NM')">
     <input class="button" type="button" name="Search" value="Reset" onClick="SR_Hrs_SD_Reset()">
      <input class="button" type="button" name="Search" value="Close" onClick="<%=strRetnFn%>('<%=strSht_RegSeq%>','<%=strSht_HorseName%>','<%=strNum%>','<%=strSht_RegNum%>')">
      <input type="hidden" name="PageID" value="HSRSREGISTRAION"/>
        <input type="hidden" name="Type"  value="<%=strType%>" />
        <input type="hidden" name="Num"   value="<%=strNum%>" />
    </td>

    </tr>
    </table>
	</tr>
    <div id="dialog-CmmnRef" style="display:none; background:url('Images/trans-wood-1.png')" >
      <iframe id="modalIFrame_CmmnRef" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
      </iframe> </div>
    <div id="dialog-PlaceOfBirth" style="display:none; background:url('Images/trans-wood-1.png')" >
      <iframe id="modalIFrame_PlaceOfBirth" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
      </iframe> </div>
  </table>
<div >
<%@ include file="frmBottom_Registration.jsp"%>
</div>
</form>
    </body>
</html>
