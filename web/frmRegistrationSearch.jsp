<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.GeneralServlet" %>  
<html>
<head>
  
<title>REGISTRATION SEARCH</title>
<link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
<link href="Style_Popup.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
<link href="Registration.css" rel="stylesheet" type="text/css" /> 
<script type="text/javascript" src="jquery-1.5.1.js"></script>
<script type="text/javascript" src="external/jquery.bgiframe-2.1.2.js"></script>
<script type="text/javascript" src="ui/jquery.ui.core.js"></script>
<script type="text/javascript" src="ui/jquery.ui.widget.js"></script>
<script type="text/javascript" src="ui/jquery.ui.mouse.js"></script>
<script type="text/javascript" src="ui/jquery.ui.button.js"></script>
<script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="ui/jquery.ui.draggable.js"></script>
<script type="text/javascript" src="ui/jquery.ui.position.js"></script>
<script type="text/javascript" src="ui/jquery.ui.resizable.js"></script>
<script type="text/javascript" src="ui/jquery.ui.dialog.js"></script>
<script type="text/javascript" src="ui/jquery.effects.core.js"></script>
<script type="text/javascript" src="AutoComplete/jquery.autocomplete.js"></script>

<script type="text/javascript" src="js/interface.js"></script>


<script type="text/javascript" src="jscRegistrationSearch.js"></script>  

<script type="text/javascript">

function showAlert()
{
        document.forms[0].HdnViewAll.value='Y';
	document.forms[0].BtnRegistrationSearch.click();
}

function CalculatorPopUp()
{
    $('#dialog-Calculator').dialog({autoOpen: false,height: 280,width: 350, modal: true});
    $('#dialog-Calculator').dialog('open');
    return false;
}
</script>
           

<style type="text/css">
/*
INPUT.Nobutton {
	width : 10ex;
	height :4ex;
	//background-color: #D1EFFF;
	//border-color: #D1EFFF;
	//border-style: solid;
	color: blue;
	cursor:hand;
}*/
.dateStyleBody
{
	font-size: 8px;
	font-family: Verdana, arial, helvetica, sans-serif;
	font-weight: bold;
	FONT-STYLE: italic;
	color: maroon; /* before 7/17/2006 maroon; */
        vertical-align:top;
}

#footer_Bot {
	clear:both;
	text-align:center;
	/*background: #555;
	color:#fff;*/
	height:50px;
	padding:5px;
        bottom: auto;
}

</style>
</head>
  
