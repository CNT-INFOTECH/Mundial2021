<%-- 
    Document   : frmReg_Ped_EditHorseInfm
    Created on : Nov 9, 2011, 6:30:41 PM
    Author     : Erzath
--%>

<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.GeneralServlet" %>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
<link rel="stylesheet" href="themes/base/jquery.ui.all.css">
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
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="jscIndex.js"></script>
<link href="Style_Popup.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/interface.js"></script>
<script type="text/javascript">
$(function() {
  $( "#EFFECTIVEDATE" ).datepicker({
changeMonth: true,
changeYear: true
});
});
function saveHorInfm(LHname,THname,LRegno,TRegno,LAsoname,TAsoname,TAsoseq)
{
    valHName=document.getElementById("HorseName_P").value;
    valRegNum=document.getElementById("regno").value;
    valOrgName=document.getElementById("org").value;
    valOrgSeq=document.getElementById("orgSeq").value;
    
    window.parent.document.getElementById(LHname).innerHTML=valHName;
    window.parent.document.getElementById(THname).value=valHName;
    window.parent.document.getElementById(LRegno).innerHTML=valRegNum;
    window.parent.document.getElementById(TRegno).value=valRegNum;
    window.parent.document.getElementById(LAsoname).innerHTML=valOrgName;
    window.parent.document.getElementById(TAsoname).value=valOrgName;
    window.parent.document.getElementById(TAsoseq).value=valOrgSeq;
    //window.parent.document.getElementById("SavedYN").value="N";
        
    document.forms[0].method="post";
    document.forms[0].action="RegistrationServlet";
    document.forms[0].target="_self";                                                                
    document.forms[0].submit();
}
function CloseHorInfm()
{
    window.parent.jQuery('#dialog-EditHorseInformation').dialog('close');
}
</script>
<style type="text/css">
.altRow
{

}

.altRow td
{	
	font-size:9pt;  
	color:#000000;
	/*padding:5px 0 5px 5px;*/
	vertical-align:top;
	/*text-align:left;*/
}

.altRow  th
{
	background:#4e738f;
	color:#fff;
	font-weight:bold;
	font-size:9pt;
	/*text-align:center;*/
}
		
