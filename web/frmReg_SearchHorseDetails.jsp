<%-- 
    Document   : frmReg_SearchHorseDetails
    Created on : Dec 4, 2012, 3:26:06 PM
    Author     : Erzath
--%>

<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%@ page import = "java.io.*" %>
        <%@ page import = "java.util.*" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="javax.naming.*" %>
        <%@ page import="javax.sql.rowset.*" %>
        <%@ page import="pasotracker.GeneralServlet" %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>HORSE SEARCH</title>
        <link rel="stylesheet" href="Style_Popup.css">
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />
        <link href="frmReg_CommonRef.css" rel="stylesheet" type="text/css" />
        <link href="Registration.css" rel="stylesheet" type="text/css" />
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
        <script src="js/jquery.autocomplete.js"></script>
        <script src="jscReg_SearchHorseDetails.js"></script>
        <script type="text/javascript" src="js/interface.js"></script>
        <!--<script type="text/javascript" src="jscReg_AutoComplete.js"></script>-->


<style type="text/CSS">
<!--
@import url("CommonTableStyle.css");
-->

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
<script>
$(function() {

    function formatItem(row) {
        	return row[0];
    }
    function formatResult(row) {
            finalVal=row[0].split('[REG:]')
            return finalVal[0].replace(/(<.+?>)/gi, '');
    }


    $("#hor_name").autocomplete('Auto_HorseName_NewRegSearch.jsp', {
            width: 500,
//startsWith: true,
            matchContains: true,
                    highlight:false,
            formatItem: formatItem,
            formatResult: formatResult
    });

    $("#hor_name").result(function(event, data, formatted) {

    var hiddenSeq = $("#RegSeqHidden");
    var RegNum = $("#regno");
    var value = data.toString().split('[REG:]');

    hiddenSeq.val(trimRegister(value[1]));
    RegNum.val(trimRegister(value[1]));

    });
});
</script>

    </head>
    <body>
<form name="Search_HorseDetails">
<%@ include file="frmReg_ScreenAttributes.jsp"%>
<div id="container">

    <div id="header">
        <%@ include file="frmHeader.jsp"%>
    </div>

    <div >
<%//id="content"

		if(!bRegistraion)
		response.sendRedirect("login.jsp");

    String strHorseName="";
    String strHorseRegNo="";
    String srchAction="";
    String strHdnRegSeq="";
    String strHdnSeq="";
    String srchType="";

    if(request.getParameter("sch")!=null)
        srchAction=request.getParameter("sch");

    if(request.getParameter("rseq")!=null)
        strHdnSeq=request.getParameter("rseq");

    if(request.getParameter("hor_name")!=null)
        strHorseName=request.getParameter("hor_name");

    if(request.getParameter("regno")!=null)
        strHorseRegNo=request.getParameter("regno");

    /*if(request.getParameter("RegSeqHidden")!=null)
        srchType=request.getParameter("RegSeqHidden");*/

    /*if(request.getParameter("RegSeqHidden")!=null)
        srchType=request.getParameter("RegSeqHidden");*/

    GeneralServlet gen=new GeneralServlet();
    
    //if(request.getParameter("sch")!=null)
    //    strHorseRegNo=request.getParameter("sch");
%>
        <table width="100%" class="altRow" title="SEARCH">
            <tr>
                <td nowrap>HORSE NAME:</td>
                <td colspan="3">
				<!--
                    <input type="text" value="<%=strHorseName%>" size="45" name="hor_name" id="hor_name" 
					style=" background:  #FFF8DC; border: 1px solid #000000;text-transform: uppercase;">
-->
					 <input type="text" value="<%=strHorseName%>" size="45" name="hor_name" id="hor_name" onchange="EmptyAll_Autocomplete('hor_name','regno','RegSeqHidden')"
                    style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
                    height: 16px;padding-left: 18px;text-transform:uppercase;"
                    onmousedown="fnClearSeq()">


                    <input type="hidden" size="7" name="RegSeqHidden" id="RegSeqHidden"
                    value="<%=strHdnSeq%>"
                    style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
                </td>
                <td>REG#:</td>
                <td>
                    <input type="text"  name="regno" id="regno" maxlength="15" onChange="PopulateValues(this)"
                    value="<%=strHorseRegNo%>"
                    style="background-color:#FFF8DC;border:1px solid #000000;text-transform: uppercase;width:100px;">
                </td>
                <td>
                    <input type="button" id="searchHorseDetails" class="button" value="Search"/>
                </td>
                <td>
                    <!--<input type="button" id="viewCertificate" class="button" value="View Certificate"/>-->
                </td>
                <td>
                    <input type="button" id="resetHorseSearch" class="button" value="Reset"/>
                </td>
            </tr>
        </table>
