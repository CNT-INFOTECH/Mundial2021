<%--
    Document   : frmRegister
    Created on : May 26, 2011, 11:11:45 PM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>
<%@ page import="beans.PersonBean" %>
<%@ taglib uri="/WEB-INF/tlds/Reference.tld" prefix="Reference"%> 
<jsp:useBean id="personbean" class="beans.PersonBean" scope="session" />
<html>
     <title>PASO TRACKER</title>
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
 <script type="text/javascript" src="jscCommon.js"></script>
 </head>
	<body>
	<form name="frmRider">

<%
            Connection localConnection=null;
            DbConnMngr dbcmt=new DbConnMngr();
    String strEventSeq=request.getParameter("EventSeq");
    String strEventDate="01/01/2001";
     String strEventGender="";
%>
 <%@ include file="frmYouthRider_Include.jsp"%>

 <table width="100%" border="0" cellspacing="1" cellpadding="2" >
    <th colspan="10" class="Grid_Header" >RIDER INFORMATION&nbsp;&nbsp;
        <% if (!strGroupSeq_S.equals("0")){%>
    <img alt="" src="Images/Registered.jpg"/> <% }%>

    </th>
      <tr>
          <td nowrap><font class="label">ID#&nbsp;</font></td>
          <td ><font size="4" color="BLUE"> <%= strAssignedNum.trim()%> </font> </td>

          <td nowrap><font class="label">EVENT ASSIGNED#&nbsp;</font></td>
          <td  colspan="3"><input type="text" size="5" class="allcaps" maxlength="15" name="EvtAssignedNum" value="<%= strEvntAssignedNum.trim()%>"/></td>



      </tr>




<tr>

<td >
<input  type="hidden" name="Person_Type" id="Person_Type"  value="YOUTH RIDER"  class="allcaps"/>
</td>
<td width="40">&nbsp;</td>
<td colspan="3">&nbsp;</td>
</tr>


<tr>

      <td width="78"><font class="label">NAME(F,M,L)</font></td>
      <td >
        <input type="text" size="32" maxlength="80" name="BreederFName"
          class="allcaps"
          value="<%= strFirstName.trim()%>" />
      </td>

      <td colspan="4">
        <input type="text" size="30" maxlength="70" name="BreederLName"
               class="allcaps"
               value="<%= strLastName.trim()%>" />
        <input type="hidden" size="12"  name="BreederMName"
               class="allcaps"
                value="<%= strMidName.trim()%>" />
      </td>
    </tr>
    <tr>
    <td width="78"><font class="label">DOB:</font></td>
      <td >
        <input type="text" size="10" maxlength="10" name="txtDOB"
          class="allcaps" id="Sreg_HDOB"
          value="<%= strDOB.trim()%>" onChange="getAge_Years(Sreg_HDOB.value,txtAGE,'<%=strEventSeq%>')"  />

        <font color="BLUE"><span id="txtAGE"><%= strAge.trim()%></span> As of Event Date </font>


      </td>


      <td colspan="4">
         <font >GENDER</font>
        <select  name="txtGender" style="background-color:  #FFF8DC; border:  1px solid #000000;" class="allcaps" >
           <option value="">Select</option>
          <option <% if(strGender.equalsIgnoreCase("MALE")) { %> Selected <%}%> >MALE</option>
         <option <% if(strGender.equalsIgnoreCase("FEMALE")) { %> Selected <%}%> >FEMALE</option>
        </select>

      </td>
    </tr>
<tr>	 
    <td >
        <font>REPRESENT COUNTRY</font>
    </td>
    <td>
        <select  style="background-color:  #FFF8DC; border:  1px solid #000000;"
                   name="repCountry" id="repCountry" >
              <option value="">Select</option>
              <Reference:CommonTagHandler  strRefType="COUNTRY" screenAttVal="<%=strSht_Country%>"  />
        </select>
    </td>
