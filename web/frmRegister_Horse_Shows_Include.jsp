<%--
    Document   : frmRegister
    Created on : May 26, 2011, 11:11:45 PM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="beans.SRegistrationBean" %>
<jsp:useBean id="RegDetails" class="beans.SRegistrationBean" scope="session" />
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
    <%
        String strMode="";
        if (request.getParameter("mode")!=null){
            strMode=request.getParameter("mode");
         if(strMode.equals("Rset")) {
                if(session.getAttribute("RegDetails")!=null)
                 session.removeAttribute("RegDetails");
            }
        }
    %>

    <body>
 <form>


  <table width="100%" class="altRow">
    <tr>
      <td width="96"><font class="label">NAME</font></td>
      <td nowrap colspan="12" >
        <input type="hidden" name="RegSeq" id="RegSeq"
            value="<% if(RegDetails.getRegSeq()!=null){ out.println( RegDetails.getRegSeq()); }%>">
        <input type="text"  name="HorseName" size="80"
        class="allcaps"
         value="<% if(RegDetails.getHorseName()!=null){ out.println( RegDetails.getHorseName()); }%>">
      </td>
    </tr>
    <tr>
      <td width="96"><font class="label">REG#</font></td>
      <td width="85">
        <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
               name="RegNum" id="RegNum" size="15" onChange="CheckRegNumExists(RegNum)"
               value="<% if(RegDetails.getRegNum()!=null){ out.println( RegDetails.getRegNum()); }%>">
      </td>
      <td width="106"><font class="label">GENDER</font></td>
      <td width="62">
        <Select  style="background-color:  #FFF8DC; border:  1px solid #000000;" name="HGender" >
          <option value="">Select</option>
          <% String[] strGendOption={"MALE","FEMALE","GELDING"};
           for(int gen=0;gen <strGendOption.length;gen++)
            {
                if((RegDetails.getHGender()!=null) && strGendOption[gen].equals(RegDetails.getHGender()))
                { %>
                <option selected><%=RegDetails.getHGender()%></option>
                <% }
                else{%>
                <option><%=strGendOption[gen]%></option>
            <%}
            }%>
        </Select>
      </td>
      <td width="123"><font class="label">PLACE&nbsp;OF&nbsp;BIRTH</font></td>
      <td colspan="2" width="827">
        <input type="text"   class="allcaps"
               name="Place" id="Place" size="10"
               value="<% if(RegDetails.getPlace()!=null){ out.println( RegDetails.getPlace()); }%>">
        <font class="label"> </font> </td>
    </tr>
    <tr>
      <td width="96"><font class="label">BIRTH DATE</font></td>
      <td width="85">
        <input type="text"  class="allcaps"
               name="HDOB" id="datepicker" size="6"
               value="<% if(RegDetails.getHDOB()!=null){ out.println( RegDetails.getHDOB()); }%>"
               >
      </td>
      <td width="106"><font class="label">COLOR</font></td>
      <td width="62"><font class="label">
        <input type="text"   class="allcaps"
            name="color" size="10"
            value="<% if(RegDetails.getColor()!=null){ out.println( RegDetails.getColor()); }%>">
        </font></td>
      <td width="123"><font class="label">MODALITY</font></td>
      <td colspan="2" width="827">
        <select  style="background-color:  #FFF8DC; border:  1px solid #000000;"
                 name="modality" value="<% if(RegDetails.getModality()!=null){ out.println( RegDetails.getModality()); }%>">
          <option value="">Select</option>
          <% String[] strModOption={"PASOFINO","TROCHA","TROCHA Y GALOPE","TROTE Y GALOPE"};
           for(int mod=0;mod <strModOption.length;mod++)
            {
                       if((RegDetails.getModality()!=null) && strModOption[mod].equals(RegDetails.getModality()))
                        { %>
                            <option selected><%=RegDetails.getModality()%></option>
                        <% }
                     else{%>
          <option><%=strModOption[mod]%></option>
          <% }
            }%>
        </select>
      </td>
    </tr>
    <tr>
      <td width="96"><font class="label">MICROCHIP#</font></td>
      <td width="85">
        <input type="text" style="background-color:  #FFF8DC; border:  1px solid #000000;" name="Mchip" id="Mchip" size="15"
            value="<% if(RegDetails.getMchip()!=null){ out.println( RegDetails.getMchip()); }%>">
      </td>
      <td width="106"><font class="label">ASSOCIATION</font></td>
      <td colspan="4">
        <input type="text"  class="allcaps"
                name="AssoNum" size="40"
                value="<% if(RegDetails.getAssoNum()!=null){ out.println( RegDetails.getAssoNum()); }%>">
      </td>
    </tr>
    <tr>
      <td width="96"><font class="label">BREEDER</font></td>
      <td colspan="6">
        <input type="hidden" name="BreederSeq" size="10"
                    value="<% if(RegDetails.getBreederSeq()!=null){ out.println( RegDetails.getBreederSeq()); }%>" >
        <input type="text"   class="allcaps"
                name="breeder" size="80"
                value="<% if(RegDetails.getBreeder()!=null){ out.println( RegDetails.getBreeder()); }%>">
        <img src="Images/Find.gif" onClick="SearchOwner('Owner',600,600,'yes','2')">
      </td>
    </tr>
    <tr>
      <td width="96"><font class="label">SIRE</font></td>
      <td colspan="6">
        <input type="hidden" name="sire" id="sire" size="10"
                    value="<% if(RegDetails.getSire()!=null){ out.println( RegDetails.getSire()); }%>" >
        <input type="text"  class="allcaps" name="sireName" id="sireName" size="80"
                    value="<% if(RegDetails.getSireName()!=null){ out.println( RegDetails.getSireName()); }%>" >
        <img src="Images/Find.gif" onClick="SearchSireDame('PopPed',600,600,'yes','2')">
      </td>
    </tr>
    <tr>
      <td width="96"><font class="label">DAM</font></td>
      <td colspan="6">
        <input type="hidden" name="dam" id="dam" size="10"
            value="<% if(RegDetails.getDam()!=null){ out.println( RegDetails.getDam()); }%>" >
        <input type="text"  class="allcaps" name="damName" id="damName" size="80"
            value="<% if(RegDetails.getDamName()!=null){ out.println( RegDetails.getDamName()); }%>" >
        <img src="Images/Find.gif" onClick="SearchSireDame('PopPed',600,600,'yes','3')">
      </td>
    </tr>
    <tr>
      <td width="96"><font class="label">OWNER</font></td>
      <td colspan="6">
        <input type="hidden" name="OwnerSeq"  size="10"
                    value="<% if(RegDetails.getOwnerSeq()!=null){ out.println( RegDetails.getOwnerSeq()); }%>" >
        <input type="text"  class="allcaps" name="owner" id="owner" size="80"
            value="<% if(RegDetails.getOwner()!=null){ out.println( RegDetails.getOwner()); }%>">
        <img src="Images/Find.gif" onClick="SearchOwner('Owner',600,600,'yes','1')">
      </td>
    </tr>
  </table>
    <br>
    <table width="30%" align="right">
    <tr>
    <td >
    <input class="button" type="button" name="Search" value="Save" onClick="SRSubmit(sire,sireName,dam,damName,'winRegPop','800','500','yes')">
     <input class="button" type="button" name="Search" value="Reset" onClick="SRReset()">
      <input class="button" type="button" name="Search" value="Close" onClick="parent.PopWin.hide()" >
      <input type="hidden" name="PageID" value="SREGISTRAION"/>
    </td>

    </tr>
    </table>

        </form>
    </body>
</html>