<%
    RowSetFactory factory27 = RowSetProvider.newFactory();
   CachedRowSet crsGetHorseDetails= factory27.createCachedRowSet();
  //  CachedRowSetImpl crsGetHorseDetails = new CachedRowSetImpl();
    
    if(srchAction.equals("y") && (!strHdnSeq.equals("") || !strHorseRegNo.equals("") ))
    {
        
        String strRegDate="";
        String strRegPlace="";
        String strHorGender="";
        String strHorDob="";
        String strHorAge="";
        String ageMonths="";
        String ageDays="";
        String age_MD="";
        String stDobAge="";
        String strHorColor="";
        String strHorModality="";
        String strMChipNum="";
        String strHorBreeder="";
        String strOwn_Type="";
        String strOrg_Name="";
        String strOwnFName="";
        String strOwnLName="";
        String strOwnAdd1="";
        String strOwnAdd2="";
        String strOwnCity="";
        String strOwnState="";
        String strOwnZip="";
        String strOwnCountry="";
        String strOwnPhone="";
        String strOwnEmail="";
        String strOwnerDetails="";
        String strEntitySeq="";
        String strOwnName="";
        String strOrg="";
        String strCasoNum="";
        String strreg_type="";
        String strRegistration_Type="";
        String strReg_Status="";
        String strRegBy="";
        String strHorGeldDate="";
        
        try
        {

        if(strHdnSeq.length()>0 && strHdnSeq!=null || strHorseName!=null || strHorseRegNo!=null)
        crsGetHorseDetails = gen.GetHorseDetails(strHdnSeq,strHorseRegNo,strHorseName,"","","","","");//strHdnRegSeq


        while(crsGetHorseDetails.next())
        {

            if(crsGetHorseDetails.getString("REGSEQ")!=null)
                strHdnRegSeq= crsGetHorseDetails.getString("REGSEQ").trim();
            else
                strHdnRegSeq="";

            if(crsGetHorseDetails.getString("REGISTRATION_NUM")!=null)
                strHorseRegNo= crsGetHorseDetails.getString("REGISTRATION_NUM").trim();
            else
                strHorseRegNo="";

            /*out.println("--------------tttttttt1ttttttttt"+strHorseRegNo.startsWith("T"));
            String restrictT="T";
            String restrict_t="t";
            if(strHorseRegNo.startsWith(restrictT) || strHorseRegNo.startsWith(restrict_t))
            {out.println("--------------ttttttttttttttttt");
                   continue;
            }*/
            if(crsGetHorseDetails.getString("REGISTRY_DATE")!=null)
                strRegDate= crsGetHorseDetails.getString("REGISTRY_DATE").trim();
            else
                strRegDate="";

            if(crsGetHorseDetails.getString("REGISTRY_PLACE_VAL")!=null)
                strRegPlace= crsGetHorseDetails.getString("REGISTRY_PLACE_VAL").trim();
            else
                strRegPlace="";

            if(crsGetHorseDetails.getString("REGISTRY_TYPE")!=null)
                strreg_type= crsGetHorseDetails.getString("REGISTRY_TYPE").trim();
            else
                strreg_type="";

            if(crsGetHorseDetails.getString("REGISTRATION_TYPE")!=null)
                strRegistration_Type= crsGetHorseDetails.getString("REGISTRATION_TYPE").trim();
            else
                strRegistration_Type="";

            if(crsGetHorseDetails.getString("REG_STATUS")!=null)
                strReg_Status= crsGetHorseDetails.getString("REG_STATUS").trim();
            else
                strReg_Status="";

            if(crsGetHorseDetails.getString("REGISTRY_USER")!=null)
                strRegBy= crsGetHorseDetails.getString("REGISTRY_USER").trim();
            else
                strRegBy="";
            
            if(crsGetHorseDetails.getString("HORSE_PRIMARYNAME")!=null)
                strHorseName= crsGetHorseDetails.getString("HORSE_PRIMARYNAME").trim();
            else
                strHorseName="";

            if(crsGetHorseDetails.getString("HORSE_GENDER")!=null)
                strHorGender= crsGetHorseDetails.getString("HORSE_GENDER").trim();
            else
                strHorGender="";


            if(crsGetHorseDetails.getString("HORSE_DOB")!=null)
                strHorDob= crsGetHorseDetails.getString("HORSE_DOB").trim();
            else
                strHorDob="";

            if(crsGetHorseDetails.getString("AGE")!=null)
                strHorAge= crsGetHorseDetails.getString("AGE").trim()+" Months";
            else
                strHorAge="";

            if(crsGetHorseDetails.getString("MONTH")!=null)
                ageMonths= crsGetHorseDetails.getString("MONTH").trim()+"M";
            else
                ageMonths="";

            if(crsGetHorseDetails.getString("DAYS")!=null)
                ageDays= crsGetHorseDetails.getString("DAYS").trim()+"D";
            else
                ageDays="";

            age_MD=ageMonths+' '+ageDays;

            if(!strHorDob.equals("")&& !age_MD.equals(""))
                stDobAge=strHorDob+"    /   "+age_MD;
            else
                stDobAge="";

            if(crsGetHorseDetails.getString("HORSE_GELDING_DATE")!=null)
                strHorGeldDate= crsGetHorseDetails.getString("HORSE_GELDING_DATE").trim();
            else
                strHorGeldDate="";

            if(crsGetHorseDetails.getString("HORSE_COLOR_VAL")!=null)
                strHorColor= crsGetHorseDetails.getString("HORSE_COLOR_VAL").trim();
            else
                strHorColor="";

            if(crsGetHorseDetails.getString("HORSE_MODALITY_VAL")!=null)
                strHorModality= crsGetHorseDetails.getString("HORSE_MODALITY_VAL").trim();
            else
                strHorModality="";
            
            if(crsGetHorseDetails.getString("HORSE_ORG_VAL")!=null)
                strOrg= crsGetHorseDetails.getString("HORSE_ORG_VAL").trim();
            else
                strOrg="";

            if(crsGetHorseDetails.getString("MICROCHIP_NUM")!=null)
                strMChipNum= crsGetHorseDetails.getString("MICROCHIP_NUM").trim();
            else
                strMChipNum="";

            if(crsGetHorseDetails.getString("HORSE_BREEDER_VAL")!=null)
                strHorBreeder= crsGetHorseDetails.getString("HORSE_BREEDER_VAL").trim();
            else
                strHorBreeder="";
            
            if(crsGetHorseDetails.getString("OWNER_TYPE")!=null)
                strOwn_Type= crsGetHorseDetails.getString("OWNER_TYPE").trim();
            else
                strOwn_Type="";

            if(crsGetHorseDetails.getString("ORGANIZATION_NAME")!=null)
                strOrg_Name= crsGetHorseDetails.getString("ORGANIZATION_NAME").trim();
             else
                strOrg_Name="";

            /*
            if(crsGetHorseDetails.getString("MEMBER_NUM")!=null)
                strmem_num= crsGetHorseDetails.getString("MEMBER_NUM").trim();
            else
                strmem_num="";*/

            if(crsGetHorseDetails.getString("FIRSTNAME")!=null)
                strOwnFName= crsGetHorseDetails.getString("FIRSTNAME").trim();
            else
                strOwnFName="";

            if(crsGetHorseDetails.getString("LASTNAME")!=null)
                strOwnLName= crsGetHorseDetails.getString("LASTNAME").trim();
            else
                strOwnLName="";

            if(crsGetHorseDetails.getString("ADDRESS1")!=null)
                strOwnAdd1= crsGetHorseDetails.getString("ADDRESS1").trim();
             else
                strOwnAdd1="";

            if(crsGetHorseDetails.getString("ADDRESS2")!=null)
                strOwnAdd2= crsGetHorseDetails.getString("ADDRESS2").trim();
             else
                strOwnAdd2="";

            if(crsGetHorseDetails.getString("CITY")!=null)
                strOwnCity= crsGetHorseDetails.getString("CITY").trim()+", ";
            else
                strOwnCity="";

            if(crsGetHorseDetails.getString("STATE")!=null)
                strOwnState= crsGetHorseDetails.getString("STATE").trim()+", ";
            else
                strOwnState="";

            if(crsGetHorseDetails.getString("ZIP")!=null)
                strOwnZip= crsGetHorseDetails.getString("ZIP").trim();
            else
                strOwnZip="";

            if(crsGetHorseDetails.getString("COUNTRY")!=null)
                strOwnCountry= crsGetHorseDetails.getString("COUNTRY").trim();
            else
                strOwnCountry="";

            if(crsGetHorseDetails.getString("PHONE")!=null)
                strOwnPhone= crsGetHorseDetails.getString("PHONE").trim();
            else
                strOwnPhone="";

            if(crsGetHorseDetails.getString("EMAIL")!=null)
                strOwnEmail= crsGetHorseDetails.getString("EMAIL").trim();
            else
                strOwnEmail="";

            if(crsGetHorseDetails.getString("ENTITYSEQ")!=null)
                strEntitySeq= crsGetHorseDetails.getString("ENTITYSEQ").trim();
            else
                strEntitySeq="";

            if(crsGetHorseDetails.getString("CASODNA_NUM")!=null)
                strCasoNum= crsGetHorseDetails.getString("CASODNA_NUM").trim();
             else
                strCasoNum="";

            /*
            if(crsGetHorseDetails.getString("START_DATE")!=null)
                strEffectivedate= crsGetHorseDetails.getString("START_DATE").trim();
            else
                strEffectivedate="";

            if(crsGetHorseDetails.getString("SUFFIX")!=null)
                strmem_mname= crsGetHorseDetails.getString("SUFFIX").trim();
            else
                strmem_mname="";
            */
            /*if(crsGetHorseDetails.getString("SIRE")!=null)
                strSire= crsGetHorseDetails.getString("SIRE").trim();
            else
                strSire="";

            if(crsGetHorseDetails.getString("DAM")!=null)
                strDam= crsGetHorseDetails.getString("DAM").trim();
            else
                strDam="";*/

            /*
            if(crsGetHorseDetails.getString("COUN")!=null)
                strCOUN = Integer.parseInt(crsGetHorseDetails.getString("COUN").trim());
            else
                strCOUN=0;
            
            if(crsGetHorseDetails.getString("ASSIGNEDNUM")!=null)
                strOwnerNo= crsGetHorseDetails.getString("ASSIGNEDNUM").trim();
            else
                strOwnerNo="";*/
			if(strOwn_Type.equalsIgnoreCase("INDIVIDUAL") || strOwn_Type.equalsIgnoreCase("YOUTH RIDER") ||(strOwn_Type.equals("") && strOrg_Name.equals("") ))
                strOwnName=strOwnFName+" "+strOwnLName;
            else
                strOwnName=strOrg_Name;


            strOwnerDetails=strOwnName+"<br>";//+strOwnAdd1+"<br>"+strOwnAdd2+"<br>"+strOwnCity+" "+strOwnState+" "+strOwnZip+"<br>"+strOwnCountry+"<br>"+strOwnPhone+"\n"+strOwnEmail;

            if(strOwnAdd1.length()>0 || strOwnAdd2.length()>0)
                strOwnerDetails=strOwnerDetails+strOwnAdd1+" "+strOwnAdd2+"<br>";
            if(strOwnCity.length()>0 || strOwnState.length()>0 || strOwnZip.length()>0)
                strOwnerDetails=strOwnerDetails+strOwnCity+" "+strOwnState+" "+strOwnZip+"<br>";
            if(strOwnCountry.length()>0)
                    strOwnerDetails=strOwnerDetails+strOwnCountry+"<br>";
            if(strOwnPhone.length()>0)
                    strOwnerDetails=strOwnerDetails+strOwnPhone+"<br>";
            if(strOwnEmail.length()>0)
                    strOwnerDetails=strOwnerDetails+strOwnEmail+"<br>";


            if(strRegistration_Type.equals("R"))
                strRegistration_Type="REGISTRATION";
            else  if(strRegistration_Type.equals("P"))
                strRegistration_Type="PEDIGREE";
            else  if(strRegistration_Type.equals("S"))
                strRegistration_Type="SHOW";

            }

          }
            catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println("-----Error in frmReg_SearchHorseDetails.jsp in Horse Information --------"+e);
        }

        //For Getting the HORSE Image ------------------
        /*InputStream horseImage;
        try
        {
        ServletOutputStream servletOutputStream = response.getOutputStream();
           
        servletOutputStream.flush();
        servletOutputStream.close();
        ResultSet rs =  pst.executeQuery();   
        rs.close();        
        pst.close();        
        con.commit();
        con.close();
        }
        catch(Exception e)
        {
        System.out.println("Error in getting the horse image in frmReg_SearchHorseDetails.jsp---"+e);
        }*/