</tr>


     

    <tr>
      <td width="78"><font class="label">ADDRESS1</font></td>
      <td colspan="2">
        <input type="text" maxlength="50"size="50" name="ADDRESS1" id="ADDRESS1"
              class="allcaps"
                value="<%= strAddress1.trim()%>" />
      </td>
      <td width="40">&nbsp;

      </td>

      <td colspan="3">&nbsp;</td>
    </tr>
   
    <tr>
      <td width="78"  ><font class="label">ADDRESS2</font></td>
      <td colspan="2">
        <input type="text" maxlength="50" size="50" name="ADDRESS2" id="ADDRESS2"
               class="allcaps"
               value="<%= strAddress2.trim()%>"/>
      </td>
       <td width="40">&nbsp;

      </td>
      <td colspan="3">&nbsp;</td>
    </tr>
    
    <tr align="left">
      <td  width="78" align="left" ><font class="label">CITY</font></td>
      <td width="146" >
        <input type="text"  name="CITY"  maxlength="20"  size="20"  id="CITY"
               class="allcaps"
                value="<%= strCity.trim()%>"
                onChange="CityStateZipDetails('CITY','STATE','ZIP','COUNTRY',CITY.value,'CITY')"/>
        <font class="label">STATE</font></td>
      <td width="70">
        <input type="text" name="STATE" maxlength="10" size="7" id="STATE"
                class="allcaps"
               value="<%= strState.trim()%>"
               onChange="CityStateZipDetails('CITY','STATE','ZIP','COUNTRY',STATE.value,'STATE')"/>
      </td>
      <td   width="64" ><font class="label">ZIP</font>
      <td   width="75" >
        <input type="text" maxlength="6" name="ZIP" id="ZIP" size="5"
               style="background-color:  #FFF8DC; border:  1px solid #000000;"
               value="<%= strZip.trim()%>"
               onChange="CityStateZipDetails('CITY','STATE','ZIP','COUNTRY',ZIP.value,'ZIP')" />


      <td   width="100" ><font class="label">COUNTRY</font>
      <td width="148">
        <input type="text" name="COUNTRY" size="5"  id="COUNTRY"
                class="allcaps"
                value="<%= strCountry.trim()%>"/>
      </td>
    </tr>
  
    <tr>
      <td width="78"><font class="label">PHONE</font></td>
      <td width="146" >
        <input type="text" maxlength="20" size="20" name="PHONE" id="PHONE"
               style="background-color:  #FFF8DC; border:  1px solid #000000;"
               value="<%= strPhone.trim()%>" />
     <font class="label">EMAIL</font></td>
            <td colspan="4">
                <input type="text"  size="35" name="EMAIL" id="EMAIL"   value="<%= strEmail.trim()%>"
                       style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;"  />
            </td>
    </tr>
    <tr>
    <td width="96"><font class="label">HREG#</font></td>
      <td colspan="9">
        <input type="hidden" name="RegSeq"  size="10" id="RegSeq"
                    value="<%=strRegSeq%>">
        <input type="text" name="Reg_Num"  size="10" class="allcaps"  id="Reg_Num"
                    value="<%=strRegistration_Num%>"  onblur="GetHorseName_ByNum(this.value, 'RegSeq','Reg_Num','Name_Label','<%=strEventSeq%>')">
          <img src="Images/Find.gif" onClick="SearchHorse('PopHrs',600,600,'yes','1','1','')">
          <span id="Name_Label" style="color :blue;"><%=strHorsePrimaryName%></span>


      </td>
 </tr>
 


         
     <tr>
      <td colspan="11" >

          <FIELDSET> <LEGEND>Payment Info</LEGEND>
        <table width="100%" align="center">
          <tr>
            <td>
              <table  style="border-right: thin solid white;" width="90% "cellspacing="0px" cellpadding="3px">
                <tr>
                  <td align="left">
                    <input name="RegType" value="Pre" type="radio" <% if(PaymentType.equals("Pre")){%> checked <%}%>
                   onClick="PostAmount(RegType,MemYN,AmountVal)"/>
                    <label>Pre Regisrtaion</label></td>
                  <td align="left">
                    <input name="RegType" value="Spot" type="radio" <% if(PaymentType.equals("Spot")){%> checked <%}%>
                     onClick="PostAmount(RegType,MemYN,AmountVal)"/>
                    <label>Regisrtaion</label></td>
                </tr>
                <tr>
                  <td align="left" >
                    <input name="MemYN" value="Member" type="radio"  <% if(MemberYN.equals("Member")){%> checked <%}%>
                   onClick="PostAmount(RegType,MemYN,AmountVal)"/>
                    <label>Member </label></td>
                </tr>
                <tr>
                  <td align="left" >
                    <input name="MemYN" value="NonMember" type="radio" <% if(MemberYN.equals("NonMember")){%> checked <%}%>
                   onClick="PostAmount(RegType,MemYN,AmountVal)"/>
                    <label>Non-Member </label></td>
                </tr>
                <tr>
                  <td align="left" colspan="2"> Total Amount
                    <input type="text" class="allcaps"
                                style="text-align:right" name="AmountVal" size="4" maxlength="15"
                                 value="<%=Charges%>"> $ </td>

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
                       value="<%=CC%>" >
                </td>
                <td align="left">
                  <input type="text" name="ATMAmount" size="4" maxlength="15"
                      class="allcaps"  style="text-align:right"
                      onBlur="PostTotalAmount(CCAmount,ATMAmount,ChkAmount,CashAmount,MOAmount)"
                      value="<%=ATM%>">
                </td>
                <td align="left">
                  <input type="text" name="ChkAmount" size="4" maxlength="15"
                      class="allcaps"  style="text-align:right"
                      onBlur="PostTotalAmount(CCAmount,ATMAmount,ChkAmount,CashAmount,MOAmount)"
                      value="<%=Cheque%>">
                </td>
                <td align="left">
                  <input type="text" name="CashAmount" size="4" maxlength="15"
                      class="allcaps"  style="text-align:right"
                      onBlur="PostTotalAmount(CCAmount,ATMAmount,ChkAmount,CashAmount,MOAmount)"
                      value="<%=Cash%>">
                </td></td>
              <td align="left" >
                <input type="text" name="MOAmount" size="4" maxlength="15"
                      class="allcaps" style="text-align:right"
                      onBlur="PostTotalAmount(CCAmount,ATMAmount,ChkAmount,CashAmount,MOAmount)"
                      value="<%=MO%>">
              </td>
              </tr>
              <tr>
                <td align="left" colspan="2">Total Paid <br>
                  <input type="text" name="TotalPaid" size="4" maxlength="15"
                      class="allcaps"  style="text-align:right"
                      value="<%=TotalPaid%>">
                </td>
                <td align="left"  colspan="2">Balance Amt<br>
                  <input type="text" name="Balance" size="4" maxlength="15" class="allcaps"
                          style="text-align:right"   value="<%=Balance%>">
                </td>
              </tr>
            </table>
        </table>
  </FIELDSET>
          <br>
          <table width="30%" align="right">
    <tr>
      <td colspan="7" align="center">
        <input type="button" id="SaveOwner" class="button" value="Save" onclick="SaveRider()" />
        <input type="button" id="CancelOwner" class="button" value="Close" onclick="JQueryClose_YouthRiders()" />
        <!--<input type="button" id="Reset" class="button" value="Reset" onclick="YouthRider_Reset('<%=strEventSeq%>','')"/>-->


        <input type="hidden" value="PERSON_EVENT_EDIT" name="PageID"/>
        <input type="hidden" size="2" name="HdnEntitySeq" id="HdnEntitySeq"  value="<%=strEntitySeq.trim()%>" >
         <input type="hidden" size="2"  name="GroupSeq_S" id="GroupSeq_S"  value="<%=strGroupSeq_S.trim()%>" >
           <input type="hidden" size="2"  name="EventSeq" id="EventSeq"  value="<%=strEventSeq%>" >



      </td>
    </tr>
  </table>


        </form>
    </body>
</html>
