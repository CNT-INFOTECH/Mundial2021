<%--
    Document   : frmRegister
    Created on : May 26, 2011, 11:11:45 PM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
        <head>
         <link href="GroupEvents.css" rel="stylesheet" type="text/css" />
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

 <script type="text/javascript" src="scripts/SRegistraion.js"></script>
  <script type="text/javascript" src="scripts/jscShortRegistration_Off.js"></script>






    </head>
    <%
       String strMode1="";
       if(request.getParameter("mode")!=null)
           strMode1=request.getParameter("mode");



        String strRegNum="";
        String strEventSeq="";

        if(request.getParameter("EventSeq")!=null )
                strEventSeq=request.getParameter("EventSeq");


        if(strMode1.equals("1") )
        {
           strRegNum=request.getParameter("Reg");

        }
    %>

   <%@ include file="frmShortRegistration_Off_Include.jsp" %>



    <body >


<table width="100%" border="0" cellspacing="1" cellpadding="2">
  <tr>
    <td colspan="11" class="Grid_Header">MARE 1&nbsp;&nbsp;&nbsp;<% if (!strSht_GroupSeq.equals("0")){%>
    <img alt="" src="Images/Registered.jpg"/> <% }%></td>
  </tr>
  <tr>
    <td width="9%"><font class="label">REG#</font> </td>
    <td width="17%" colspan="2">
      <input type="hidden" name="RegSeq_S" id="RegSeq_S" value="<%=strSht_RegSeq%>">
      <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
               name="RegNum_S" id="RegNum_S" size="10" onChange="CheckRegNumExists3(RegNum_S,'<%=strEventSeq%>','Mare1')"
               value="<%=strSht_RegNum%>">
    <img alt="" src="Images/Find.gif" onClick="SearchHorse('PopHrs',600,600,'yes','1','3','<%=strEventSeq%>')"/>
    </td>
    <td width="10%"><font class="label">NAME :</font></td>
    <td width="20%" colspan="4">
      <input type="hidden"  name="HorseName_S" size="2"
        value="<%=strSht_HorseName%>">
      <a href="#" onClick="OpenLink('PopRegNum',600,600,'yes','frmHrsRegistration.jsp',RegSeq_S.value,'RegNum','Num=1')" >
          <font size="3" color="blue"><span  class="Onlycaps" ><%=strSht_HorseName%></span></font>
      </a>
    </td>
    <td width="15%"><font class="label">GENDER :</font></td>
    <td> <font size="2" color="blue"> <span  class="Onlycaps"><%=strSht_Gender%></span></font>
      <input type="hidden" name="HGender" value='<%=strSht_Gender%>' size=1>
    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="9%"><font class="label">BIRTH DATE : </font></td>
    <td width="17%"> <font color="blue" size="2" ><span class="OnlyCaps"><%=strSht_DOB%></span></font>
       &nbsp;&nbsp;&nbsp; AGE:<font color="blue" size="2" ><%=strSht_Age%></font>
      <input type="hidden"  class="allcaps"
               name="Sreg_HDOB" id="Sreg_HDOB" size="1" value="<%=strSht_DOB%>"

               onChange="getAge_Months(Sreg_HDOB.value,Sreg_HAGE)">
      <input type="hidden"  class="allcaps" ReadOnly name="Sreg_HAGE"  size="1" value="<%=strSht_Age%>">
    </td>
    <td width="5%"><font class="dateStyleBody">&nbsp;</font></td>
    <td width="10%"><font class="label">COLOR : </font></td>
    <td colspan="4">
      <!--<img alt="" src="Images/dropdown_icon4.gif"    onClick="OpenCommonRef('Color','Color','Color_Lbl')"/> -->
      <font color="blue" size="2"><span id="Color_Lbl" valign="top" name="Color_Lbl"><%=strSht_HORSE_COLOR_VAL%></span></font>
      <input type="hidden"   class="allcaps" value="<%=strSht_COLOR%>"
            name="color" id="Color" size="10"  >
      <input type="hidden"  id="ColorValue"  class="Onlycaps" value="<%=strSht_HORSE_COLOR_VAL%>"
            name="colorValue"  size="15"  >
    </td>
    <td width="15%"><font class="label">PLACE&nbsp;OF&nbsp;BIRTH : </font></td>
    <td>
      <!--<img alt="" src="Images/dropdown_icon4.gif"    onClick="OpenCommonRef('Place','Place','place_Lbl')"/> -->
      <font color="blue" size="2"><span id="place_Lbl" class="Onlycaps"><%=strREGISTRY_PLACE_VAL%></span></font>
      <input type="hidden"   class="allcaps"
               name="Place" id="Place" size="1" value="<%=strSht_POB%>">
      <input type="hidden"   class="allcaps"
               name="PlaceVal" id="PlaceVal" size="15"  value="<%=strREGISTRY_PLACE_VAL%>">
    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="9%"><font class="label">MICROCHIP#&nbsp;:&nbsp;</font></td>
    <td width="17%"> <font color="blue" size="2"><span  class="Onlycaps"><%=strSht_Chip%></span></font>
      <input type="hidden" style="background-color:  #FFF8DC; border:  1px solid #000000;"
               name="Mchip_S" id="Mchip" size="15"
           value="<%=strSht_Chip%>">
    </td>
    <td width="5%">&nbsp;</td>
    <td width="10%"><font class="label">ASSOCIATION#&nbsp;:&nbsp;</font></td>
    <td colspan="4">
      <!--<img alt="" src="Images/dropdown_icon4.gif"
                            onClick="OpenCommonRef('ORGANIZATION','AssoNum','AssoNum_Lbl')"/>-->
      <font color="blue" size="2"><span id="AssoNum_Lbl" class="Onlycaps"><%=strORGNAME.trim()%></span></font>
      <input type="hidden"  class="allcaps"
                name="AssoNum" id="AssoNum" size="40"
                value="<%=strSht_Asso%>">
      <input type="hidden"  class="allcaps"
                name="AssoNum_Value" id="AssoNum_Value"  size="15"
                value="<%=strORGNAME%>">
    </td>
    <td width="15%"><font class="label">MODALITY : </font> </td>
    <td colspan="2"><font color="blue" size="2"><span class="Onlycaps"><%=strSht_Modality.trim()%></span></font>
      <input type="hidden" name="modality" value="<%=strSht_Modality%>" size="1" >
    </td>
  </tr>
  <tr>
    <td width="9%"><font class="label">SIRE</font></td>
    <td colspan="4">
      <input type="hidden" name="sire" id="sire" size="10"
                    value="<%=strSht_SireSeq%>" >
      <input type="text"  class="allcaps" name="sireName" id="sireName" size="10"
                      onChange="GetHorseName_ByNum_SD(this.value, 'sire','sireName','Name_Label','2')"
                     onBlur="ClearFields_Shrt('sireName','sire','Name_Label')"
                     value="<%=strSireReg_Num%>">
      <img alt="" src="Images/Find.gif" onClick="SearchSireDame('PopPed',600,600,'yes','2','1')"/>
      <a href="#" onClick="OpenLink('PopSire',600,600,'yes','frmSHrsRegistration.jsp',sire.value,'RegNum','Num=1')">
      <span id="Name_Label" style="color :blue; font-size:12px"  class="Onlycaps"><%=strSht_SireName%></span></a></td>
    <td width="4%"><font class="label">DAM</font></td>
    <td colspan="4">
      <input type="hidden" name="dam" id="dam" size="10"
             value="<%=strSht_DamSeq%>">
      <input type="text"  class="allcaps" name="damName" id="damName" size="10" value="<%=strDamReg_Num%>"
             onChange="GetHorseName_ByNum_SD(this.value, 'dam','damName','Dam_Label','3')"
            onBlur="ClearFields_Shrt('damName','dam','Dam_Label')"
                          >
      <img alt="" src="Images/Find.gif" onClick="SearchSireDame('PopPed',600,600,'yes','3','1')">
      <a href="#" onClick="OpenLink('PopDam',600,600,'yes','frmSHrsRegistration.jsp',dam.value,'RegNum')">
      <span id="Dam_Label" style="color :blue; font-size:12px"  class="Onlycaps"><%=strSht_DamName%></span>
      </a> </td>
    <td width="2%">&nbsp;</td>
  </tr>
  <tr>
    <td width="9%"><font class="label">BREEDER#</font></td>
    <td colspan="4">
      <input type="hidden" name="BreederSeq"  id="BreederSeq" size="10" value="<%=strSht_BreederSeq%>">
      <input type="hidden"   class="allcaps"  name="breeder"  id="breeder"  size="40"
                value="<%=strSht_BreederFName%>" >
      <input type="text" name="Breeder_Assigned"  size="10" class="allcaps" id="Breeder_Assigned"
                    value="<%=strSht_BreederAssignedNum%>" onBlur="GetPersonByAssignedNum_Grp(this.value,'BreederSeq','Breeder_Assigned','Breeder_Label')">
      <img src="Images/Find.gif" onClick="SearchOwner('Owner',600,600,'yes','2','1')">
      <a href="#" onClick="OpenLink('PopBreed',600,600,'yes','frmEntityDetails.jsp',BreederSeq.value,'ID','Type=2&Num=1')">
      <span id="Breeder_Label" style="color :blue; font-size:12px"  class="Onlycaps"><%=strSht_BreederFName%></span></a>
    </td>
    <td width="4%"><font class="label">EXHIBITOR</font></td>
    <td colspan="5">
      <input type="text" name="Rider_Assigned" size="10" class="allcaps" id="Rider_Assigned"
                    value="<%=strSht_RiderAssignedNum%>" onBlur="GetPersonByAssignedNum(this.value,'RiderSeq','Rider_Assigned','Rider_Label')">
      <img alt="" src="Images/Find.gif" onClick="SearchOwner('Owner',600,550,'yes','3','1')" >
      <a href="#" onClick="OpenLink('PopBreed',600,600,'yes','frmEntityDetails.jsp',RiderSeq.value,'ID','Type=3&Num=1')">
      <span id="Rider_Label" style="color :blue; font-size:12px"  class="Onlycaps"><%=strSht_RiderFName%></span></a>
      <input type="hidden" name="RiderSeq"  id="RiderSeq" size="10"
                    value="<%=strSht_RiderSeq%>" >
      <input type="hidden"   class="allcaps"
                name="Rider_FN" size="40"
                 value="<%=strSht_RiderFName%>">
    </td>
  </tr>
 
        <tr>
         <td width="96"><font class="label">OWNER#</font></td>
         <td colspan="9">
        <input type="hidden" name="OwnerSeq"  size="10" id="OwnerSeq"
                    value="<%=strSht_OwnerSeq%>">
        
         <input type="text" name="Owner_Assigned"  size="10" class="allcaps"  id="Owner_Assigned"
                    value="<%=strSht_OwnerSeq%>" onChange="GetPersonByAssignedNum(this.value,'OwnerSeq','Owner_Assigned','owner_Label')"
                    onBlur="ClearFields_Shrt('Owner_Assigned','OwnerSeq','owner_Label')">
        <input type="hidden"  class="allcaps" name="owner" id="owner" size="40"
            value="<%=strSht_OwnerFName%>">
        <input type="hidden"  class="allcaps" name="Mowner" id="Mowner" size=""
            value="<%=strSht_OwnerMName%>">
        <input type="hidden"  class="allcaps" name="Lowner" id="Lowner" size="40"
            value="<%=strSht_OwnerLName%>">
        <img src="Images/Find.gif" onClick="SearchOwner('Owner',600,550,'yes','1','1')">
         <a href="#" onClick="OpenLink('PopBreed',600,600,'yes','frmEntityDetails.jsp',OwnerSeq.value,'ID','Num=1&Type=1')">
         <span id="owner_Label" style="color :blue; font-size:12px"  class="Onlycaps"><%=strSht_OwnerFName%> <%=strSht_OwnerLName%></span></a>

      </td>
        </tr>
      </table>
          <br>

       <fieldset><legend>Descendents</legend>
        <table width="100%" >
        <tr><td>

        <div id="Descendent1" >
            <td width="96"><font class="label">DESCENDENT1</font></td>
           <td colspan="9">
               <input type="hidden" name="RegSeq_D1" id="RegSeq_D1"  value="<%=strSht_RegSeq_Off%>">

                <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
                                    name="RegNum_D1" id="RegNum_D1" size="10"
                                    onblur="GetHorseName_ByNum_off(this.value, 'RegSeq_D1','RegNum_D1','Name_Label_D1')"
                                    value="<%=strSht_RegNum_Off%>">
                <img alt="" src="Images/Find.gif" onClick="SearchHorse_OffSprings('PopHrs',600,600,'yes','1','D1','<%=strEventSeq%>',RegSeq_S.value,'M')"/>
                <a href="#" onClick="OpenLink('PopRegNum',600,600,'yes','frmHrsRegistration.jsp',RegSeq_D1.value,'RegNum','Num=1')" >
                <span id="Name_Label_D1" style="color :blue; font-size:12px"  class="Onlycaps"><%=strSht_HorseName_Off%></span></a>

                </td>
        </div>
        </td>
        </tr>

        <tr><td>
        <div id="Descendent2" >
            <td width="96"><font class="label">DESCENDENT2</font></td>
           <td colspan="9">
               <input type="hidden" name="RegSeq_D2" id="RegSeq_D2" value="<%=strSht_RegSeq_Off_2%>">

                <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
                                    name="RegNum_D2" id="RegNum_D2" size="10"
                                    onblur="GetHorseName_ByNum_off(this.value, 'RegSeq_D2','RegNum_D2','Name_Label_D2')"
                                     value="<%=strSht_RegNum_Off_2%>">
                <img alt="" src="Images/Find.gif" onClick="SearchHorse_OffSprings('PopHrs',600,600,'yes','1','D2','<%=strEventSeq%>',RegSeq_S.value,'M')"/>
                <a href="#" onClick="OpenLink('PopRegNum',600,600,'yes','frmHrsRegistration.jsp',RegSeq_D2.value,'RegNum','Num=1')" >
                <span id="Name_Label_D2" style="color :blue; font-size:12px"  class="Onlycaps"><%=strSht_HorseName_Off_2%></span></a>

                </td>
        </div>
        </td>
        </tr>

  </table>

