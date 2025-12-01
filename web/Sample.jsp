<%-- 
    Document   : Sample
    Created on : Jul 14, 2011, 11:44:27 PM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

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
    <body>
       
       <table width="100%" border="0" cellspacing="1" cellpadding="2">
    <tr>
      <td colspan="7" class="Grid_Header">MARE 2</td>
    </tr>
    <tr>
      <td width="9%"><font class="label">REG#</font> </td>
      <td width="7%">
        <input type="text" name="RegSeq_S2" id="RegSeq_S2" value="<%=strSht_RegSeq2%>">
        <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
               name="RegNum_S2" id="RegNum_S2" size="15" onChange="CheckRegNumExists2(RegNum_S2)"
               value="<%=strSht_RegNum2%>">
        </td>
      <td width="7%">
        <img src="Images/Find.gif" onClick="SearchHorse('PopHrs',600,600,'yes',2)"/>
      </td>
      <td width="4%"><font class="label">NAME</font> </td>
      <td width="34%">
        <input type="text"  name="HorseName_S2" size="40" class="allcaps"
        value="<%=strSht_HorseName2%>">
      </td>
      <td width="5%"><font class="label">GENDER</font></td>
      <td width="41%">
        <select  style="background-color:  #FFF8DC; border:  1px solid #000000;" name="HGender2" >
          <option value="">Select</option>
          <% String[] strGendOption2={"MALE","FEMALE","GELDING"};
           for(int gen=0;gen <strGendOption2.length;gen++)
            {
                if(strGendOption2[gen].equalsIgnoreCase(strSht_Gender2))
                { %>
          <option selected><%=strSht_Gender2%></option>
          <% }
                else{%>
          <option><%=strGendOption2[gen]%></option>
          <%}
            }%>
        </select>
      </td>
    </tr>
  </table>

   <table width="100%" border="0" cellspacing="1" cellpadding="2">
    <tr>
      <td width="8%"><font class="label">BIRTH DATE</font> </td>
      <td width="3%">
        <input type="text"  class="allcaps"
               name="Sreg_HDOB2" id="Sreg_HDOB2" size="6" value="<%=strSht_DOB2%>"

               onChange="getAge_Months(Sreg_HDOB.value,Sreg_HAGE)">
      </td>
      <td width="1%">
        <input type="text"  class="allcaps" ReadOnly name="Sreg_HAGE2"  size="1" value="<%=strSht_Age2%>">
      </td>
      <td width="6%"><font class="dateStyleBody">MONTHS</font></td>
      <td width="8%"><font class="label">COLOR</font><font class="label"></font></td>
      <td width="7%">
        <input type="hidden"   class="allcaps" value="<%=strSht_COLOR2%>"
            name="color2" id="Color2" size="10"  >
        <input type="text"  id="ColorValue2"  class="allcaps" value="<%=strSht_HORSE_COLOR_VAL2%>"
            name="colorValue2"  size="15"  >
      </td>
      <td width="3%"><font class="label"><img alt="" src="Images/dropdown_icon4.gif"
                            onClick="OpenCommonRef('Color','Color2','ColorValue2')"/></font></td>
      <td width="10%"><font class="label">PLACE&nbsp;OF&nbsp;BIRTH</font></td>
      <td width="7%">
        <input type="hidden"   class="allcaps"
               name="Place2" id="Place2" size="1" value="<%=strSht_POB2%>">
        <input type="text"   class="allcaps"
               name="PlaceVal2" id="PlaceVal2" size="15"  value="<%=strREGISTRY_PLACE_VAL2%>">
      </td>
      <td width="47%"><img alt="" src="Images/dropdown_icon4.gif"
                            onClick="OpenCommonRef('Place','Place2','PlaceVal2')"/></td>
    </tr>
    <tr>
      <td width="8%"><font class="label">MICROCHIP#</font></td>
      <td colspan="3">
        <input type="text" style="background-color:  #FFF8DC; border:  1px solid #000000;"
               name="Mchip_S2" id="Mchip2" size="15"
           value="<%=strSht_Chip2%>">
      </td>
      <td width="8%"><font class="label">ASSOCIATION</font></td>
      <td width="7%"><font class="label">
        <input type="hidden"  class="allcaps"
                name="AssoNum2" id="AssoNum2" size="40"
                value="<%=strSht_Asso2%>">
        <input type="text"  class="allcaps"
                name="AssoNum_Value2" id="AssoNum_Value2"  size="15"
                value="<%=strORGNAME2%>">
        </font></td>
      <td width="3%"><font class="label"><img alt="" src="Images/dropdown_icon4.gif"
                            onClick="OpenCommonRef('ORGANIZATION','AssoNum2','AssoNum_Value2')"/></font></td>
      <td width="10%"><font class="label">MODALITY</font></td>
      <td colspan="2">
        <select  style="background-color:  #FFF8DC; border:  1px solid #000000;"
                 name="modality2" >
          <option value="">Select</option>
          <% String[] strModOption2={"PASOFINO","TROCHA","TROCHA Y GALOPE","TROTE Y GALOPE"};
           for(int mod=0;mod <strModOption2.length;mod++)
            {
                if( strModOption2[mod].equalsIgnoreCase(strSht_Modality2))
                        { %>
          <option selected><%=strSht_Modality2%></option>
          <% }
                     else{%>
          <option><%=strModOption2[mod]%></option>
          <% }
            }%>
        </select>
      </td>
    </tr>
  </table>

  <table width="100%" border="0" cellspacing="1" cellpadding="2">
    <tr>
      <td width="8%"><font class="label">SIRE</font></td>
      <td width="40%">
        <input type="hidden" name="sire2" id="sire2" size="10"
                    value="<%=strSht_SireSeq2%>" >
        <input type="text"  class="allcaps" name="sireName2" id="sireName2" size="40"
                     onChange="chkforSire(sire2,sireName2,'800','500','yes')"
                     value="<%=strSht_SireName2%>">
        <img alt="" src="Images/Find.gif" onClick="SearchSireDame('PopPed',600,600,'yes','2','2')"/></td>
      <td width="5%"><font class="label">DAM</font></td>
      <td width="49%">
        <input type="hidden" name="dam2" id="dam2" size="10"
             value="<%=strSht_DamSeq2%>">
        <input type="text"  class="allcaps" name="damName2" id="damName2" size="40"
             onChange="chkforDam(dam2,damName2,'800','500','yes')"
                          value="<%=strSht_DamName2%>">

        <img alt="" src="Images/Find.gif" onClick="SearchSireDame('PopPed',600,600,'yes','3','2')">
      </td>
    </tr>
  </table>

   <table width="100%" border="0" cellspacing="1" cellpadding="2">
    <tr>
      <td width="5%"><font class="label">BREEDER</font></td>
      <td width="14%">
        <input type="hidden" name="BreederSeq2" id="BreederSeq2" size="10" value="<%=strSht_BreederSeq2%>">
        <input type="text"   class="allcaps"    id="breeder2"           name="breeder2" size="20"
                value="<%=strSht_BreederFName2%>" >
      </td>
      <td width="1%">
        <input type="text"   class="allcaps"
                name="Mbreeder2" size="1"
               value="<%=strSht_BreederMName2%>">
      </td>
      <td width="18%">
        <input type="text"   class="allcaps"
                name="Lbreeder2" size="20"
               value="<%=strSht_BreederLName2%>">
      </td>
      <td width="2%"><img src="Images/Find.gif" onClick="SearchOwner('Owner',600,600,'yes','2','2')"></td>
      <td width="3%"><font class="label">RIDER</font></td>
      <td width="19%">
        <input type="hidden" name="RiderSeq2" id="RiderSeq2" size="10"
                    >
        <input type="text"   class="allcaps" id="Rider_FN2"
                name="Rider_FN2" size="20"
                >
      </td>
      <td width="2%">
        <input type="text"   class="allcaps"
                name="Rider_MN2" size="1"
                >
      </td>
      <td width="12%">
        <input type="text"   class="allcaps"
                name="Rider_lN2" size="20"
                >
      </td>
      <td width="24%"><img alt="" src="Images/Find.gif" onClick='GetRiderInfo("frmListRider.jsp?Num=2",event.screenX,event.screenY)' ></td>
    </tr>
  </table>

    </body>
</html>
