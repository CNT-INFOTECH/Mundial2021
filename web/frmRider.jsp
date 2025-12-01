<%--
    Document   : frmRegister
    Created on : May 26, 2011, 11:11:45 PM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="beans.SRegistrationBean" %>
<jsp:useBean id="riderbean" class="beans.RiderBean" scope="session" />
<html>
        <head>

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
 <link href="Shows.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="scripts/SRegistraion.js"></script>





    </head>
	<body>
	<form name="frmRider">
    <br><br>
 <%@ include file="frmRiderInclude.jsp"%>
  <table class="altRow">
    <tr>
      <td width="78">NAME<img src="Images/Find.gif" onClick='GetRiderInfo("frmListRider.jsp",event.screenX,event.screenY)' /></td>
      <td colspan="2"><font class="dateStyleBody" align="center">&nbsp;&nbsp;&nbsp;&nbsp;FIRST</font>
        <input type="text" size="32" maxlength="80" name="BreederFName"
          class="allcaps"
          value="<% if(riderbean.getFName()!=null){ out.println(riderbean.getFName()); }%>" />
      </td>
      <td width="64"><font class="dateStyleBody" align="center">MIDDLE</font><br>
        <input type="text" size="4"  name="BreederMName"
               class="allcaps"
                value="<% if(riderbean.getMName()!=null){ out.println(riderbean.getMName()); }%>" />
      </td>
      <td colspan="3"><font class="dateStyleBody" align="center">&nbsp;&nbsp;&nbsp;&nbsp;LAST</font><br>
        <input type="text" size="35" maxlength="80" name="BreederLName"
               class="allcaps"
               value="<% if(riderbean.getLName()!=null){ out.println(riderbean.getLName()); }%>" />
      </td>
    </tr>
    <tr>
      <td width="78"><font class="label">ADDRESS1</font></td>
      <td  colspan="6">
        <input type="text" maxlength="50"size="55" name="ADDRESS1" id="ADDRESS1"
              class="allcaps"
                value="<% if(riderbean.getAddress1()!=null){ out.println(riderbean.getAddress1()); }%>" />
      </td>
    </tr>
    <tr>
      <td width="78"  ><font class="label">ADDRESS2</font></td>
      <td colspan="6">
        <input type="text" maxlength="50" size="55" name="ADDRESS2" id="ADDRESS2"
               class="allcaps"
               value="<% if(riderbean.getAddress2()!=null){ out.println(riderbean.getAddress2()); }%>"/>
      </td>
    </tr>
    <tr align="left">
      <td  width="78" align="left" ><font class="label">CITY</font></td>
      <td width="146" >
        <input type="text"  name="CITY"  maxlength="20" size="13"  id="CITY"
               class="allcaps"
                value="<% if(riderbean.getCity()!=null){ out.println(riderbean.getCity()); }%>"
                onChange="CityStateZipDetails('CITY','STATE','ZIP','COUNTRY',CITY.value,'CITY')"/>
        <font class="label">STATE</font></td>
      <td width="70">
        <input type="text" name="STATE" maxlength="10" size="7" id="STATE"
                class="allcaps"
               value="<% if(riderbean.getState()!=null){ out.println(riderbean.getState()); }%>"
               onChange="CityStateZipDetails('CITY','STATE','ZIP','COUNTRY',STATE.value,'STATE')"/>
      </td>
      <td   width="64" ><font class="label">ZIP</font>
      <td   width="75" >
        <input type="text" maxlength="6" name="ZIP" id="ZIP" size="5"
               style="background-color:  #FFF8DC; border:  1px solid #000000;"
               value="<% if(riderbean.getZip()!=null){ out.println(riderbean.getZip()); }%>"
               onChange="CityStateZipDetails('CITY','STATE','ZIP','COUNTRY',ZIP.value,'ZIP')" />

        
      <td   width="100" ><font class="label">COUNTRY</font>
      <td width="148">
        <input type="text" name="COUNTRY" size="5"  id="COUNTRY"
                class="allcaps"
                value="<% if(riderbean.getCountry()!=null){ out.println(riderbean.getCountry()); }%>"/>
      </td>
    </tr>
    <tr>
      <td width="78"><font class="label">PHONE</font></td>
      <td width="146">
        <input type="text" maxlength="20"  size="20" name="PHONE" id="PHONE"
               style="background-color:  #FFF8DC; border:  1px solid #000000;"
               value="<% if(riderbean.getPhone()!=null){ out.println(riderbean.getPhone()); }%>" />
      </td>
      <td colspan="7" align="right">
        <input type="button" id="SaveOwner" class="button" value="Save" onclick="SaveRider()" />
        <input type="button" id="CancelOwner" class="button" value="Close" onclick="CloseRider(SavedYN)"/>
        <input type="hidden" value="RIDER" name="PageID"/>
        <input type="hidden" name="BreederSeq" id="HdnEntitySeq"
                value="<% if(riderbean.getRegSeq()!=null){ out.println(riderbean.getRegSeq().trim()); }%>" >

         <input type="text" name="EventSeq" id="EventSeq"    value="<%=strREventSeq%>" >
          <input type="text" name="Reg_Num" id="Reg_Num"     value="<%=strRegSeq %>" >
          <input type="text" name="SavedYN"  value="N" >
      </td>
    </tr>
  </table>


        </form>
    </body>
</html>
