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
       String strMode2="";
       if(request.getParameter("mode")!=null)
           strMode2=request.getParameter("mode");



        String strRegNum2="";
        String strEventSeq2="";

        if(request.getParameter("EventSeq")!=null )
                strEventSeq2=request.getParameter("EventSeq");

        if(strMode2.equals("1") )
        {
           strRegNum2=request.getParameter("Reg");
        }
    %>

   <%@ include file="frmShortRegistration_Off2_Include.jsp" %>



    <body >

  <table width="100%" border="0" cellspacing="1" cellpadding="2">
  <tr>
    <td colspan="11" class="Grid_Header">MARE 2</td>
  </tr>
  <tr>
    <td width="9%"><font class="label">REG#</font> </td>
    <td width="17%" colspan="2">
      <input type="hidden" name="RegSeq_S2" id="RegSeq_S2" value="<%=strSht_RegSeq2%>">
      <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
               name="RegNum_S2" id="RegNum_S2" size="10" onChange="CheckRegNumExists1(RegNum_S2,'<%=strEventSeq2%>','Mare2')"
               value="<%=strSht_RegNum2%>">
    <img alt="" src="Images/Find.gif" onClick="SearchHorse('PopHrs',600,600,'yes',2,'2','<%=strEventSeq2%>')"/>
    </td>
    <td width="10%"><font class="label">NAME :</font></td>
    <td width="20%" colspan="4">
      <input type="hidden"  name="HorseName_S2" size="2"
        value="<%=strSht_HorseName2%>">
      <a href="#" onClick="OpenLink('PopRegNum',600,600,'yes','frmHrsRegistration.jsp',RegSeq_S2.value,'RegNum','Num=2')" >
      <font size="4" color="blue"><span  class="Onlycaps"><%=strSht_HorseName2%></span></font>
      </a>
    </td>
    <td width="15%"><font class="label">GENDER :</font></td>
    <td> <font size="2" color="blue"> <span  class="Onlycaps"><%=strSht_Gender2%></span></font>
      <input type="hidden" name="HGender2" value='<%=strSht_Gender2%>' size=1>
    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="9%"><font class="label">BIRTH DATE : </font></td>
    <td width="17%"> <font color="blue" size="2" ><span class="OnlyCaps"><%=strSht_DOB2%></span></font>
       &nbsp;&nbsp;&nbsp; AGE:<font color="blue" size="2" > <%=strSht_Age2%></font>
      <input type="hidden"  class="allcaps"
               name="Sreg_HDOB2" id="Sreg_HDOB2" size="1" value="<%=strSht_DOB2%>"

               onChange="getAge_Months(Sreg_HDOB2.value,Sreg_HAGE2)">
      <input type="hidden"  class="allcaps" ReadOnly name="Sreg_HAGE2"  size="1" value="<%=strSht_Age2%>">
    </td>
    <td width="5%"><font class="dateStyleBody">&nbsp;</font></td>
    <td width="10%"><font class="label">COLOR : </font></td>
    <td colspan="4">
      <!--<img alt="" src="Images/dropdown_icon4.gif"    onClick="OpenCommonRef('Color','Color2','Color_Lbl2')"/> -->
      <font color="blue" size="2"><span id="Color_Lbl2" valign="top" name="Color_Lbl2"><%=strSht_HORSE_COLOR_VAL2%></span></font>
      <input type="hidden"   class="allcaps" value="<%=strSht_COLOR2%>"
            name="color2" id="Color2" size="10"  >
      <input type="hidden"  id="ColorValue2"  class="Onlycaps" value="<%=strSht_HORSE_COLOR_VAL2%>"
            name="colorValue2"  size="15"  >
    </td>
    <td width="15%"><font class="label">PLACE&nbsp;OF&nbsp;BIRTH : </font></td>
    <td>
      <!--<img alt="" src="Images/dropdown_icon4.gif"    onClick="OpenCommonRef('Place','Place2','place_Lbl2')"/> -->
      <font color="blue" size="2"><span id="place_Lbl2" class="Onlycaps"><%=strREGISTRY_PLACE_VAL2%></span></font>
      <input type="hidden"   class="allcaps"
               name="Place2" id="Place2" size="1" value="<%=strSht_POB2%>">
      <input type="hidden"   class="allcaps"
               name="PlaceVal2" id="PlaceVal2" size="15"  value="<%=strREGISTRY_PLACE_VAL2%>">
    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="9%"><font class="label">MICROCHIP#&nbsp;:&nbsp;</font></td>
    <td width="17%"> <font color="blue" size="2"><span  class="Onlycaps"><%=strSht_Chip2%></span></font>
      <input type="hidden" style="background-color:  #FFF8DC; border:  1px solid #000000;"
               name="Mchip_S2" id="Mchip2" size="15"
           value="<%=strSht_Chip2%>">
    </td>
    <td width="5%">&nbsp;</td>
    <td width="10%"><font class="label">ASSOCIATION#&nbsp;:&nbsp;</font></td>
    <td colspan="4">
      <!--<img alt="" src="Images/dropdown_icon4.gif"
                            onClick="OpenCommonRef('ORGANIZATION','AssoNum2','AssoNum_Lbl2')"/>-->
      <font color="blue" size="2"><span id="AssoNum_Lbl2" class="Onlycaps"><%=strORGNAME2.trim()%></span></font>
      <input type="hidden"  class="allcaps"
                name="AssoNum2" id="AssoNum2" size="40"
                value="<%=strSht_Asso2%>">
      <input type="hidden"  class="allcaps"
                name="AssoNum_Value2" id="AssoNum_Value2"  size="15"
                value="<%=strORGNAME2%>">
    </td>
    <td width="15%"><font class="label">MODALITY : </font> </td>
    <td colspan="2"><font color="blue" size="2"><span class="Onlycaps"><%=strSht_Modality2.trim()%></span></font>
      <input type="hidden" name="modality2" value="<%=strSht_Modality2%>" size="1" >
    </td>
  </tr>
  <tr>
    <td width="9%"><font class="label">SIRE</font></td>
    <td colspan="4">
      <input type="hidden" name="sire2" id="sire2" size="10"
                    value="<%=strSht_SireSeq2%>" >
      <input type="text"  class="allcaps" name="sireName2" id="sireName2" size="10"
                      onChange="GetHorseName_ByNum_SD(this.value, 'sire2','sireName2','Name_Label2','2')"
                     onBlur="ClearFields_Shrt('sireName2','sire2','Name_Label2')"
                     value="<%=strSireReg_Num2%>">
      <img alt="" src="Images/Find.gif" onClick="SearchSireDame('PopPed',600,600,'yes','2','2')"/>
      <a href="#" onClick="OpenLink('PopSire',600,600,'yes','frmSHrsRegistration.jsp',sire2.value,'RegNum','Num=2')">
      <span id="Name_Label2" style="color :blue; font-size:12px"  class="Onlycaps"><%=strSht_SireName2%></span></a></td>
    <td width="4%"><font class="label">DAM</font></td>
    <td colspan="4">
      <input type="hidden" name="dam2" id="dam2" size="10"
             value="<%=strSht_DamSeq2%>">
      <input type="text"  class="allcaps" name="damName2" id="damName2" size="10" value="<%=strDamReg_Num2%>"
             onChange="GetHorseName_ByNum_SD(this.value, 'dam2','damName2','Dam_Label2','3')"
            onBlur="ClearFields_Shrt('damName2','dam2','Dam_Label2')" >
      <img alt="" src="Images/Find.gif" onClick="SearchSireDame('PopPed',600,600,'yes','3','2')">
      <a href="#" onClick="OpenLink('PopDam',600,600,'yes','frmSHrsRegistration.jsp',dam2.value,'RegNum','Num=2')">
      <span id="Dam_Label2" style="color :blue; font-size:12px"  class="Onlycaps"><%=strSht_DamName2%></span>
      </a> </td>
    <td width="2%">&nbsp;</td>
  </tr>
  <tr>
    <td width="9%"><font class="label">BREEDER#</font></td>
    <td colspan="4">
      <input type="hidden" name="BreederSeq2"  id="BreederSeq2" size="10" value="<%=strSht_BreederSeq2%>">
      <input type="hidden"   class="allcaps"  name="breeder2"  id="breeder2"  size="40"
                value="<%=strSht_BreederFName2%>" >
      <input type="text" name="Breeder_Assigned2"  size="10" class="allcaps" id="Breeder_Assigned2"
                    value="<%=strSht_BreederAssignedNum2%>" onBlur="GetPersonByAssignedNum_Grp(this.value,'BreederSeq2','Breeder_Assigned2','Breeder_Label2')">
      <img src="Images/Find.gif" onClick="SearchOwner('Owner',600,600,'yes','2','22')">
      <a href="#" onClick="OpenLink('PopBreed',600,600,'yes','frmEntityDetails.jsp',BreederSeq2.value,'ID','Type=2&Num=22')">
      <span id="Breeder_Label2" style="color :blue; font-size:12px"  class="Onlycaps"><%=strSht_BreederFName2%></span></a>
    </td>
    <td width="4%"><font class="label">EXHIBITOR</font></td>
    <td width="15%" colspan="5">
      <input type="text" name="Rider_Assigned2" size="10" class="allcaps" id="Rider_Assigned2"
                    value="<%=strSht_RiderAssignedNum2%>" onBlur="GetPersonByAssignedNum(this.value,'RiderSeq2','Rider_Assigned2','Rider_Label2')">
      <img alt="" src="Images/Find.gif" onClick="SearchOwner('Owner',600,600,'yes','3','22')" >
      <a href="#" onClick="OpenLink('PopBreed',600,600,'yes','frmEntityDetails.jsp',RiderSeq2.value,'ID','Type=3&Num=22')">
      <span id="Rider_Label2" style="color :blue; font-size:12px"  class="Onlycaps"><%=strSht_RiderFName2%></span></a>
      <input type="hidden" name="RiderSeq2"  id="RiderSeq2" size="10"
                    value="<%=strSht_RiderSeq2%>" >
      <input type="hidden"   class="allcaps"
                name="Rider_FN2" size="40"
                 value="<%=strSht_RiderFName2%>">
    </td>
  </tr>

</table>

      <table width="100%" cellspacing="0px" cellpadding="3px" border="0px">

        <tr>
         <td colspan="9">
        <input type="hidden" name="OwnerSeq"  size="10"
                    value="<%=strSht_OwnerSeq2%>">
        <input type="hidden"  class="allcaps" name="owner" id="owner" size="40"
            value="<%=strSht_OwnerFName2%>">
        <input type="hidden"  class="allcaps" name="Mowner" id="Mowner" size=""
            value="<%=strSht_OwnerMName2%>">
        <input type="hidden"  class="allcaps" name="Lowner" id="Lowner" size="40"
            value="<%=strSht_OwnerLName2%>">

      </td>
        </tr>
      </table>



    </body>
</html>