<body>    
    <form name="frmRegistrationSearch">
	<%@ include file="frmReg_ScreenAttributes.jsp"%>
    <div id="container">
        
    <div id="header">
         <%@ include file="frmHeader.jsp"%>
    </div>
	<%
	if(!bRegistraion)
	response.sendRedirect("login.jsp");
	%>

    <div id="content">
     <%
    String strQry = request.getRequestURI();
    String strDateRegisteredFrom="";
    String strDateRegisteredTo="";
    String strRegistrationNo="";
    String strDOBFrom="";
    String strDOBTo="";
    String strMicroChipNo="";
    String strAgeFrom="";
    String strAgeTo="";
    String strTypeofReg="";
    String strGender="";
    String EmbryoTransfer="";
    String strAño="";
    String DNACertified="";
    String strSire="";
    String strDam="";
    String strModality="";
    String strOwner="";
    String strPedigree="";
    String strBreeder="";
    String strBreederName="";
    String strFeuroDeConcurso="";
    String strStatus="";
    String strHdnRegistrationSeq="";


    String strreg_type="";
    String strhor_gender="";
    String strEmb_Transfer="";
    String strDNA_Certified="";
    String strSireName="";
    String strDamName="";
    String strRegistrationName="";
    String strPedigreeName="";
    String strOwnerName="";
    String strPedigreeSeq="";
    String strSireSeq="";
    String strDamSeq="";
    String strObservationType="";
    String strPlaceSeq="";
    String strPlaceName="";
    String strDDFrom="";
    String strDDTo="";
    String strMode="";
    String strRegistration_Type="";
    String strcaso_num=""; 
    if(request.getParameter("Mode")!=null)
        strMode=request.getParameter("Mode");
    else
        strMode="";
    
    if(strQry.indexOf("frmRegistrationSearchList.jsp") == -1)  // This is for Clear
    {
%>
<%@ include file="frmRegistrationSearch_EmptyAll.jsp" %>
<%
    }


    if(request.getParameter("Registration_Type")!=null)
    strRegistration_Type=request.getParameter("Registration_Type");

    if(request.getParameter("datepickerFrom")!=null)
    strDateRegisteredFrom=request.getParameter("datepickerFrom");

    if(request.getParameter("datepickerTo")!=null)
    strDateRegisteredTo=request.getParameter("datepickerTo");

    if(request.getParameter("regno")!=null)
    strRegistrationNo=request.getParameter("regno");

    if(request.getParameter("DOBFrom")!=null)
    strDOBFrom=request.getParameter("DOBFrom");

    if(request.getParameter("DOBTo")!=null)
    strDOBTo=request.getParameter("DOBTo");

    if(request.getParameter("MicroChipNo")!=null)
    strMicroChipNo=request.getParameter("MicroChipNo");


    if(request.getParameter("AgeFrom")!=null)
    strAgeFrom=request.getParameter("AgeFrom");

    if(request.getParameter("AgeTo")!=null)
    strAgeTo=request.getParameter("AgeTo");

    if(request.getParameter("registrytype")!=null)
    strTypeofReg=request.getParameter("registrytype");

    if(request.getParameter("Horsegender")!=null)
    strGender=request.getParameter("Horsegender");

    if(request.getParameter("Emb_Transfer")!=null)
    EmbryoTransfer=request.getParameter("Emb_Transfer");

    if(request.getParameter("TxtANO")!=null)
    strAño=request.getParameter("TxtANO");

    if(request.getParameter("DNACer")!=null)
    DNACertified=request.getParameter("DNACer");

    if(request.getParameter("TxtSire")!=null)
    strSire=request.getParameter("TxtSire");

    if(request.getParameter("TxtSireSeq")!=null)
    strSireSeq=request.getParameter("TxtSireSeq");

    if(request.getParameter("TxtSireName")!=null)
    strSireName=request.getParameter("TxtSireName");

    if(request.getParameter("TxtDamName")!=null)
    strDamName=request.getParameter("TxtDamName");

    if(request.getParameter("TxtDam")!=null)
    strDam=request.getParameter("TxtDam");

    if(request.getParameter("TxtDamSeq")!=null)
    strDamSeq=request.getParameter("TxtDamSeq");

    if(request.getParameter("modality")!=null)
    strModality=request.getParameter("modality");

    if(request.getParameter("Owner")!=null)
    strOwner=request.getParameter("Owner");

    if(request.getParameter("OwnerName")!=null)
    strOwnerName=request.getParameter("OwnerName");

    if(request.getParameter("InPedigree")!=null)
    strPedigree=request.getParameter("InPedigree");

    if(request.getParameter("InPedigreeSeq")!=null)
    strPedigreeSeq=request.getParameter("InPedigreeSeq");

    if(request.getParameter("InPedigreeName")!=null)
    strPedigreeName=request.getParameter("InPedigreeName");

    if(request.getParameter("Breeder")!=null)
    strBreeder=request.getParameter("Breeder");

    if(request.getParameter("BreederName")!=null)
    strBreederName=request.getParameter("BreederName");

    if(request.getParameter("FeuroDeConcurso")!=null)
    strFeuroDeConcurso=request.getParameter("FeuroDeConcurso");

    if(request.getParameter("Status")!=null)
    strStatus=request.getParameter("Status");

    if(request.getParameter("HdnRegSeq")!=null)
    strHdnRegistrationSeq=request.getParameter("HdnRegSeq");

    if(request.getParameter("HorseName")!=null)
    strRegistrationName=request.getParameter("HorseName");

    //if(request.getParameter("TxtPlaceSeq")!=null)
    //strPlaceSeq=request.getParameter("TxtPlaceSeq");

    if(request.getParameter("TxtPlaceName")!=null)
    strPlaceName=request.getParameter("TxtPlaceName");

    if(request.getParameter("TxtObservationType")!=null)
    strObservationType=request.getParameter("TxtObservationType");
 if(request.getParameter("casodna")!=null)
    strcaso_num=request.getParameter("casodna");


    if(request.getParameter("DODFrom")!=null)
    strDDFrom=request.getParameter("DODFrom");

    if(request.getParameter("DODTo")!=null)
    strDDTo=request.getParameter("DODTo");
	
	if(strGender.equalsIgnoreCase("STALLION/MACHO"))
        strGender="MALE";
    else if(strGender.equalsIgnoreCase("MARE/HEMBRA"))
        strGender="FEMALE";
    else if(strGender.equalsIgnoreCase("GELDING/CASTRADO"))
        strGender="GELDING";

    if(strMode.equals("") )  // This is for Clear
    {
%>
<%@ include file="frmRegistrationSearch_EmptyAll.jsp" %>
<%
    }
    %>
    
         <fieldset> <legend>Registration Search:</legend>
         
            <table class="altRow">                
            <tr>
                         
                <td nowrap >REG# </td>
                <td nowrap colspan="2">
                
            <input type="text"  name="regno" id="regno" 
                     value="<%=strRegistrationNo%>"  onblur="Empty(this)" style="width:250px;background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/>
            
            <input type="hidden" name="HdnRegSeq" id="HdnRegSeq" value="<%=strHdnRegistrationSeq%>"/>


            <img src="Images/Find12.jpg" onClick='RegSearch(),SearchType("HorseReg")' />
            </td>
            
            <td nowrap>HORSE NAME</td>
            <div>
                <td colspan="3" >
                    <input id="HorseName" class="sample" name="HorseName"   value="<%=strRegistrationName%>"  style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
                height: 16px;
                padding-left: 18px;
                width: 320px !important;
                 text-transform: uppercase;" onkeypress="Empty(this)"> <!--onChange="Empty(this),AjaxAutoComplete(this,'HdnRegSeq')"-->

                </td>
            </div>
            </tr>
            <tr>
                 <td nowrap  valign="bottom">DATE REGISTERED</td>
                 <td nowrap colspan=""><font class="dateStyleBody" align="top" >FROM</font>
                  <input type="text" id="datepickerFrom" name="datepickerFrom" size="10" placeholder="mm/dd/yyyy" value="<%=strDateRegisteredFrom%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" />
                 
                 </td>
                 <td>
                    <font class="dateStyleBody" align="top" >TO</font>&nbsp;&nbsp;
                    <input type="text" id="datepickerTo" name="datepickerTo" size="10" placeholder="mm/dd/yyyy" value="<%=strDateRegisteredTo%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/>
                </td>

                <td nowrap colspan="">MICRO CHIP#</td>
                <td>
            <input type="text"  name="MicroChipNo" id="MicroChipNo" size="15" value="<%=strMicroChipNo%>"  style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/>

            </td>
            <td nowrap>AGE</td><td><font class="dateStyleBody" align="top" >FROM</font>
                  <input type="text" id="AgeFrom" name="AgeFrom" size="3" value="<%=strAgeFrom%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/>
                  <font class="dateStyleBody" align="top" >TO</font>
                  <input type="text" id="AgeTo" name="AgeTo" size="3" value="<%=strAgeTo%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/>
                </td>                
            </tr>
            
                <tr>
                    <td nowrap>DATE OF BIRTH</td>
                <td nowrap><font class="dateStyleBody" align="top" >FROM</font>
                  <input type="text" id="DOBFrom" name="DOBFrom" size="10" placeholder="mm/dd/yyyy" value="<%=strDOBFrom%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/>
                </td>
                 <td>
                  <font class="dateStyleBody" align="top" >TO</font>&nbsp;&nbsp;
                  <input type="text" id="DOBTo" name="DOBTo" size="10"  placeholder="mm/dd/yyyy"value="<%=strDOBTo%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/>
                </td>
                    <td colspan="" nowrap>GENDER</td>
              <td colspan="3">
              <select name="Horsegender" id="Horsegender" style="background-color:  #FFF8DC; border:  1px solid #000000;width:110px;text-transform: uppercase;" >
                  <option value=''>Select</option>

                <%
               if(strGender!=null)
               {
                %>
                <option
                    <%
               if (strGender.trim().equals("MALE")) {
                    %> selected <%}%> ><%=male%></option>
                <option
                <% if (strGender.trim().equals("FEMALE")) {
                    %> selected <%}%> ><%=female%></option>
                    <option
                <% if (strGender.trim().equals("GELDING")) {
                    %> selected <%}%> ><%=gelding%></option>

              </select>
                    <%}%>
            FUERA DE CONCURSO
                <select name="FeuroDeConcurso" id="FeuroDeConcurso"  style="background-color:  #FFF8DC; border:  1px solid #000000;width:103px;text-transform: uppercase;" >
                <option value=''>Select</option>
                    <%
                if(strFeuroDeConcurso!=null)
                {%>
                <option
                <% if (strFeuroDeConcurso.trim().equals("ELIGIBLE")) {
                    %> selected <%}%> >ELIGIBLE</option>
                <option
                <% if (strFeuroDeConcurso.trim().equals("RATIFIED")) {
                    %> selected <%}%> >RATIFIED</option>
              </select>
                <%}%>
            </td>
            <!-- commented by erzath 09Jan2012 -->
            <!--<td nowrap>Año</td><td>
                 <input type="text" name="TxtANO"  id="TxtANO" style="background-color:  #FFF8DC; border:  1px solid #000000;width:150px;text-transform: uppercase;" value="<%=strAño%>"/>

              </td>-->

                </tr>

                 <tr>
                    <td nowrap>DEATH DATE</td>
                <td nowrap><font class="dateStyleBody" align="top" >FROM</font>
                  <input type="text" id="DODFrom" name="DODFrom" size="10" placeholder="mm/dd/yyyy"  value="<%=strDDFrom%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/>
                </td>
                 <td>
                  <font class="dateStyleBody" align="top" >TO</font>&nbsp;&nbsp;
                  <input type="text" id="DODTo" name="DODTo" size="10" placeholder="mm/dd/yyyy" value="<%=strDDTo%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/>
                </td>

                <td nowrap>MODALITY</td>
                <td colspan="3">
                <select name="modality" id="modality" style="background-color:  #FFF8DC; border:  1px solid #000000;width:150px;text-transform: uppercase;" >
                    <option value=''>Select</option>
                <%
                if(strModality!=null)
                {%>
                <option
                <% if (strModality.trim().equals("PASOFINO")) {
                    %> selected <%}%> >PASOFINO</option>
                <option
                <% if (strModality.trim().equals("TROCHA")) {
                    %> selected <%}%> >TROCHA</option>
                    <option
                <% if (strModality.trim().equals("TROCHA Y GALOPE")) {
                    %> selected <%}%> >TROCHA Y GALOPE</option>
                <option
                <% if (strModality.trim().equals("TROTE Y GALOPE")) {
                    %> selected <%}%> >TROTE Y GALOPE</option>
              </select>
              <%}%>
            REG STATUS
              <select name="Status" id="Status" style="background-color:  #FFF8DC; border:  1px solid #000000;width:115px;text-transform: uppercase;" >
                  <option value=''>Select</option>
                    <%
                if(strStatus!=null)
                {%>
                <option
                <% if (strStatus.trim().equals("COMPLETED")) {
                    %> selected <%}%> >COMPLETED</option>
                <option
                <% if (strStatus.trim().equals("IN PROGRESS")) {
                    %> selected <%}%> >IN PROGRESS</option>
              </select>
              <%}%>
            </td>
                </tr>
            <tr>
            <td>SIRE</td>
            <td  colspan="2" nowrap>
                <input type="hidden"  name="TxtSire" id="TxtSire"  size="30" value="<%=strSire%>"  style="background-color:  #FFF8DC; border:  1px solid #000000;"/>
                <input type="hidden"  name="TxtSireSeq" id="TxtSireSeq"  size="3" value="<%=strSireSeq%>" 
                style="background-color:  #FFF8DC; border:  1px solid #000000;"/>
                <input type="text"  name="TxtSireName" id="TxtSireName" size="35"
                       <%--onChange="Empty(this),AjaxAutoComplete('TxtSireName','TxtSireSeq')"--%>
                       value="<%=strSireName%>" onChange="Empty(this)" style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
            height: 16px;
            padding-left: 18px;
            width: 230px;text-transform: uppercase;"/>
                <img src="Images/Find12.jpg" id="SireSearch" onClick='RegSireSearch()' />
            </td>

            <td nowrap>DAM</td>
                <td colspan="3" nowrap>
                <input type="hidden"  name="TxtDam" id="TxtDam"  size="25" value="<%=strDam%>"  style="background-color:  #FFF8DC; border:  1px solid #000000;"/>
                <input type="hidden"  name="TxtDamSeq" id="TxtDamSeq"  size="25" value="<%=strDamSeq%>"  style="background-color:  #FFF8DC; border:  1px solid #000000;"/>
                <input type="text"  name="TxtDamName" id="TxtDamName"  size="47"
                      <%--onChange="Empty(this),AjaxAutoComplete('TxtDamName','TxtDamSeq')"--%>
                      value="<%=strDamName%>" onChange="Empty(this)" style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
            height: 16px;
            padding-left: 18px;
            width: 292px !important;text-transform: uppercase;"/>
                <img src="Images/Find12.jpg"  id="DamSearch" onClick='RegDamSearch()' />
            </td>
            </tr>
            
            <tr>
                <td>OWNER</td>
                <td nowrap colspan="2">
                    <input type="hidden"  name="Owner" id="Owner"  size="25" value="<%=strOwner%>"  style="background-color:  #FFF8DC; border:  1px solid #000000;"/>
                    <input type="text"  name="OwnerName" id="OwnerName" size="35"
                 <%--          onblur="Empty(this),AjaxAutoComplete('OwnerName','Owner')" --%>
                value="<%=strOwnerName%>" onChange="Empty(this)" style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
            height: 16px;
            padding-left: 18px;
            width: 230px !important;text-transform: uppercase;"/>
                    <img src="Images/Find12.jpg" onClick='OwnerSearch()'/>
                </td>
                <td nowrap>IN-PEDIGREE</td>
                <td colspan="3">
                    <input type="hidden" name="InPedigree" size="5"id="InPedigree" value="<%=strPedigree%>" style="background-color:  #FFF8DC; border:  1px solid #000000;"   />
                    <input type="text" name="InPedigreeName" size="47" id="InPedigreeName"
                           onblur="Empty(this)" value="<%=strPedigreeName%>" style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
            height: 16px; padding-left: 18px; width: 292px !important;text-transform: uppercase;"/>
                    <input type="hidden" name="InPedigreeSeq" size="5"id="InPedigreeSeq" value="<%=strPedigreeSeq%>" style="background-color:  #FFF8DC; border:  1px solid #000000;"   />
                    <img src="Images/Find12.jpg" onClick='RegSearch(),SearchType("PedigreeReg")' />
            </td>
            </tr>

                <tr>
            <td>BREEDER</td>
            <td  colspan="2" nowrap>
            <input type="hidden"  name="Breeder" id="Breeder" onKeyUp="javascript:this.value=this.value.toUpperCase()" size="28" value="<%=strBreeder%>"  style="background-color:  #FFF8DC; border:  1px solid #000000;"/>
            <input type="text"  name="BreederName" id="BreederName"  size="35"
                   <%--onblur="Empty(this),AjaxAutoComplete('BreederName','Breeder')" --%>
                    value="<%=strBreederName%>" onChange="Empty(this)" style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
            height: 16px;
            padding-left: 18px;
            width: 230px !important;text-transform: uppercase;"/>
            <img src="Images/Find12.jpg" onClick='BreederSearch()' />
            </td>

            

            <td nowrap colspan="4">EMBRYO TRANSFER
                  <select name="Emb_Transfer"  id="Emb_Transfer" style="background-color:  #FFF8DC; border:  1px solid #000000;width:85px;text-transform: uppercase;" >

                      <option value=''>Select</option>
                <%
                if(EmbryoTransfer!=null)
                {%>
                <option
                <% if (EmbryoTransfer.trim().equals("YES")) {
                    %> selected <%}%> >YES</option>
                <option
                <% if (EmbryoTransfer.trim().equals("NO")) {
                    %> selected <%}%> >NO</option>

              </select>
              <%}%>
            &nbsp;&nbsp;&nbsp;&nbsp;DNA CERTIFIED             
            <select name="DNACer" id="DNACer" style="background-color:  #FFF8DC; border:  1px solid #000000;width:120px;text-transform: uppercase;" >
                <option value=''>Select</option>
                <option value="Y">YES</option>
                <option value="N">NO</option>
                <!--<option value="P">IN PROGRESS</option>-->
              </select>
            </td>
            
            
            <%
     if(DNACertified != null && !DNACertified.equals(""))  { %>
        <script language="javascript">
         var select = document.frmRegistrationSearch.DNACer;
            for (var option = 0; option < select.options.length; option++) {
                if (select.options[option].value == '<%= DNACertified.trim() %>') {
                select.selectedIndex = option;
                break;   }   }
        </script>
            <%}%>            
                </tr>
            <tr>
                 <td  nowrap colspan="2">OBSERVATION TYPE
                    <select name="TxtObservationType" id="TxtObservationType"  style="background-color:  #FFF8DC; border:  1px solid #000000;width:120px;text-transform: uppercase;" >
                        <option value=''>Select</option>
                <%
                       if(strObservationType!=null)
                       {%>
                        <option
                        <% if (strObservationType.trim().equals("EXCUSED")) {
                            %> selected <%}%> >EXCUSED</option>
                        <option
                        <% if (strObservationType.trim().equals("DISQUALIFIED")) {
                            %> selected <%}%> >DISQUALIFIED</option>
                            <option
                        <% if (strObservationType.trim().equals("MEDICAL")) {
                            %> selected <%}%> >MEDICAL</option>

                            <option
                    <%if (strObservationType.trim().equalsIgnoreCase("REGISTRATION")) {
                        %> selected <%}%> >REGISTRATION</option>

						 <option
                    <%if (strObservationType.trim().equalsIgnoreCase("OTHER")) {
                        %> selected <%}%> >OTHER</option>
                      </select>
                      <%}%>
                    </td>
             <td colspan="5">PLACE OF BIRTH
            <%--<input type="hidden" name="TxtPlaceSeq" id="TxtPlaceSeq" value="<%=strPlaceSeq%>" style="background-color:  #FFF8DC; border:  1px solid #000000;"/>--%>
            <input type="text" name="TxtPlaceName" size="28" id="TxtPlaceName" value="<%=strPlaceName%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/>
            <img src="Images/Find12.jpg" onClick="PlaceOfBirthSearch()" />


            TYPE OF REGISTRY &nbsp;&nbsp;
                    <select name="registrytype" id="registrytype"  style="background-color:  #FFF8DC; border:  1px solid #000000;width:115px;text-transform: uppercase;" >
                        <option value=''>Select</option>
                <%
                       if(strTypeofReg!=null)
                       {%>
                        <option
                        <% if (strTypeofReg.trim().equals("CERTIFICADO")) {
                            %> selected <%}%> >CERTIFICADO</option>
                        <option
                        <% if (strTypeofReg.trim().equals("DENUNCIADO")) {
                            %> selected <%}%> >DENUNCIADO</option>
                      </select>
                      <%}%>
                    </td>            
            </tr>
            <tr>
                <td colspan="3">
                    REGISTRATION TYPE
                    <select name="Registration_Type" id="Registration_Type" onchange="ChangeColor(this),SaveMode()" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:225px" >
                    <option value=''>Select</option>
                    <%
                    
                    String strSelectedR="";
                    String strSelectedP="";
                    String strSelectedS="";
                    if(strRegistration_Type.equals("R"))
                        strSelectedR="SELECTED";
                    else  if(strRegistration_Type.equals("P"))
                        strSelectedP="SELECTED";
                    else  if(strRegistration_Type.equals("S"))
                        strSelectedS="SELECTED";
                        
                    %>
                    <option value='R' <%=strSelectedR%> >REGISTRATION</option>
                    <option value='P' <%=strSelectedP%> >PEDIGREE</option>
                    <option value='S' <%=strSelectedS%> >SHOW</option>
                    </select>

                </td>
                    <td>CASO DNA#</td>
                <td colspan="2">
                    <input type="text" name="casodna" id="casodna" value="<%=strcaso_num%>"  style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:190px">
                        
                </td>
            </tr>
        </table>
        <input type="hidden" name="HdnViewAll" id="HdnViewAll" value='N' />
        </fieldset>
        <br/>
          
        <div align="center">          
            <table class="altRow">            
                <tr>
                    <td>
                        <%--<input type="button" class="button" id="BtnRegistrationViewAll" value="View All"/>--%>
                        <input type="button" class="button" id="BtnRegistrationPrint"  name="BtnRegistrationPrint" value="Print"/>
                        <input type="button" class="button" id="BtnRegistrationSearch" name="BtnRegistrationSearch"  value="Search" onclick="fnSearch()"/>
                        <input type="button" class="button" id="BtnRegistrationReset"  value="Reset"/>
                        <%--<input type="button" class="button" id="BtnRegistrationClose" value="Close"/>--%>
                        <input type="button" class="button" id="BtnRegistrationETE" value="Export To Excel" />                    
                    </td>
                </tr>
            </table>
        </div>        
        <br/>
            <input type="hidden" id="PAGEID" name="PAGEID" value="REGISTRATIONSEARCH"/>   
             <input type="hidden" name="SavedYN" id="SavedYN" value="Y" />
             <input type="hidden" name="HdnRegSearchType" id="HdnRegSearchType">
             <input type="hidden" name="FlgViewAll" value="N" >
    </div>
    
    <div id="sidebar">
        <%@ include file="frmReg_SearchSide.jsp" %>       
    </div>
       <%
        String strViewAll=request.getParameter("ViewAll");
        if(!strMode.equals("")) // Search Mode is 1 list the horses
        {
       %>
       <%@ include file="frmRegistrationSearchList.jsp" %>       
       <%}%>
      <%--
            if(strQry.indexOf("frmRegistrationSearchList.jsp") == -1)
{
--%>
            <div id="footer_Bot" align="bottom">         
             <%@ include file="frmBottom_Registration.jsp"%>
            </div>
<%--}--%>
       
    </div>
     
            
         
         
   <div id="dialog-Reg" title="SEARCH REGISTRATION" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="regsearchpopup.jsp"  id="modalIFrame_Show" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="no">
        </iframe>
    </div>

   <div id="dialog-SireReg" title="SIRE SEARCH" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="frmSireSearchPopup.jsp?Mode=2"  id="modalIFrame_Sire" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="no">
        </iframe>
    </div>
    <div id="dialog-DamReg" title="DAM SEARCH" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="frmDamSearchPopup.jsp"  id="modalIFrame_Show" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="no">
        </iframe>
    </div>
    <div id="dialog-Breeder" title="BREEDER SEARCH" style="display:none; background:url('Images/trans-wood-1.png');" >
        <%--<iframe  src="BreederPopup_Reg.jsp"  id="modalIFrame_Show" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">--%>

        <iframe  src="frmBreederSearchPopup.jsp"  id="modalIFrame_Breeder" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
        </iframe>
    </div>
    
    <div id="dialog-OwnerSearch" title="OWNER INFORMATION" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="frmReg_OwnerSearchPopup.jsp"  id="modalIFrame_OwnerSearch" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="no">
        </iframe>
    </div>
    <div id="dialog-Calculator" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe src="frmCalculator.jsp" id="modalIFrame_Calculator" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
        </iframe>
    </div>
    <div id="dialog-CmmnRef" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe id="modalIFrame_CmmnRef" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
        </iframe>
    </div>

    <div id="dialog-PlaceOfBirth" title="SEARCH PLACE" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe id="modalIFrame_PlaceOfBirth_RegSrch" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes" >
        </iframe><!-- src="frmPlaceOfBirthSearch.jsp" -->
    </div>
    
    <div id="dialog-SireSearchPopupList" title="SEARCH HORSE" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe src="frmSireSearchPopupList.jsp" id="modalIFrame_SireSearchPopupList" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes" >
        </iframe>
    </div>
    <div id="dialog-DamSearchPopupList" title="SEARCH HORSE" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe src="frmDamSearchPopupList.jsp" id="modalIFrame_DamSearchPopupList" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes" >
        </iframe>
    </div>
    <div id="dialog-OwnerSearchList" title="OWNER INFORMATION" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="frmReg_OwnerSearchPopupList.jsp"  id="modalIFrame_OwnerSearchList" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="no">
        </iframe>
    </div>
    
     <div id="dialog-BreederList" title="BREEDER SEARCH" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="frmBreederSearchPopupList.jsp"  id="modalIFrame_BreederList" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
        </iframe>
    </div>
    
    </form>
    
</body>
</html>