.ui-datepicker
{
    font-family:TimesNewRoman;
    font-size: 10px;
    margin-left:0px;
    margin-top: 0px;
    line-height: 1.0em;
}
a:link {
text-decoration: none;
}
a:visited {
text-decoration: none;
}
a:hover {
cursor:pointer;
text-decoration: underline;
color: #FF0000;
}
a:active {
text-decoration: none;
}
fieldset { padding:20px;  }
input, textarea, select {font:12px/12px Arial, Helvetica, sans-serif; padding:0;}
fieldset.action {background:#9da2a6; border-color:#e5e5e5 #797c80 #797c80 #e5e5e5; margin-top:-20px;}
</style>
</head>
<body>
<form name="Reg_Ped_EditHorseInformation">
<%
String REGSEQ="";
String strreg_num="";
String strhor_name="";
String strhor_dob="";
String strhor_breeder="";
String strhor_breederSeq="";
String strSire="";
String strDam=""; 
String strOwnerNo="";
String strOwn_Type="";
String strOrg_Name="";
String strmem_name="";
String strmem_lname="";
String strOwnerName="";
String strhor_gender="";
String strreg_colorSeq="";
String strhor_color="";
String strorgSeq="";
String strorg="";
String strEntitySeq="";

String strmem_num="";    
String strmem_add1="";
String strmem_add2="";
String strmem_city="";
String strmem_state="";
String strmem_zip="";
String strmem_country="";
String strmem_phone="";
String strmem_email="";

String SireRegNum="";
String DamRegNum="";
String SireHorName="";
String DamHorName="";
String BreederIdNo="";

if(request.getParameter("RSq")!=null)
REGSEQ=request.getParameter("RSq");
else
REGSEQ="";

String Fld_LHorNam="";
String Fld_THorName="";
String Fld_LReg="";
String Fld_TReg="";
String Fld_LAso="";
String Fld_TAso="";
String Fld_TAsoSeq="";

if(request.getParameter("LHorNam")!=null)
Fld_LHorNam=request.getParameter("LHorNam");

if(request.getParameter("THorName")!=null)
Fld_THorName=request.getParameter("THorName");

if(request.getParameter("LReg")!=null)
Fld_LReg=request.getParameter("LReg");

if(request.getParameter("TReg")!=null)
Fld_TReg=request.getParameter("TReg");

if(request.getParameter("LAso")!=null)
Fld_LAso=request.getParameter("LAso");

if(request.getParameter("TAso")!=null)
Fld_TAso=request.getParameter("TAso");

if(request.getParameter("TAsoSeq")!=null)
Fld_TAsoSeq=request.getParameter("TAsoSeq");




GeneralServlet gen=new GeneralServlet();   
 RowSetFactory factory27 = RowSetProvider.newFactory();
   CachedRowSet crsGetHorseDetails= factory27.createCachedRowSet();
//CachedRowSetImpl crsGetHorseDetails = new CachedRowSetImpl();                        
if(REGSEQ.length()>0 && REGSEQ!=null)
crsGetHorseDetails = gen.GetHorseDetails(REGSEQ,"","","","","","","");

if(crsGetHorseDetails.next())
{
    REGSEQ="";
    strreg_num="";
    strhor_name="";
    strhor_dob="";
    strhor_breeder="";
    strhor_breederSeq="";
    strSire="";
    strDam=""; 
    strOwnerNo="";
    strOwn_Type="";
    strmem_lname="";
    strOwnerName="";
    strhor_gender="";
    strreg_colorSeq="";
    strhor_color="";
    strEntitySeq="";
    strmem_num="";    
    strmem_add1="";
    strmem_add2="";
    strmem_city="";
    strmem_state="";
    strmem_zip="";
    strmem_country="";
    strmem_phone="";
    strmem_email="";
    SireRegNum="";
    DamRegNum="";
    SireHorName="";
    DamHorName="";
    BreederIdNo="";
    
    if(crsGetHorseDetails.getString("REGSEQ")!=null)   
        REGSEQ= crsGetHorseDetails.getString("REGSEQ").trim();
    else
        REGSEQ="";
    
    if(crsGetHorseDetails.getString("REGISTRATION_NUM")!=null)               
        strreg_num= crsGetHorseDetails.getString("REGISTRATION_NUM").trim();                
    else
        strreg_num="";
    
    if(crsGetHorseDetails.getString("HORSE_PRIMARYNAME")!=null)                     
        strhor_name= crsGetHorseDetails.getString("HORSE_PRIMARYNAME").trim();
    else
        strhor_name="";
    
    if(crsGetHorseDetails.getString("HORSE_GENDER")!=null)                  
        strhor_gender= crsGetHorseDetails.getString("HORSE_GENDER").trim();
    else
        strhor_gender="";
    
    if(crsGetHorseDetails.getString("HORSE_DOB")!=null)                  
        strhor_dob= crsGetHorseDetails.getString("HORSE_DOB").trim();
    else
        strhor_dob="";
    
    if(crsGetHorseDetails.getString("HORSE_COLOR")!=null)                  
        strreg_colorSeq= crsGetHorseDetails.getString("HORSE_COLOR").trim();		
    else
        strreg_colorSeq="";

    if(crsGetHorseDetails.getString("HORSE_COLOR_VAL")!=null)                  
        strhor_color= crsGetHorseDetails.getString("HORSE_COLOR_VAL").trim();               
    else
        strhor_color="";
    
    if(crsGetHorseDetails.getString("HORSE_BREEDER_VAL")!=null)                  
        strhor_breeder= crsGetHorseDetails.getString("HORSE_BREEDER_VAL").trim();
    else
        strhor_breeder="";

    if(crsGetHorseDetails.getString("HORSE_BREEDER")!=null)                  
        strhor_breederSeq= crsGetHorseDetails.getString("HORSE_BREEDER").trim();
    else
        strhor_breederSeq="";
    
    if(crsGetHorseDetails.getString("BREEDERNO")!=null)                  
        BreederIdNo= crsGetHorseDetails.getString("BREEDERNO").trim();
    else
        BreederIdNo="";
    
    if(crsGetHorseDetails.getString("HORSE_ORG_VAL")!=null)                  
        strorg= crsGetHorseDetails.getString("HORSE_ORG_VAL").trim();
    else
        strorg="";

    if(crsGetHorseDetails.getString("ORGANISATION")!=null)                  
        strorgSeq= crsGetHorseDetails.getString("ORGANISATION").trim();
    else
        strorgSeq="";
    
    if(crsGetHorseDetails.getString("SIRE")!=null)                  
        strSire= crsGetHorseDetails.getString("SIRE").trim();
    else
        strSire="";

    if(crsGetHorseDetails.getString("DAM")!=null)                  
        strDam= crsGetHorseDetails.getString("DAM").trim();
    else
        strDam=""; 
    
    if(crsGetHorseDetails.getString("SIRENAME")!=null)                  
        SireHorName= crsGetHorseDetails.getString("SIRENAME").trim();
    else
        SireHorName="";

    if(crsGetHorseDetails.getString("DAMNAME")!=null)                  
        DamHorName= crsGetHorseDetails.getString("DAMNAME").trim();
    else
        DamHorName=""; 
    
    if(crsGetHorseDetails.getString("SIRE_REGNUM")!=null)                  
        SireRegNum= crsGetHorseDetails.getString("SIRE_REGNUM").trim();
    else
        SireRegNum="";

    if(crsGetHorseDetails.getString("DAM_REGNUM")!=null)                  
        DamRegNum= crsGetHorseDetails.getString("DAM_REGNUM").trim();
    else
        DamRegNum=""; 

    if(crsGetHorseDetails.getString("ASSIGNEDNUM")!=null)                  
        strOwnerNo= crsGetHorseDetails.getString("ASSIGNEDNUM").trim();
    else
        strOwnerNo="";
    
    if(crsGetHorseDetails.getString("OWNER_TYPE")!=null)                  
        strOwn_Type= crsGetHorseDetails.getString("OWNER_TYPE").trim();
    else
        strOwn_Type="";

    if(crsGetHorseDetails.getString("ORGANIZATION_NAME")!=null)                  
        strOrg_Name= crsGetHorseDetails.getString("ORGANIZATION_NAME").trim();
     else
        strOrg_Name="";
    
    if(crsGetHorseDetails.getString("FIRSTNAME")!=null)                  
        strmem_name= crsGetHorseDetails.getString("FIRSTNAME").trim();
    else
        strmem_name="";

    if(crsGetHorseDetails.getString("LASTNAME")!=null)                  
        strmem_lname= crsGetHorseDetails.getString("LASTNAME").trim();
    else
        strmem_lname="";
    
    if(crsGetHorseDetails.getString("ENTITYSEQ")!=null)                  
        strEntitySeq= crsGetHorseDetails.getString("ENTITYSEQ").trim();
    else
        strEntitySeq="";
    
    if(crsGetHorseDetails.getString("MEMBER_NUM")!=null)                  
        strmem_num= crsGetHorseDetails.getString("MEMBER_NUM").trim();
    else
        strmem_num="";   

    if(crsGetHorseDetails.getString("ADDRESS1")!=null)                  
        strmem_add1= crsGetHorseDetails.getString("ADDRESS1").trim();
     else
        strmem_add1=""; 

    if(crsGetHorseDetails.getString("ADDRESS2")!=null)                  
        strmem_add2= crsGetHorseDetails.getString("ADDRESS2").trim();
     else
        strmem_add2="";

    if(crsGetHorseDetails.getString("CITY")!=null)                  
        strmem_city= crsGetHorseDetails.getString("CITY").trim();
    else
        strmem_city="";

    if(crsGetHorseDetails.getString("STATE")!=null)                  
        strmem_state= crsGetHorseDetails.getString("STATE").trim();
    else
        strmem_state=""; 

    if(crsGetHorseDetails.getString("ZIP")!=null)                  
        strmem_zip= crsGetHorseDetails.getString("ZIP").trim();
    else
        strmem_zip="";

    if(crsGetHorseDetails.getString("COUNTRY")!=null)                  
        strmem_country= crsGetHorseDetails.getString("COUNTRY").trim();
    else
        strmem_country="";

    if(crsGetHorseDetails.getString("PHONE")!=null)                  
        strmem_phone= crsGetHorseDetails.getString("PHONE").trim();
    else
        strmem_phone="";

    if(crsGetHorseDetails.getString("EMAIL")!=null)                  
        strmem_email= crsGetHorseDetails.getString("EMAIL").trim();
    else
        strmem_email="";
    
    strOwnerName=strmem_name+" "+strmem_lname;
} 
                      
%>
<table class="altRow" width="100%" border="0" cellspacing="1" cellpadding="2">
    <tr>
        <td nowrap width="80px" style="border-bottom:1px dotted #ffffff;">HORSE NAME</td>
        <td colspan="5" style="border-bottom:1px dotted #ffffff;">
            <input type="text"  name="HorseName_P" id="HorseName_P" size="86" 
                 value="<%=strhor_name%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
        </td>
    </tr>
    <tr >
        <td style="border-bottom:1px dotted #ffffff;">REG#</td>
        <td style="border-bottom:1px dotted #ffffff;" width="85px">
            <input type="text"  name="regno" id="regno" maxlength="15"  value="<%=strreg_num%>"  READONLY
            style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:90px;">                   
            <input type="hidden" value="<%=REGSEQ%>" name="regseq" id="regseq" />
        </td>    
        <td style="border-bottom:1px dotted #ffffff;" width="85px" nowrap>BIRTH DATE</td>
        <td style="border-bottom:1px dotted #ffffff;" width="121px">
            <input type="text" name="Horsebirthdate"  placeholder="MM/DD/YYYY" id="datepicker_DOB" 
            onchange="agecal(),SaveMode()" onkeyup="SaveMode()" size="8" value="<%=strhor_dob%>" 
            style="background-color:  #FFF8DC; border:  1px solid #000000;width:114px;">
        </td>
        <td style="border-bottom:1px dotted #ffffff;">GENDER</td>
        <td style="border-bottom:1px dotted #ffffff;">
            <select name="Horsegender" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:83px;" >                                  
                <option value=''>Select</option>
              <%
                    String strSelected_Male="";
                    String strSelected_Female="";                    
              if(strhor_gender.equals("MALE"))
                  strSelected_Male="SELECTED";
              else  if(strhor_gender.equals("FEMALE"))
                  strSelected_Female="SELECTED";            
              %>
                <option value='MALE' <%=strSelected_Male%> >MALE</option>
                <option value='FEMALE'<%=strSelected_Female%>>FEMALE</option>                
              </select>
        </td>                                   
    </tr>
    <tr>
        <td style="border-bottom:1px dotted #ffffff;">COLOR
            <img src="Images/dropdown_icon4.gif" onClick="OpenCommonRef_Pedigree('COLOR','colorSeq','Horsecolor_Lbl','Horsecolor')" />                                               
        </td>            
        <td style="border-bottom:1px dotted #ffffff;" colspan="2">       
            <input type="hidden" name="colorSeq"  id="colorSeq" value="<%=strreg_colorSeq%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"   >
            <input type="hidden" name="Horsecolor" size="14" id="Horsecolor" value="<%=strhor_color%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"  Readonly>
            <label id="Horsecolor_Lbl"  style="font-size:9pt;font-weight:bold;text-transform: uppercase;"><%=strhor_color%></label>
        </td>
        <td style="border-bottom:1px dotted #ffffff;">ORGANIZATION          
            <img src="Images/dropdown_icon4.gif" onClick="OpenCommonRef_Pedigree('ORGANIZATION','orgSeq','org_Lbl','org')" />              
        </td>
        <td style="border-bottom:1px dotted #ffffff;" colspan="2">             
            <input type="hidden" name="orgSeq"  id="orgSeq" value="<%=strorgSeq%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"   >
            <input type="hidden" name="org" id="org" size="18" value="<%=strorg%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"   Readonly>
            <label id="org_Lbl"  style="font-size:9pt;font-weight:bold;text-transform: uppercase;"><%=strorg%></label>           
        </td>
    </tr>
    <tr>
        <td style="border-bottom:1px dotted #ffffff;">BREEDER#</td>
        <td style="border-bottom:1px dotted #ffffff;">
            <input type="text"  size="6" name="BREEDER_NO" id="BREEDER_NO" value="<%=BreederIdNo%>"
            style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" 
            onchange="Ajax_Owner(this.value,'breederSeq','BREEDER_NO','BreederName_Lbl')"/>        
            <img src="Images/Find12.jpg" onClick="OwnerSearch('','pop','1','B')" />           
            <input type="hidden" name="breederSeq" id="breederSeq" value="<%=strhor_breederSeq%>"  > 
        </td>            
        <td style="border-bottom:1px dotted #ffffff;" colspan="4">              
            <label id="BreederName_Lbl" style="color:blue;font-size:9pt;font-weight:bold;text-transform: uppercase;"><a onclick="EditOwner('<%=strhor_breederSeq%>','B')"><%=strhor_breeder%></a></label>                          
        </td>
    </tr>
    <tr>
        <td style="border-bottom:1px dotted #ffffff;">OWNER#</td>
        <td style="border-bottom:1px dotted #ffffff;">
            <input type="text"  size="6" name="OWNER_NO" id="OWNER_NO"                      
            style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" 
            value="<%=strOwnerNo%>" onchange="Ajax_Owner(this.value,'HDNENTITYSEQ','OWNER_NO','OWNER_NAME_VAL')"/>
            <img src="Images/Find12.jpg" onClick="OwnerSearch('','pop','1','O')" />
            <input type="hidden"  size="4" name="HDNENTITYSEQ" id="HDNENTITYSEQ" value="<%=strEntitySeq%>" />                     
        </td>
        <td style="border-bottom:1px dotted #ffffff;" colspan="4">
            <%
            if(strOwn_Type.equals("ORGANIZATION"))
            strOwnerName=(String) strOrg_Name;
            %>
            <label  id="OWNER_NAME_VAL" style="color:blue;font-size:9pt;font-weight:bold;text-transform: uppercase;"><a onclick="EditOwner('<%=strEntitySeq%>','O')"><%=strOwnerName%></a></label>            
        </td>        
    </tr>    
    <tr><!--
        <td>SIRE</td>
        <td>
            <input type="text" name="SireRegNo" id="SireRegNo" value="<%=SireRegNum%>" size="6"
            style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" />
            <img src="Images/Find12.jpg" onClick='PedigreeSearch_Sire("Sire_Name_2_1","Sire_2_1","LSire_2_1","Sire_2_1_Seq","MALE","Aso_Sire_2_1","Aso_Sire_2_1_Seq")' />
            <input type="hidden" name="SireSeq" id="SireSeq" value="<%=strSire%>" size="6" />
        </td>        
        <td colspan="4">
            <label id="SireHorName" style="font-size:9pt;font-weight:bold;text-transform: uppercase;"><%=SireHorName%></label>              
        </td>
    </tr>-->
    <tr>
        <!--<td>DAM</td>
        <td>
            <input type="text" name="DamRegNo" id="DamRegNo" value="<%=DamRegNum%>" size="6"
            style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" />
            <img src="Images/Find12.jpg" onClick='PedigreeSearch_Dam("Dam_Name_2_1","Dam_2_1","LDam_2_1","Dam_2_1_Seq","FEMALE","Aso_Dam_2_1","Aso_Dam_2_1_Seq")' />
            <input type="hidden" name="DamSeq" id="DamSeq" value="<%=strDam%>" size="6" />
        </td>        
        <td colspan="4">
            <label id="DamHorName" style="font-size:9pt;font-weight:bold;text-transform: uppercase;"><%=DamHorName%></label>              
        </td>-->        
    </tr>
    <tr>
        <td><br/></td>
    </tr>
    <tr>
        <td><br/></td>
    </tr>
    <tr>
        <td colspan="6" style="border-bottom:1px dotted #ffffff;" align="center">
            <input type="button" class="button" value="SAVE" onclick="saveHorInfm('<%=Fld_LHorNam%>','<%=Fld_THorName%>','<%=Fld_LReg%>','<%=Fld_TReg%>','<%=Fld_LAso%>','<%=Fld_TAso%>','<%=Fld_TAsoSeq%>')"/>
            <input type="button" class="button" value="CLOSE" onclick="CloseHorInfm()"/>
        </td>        
    </tr>
<input type="hidden" name="PAGEID" id="PAGEID" size="10" value="EDITREG_PEDIGREE" >
<input type="hidden" name="SavedYN" id="SavedYN" />

</table>
    <div id="dialog-CmmnRef" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe id="modalIFrame_CmmnRef" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
        </iframe>
    </div>    
</body>
</html>
