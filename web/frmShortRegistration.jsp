<%--
    Document   : frmRegister
    Created on : May 26, 2011, 11:11:45 PM
    Author     : CNT
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="beans.SRegistrationBean" %>
<jsp:useBean id="RegDetails" class="beans.SRegistrationBean" scope="session" />
<%@ taglib uri="/WEB-INF/tlds/Reference.tld" prefix="Reference"%> 
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
</head>



    <body>
 <form>

 <%@ include file="frmShortRegistration_Include.jsp"%>

  <table width="100%" border="0" cellspacing="1" cellpadding="2">
    <th colspan="10" class="Grid_Header" > HORSE INFORMATION&nbsp;&nbsp;
    <% if (!strSht_Group.equals("0")){%>
    <img alt="" src="Images/Registered.jpg"/> <% }%>
    </th>


    <tr>&nbsp;</tr>
    <tr>
      <td width="96"><font class="label">NAME</font></td>
      <td nowrap colspan="6" >
        <input type="hidden" name="RegSeq_S" id="RegSeq_S"
            value="<%=strSht_RegSeq.trim()%>">
        <input type="hidden" name="GroupSeq_S" id=GroupSeq_S"
            value="<%=strSht_Group.trim()%>">

        <input type="text"  name="HorseName_S" size="60"
        class="allcaps"
         value="<%=strSht_HorseName.trim()%>">
      </td>
       <td width="96"><font class="label">EVENT ASSIGNED#</font></td>
        <td width="96" colspan="2" ><input type="text"  class="allcaps"
               name="Sreg_EAssignedNum" id=Sreg_EAssignedNum" size="6"
               value="<%=strEvent_AssignedNum%>" ></td>
    </tr>
    <tr>
      <td width="96"><font class="label">REG#</font></td>
      <td colspan="3">
        <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
               name="RegNum_S" id="RegNum_S" size="15" onChange="CheckRegNumExists(RegNum_S)"
               value="<%=strSht_RegNum.trim()%>">
      </td>
      <td width="106"><font class="label">GENDER</font></td>
      <td colspan="2">
        <Select  style="background-color:  #FFF8DC; border:  1px solid #000000;" name="HGender" >
          <option value="">Select</option>
          <% String[] strGendOption={"MALE","FEMALE","GELDING"};
           for(int gen=0;gen <strGendOption.length;gen++)
            {
                if(strGendOption[gen].equalsIgnoreCase(strSht_Gender))
                { %>
          <option selected><%=strSht_Gender%></option>
          <% }
                else{%>
          <option><%=strGendOption[gen]%></option>
          <%}
            }%>
        </Select>
      </td>
      <td width="123"><font class="label">MODALITY</font></td>
      <td colspan="2" width="696">
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
      <td width="96"><font class="label">BIRTH DATE</font></td>
      <td width="57" >
        <input type="text"  class="allcaps"
               name="Sreg_HDOB" id="Sreg_HDOB" size="6"
               value="<%=strSht_DOB%>"
               onChange="getAge_Months(Sreg_HDOB.value,'Sreg_HAGE_Lbl','<%=strEventSeq%>')">
        </td>
      <td width="43" colspan="2">
       <!-- <input type="text"  class="allcaps" ReadOnly name="Sreg_HAGE"  size="1" value="<%=strSht_Age%>" > -->
         <font color="blue"><span id="Sreg_HAGE_Lbl" class="Onlycaps"><%=strSht_Age%></span></font>
        </td>

      <td width="106"><font class="label">COLOR</font></td>
       <td width="33"><img alt="" src="Images/dropdown_icon4.gif"
                            onClick="OpenCommonRef('Color','Color','Color_Lbl')"/>
      <td width="60">
          <font color="blue"><span id="Color_Lbl" class="Onlycaps"><%=strSht_HORSE_COLOR_VAL%></span></font>
        <input type="hidden"   class="allcaps"
            name="color" id="Color" size="10"   value="<%=strSht_COLOR%>">
        <input type="hidden"  id="ColorValue"  class="allcaps"
            name="colorValue" size="10"   value="<%=strSht_HORSE_COLOR_VAL%>">
       </td>

      <td width="123"><font class="label">PLACE&nbsp;OF&nbsp;BIRTH</font></td>
      <td colspan="2" width="696">
        <input type="hidden"   class="allcaps"
               name="Place" id="place" size="1"
               value="<%=strSht_POB%>">


      <!--  <input type="text"   class="allcaps"
               name="PlaceVal" id="PlaceVal" size="15"
               value="<%=strREGISTRY_PLACE_VAL%>"> -->

      <input type="hidden" name="SavedYN" id="SavedYN">
        <img alt="" src="Images/dropdown_icon4.gif" onClick="OpenPlaceofBirth()"/>
      <font color="blue"><span id="place_Lbl" class="Onlycaps"><%=strSht_POB%></span></font></td>
    </tr>
    <tr>
      <td width="96"><font class="label">MICROCHIP#</font></td>
      <td colspan="3">
        <input type="text" style="background-color:  #FFF8DC; border:  1px solid #000000;" name="Mchip_S" id="Mchip" size="15"
            value="<%=strSht_Chip%>">
      </td>
      <td width="106"><font class="label">ASSOCIATION</font>

      <td colspan="5"> <img alt="" src="Images/dropdown_icon4.gif"
                            onClick="OpenCommonRef('ORGANIZATION','AssoNum','AssoNum_Lbl')"/>
        <font color="blue"><span id="AssoNum_Lbl" class="Onlycaps"><%=strORGNAME%></span>
        <input type="hidden"  class="allcaps"
                name="AssoNum" id="AssoNum" size="2"
                value="<%=strSht_Asso%>">
        <input type="hidden"  class="allcaps"
                name="AssoNum_Value" id="AssoNum_Value"  size="2"
                value="<%=strORGNAME%>">
        </font></td>
      <td>&nbsp; </td>
    </tr>
    <tr> </tr>
    
   
    
    
    <tr>
      <td width="96"><font class="label">SIRE</font></td>
      <td colspan="5">
        <input type="hidden" name="sire" id="sire" size="10"
                    value="<%=strSht_SireSeq%>" >
        <input type="text"  class="allcaps" name="sireName" id="sireName" size="10"
                    value="<%=strSht_SireNum%>"
                onChange="GetHorseName_ByNum_SD(this.value, 'sire','sireName','Name_Label','2')"
                 onBlur="ClearFields_Shrt('sireName','sire','Name_Label')">
        <img src="Images/Find.gif" onClick="SearchSireDame('PopPed',600,600,'yes','2','1')"/>

        <a href="#" onClick="OpenLink('PopSire',600,600,'yes','frmSHrsRegistration.jsp',sire.value,'RegNum','Num=1')">
            <span id="Name_Label" style="color :blue;" class="Onlycaps"><%=strSht_SireName%></span></a>

      </td>
      <%--<td><font class="label">REPRESENT COUNTRY</font></td>
      <td>
          <select  style="background-color:  #FFF8DC; border:  1px solid #000000;"
                   name="country" id="country" >
              <option value="">Select</option>
              <Reference:CommonTagHandler  strRefType="place" screenAttVal="<%--=strSht_Country--%>"  />
                </select>
              
             
      </td>--%>
          
      
       
    </tr>
    <tr>
      <td width="96"><font class="label">DAM</font></td>
      <td colspan="9">
        <input type="hidden" name="dam" id="dam" size="10"
            value="<%=strSht_DamSeq%>" >

        <input type="text"  class="allcaps" name="damName" id="damName" size="10"
            value="<%=strSht_DamNum%>" onChange="GetHorseName_ByNum_SD(this.value, 'dam','damName','Dam_Label','3')"
            onBlur="ClearFields_Shrt('damName','dam','Dam_Label')">

        <img alt="" src="Images/Find.gif" onClick="SearchSireDame('PopPed',600,600,'yes','3','1')">
        <a href="#" onClick="OpenLink('PopDam',600,600,'yes','frmSHrsRegistration.jsp',dam.value,'RegNum','Num=1')">
            <span id="Dam_Label" style="color :blue;" class="Onlycaps"><%=strSht_DamName%></span> </a>
      </td>
    </tr>
    <tr>
      <td width="96"><font class="label">OWNER#</font></td>
      <td colspan="9">
        <input type="hidden" name="OwnerSeq"  size="10" id="OwnerSeq"
                    value="<%=strSht_OwnerSeq%>">
        <input type="text" name="Owner_Assigned"  size="10" class="allcaps"  id="Owner_Assigned"
                    value="<%=strSht_OwnerSeq_AssignedNum%>" onChange="GetPersonByAssignedNum(this.value,'OwnerSeq','Owner_Assigned','owner_Label')"
                    onBlur="ClearFields_Shrt('Owner_Assigned','OwnerSeq','owner_Label')">
          <img src="Images/Find.gif" onClick="SearchOwner('Owner',600,550,'yes','1','1')">
           <a href="#" onClick="OpenLink('PopOwner',600,600,'yes','frmEntityDetails.jsp',OwnerSeq.value,'ID','Num=1&Type=1')">
          <span id="owner_Label" style="color :blue;" class="Onlycaps"><%=strSht_OwnerFName%> <%=strSht_OwnerMName%> <%=strSht_OwnerLName%></span>
           </a>
        <input type="hidden"  class="allcaps" name="owner" id="owner" size="40"
            value="<%=strSht_OwnerFName%>">
        <input type="hidden"  class="allcaps" name="Mowner" id="Mowner" size="2"
            value="<%=strSht_OwnerMName%>">
        <input type="hidden"  class="allcaps" name="Lowner" id="Lowner" size="40"
            value="<%=strSht_OwnerLName%>">

      </td>
    </tr>
    <td width="96"><font class="label">BREEDER#</font></td>
    <td colspan="9">
      <input type="hidden" name="BreederSeq" size="10" id="BreederSeq"
                    value="<%=strSht_BreederSeq%>" >

       <input type="text" name="Breeder_Assigned"  size="10" class="allcaps" id="Breeder_Assigned"
                    value="<%=strSht_BreederSeq_AssignedNum%>"
                    onChange="GetPersonByAssignedNum(this.value,'BreederSeq','Breeder_Assigned','Breeder_Label')"
                    onBlur="ClearFields_Shrt('Breeder_Assigned','BreederSeq','Breeder_Label')">
        <img src="Images/Find.gif" onClick="SearchOwner('Owner',600,550,'yes','2','1')">
         <a href="#" onClick="OpenLink('PopBreed',600,600,'yes','frmEntityDetails.jsp',BreederSeq.value,'ID','Num=1&Type=2')">
       <span id="Breeder_Label" style="color :blue;" class="Onlycaps"><%=strSht_BreederFName%> <%=strSht_BreederMName%> <%=strSht_BreederLName%></span>
         </a>
      <input type="hidden"   class="allcaps"
                name="breeder" size="40"
                value="<%=strSht_BreederFName%>">
      <input type="hidden"   class="allcaps"
                name="Mbreeder" size="2"
                value="<%=strSht_BreederMName%>">
      <input type="hidden"   class="allcaps"
                name="Lbreeder" size="40"
                value="<%=strSht_BreederLName%>">

    </td>
    <tr>
      <td width="96"><font class="label">RIDER#</font></td>
      <td colspan="9">
        <input type="hidden" name="RiderSeq" size="10" id="RiderSeq"
                    value="<%=strSht_RiderSeq%>" >

          <input type="text" name="Rider_Assigned" size="10" class="allcaps" id="Rider_Assigned"
                    value="<%=strSht_RiderSeq_AssignedNum%>"
                    onChange="GetPersonByAssignedNum(this.value,'RiderSeq','Rider_Assigned','Rider_Label')"
                    onBlur="ClearFields_Shrt('Rider_Assigned','RiderSeq','Rider_Label')">


         <img alt="" src="Images/Find.gif" onClick="SearchOwner('Owner',600,550,'yes','3','1')">
         <a href="#" onClick="OpenLink('PopRid',600,600,'yes','frmEntityDetails.jsp',RiderSeq.value,'ID','Num=1&Type=3')">
          <span id="Rider_Label" style="color :blue;" class="Onlycaps"><%=strSht_RiderFName%> <%=strSht_RiderMName%> <%=strSht_RiderLName%></span>
          </a>

        <input type="hidden"   class="allcaps"
                name="Rider_FN" size="40"
                value="<%=strSht_RiderFName%>">
        <input type="hidden"   class="allcaps"
                name="Rider_MN" size="2"
                value="<%=strSht_RiderMName%>">

        <input type="hidden"   class="allcaps"
                name="Rider_lN" size="40"
                value="<%=strSht_RiderLName%>">

      </td>
    </tr>
    <tr>
      <td colspan="11" > <FIELDSET> <LEGEND>Payment Info</LEGEND>
        <table width="100%" align="center">
          <tr>
            <td>
              <table  style="border-right: thin solid white;" width="90% "cellspacing="0px" cellpadding="3px">
                <tr>
                  <td align="left">
                    <input name="RegType" value="Pre" type="radio"
                   <% if(strRegType.equals("Pre")){%> checked <%}%> onClick="PostAmount(RegType,MemYN,AmountVal)"/>
                    <label>Pre Regisrtaion</label></td>
                  <td align="left">
                    <input name="RegType" value="Spot" type="radio"
                   <% if(strRegType.equals("Spot")){%> checked <%}%> onClick="PostAmount(RegType,MemYN,AmountVal)"/>
                    <label>Regisrtaion</label></td>
                </tr>
                <tr>
                  <td align="left" >
                    <input name="MemYN" value="Member" type="radio"  <% if(strIsMember.equals("Member")){%> checked <%}%>
                   onClick="PostAmount(RegType,MemYN,AmountVal)"/>
                    <label>Member </label></td>
                </tr>
                <tr>
                  <td align="left" >
                    <input name="MemYN" value="NonMember" type="radio" <% if(strIsMember.equals("NonMember")){%> checked <%}%>
                   onClick="PostAmount(RegType,MemYN,AmountVal)"/>
                    <label>Non-Member </label></td>
                </tr>
                <tr>
                  <td align="left" colspan="2"> Total Amount
                    <input type="text" class="allcaps"
                                style="text-align:right" name="AmountVal" size="4" maxlength="15"
                                value="<%=strTotalCharges%>">
                    $ </td>
                </tr>
              </table><td>
            <table width="100% "cellspacing="0px" cellpadding="3px" border="0px">
              <tr>
                <td align="left">

                  <label>Credit Card </label></td>
                <td align="left">

                  <label>ATM</label></td>
                <td align="left">

                  <label >Cheque</label></td>
                <td align="left">

                  <label>Cash</label></td>
                <td align="left">

                  <label >Money Order</label></td>
              </tr>
              <tr>
                <td align="left">
                  <input type="text" name="CCAmount" size="4" maxlength="15"
                      class="allcaps"  style="text-align:right"
                      onBlur="PostTotalAmount(CCAmount,ATMAmount,ChkAmount,CashAmount,MOAmount)"
                      value="<%=strCC%>" >
                </td>
                <td align="left">
                  <input type="text" name="ATMAmount" size="4" maxlength="15"
                      class="allcaps"  style="text-align:right"
                      onBlur="PostTotalAmount(CCAmount,ATMAmount,ChkAmount,CashAmount,MOAmount)"
                      value="<%=strATM%>">
                </td>
                <td align="left">
                  <input type="text" name="ChkAmount" size="4" maxlength="15"
                      class="allcaps"  style="text-align:right"
                      onBlur="PostTotalAmount(CCAmount,ATMAmount,ChkAmount,CashAmount,MOAmount)"
                       value="<%=strCheck%>">
                </td>
                <td align="left">
                  <input type="text" name="CashAmount" size="4" maxlength="15"
                      class="allcaps"  style="text-align:right"
                      onBlur="PostTotalAmount(CCAmount,ATMAmount,ChkAmount,CashAmount,MOAmount)"
                     value="<%=strCash%>">
                </td></td>
              <td align="left" >
                <input type="text" name="MOAmount" size="4" maxlength="15"
                      class="allcaps" style="text-align:right"
                      onBlur="PostTotalAmount(CCAmount,ATMAmount,ChkAmount,CashAmount,MOAmount)"
                      value="<%=strMO%>">
              </td>
              </tr>
              <tr>
                <td align="left" colspan="2">Total Paid <br>
                  <input type="text" name="TotalPaid" size="4" maxlength="15"
                      class="allcaps"  style="text-align:right"
                      value="<%=strPaidAmt%>">
                </td>
                <td align="left"  colspan="2">Balance Amt<br>
                  <input type="text" name="Balance" size="4" maxlength="15" class="allcaps"
                          style="text-align:right"
                          value="<%=strBalanceAmt%>">
                </td>
              </tr>
            </table>
        </table>
  </table>

</FIELDSET>

    <br>
    <table width="30%" align="right">
    <tr>
    <td >
    <!--<input class="button" type="button" name="Search" value="Save" onClick="SRSubmit(sire,sireName,dam,damName,'winRegPop','800','500','yes')"> -->
    <input class="button" type="button" name="Search" value="Save" onClick="SRSubmit()">
     <input class="button" type="button" name="Search" value="Reset" onClick="SRReset(EventSeq,EventName)">
      <input class="button" type="button" name="Search" value="Close" onClick="JQueryClose_Short()">
      <input type="hidden" name="PageID" value="SREGISTRAION"/>
    </td>

    </tr>
    </table>
<div id="dialog-CmmnRef" style="display:none; background:url('Images/trans-wood-1.png')" >
<iframe id="modalIFrame_CmmnRef" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
</iframe>
</div>

 <div id="dialog-PlaceOfBirth" style="display:none; background:url('Images/trans-wood-1.png')" >
<iframe id="modalIFrame_PlaceOfBirth" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
</iframe>
</div>



        </form>
    </body>
</html>
