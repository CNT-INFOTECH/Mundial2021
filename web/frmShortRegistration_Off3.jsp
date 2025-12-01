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
       String strMode3="";
       if(request.getParameter("mode")!=null)
           strMode3=request.getParameter("mode");



        String strRegNum3="";
        String strEventSeq3="";


        if(request.getParameter("EventSeq")!=null )
                strEventSeq3=request.getParameter("EventSeq");

         //if(request.getParameter("Reg")!=null)
           //strRegNum=request.getParameter("Reg");

        if(strMode3.equals("1") )
        {
           strRegNum3=request.getParameter("Reg");
        }
    %>

   <%@ include file="frmShortRegistration_Off3_Include.jsp" %>



    <body >
<form>
 <table width="100%" border="0" cellspacing="1" cellpadding="2">
    <tr>
      <td  colspan="11"  class="Grid_Header">MARE 3</td>
    </tr>
    <tr>
    <td width="9%"><font class="label">REG#</font> </td>
    <td width="17%" colspan="2">
      <input type="hidden" name="RegSeq_S3" id="RegSeq_S3" value="<%=strSht_RegSeq3%>">
      <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
               name="RegNum_S3" id="RegNum_S3" size="10" onChange="CheckRegNumExists1(RegNum_S3,'<%=strEventSeq3%>','Mare3')"
               value="<%=strSht_RegNum3%>">
    <img alt="" src="Images/Find.gif" onClick="SearchHorse('PopHrs',600,600,'yes',3,'2','<%=strEventSeq3%>')"/>
    </td>
    <td width="10%"><font class="label">NAME :</font></td>
    <td width="20%" colspan="4">
      <input type="hidden"  name="HorseName_S3" size="2"
        value="<%=strSht_HorseName3%>">
      <a href="#" onClick="OpenLink('PopRegNum',600,600,'yes','frmHrsRegistration.jsp',RegSeq_S3.value,'RegNum','Num=3')" >
      <font size="4" color="blue"><span  class="Onlycaps"><%=strSht_HorseName3%></span></font>
      </a>
    </td>
    <td width="15%"><font class="label">GENDER :</font></td>
    <td> <font size="2" color="blue"> <span  class="Onlycaps"><%=strSht_Gender3%></span></font>
      <input type="hidden" name="HGender3" value='<%=strSht_Gender3%>' size=1>
    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="9%"><font class="label">BIRTH DATE : </font></td>
    <td width="17%"> <font color="blue" size="2" ><span class="OnlyCaps"><%=strSht_DOB3%></span></font>
      &nbsp;&nbsp;&nbsp; AGE:<font color="blue" size="2" ><%=strSht_Age3%></font>
      <input type="hidden"  class="allcaps"
               name="Sreg_HDOB3" id="Sreg_HDOB3" size="1" value="<%=strSht_DOB3%>"

               onChange="getAge_Months(Sreg_HDOB3.value,Sreg_HAGE3)">
      <input type="hidden"  class="allcaps" ReadOnly name="Sreg_HAGE3"  size="1" value="<%=strSht_Age3%>">
    </td>
    <td width="5%"><font class="dateStyleBody">&nbsp;</font></td>
    <td width="10%"><font class="label">COLOR : </font></td>
    <td colspan="4">
      <!--<img alt="" src="Images/dropdown_icon4.gif"    onClick="OpenCommonRef('Color','Color3','Color_Lbl3')"/> -->
      <font color="blue" size="2"><span id="Color_Lbl3" name="Color_Lbl3"><%=strSht_HORSE_COLOR_VAL3%></span></font>
      <input type="hidden"   class="allcaps" value="<%=strSht_COLOR3%>"
            name="color3" id="Color3" size="10"  >
      <input type="hidden"  id="ColorValue3"  class="Onlycaps" value="<%=strSht_HORSE_COLOR_VAL3%>"
            name="colorValue3"  size="15"  >
    </td>
    <td width="15%"><font class="label">PLACE&nbsp;OF&nbsp;BIRTH : </font></td>
    <td>
      <!--<img alt="" src="Images/dropdown_icon4.gif"    onClick="OpenCommonRef('Place','Place3','place_Lbl3')"/> -->
      <font color="blue" size="2"><span id="place_Lbl3" class="Onlycaps"><%=strREGISTRY_PLACE_VAL3%></span></font>
      <input type="hidden"   class="allcaps"
               name="Place3" id="Place3" size="1" value="<%=strSht_POB3%>">
      <input type="hidden"   class="allcaps"
               name="PlaceVal3" id="PlaceVal3" size="15"  value="<%=strREGISTRY_PLACE_VAL3%>">
    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="9%"><font class="label">MICROCHIP#&nbsp;:&nbsp;</font></td>
    <td width="17%"> <font color="blue" size="2"><span  class="Onlycaps"><%=strSht_Chip3%></span></font>
      <input type="hidden" style="background-color:  #FFF8DC; border:  1px solid #000000;"
               name="Mchip_S3" id="Mchip3" size="15"
           value="<%=strSht_Chip3%>">
    </td>
    <td width="5%">&nbsp;</td>
    <td width="10%"><font class="label">ASSOCIATION#&nbsp;:&nbsp;</font></td>
    <td colspan="4">
      <!--<img alt="" src="Images/dropdown_icon4.gif"
                            onClick="OpenCommonRef('ORGANIZATION','AssoNum3','AssoNum_Lbl3')"/>-->
      <font color="blue" size="2"><span id="AssoNum_Lbl3" class="Onlycaps"><%=strORGNAME3.trim()%></span></font>
      <input type="hidden"  class="allcaps"
                name="AssoNum3" id="AssoNum3" size="40"
                value="<%=strSht_Asso3%>">
      <input type="hidden"  class="allcaps"
                name="AssoNum_Value3" id="AssoNum_Value3"  size="15"
                value="<%=strORGNAME3%>">
    </td>
    <td width="15%"><font class="label">MODALITY : </font> </td>
    <td colspan="2"><font color="blue" size="2"><span class="Onlycaps"><%=strSht_Modality3.trim()%></span></font>
      <input type="hidden" name="modality3" value="<%=strSht_Modality3%>" size="1" >
    </td>
  </tr>
  <tr>
    <td width="9%"><font class="label">SIRE</font></td>
    <td colspan="4">
      <input type="hidden" name="sire3" id="sire3" size="10"
                    value="<%=strSht_SireSeq3%>" >
      <input type="text"  class="allcaps" name="sireName3" id="sireName3" size="10"
                      onChange="GetHorseName_ByNum_SD(this.value, 'sire3','sireName3','Name_Label3','2')"
                     onBlur="ClearFields_Shrt('sireName3','sire3','Name_Label3')"
                     value="<%=strSireReg_Num3%>">
      <img alt="" src="Images/Find.gif" onClick="SearchSireDame('PopPed',600,600,'yes','2','3')"/>
      <a href="#" onClick="OpenLink('PopSire',600,600,'yes','frmSHrsRegistration.jsp',sire3.value,'RegNum','Num=3')">
      <span id="Name_Label3" style="color :blue; font-size:12px"  class="Onlycaps"><%=strSht_SireName3%></span></a></td>


    <td width="4%"><font class="label">DAM</font></td>
    <td colspan="4">
      <input type="hidden" name="dam3" id="dam3" size="10"
             value="<%=strSht_DamSeq3%>">
      <input type="text"  class="allcaps" name="damName3" id="damName3" size="10" value="<%=strDamReg_Num3%>"
             onChange="GetHorseName_ByNum_SD(this.value, 'dam3','damName3','Dam_Label3','3')"
            onBlur="ClearFields_Shrt('damName3','dam3','Dam_Label3')" >
      <img alt="" src="Images/Find.gif" onClick="SearchSireDame('PopPed',600,600,'yes','3','3')">
      <a href="#" onClick="OpenLink('PopDam',600,600,'yes','frmSHrsRegistration.jsp',dam3.value,'RegNum','Num=3')">
      <span id="Dam_Label3" style="color :blue; font-size:12px"  class="Onlycaps"><%=strSht_DamName3%></span>
      </a> </td>
    <td width="2%">&nbsp;</td>
  </tr>
  <tr>
    <td width="9%"><font class="label">BREEDER#</font></td>
    <td colspan="4">
      <input type="hidden" name="BreederSeq3"  id="BreederSeq3" size="10" value="<%=strSht_BreederSeq3%>">
      <input type="hidden"   class="allcaps"  name="breeder3"  id="breeder3"  size="40"
                value="<%=strSht_BreederFName3%>" >
      <input type="text" name="Breeder_Assigned3"  size="10" class="allcaps" id="Breeder_Assigned3"
                    value="<%=strSht_BreederAssigned3%>"
                    onBlur="GetPersonByAssignedNum_Grp(this.value,'BreederSeq3','Breeder_Assigned3','Breeder_Label3')">

      <img src="Images/Find.gif" onClick="SearchOwner('Owner',600,600,'yes','2','23')">
       <a href="#" onClick="OpenLink('PopBreed',600,600,'yes','frmEntityDetails.jsp',BreederSeq3.value,'ID','Type=2&Num=23')">
      <span id="Breeder_Label3" style="color :blue; font-size:12px"  class="Onlycaps"><%=strSht_BreederFName3%></span></a>
    </td>
    <td width="4%"><font class="label">EXHIBITOR</font></td>
    <td width="15%" colspan="5">
      <input type="text" name="Rider_Assigned3" size="10" class="allcaps" id="Rider_Assigned3"
                    value="<%=strSht_RiderAssinged3%>" onBlur="GetPersonByAssignedNum(this.value,'RiderSeq3','Rider_Assigned3','Rider_Label3')">
      <img alt="" src="Images/Find.gif" onClick="SearchOwner('Owner',600,600,'yes','3','23')" >
      <a href="#" onClick="OpenLink('PopBreed',600,600,'yes','frmEntityDetails.jsp',RiderSeq3.value,'ID','Type=3&Num=23')">
      <span id="Rider_Label3" style="color :blue; font-size:12px"  class="Onlycaps"><%=strSht_RiderFName3%></span></a>
      <input type="hidden" name="RiderSeq3"  id="RiderSeq3" size="10"
                    value="<%=strSht_RiderSeq3%>" >
      <input type="hidden"   class="allcaps"
                name="Rider_FN3" size="40"
                 value="<%=strSht_RiderFName3%>">
    </td>
  </tr>

</table>

      <table width="100%" cellspacing="0px" cellpadding="3px" border="0px">

        <tr>
         <td colspan="9">
        <input type="hidden" name="OwnerSeq3"  size="10"
                    value="<%=strSht_OwnerSeq3%>">
        <input type="hidden"  class="allcaps" name="owner3" id="owner3" size="40"
            value="<%=strSht_OwnerFName3%>">
        <input type="hidden"  class="allcaps" name="Mowner" id="Mowner3" size=""
            value="<%=strSht_OwnerMName3%>">
        <input type="hidden"  class="allcaps" name="Lowner" id="Lowner3" size="40"
            value="<%=strSht_OwnerLName3%>">

      </td>
        </tr>
      </table>


</form>
    </body>
</html>