if(crsGetHorseDetails.size()>0){
%>
        <!-- ---------- HORSE INFORMATION -------------------- -->
        <table width="100%"  class="altRow">
            <tr>
                <td colspan="5">
                    <label  id="horseName"  style="color:<%--=FontColor--%>; text-transform: uppercase; font-size: 18px;font-weight:bold;"> <%=strHorseName%></label>
                </td>
            </tr>
            <tr>
                <td width="15%" style="font-weight:bold;" >REGISTRATION NUMBER:</td>
                <td width="20%" >
                    <input type="hidden" size="7" name="HdnRegSeq" id="HdnRegSeq"
                    value="<%=strHdnRegSeq%>"/>
                    <!--<input type="text"  name="regno" id="regno" maxlength="15" onChange="PopulateValues(this)"
                    value="<%--=strHorseRegNo--%>"
                    style="background-color:#FFF8DC;border:1px solid #000000;text-transform: uppercase;width:190px;">
                    <input type="hidden" size="7" name="regSeq" id="regSeq"
                    value="<%--=strHdnRegSeq--%>"
                    style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">-->
                    <label id="regNum" style="text-transform: uppercase; font-size: 15px;font-weight:normal;"><%=strHorseRegNo%></label>
                </td>
                <td width="15%" style="font-weight:bold;">REGISTRATION DATE:</td>
                <td width="20%">
                    <label id="regDate" style="text-transform:uppercase;font-size:15px;font-weight:normal;"><%=strRegDate%></label>
                </td>
                <td rowspan="6"  width="30%"><!-- Horse Image -->
                    <table border="1" width="100%"  bordercolor="#ffffff" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <!--<td>
                            <img src="<%--=str--%>" width="200" height="175"/>
                        </td>-->
                        <td>
                            <img src="frmReg_GetHorseImage.jsp?seq=<%=strHdnRegSeq%>"  width="270" height="177">
                        </td>
                    </tr>

                    <!--<tr>
                        <td>
                            <input type="file" name="upload" id="upload"  size="10"  onclick="ImageEmpty()" />
                            <input type="hidden" name="upload1" id="upload1" value="<%--=strSample--%>" />
                        </td>
                    </tr>-->
                    </table>
                </td>
            </tr>            
            <tr>
                <td style="font-weight:bold;">TYPE OF REGISTRY:</td>
                <td>
                    <label id="typeRegistry" style="text-transform:uppercase;font-size:15px;font-weight:normal;"><%=strreg_type%></label>
                </td>
                <td style="font-weight:bold;">REGISTERED BY:</td>
                <td>
                    <label id="regBy" style="text-transform:uppercase;font-size:15px;font-weight:normal;"><%=strRegBy%></label>
                </td>
            </tr>
            <tr>                
                <td style="font-weight:bold;">REGISTRATION TYPE:</td>
                <td>
                    <label id="regType" style="text-transform:uppercase;font-size:15px;font-weight:normal;"><%=strRegistration_Type%></label>
                </td>
                <td style="font-weight:bold;">PLACE OF BIRTH:</td>
                <td>
                    <label id="regPlace" style="text-transform:uppercase;font-size:15px;font-weight:normal;"><%=strRegPlace%></label>
                </td>
            </tr>
            <tr>
                <td style="font-weight:bold;">MICROCHIP#:</td>
                <td>
                    <label id="mChipNum" style="text-transform: uppercase; font-size: 15px;font-weight:normal;"><%=strMChipNum%></label>
                </td>
                <td style="font-weight:bold;">DOB / AGE:</td>
                <td>
                    <label  id="dobAge"  style="text-transform: uppercase; font-size: 15px;font-weight:bold;color: red;" onclick="getAgePopup()" >
					<%=stDobAge%></label>
					<input type="hidden" name="Horsedeathdate" placeholder="MM/DD/YYYY" id="Deathdate_datepicker" >
					<input type="hidden" name="datepicker_DOB" id="datepicker_DOB" value='<%=stDobAge%>'>
					<label  id="inYears"  style="visibility:hidden;"> </label>       
					<label  id="inMonths" style="visibility:hidden;"> </label>       
					<label  id="inDays"   style="visibility:hidden;"> </label> 
                </td>
            </tr>
            <tr>
                <td style="font-weight:bold;">GENDER:</td>
                <td>
                    <label  id="horGender"  style="text-transform: uppercase; font-size: 15px;font-weight:normal;">
					<%
                  if(strHorGender.equals("MALE"))
                      out.println(male);
                  else  if(strHorGender.equals("FEMALE"))
                      out.println(female);
                  else  if(strHorGender.equals("GELDING"))
                      out.println(gelding);

                        %></label>
                </td>
                <td style="font-weight:bold;">COLOR:</td>
                <td>
                    <label  id="horGender"  style="text-transform: uppercase; font-size: 15px;font-weight:normal;"><%=strHorColor%></label>
                </td>
            </tr>
            <tr>
                <td style="font-weight:bold;">DATE GELDED:</td>
                <td>
                    <label  id="dateGelded"  style="text-transform: uppercase; font-size: 15px;font-weight:normal;"><%=strHorGeldDate%></label>
                </td>
                <td style="font-weight:bold;">MODALITY:</td>
                <td>
                    <label  id="horModality"  style="text-transform: uppercase; font-size: 15px;font-weight:normal;"><%=strHorModality%></label>
                </td>
            </tr>
			<tr>
                <td style="font-weight:bold;">CASODNA#:</td>

                <td>
                    <label  id="casoDnaNo"  style="text-transform: uppercase; font-size: 15px;font-weight:normal;"><%=strCasoNum%></label>
                </td>
                <td style="font-weight:bold;">ORGANIZATION:</td>
                <td  colspan="2">
                    <label  id="horseName"  style="text-transform: uppercase; font-size: 15px;font-weight:normal;"><%=strOrg%></label>
                </td>
            </tr>
            <tr>
                <td style="font-weight:bold;">OWNER:</td>
                <td colspan="4">
                    <label  id="horOwner"  style="text-transform: uppercase; font-size: 15px;font-weight:normal;"><%=strOwnerDetails%></label>

                    <input type="button" id="searchOwnerHistory" class="button" value="Owner History" onclick="fnOwnerHistory('<%=strHdnRegSeq%>')" />
                </td>
            </tr>
            <tr>
                <td style="font-weight:bold;">BREEDER:</td>
                <td colspan="4">
                    <label  id="horseName"  style="text-transform: uppercase; font-size: 15px;font-weight:normal;"><%=strHorBreeder%></label>
                </td>
            </tr>            
        </table>

        <!-- ---------- PEDIGREE INFORMATION -------------------- -->
        <table width="100%" >
            <tr>
                <td>
                    <label style="text-transform:uppercase; font-size: 15px;font-weight:bold;">PEDIGREE</label>
                </td>
            </tr>
            <tr>
                <td>
                    <%@include file="frmReg_SearchHorseDetails_Pedigree.jsp" %>
                </td>
            </tr>
        </table>

<%
 
    String showYear="";
    String select_LT="";
    String select_2013="";
    String select_2012="";
    String select_2011="";
    String select_2010="";

    if(request.getParameter("showYear")!=null)
        showYear=request.getParameter("showYear");

    if(showYear.equals(""))
      select_LT="SELECTED";
    else  if(showYear.equals("2013"))
      select_2013="SELECTED";
    else  if(showYear.equals("2012"))
      select_2012="SELECTED";
    else  if(showYear.equals("2011"))
      select_2011="SELECTED";
    else  if(showYear.equals("2010"))
      select_2010="SELECTED";
%>
        <!-- ---------- SHOW HISTORY DETAILS -------------------- -->
        <table width="100%" >
            <tr>
                <td colspan="2">
                    <label style="text-transform:uppercase; font-size: 15px;font-weight:bold;">SHOW HISTORY</label>
                </td>
            </tr>
            <tr>
                <td width="15%" style="font-weight:bold;">SHOW YEAR:</td>
                <td>
                    <select id="showYear" name="showYear"
                            onchange="fnDisplayShowHistory(showYear,'<%=strHdnRegSeq%>')"
                            style="background-color:#FFF8DC;border:1px solid #000000;font-size: 15px;font-weight:normal;width:13%;" >
                    <option value="0" >Select</option>
                    <option value="" <%=select_LT%>>Lifetime</option>
                    <option value="2013" <%=select_2013%>>2013</option>
                    <option value="2012" <%=select_2012%>>2012</option>
                    <option value="2011" <%=select_2011%>>2011</option>
                    <option value="2010" <%=select_2010%>>2010</option>
                    </select>
                </td>
            </tr>
            <tr>
				<td colspan="2">

				<iframe  src="frmReg_SearchHorseDetails_ShowHistory.jsp?showYear=&sch=y&rseq=<%=strHdnRegSeq%>"  id="iFrame_ShowResults"
				width="100%" height="500" marginwidth="0" marginheight="0"
				frameborder="0">
				</iframe> 
				
				</td>
            </tr>
        </table>


<%}
    }
    else if(srchAction.equals("y") && strHdnSeq.equals(""))
    {
        String sireName="";
        String damName="";
        String strOwnFName="";
        String strOwnLName="";
        String strOrgName="";
        String strOwnType="";
        String strOwnerName="";
%>
        <table width="100%" class="altRow" title="SEARCH">
            <tr>
                <th>HORSE NAME</th>
                <th>REG#</th>
                <th>OWNER</th>
                <th>SIRE</th>
                <th>DAM</th>
            </tr>
        <%
        crsGetHorseDetails = gen.GetHorseDetails("",strHorseRegNo,strHorseName,"","","","","");
        while (crsGetHorseDetails.next())
        {
            if(crsGetHorseDetails.getString("REGSEQ")!=null)
                strHdnSeq= crsGetHorseDetails.getString("REGSEQ").trim();

            if(crsGetHorseDetails.getString("REGISTRATION_NUM")!=null)
                strHorseRegNo= crsGetHorseDetails.getString("REGISTRATION_NUM").trim();
            
            if(strHorseRegNo.startsWith("T") || strHorseRegNo.startsWith("t"))
                   continue;           

            if(crsGetHorseDetails.getString("HORSE_PRIMARYNAME")!=null)
                strHorseName= crsGetHorseDetails.getString("HORSE_PRIMARYNAME").trim();

            if(crsGetHorseDetails.getString("FIRSTNAME")!=null)
                strOwnFName= crsGetHorseDetails.getString("FIRSTNAME").trim();
            else
                strOwnFName="";

            if(crsGetHorseDetails.getString("LASTNAME")!=null)
                strOwnLName= crsGetHorseDetails.getString("LASTNAME").trim();
            else
                strOwnLName="";

            if(crsGetHorseDetails.getString("OWNER_TYPE")!=null)
                strOwnType=crsGetHorseDetails.getString("OWNER_TYPE").trim();
            else
                strOwnType="";

            if(crsGetHorseDetails.getString("ORGANIZATION_NAME")!=null)
                strOrgName= crsGetHorseDetails.getString("ORGANIZATION_NAME").trim();
            else
                strOrgName="";


            if(strOwnType.equals("INDIVIDUAL") || strOwnType.equalsIgnoreCase("YOUTH RIDER")   ||(strOwnType.equals("") && strOrgName.equals("") ))
                strOwnerName = strOwnFName+" "+strOwnLName;
            else
                strOwnerName = strOrgName;

            if(crsGetHorseDetails.getString("SIRENAME")!=null)
                sireName= crsGetHorseDetails.getString("SIRENAME");
            else
                sireName="";

            if(crsGetHorseDetails.getString("DAMNAME")!=null)
                damName= crsGetHorseDetails.getString("DAMNAME");
            else
                damName="";

%>
        
            <tr>
                <td>
                    <a href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strHdnSeq%>" ><%out.println(strHorseName.toUpperCase());%></a>
                </td>
                <td><%out.println(strHorseRegNo.toUpperCase());%></td>
                <td><%out.println(strOwnerName.toUpperCase());%></td>
                <td><%out.println(sireName.toUpperCase());%></td>
                <td><%out.println(damName.toUpperCase());%></td>
            </tr>
        
<%
        }
%>
        </table>
<%
    }   
%>


    <!-- end of div content -->
    </div>
<!--</div>
    <div id="sidebar">
        <%--@ include file="PersonSearch_Side.jsp" --%>
    </div>-->

   <div id="footer_Bot" align="bottom">
    <jsp:include page="/frmBottom_Registration.jsp"/>
    </div>
</div>
    <div id="dialog-OwnerHistory" title="OWNER HISTORY" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  id="modalIFrame_OwnerHistory" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
        </iframe>
    </div>
	<div id="dialog-Age" title="AGE" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="frmAgeCalculator.jsp"  id="modalIFrame_Age" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="no">
        </iframe>        
    </div> 
</form>

    </body>
</html>