</fieldset>


                
                
</br>

<fieldset><legend>Payment Info</legend>
<table  width="100%" align="center">
  <tr>
    <td>
      <table  style="border-right: thin solid white;" width="90% "cellspacing="0px" cellpadding="3px">
        <tr>
          <td align="left">
            <input name="RegType" value="Pre" type="radio" <% if(strRegType.equals("Pre")){%> checked <%}%>
                   onClick="PostAmount(RegType,MemYN,AmountVal)"/>
            <label>Pre Regisrtaion</label></td>
          <td align="left">
            <input name="RegType" value="Spot" type="radio" <% if(strRegType.equals("Spot")){%> checked <%}%>
                   onClick="PostAmount(RegType,MemYN,AmountVal)"/>
            <label>Regisrtaion</label></td>
        </tr>
        <tr>
          <td align="left" >
            <input name="MemYN" value="Member" type="radio" <% if(strIsMember.equals("Member")){%> checked <%}%>
                   onClick="PostAmount(RegType,MemYN,AmountVal)"/>
            <label>Member </label></td>
          <td>
            <input name="MemYN" value="NonMember" type="radio" <% if(strIsMember.equals("NonMember")){%> checked <%}%>
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
                       value="<%=strCC%>">
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
                    value="<%=strCash%>" >
          </td>
          <td align="left" width="0%">&nbsp;</td>
          <td align="left" width="3%" >
            <input type="text" name="MOAmount" size="4" maxlength="15"
                      class="allcaps" style="text-align:right"
                      onBlur="PostTotalAmount(CCAmount,ATMAmount,ChkAmount,CashAmount,MOAmount)"
                      value="<%=strMO%>" >
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

    </body>
</html>
