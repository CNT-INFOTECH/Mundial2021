<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.GeneralServlet" %>  




<html >
    <head>
<title>REGISTRATION</title>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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
<script type="text/javascript" src="jscRegistration.js"></script>
<script type="text/javascript" src="jscIndex.js"></script>     
<link href="buttons.css" rel="stylesheet" type="text/css" />
<link href="Registration.css" rel="stylesheet" type="text/css" />
<link href="Style_Popup.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/interface.js"></script>
  
<script type="text/javascript">
//window.onbeforeunload = function() { return "Doing so will close this page,And you will lose your unsaved changes."; }

 function SearchOwner(myname,w,h,scroll,vartype,OwnNum)
{
     var winPop = null;

    LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
    TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
    Details ='height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
    winPop = window.open('frmOwner.jsp?Type='+vartype+"&Num="+OwnNum,myname,Details)


}
function BreederSearch()
{

    $('#dialog-Breeder').dialog({ autoOpen: false,height: 550,width: 750, modal: true });
    $('#dialog-Breeder').dialog('open');
    return false;

}

 // this is for the onblur function in the reg#
 function PopulateValues(strRegNo)
 {                 
     if(strRegNo.value=='')
      {          
          return false;
      }
      seqval=document.getElementById("HdnRegSeq").value;
      /*if(seqval!='')
       {
              alert("passing seq");
        document.forms[0].target="_self";
        document.forms[0].method="post";
        document.forms[0].action="index.jsp?Mode=5&Seq="+seqval;
       }
       */    
       document.forms[0].target="_self";
       document.forms[0].method="post";
       document.forms[0].action="index.jsp?Mode=5&RegNum="+strRegNo.value;
       document.getElementById("regno").value=strRegNo.value;
       
       document.forms[0].submit();     
 }
function AddOwnerbtn_Index()
{    
     var val;
     var val_check=document.getElementById("HDNENTITYSEQ").value;
     
     if(val_check=="")
        {
          val ="";         
        } 
        else
        {
            val="disabled";
        }
    $('#dialog-OwnerInformation').dialog({ autoOpen: false,height: 400,width: 680, modal: true });
    $('#dialog-OwnerInformation').dialog('open');         
    $("#modalIFrame_OwnerInformation").attr('src','frmReg_OwnerInformation.jsp?status='+val+'&se='+val_check);
    /*$("#modalIFrame_OwnerInformation").attr('src','frmReg_OwnerInformation.jsp?status=disabled');*/
    
    return false;

}
function LoadPage(varseq)
{
    varseq_Val = document.getElementById(varseq).value
   
    document.forms[0].target="_self";
    document.forms[0].method="post";
    document.forms[0].action="index.jsp?Mode=5&RegSeq="+varseq_Val;
    document.forms[0].submit();
}

function NewRegistration()
{  
    if(document.forms[0].regno.value!="")
    {        
        alert("Before Clicking New Registration, Please Press Reset");
        return false;
    }                                                                                            
    var bConfirm= confirm("Do You Want To Automatically Generate The Registration Number Or Enter Manually.To Enter Automatically Press Ok, Else Press Cancel To Manually Fill The Registration Number");                                                        
    if (bConfirm)
    {
    GetAutoReg();
    document.forms[0].Registration_Type.value='R';
    document.forms[0].autoreg.value='A';
    }
    else
    {
    document.forms[0].autoreg.value='M';
    }
    document.forms[0].Registration_Type.value='R';    
}
function ChangeColor(obj)
{
    if(obj.value =='R')
    {
        document.getElementById("place_Lbl").style.color='blue';
        document.getElementById("Horseage_Lbl").style.color='blue';
        document.getElementById("Horsecolor_Lbl").style.color='blue';
        document.getElementById("org_Lbl").style.color='blue';
        document.getElementById("breeder_Lbl").style.color='blue';
    }
    else if(obj.value =='P')
    {
        document.getElementById("place_Lbl").style.color='red';
        document.getElementById("Horseage_Lbl").style.color='red';
        document.getElementById("Horsecolor_Lbl").style.color='red';
        document.getElementById("org_Lbl").style.color='red';
        document.getElementById("breeder_Lbl").style.color='red';
    }
    else if(obj.value =='S')
    {
        document.getElementById("place_Lbl").style.color='green';
        document.getElementById("Horseage_Lbl").style.color='green';
        document.getElementById("Horsecolor_Lbl").style.color='green';
        document.getElementById("org_Lbl").style.color='green';
        document.getElementById("breeder_Lbl").style.color='green';
    }
}
function BreederAddPopUp1(varname,varbred_Seq)
{       
    value_BredSeq = document.getElementById(varbred_Seq).value;
    if(value_BredSeq=='')
    {
    $('#dialog-BreederAdd').dialog({ autoOpen: false,height: 280,width: 625, modal: true });
    $('#dialog-BreederAdd').dialog('open');
    $("#modalIFrame_BreederAdd").attr('src','frmReg_BreederAddPopUp.jsp?STATUS=');    
    return false;
    }
    else
    {
    $('#dialog-BreederAdd').dialog({ autoOpen: false,height: 280,width: 625, modal: true });
    $('#dialog-BreederAdd').dialog('open');    
    $("#modalIFrame_BreederAdd").attr('src','frmReg_BreederAddPopUp.jsp?STATUS=disabled&srch=1&ENTITYSEQ='+value_BredSeq);   
    return false;
    }
}
function AddNewRegNo(varRegSeq)
{   
    valRegSeq = document.getElementById(varRegSeq).value;
    $('#dialog-AddNewRegNo').dialog({ autoOpen: false,height: 280,width: 325, modal: true });
    $('#dialog-AddNewRegNo').dialog('open');
    $("#modalIFrame_AddNewRegNo").attr('src','frmReg_AddNewRegNo.jsp?RegSeq='+valRegSeq);    
    return false;
}

</script>

<style type="text/css">
   
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
    <%@ taglib uri="/WEB-INF/tlds/Reference.tld" prefix="Reference"%>    
 <form name="Registrationform" >         
 <%@ include file="frmReg_ScreenAttributes.jsp"%>
 <%     
 
		
        String strHdnRegSeq="";
        String strMode="";
        String SaveYN="N";
        String EnabledDisable="";    
        if(request.getParameter("Mode")!=null)
            strMode=request.getParameter("Mode");
        
        if(strMode.equals("1"))
        {
        SaveYN="N";            
        session.removeAttribute("ses_REGSEQ");        
        EnabledDisable="";
        }
        if(strMode.equals("2") || strMode.equals("3"))
        {
            if(request.getParameter("RegNo")!=null)
            strHdnRegSeq =request.getParameter("RegNo");
            else
            strHdnRegSeq="";           
        }
        else if(session.getAttribute("ses_REGSEQ")!=null)
            strHdnRegSeq =(String) session.getAttribute("ses_REGSEQ");
        else
            strHdnRegSeq="";                
%>
     <%@ include file="frmPassoInclude.jsp"%>    
    <div id="container">
        <div id="header">
            <%@ include file="frmHeader.jsp"%>
        </div>

		<%
		if(!bRegistraion)
		response.sendRedirect("login.jsp");

		%>
                  
   <div id="content">                    
    <fieldset> <legend>Registry Details:</legend>
        <table class="altRow">
            <tr>
                <td width="15%">REG#</td>
                <td  width="26%">
                    <div id="NonEdit">                  
                    <input type="text"  name="regno" id="regno" <%=EnabledDisable%> 
                    maxlength="15" onChange="PopulateValues(this)"                   
                    value="<%=strreg_num%>"  style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:190px;">
                    <input type="text"  name="regno_Edit" id="regno_Edit" maxlength="15"  onblur="AjaxRegNumCheck(this,'regno','regno_Edit')"   onKeyUp="SaveMode()" value="<%=strreg_num%>"  
                    style="background-color:  #FFF8DC; border:  0px;text-transform: uppercase;visibility:hidden;width:0px;">
                    <input type="hidden" name="HdnRegSeq" id="HdnRegSeq" value="<%=strHdnRegSeq%>"/>                                       
                    </div>
                </td>
                <td nowrap width="10%">
                    <img src="Images/pencil_icon1.gif" onclick="RegEdit()" >
                    <img src="Images/Find12.jpg" onClick='RegSearch()' />
                    <img src="Images/Notepad-icon1.png" onClick='AddNewRegNo("HdnRegSeq")' /> 
                </td>
                <td nowrap width="14%">TYPE OF REGISTRY</td>
                <td nowrap width="30%">
                    <select name="registrytype" id="registrytype" onchange="SaveMode()"  style="background-color:  #FFF8DC; border:  1px solid #000000;width:190px;text-transform: uppercase;" >                     
                    <option value=''>Select</option>
              <%
                    String strSelected_RegType1="";
                    String strSelected_RegType2="";                    
              if(strreg_type.equals("CERTIFICADO"))
                  strSelected_RegType1="SELECTED";
              else  if(strreg_type.equals("DENUNCIADO"))
                  strSelected_RegType2="SELECTED";            
              %>
                    <option value='CERTIFICADO' <%=strSelected_RegType1%> >CERTIFICADO</option>
                    <option value='DENUNCIADO'  <%=strSelected_RegType2%> >DENUNCIADO</option>                        
                  </select>    
                </td>
                <td nowrap width="5%"></td>
            </tr>
            <tr>
                <td>REGISTERED DATE</td>
                <td colspan="2">
                    <input type="text" id="datepicker" name="date" placeholder="MM/DD/YYYY" size="9" value="<%=strdate%>" style="background-color:  #FFF8DC; border:  1px solid #000000;width:190px;">
                </td>
                <td>REGISTERED BY</td>
                <td>
                    <input type="text" name="registeredby" id="registeredby"  value="<%=strreg_user%>" onKeyUp="SaveMode()" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:190px">
                </td>
                <td></td>
            </tr>
            <tr>
                <td>CASO DNA#</td>
                <td colspan="2">
                    <input type="text" name="casodna"  value="<%=strcaso_num%>" onKeyUp="SaveMode()" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:190px">
                </td>
                <td>DNA</td>
                <td>
                <%
                String strSelectedRP="";
                String strSelectedVP="";
                String strSelectedTE="";
                String strSelectedTS="";
                if(strdna.equals("RP"))
                strSelectedRP="Checked";
                else  if(strdna.equals("VP"))
                strSelectedVP="Checked";
                else  if(strdna.equals("TE"))
                strSelectedTE="Checked";
                else  if(strdna.equals("TS"))
                strSelectedTS="Checked";
                %>
                <input type="checkbox" name="RP_dna" onclick="DNA_VAL(this)" onchange="SaveMode()" style="background-color:  #FFF8DC;width:25px;border:  1px solid #000000;text-transform: uppercase;" <%=strSelectedRP%> /> RP             
                <input type="checkbox" name="VP_dna" onclick="DNA_VAL(this)" onchange="SaveMode()" style="background-color:  #FFF8DC;width:25px;border:  1px solid #000000;text-transform: uppercase;" <%=strSelectedVP%> /> VP              
                <input type="checkbox" name="TE_dna" onclick="DNA_VAL(this)" onchange="SaveMode()" style="background-color:  #FFF8DC;width:25px;border:  1px solid #000000;text-transform: uppercase;" <%=strSelectedTE%> /> TE              
                <input type="checkbox" name="TS_dna" onclick="DNA_VAL(this)" onchange="SaveMode()" style="background-color:  #FFF8DC;width:25px;border:  1px solid #000000;text-transform: uppercase;" <%=strSelectedTS%> /> TS 
                </td>
                <td></td>
            </tr>
            <tr>
                <td>REGISTRATION TYPE</td>
                <td colspan="2">
                    <select name="Registration_Type" id="Registration_Type" onchange="ChangeColor(this),SaveMode()" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:190px" >                                  
                <option value=''>Select</option>
                <%
                String strSelectedR="";
                String strSelectedP="";
                String strSelectedS="";
                if(strRegistration_Type.equals("R"))
                {
                    strSelectedR="SELECTED";
                    FontColor="blue";
                }
                else  if(strRegistration_Type.equals("P"))
                {
                    strSelectedP="SELECTED";
                    FontColor="red";
                }
                else  if(strRegistration_Type.equals("S"))
                {
                    strSelectedS="SELECTED";
                    FontColor="green";
                }
                %>
                <option value='R' <%=strSelectedR%> >REGISTRATION</option>
                <option value='P' <%=strSelectedP%> >PEDIGREE</option>
                <option value='S' <%=strSelectedS%> >SHOW</option>
                </select>
                </td>
                <td>REG STATUS</td>
                <td>
                    <select name="Reg_Status" id="Reg_Status" onchange="SaveMode()" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:190px;" >                     
                    <option value=''>Select</option>
              <%
                    String strSelected_RegStatus1="";
                    String strSelected_RegStatus2="";                    
              if(strReg_Status.equals("COMPLETED"))
                  strSelected_RegStatus1="SELECTED";
              else  if(strReg_Status.equals("IN PROGRESS"))
                  strSelected_RegStatus2="SELECTED";            
              %>
                <option value='COMPLETED' <%=strSelected_RegStatus1%> >COMPLETED</option>
                <option value='IN PROGRESS'  <%=strSelected_RegStatus2%> >IN PROGRESS</option>                        
                </select> 
                </td>
                <td>              
                <%
                if(strCOUN>0)
                {
                %>                
                <img src="Images/Obsev_Loader.gif"  alt="O" align="right" />                
                <%}else{%>               
                <%}%>
                </td>       
            </tr>            
        </table>      
        </fieldset> <br>
        <fieldset> <legend>Horse Information:</legend>
        <table class="altRow">
            <tr>
                <td width="15%">NAME</td>
                <td colspan="7">
                    <input type="text" name="Horsename" id="Horsename" onKeyUp="SaveMode()" maxlength="60"  value="<%=strhor_name%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:598px;">
                </td>         
                <td nowrap width="3%"><label style="visibility:hidden;width:5%;">FOR SPACE</label></td>
            </tr>
            <tr>
                <td width="15%">GENDER</td>
                <td width="26%">
                    <select name="Horsegender" onchange="SaveMode()" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:190px" >                                  
                    <option value=''>Select</option>
                  <%
                        String strSelected_Male="";
                        String strSelected_Female="";   
                        String strSelected_Gelding="";
                  if(strhor_gender.equals("MALE"))
                      strSelected_Male="SELECTED";
                  else  if(strhor_gender.equals("FEMALE"))
                      strSelected_Female="SELECTED";            
                  else  if(strhor_gender.equals("GELDING"))
                      strSelected_Gelding="SELECTED";
                  %>
                    <option value='MALE' <%=strSelected_Male%> ><%=male%></option>
                    <option value='FEMALE'<%=strSelected_Female%>><%=female%></option>
                    <option value='GELDING'<%=strSelected_Gelding%>><%=gelding%></option>              
                  </select>
                </td>   
                <td width="10%"><label style="visibility:hidden;">FORSPACE</label></td>
                <td nowrap>BIRTH DATE</td>
                <td colspan="2" width="5%">
                    <input type="text" name="Horsebirthdate" size="9" placeholder="MM/DD/YYYY" id="datepicker_DOB"  onchange="agecal('datepicker_DOB','Deathdate_datepicker'),SaveMode()" onkeyup="SaveMode()" size="8" value="<%=strhor_dob%>" style="background-color:  #FFF8DC;border:  1px solid #000000;">
                </td>                
                <td colspan="2">AGE     <img src="Images/icon_age.png" onclick="getAgePopup()" alt="findIcon"/>
                    <input type="hidden" name="Horseage" id="Horseage" size="18" value="<%=strhor_age%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" ReadOnly>
                    <label  id="Horseage_Lbl"  style="color: <%=FontColor%>;font-size:9pt;font-weight:bold;text-transform: uppercase;"><%=age_MD%></label>       
                    <label  id="Hor_daysDiff"   style="color: <%=FontColor%>;font-size:9pt;font-weight:bold;text-transform: uppercase;"></label> 
                </td>                                          
                <td>
                    <label  id="inYears"  style="visibility:hidden;"> </label>       
                    <label  id="inMonths" style="visibility:hidden;"> </label>       
                    <label  id="inDays"   style="visibility:hidden;"> </label> 
                </td>
            </tr>  
            <tr>
                <td>MODALITY</td>
                <td>
                    <select name="modality" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:190px;" onchange="SaveMode()">                                  
                    <option value=''>Select</option>
                  <%
                        String strSelected_Mod1="";
                        String strSelected_Mod2="";                    
                        String strSelected_Mod3="";                    
                        String strSelected_Mod4="";                    
                  if(strhor_aire.equals("PASO FINO"))
                      strSelected_Mod1="SELECTED";
                  else  if(strhor_aire.equals("TROCHA"))
                      strSelected_Mod2="SELECTED";            
                  else  if(strhor_aire.equals("TROCHA Y GALOPE"))
                      strSelected_Mod3="SELECTED";
                  else  if(strhor_aire.equals("TROTE Y GALOPE"))
                      strSelected_Mod4="SELECTED";
                  %>
                    <option value='PASO FINO' <%=strSelected_Mod1%> >PASO FINO</option>
                    <option value='TROCHA' <%=strSelected_Mod2%> >TROCHA</option> 
                    <option value='TROCHA Y GALOPE' <%=strSelected_Mod3%> >TROCHA Y GALOPE</option> 
                    <option value='TROTE Y GALOPE' <%=strSelected_Mod4%> >TROTE Y GALOPE</option>                 
                    </select>
                </td>
                <td></td>
                <td colspan="1">MICROCHIP#</td>
                <td colspan="4">
                    <input type="text" name="microchip"  value="<%=strmicro_num%>" onKeyUp="SaveMode()" style="width:258px;background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
                </td>
                <td nowrap></td>
            </tr>
            <tr>
                <td width="35%" NOWRAP>ORGANIZATION <img src="Images/dropdown_icon4.gif" onClick="OpenCommonRef1('ORGANIZATION','orgSeq','org_Lbl','org')" /></td>
                <td>
                    <input type="hidden" name="orgSeq"  id="orgSeq" value="<%=strorgSeq%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"   >
                    <input type="hidden" name="org" id="org" size="18" value="<%=strorg%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"   Readonly>
                    <label id="org_Lbl"  style="color: <%=FontColor%>;font-size:9pt;font-weight:bold;text-transform: uppercase;"><%=strorg%></label>           
                </td>
                <td></td>
                <td colspan="2">BREEDER       <img src="Images/Find12.jpg" onClick="BreederSearch()" /></td>
                <td colspan="3">
                    <input type="hidden" name="breederSeq" id="breederSeq" value="<%=strhor_breederSeq%>"  >
                    <input type="hidden" name="breeder" size="15" id="breeder" value="<%=strhor_breeder%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"   Readonly>                         
                    <label id="breeder_Lbl" style="color: <%=FontColor%>;font-size:9pt;font-weight:bold;text-transform: uppercase;"><%=strhor_breeder%></label>                                
                </td>
                <td nowrap></td>
            </tr>
            <tr>
                <td>COLOR <img src="Images/dropdown_icon4.gif" onClick="OpenCommonRef1('COLOR','colorSeq','Horsecolor_Lbl','Horsecolor')" /></td>                
                <td>
                    <input type="hidden" name="colorSeq"  id="colorSeq" value="<%=strreg_colorSeq%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"   >
                    <input type="hidden" name="Horsecolor" size="14" id="Horsecolor" value="<%=strhor_color%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"  Readonly>
                    <label id="Horsecolor_Lbl"  style="color: <%=FontColor%>;font-size:9pt;font-weight:bold;text-transform: uppercase;"><%=strhor_color%></label>
                </td>                
                <td></td>
                <td colspan="2" nowrap>PLACE OF BIRTH   <img src="Images/Find12.jpg" onClick="PlaceOfBirthSearch()" /></td>
                <td colspan="3">
                    <input type="hidden" name="placeSeq" id="placeSeq" value="<%=strreg_placeSeq%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"   >
                    <input type="hidden"  name="place" size="18" id="place" value="<%=strreg_place%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"   readonly>
                    <label id="place_Lbl"  style="color: <%=FontColor%>;font-size:9pt;font-weight:bold;text-transform: uppercase;"><%=strreg_place%></label>     
                </td>
                <td nowrap></td>
            </tr>
            <tr>
                <td nowrap><font color='#000000'>DATE GELDED</font></td>
                <td>
                    <input type="text" name="Horsedategelded" placeholder="MM/DD/YYYY"  onchange="agecal('datepicker_DOB','datepicker_Dategelded'),SaveMode()" onkeyup="SaveMode()" value="<%=strhor_gelding_date%>" id="datepicker_Dategelded" style="background-color:  #FFF8DC;width:190px;border:  1px solid #000000;text-transform: uppercase;">          
                </td>
                <td></td>
                <td nowrap>DEATH DATE</td>
                <td colspan="2">
                    <input type="text" name="Horsedeathdate" placeholder="MM/DD/YYYY" onchange="agecal('datepicker_DOB','Deathdate_datepicker'),SaveMode()" onkeyup="SaveMode()"  value="<%=strhor_deathdate%>" id="Deathdate_datepicker" size="9" style="background-color:#FFF8DC;border:1px solid #000000;">
                </td>                                                
                <td colspan="2" nowrap>EMBRYO TRANSFER
                    <select name="Emb_Transfer"  id="Emb_Transfer" onchange="SaveMode()" style="background-color:  #FFF8DC; border:  1px solid #000000;width:63px;" >                                     
                    <option value=''>Select</option>
                  <%
                        String strSelected_Yes="";
                        String strSelected_No="";                    
                  if(strEmb_Transfer.equals("YES"))
                      strSelected_Yes="SELECTED";
                  else  if(strEmb_Transfer.equals("NO"))
                      strSelected_No="SELECTED";            
                  %>
                    <option value='YES' <%=strSelected_Yes%> >YES</option>
                    <option value='NO'<%=strSelected_No%> >NO</option>                          
                    </select>
                </td>
                <td nowrap ></td>
            </tr>
        </table>                      

        <input type="hidden" value="<%=strSire%>" name="Sire" id="Sire"/>
        <input type="hidden" value="<%=strDam%>" name="Dam" id="Dam"/>
               
        </fieldset> <br/>
        <fieldset> <legend>Current Owner:</legend>
        
        <table class="altRow" >
            <tr>
                <th  width="100px">ID#</th>
                <th  width="200px">NAME</th>
                <th  width="100px">ADDRESS1</th>
                <th  width="100px">ADDRESS2</th>
                <th  width="50px">CITY</th>
                <th  width="50px">STATE</th>
                <th  width="50px">ZIP</th>
                <th  width="50px">COUNTRY</th>
                <th  width="100px">PHONE</th>
                <th  width="100px">EMAIL</th>
            </tr>	
<%
String srchOwner="";
if(request.getParameter("so")!=null)
{
       srchOwner=request.getParameter("so");
       if(request.getParameter("se")!=null )    
        strEntitySeq=request.getParameter("se").trim();
}
else
    srchOwner="";
GeneralServlet gen_Owner=new GeneralServlet();
RowSetFactory factory12crs = RowSetProvider.newFactory();
CachedRowSet crs= factory12crs.createCachedRowSet();
if(strEntitySeq.length()!=0 && srchOwner.equals("y"))
crs = gen_Owner.Get_IndividualsEntityDetails(strEntitySeq);

if(crs.next())
{   
    strOwnerNo="";
    strEntitySeq="";
    strmem_num="";
    strOrg_Name="";
    strmem_name="";
    strmem_lname="";
    strmem_mname="";
    strmem_add1="";
    strmem_add2="";
    strmem_city="";
    strmem_state="";
    strmem_zip="";
    strmem_country="";
    strmem_phone="";
    strmem_email="";
    strOwnerNo="";
    
    if(crs.getString("ENTITYSEQ")!=null)                                  
        strEntitySeq= crs.getString("ENTITYSEQ").trim();

    if(crs.getString("ASSIGNEDNUM")!=null)
    strOwnerNo=crs.getString("ASSIGNEDNUM");     

    if(crs.getString("OWNER_TYPE")!=null)                              
        strOwn_Type= crs.getString("OWNER_TYPE").trim();                

    if(crs.getString("ORGANIZATION_NAME")!=null)                                  
        strOrg_Name= crs.getString("ORGANIZATION_NAME").trim();                

    if(crs.getString("MEMBER_NUM")!=null)                              
        strmem_num= crs.getString("MEMBER_NUM").trim();                            

    if(crs.getString("FIRSTNAME")!=null)                                  
        strmem_name= crs.getString("FIRSTNAME").trim();

    if(crs.getString("LASTNAME")!=null)                              
        strmem_lname= crs.getString("LASTNAME").trim();                

    if(crs.getString("ADDRESS1")!=null)                                  
        strmem_add1= crs.getString("ADDRESS1").trim();

    if(crs.getString("ADDRESS2")!=null)                  
        strmem_add2= crs.getString("ADDRESS2").trim();

    if(crs.getString("CITY")!=null)                  
        strmem_city= crs.getString("CITY").trim();

    if(crs.getString("STATE")!=null)                  
        strmem_state= crs.getString("STATE").trim();

    if(crs.getString("ZIP")!=null)                  
        strmem_zip= crs.getString("ZIP").trim();

    if(crs.getString("COUNTRY")!=null)                  
        strmem_country= crs.getString("COUNTRY").trim();

    if(crs.getString("PHONE")!=null)                  
        strmem_phone= crs.getString("PHONE").trim();

    if(crs.getString("EMAIL")!=null)                                  
        strmem_email= crs.getString("EMAIL").trim();

    if(crs.getString("SUFFIX")!=null)                  
        strmem_mname= crs.getString("SUFFIX").trim();

   // strOwnerName=strmem_name+" "+strmem_lname;
}
%>
            <tr>    
                    <input type="hidden"  size="5" name="HDNMEMBER_NUM" id="HDNMEMBER_NUM"  class="text ui-widget-content ui-corner-all" value="<%=strmem_num%>"/>
                    <input type="hidden"   name="HDNMEMBER_NAME" id="HDNMEMBER_NAME"  class="text ui-widget-content ui-corner-all" value="<%=strmem_name%>"/>
                    <input type="hidden"   name="HDNEFFECTIVE_DATE" id="HDNEFFECTIVE_DATE"  class="text ui-widget-content ui-corner-all" value="<%=strEffectivedate%>"/>
                    <input type="hidden"   name="HDNMEMBER_MNAME" id="HDNMEMBER_MNAME"  class="text ui-widget-content ui-corner-all" value="<%=strmem_mname%>"/>
                    <input type="hidden"  name="HDNMEMBER_LNAME" id="HDNMEMBER_LNAME"  class="text ui-widget-content ui-corner-all" value="<%=strmem_lname%>"/>
                    <label  id="HDNENTITYSEQ_VAL" style="visibility:hidden"  > <%=strEntitySeq%></label>
                    <input type="hidden"  size="4" name="HDNENTITYSEQ" id="HDNENTITYSEQ"  class="text ui-widget-content ui-corner-all" value="<%=strEntitySeq%>"/>
                    <label  id="HDNOWNER_TYPE_VAL" style="visibility:hidden" > <%=strOwn_Type%></label>
                    <input type="hidden"  name="HDNOWNER_TYPE" id="HDNOWNER_TYPE"  class="text ui-widget-content ui-corner-all" value="<%=strOwn_Type%>"/>
                    <label  id="HDNORG_NAME_VAL" style="visibility:hidden" > <%=strOrg_Name%></label>
                    <input type="hidden"  name="HDNORG_NAME" id="HDNORG_NAME"  class="text ui-widget-content ui-corner-all" value="<%=strOrg_Name%>"/>
                <td nowrap>                                                            
                    <input type="text"  size="3" name="HDNOWNER_NO" id="HDNOWNER_NO"                      
                    style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"
                    value="<%=strOwnerNo%>" onblur="Ajax_PopulateOwnerInfm(this.value,'HDNENTITYSEQ','HDNOWNER_NO','HDNOWNER_TYPE','HDNMEMBER_NUM','OWNER_NAME_VAL','ADDRESS1_VAL','ADDRESS2_VAL','CITY_VAL','STATE_VAL','ZIP_VAL','COUNTRY_VAL','PHONE_VAL','EMAIL_VAL')"/>
                    <img src="Images/Find12.jpg" onClick="OwnerSearch('','pop','1','O')" />                    
                    <!--onClick="SearchOwner('Owner',600,550,'yes','1','1')"/>-->
                    <input type="hidden" name="HdnSeqNo_Mem" id="HdnSeqNo_Mem" value="<%=strHdnSeqNo_Mem%>">
                </td>
                <td>
                    <%
                        if(strOwn_Type.equals("INDIVIDUAL") ||strOwn_Type.equals("YOUTH RIDER")  ||(strOwn_Type.equals("") && strOrg_Name.equals("") ))
                            strOwnerName=strmem_name+" "+strmem_lname;
                        else
                            strOwnerName=(String) strOrg_Name;
                    %>                        
                    <label  id="OWNER_NAME_VAL" style="font-size:9pt;font-weight:bold;text-transform: uppercase;"><a onclick="EditOwner('<%=strEntitySeq%>')"><%=strOwnerName%></a></label><!--onclick="AddOwnerbtn_Index()"-->
                    <input type="hidden"  size="5" name="HDNOWNERFULLNAME" id="HDNOWNERFULLNAME"  class="text ui-widget-content ui-corner-all" value="<%=strOwnerName%>"/>
                </td>
                <td>
                    <label  id="ADDRESS1_VAL" style="text-transform: uppercase;"> <%=strmem_add1%> </label>
                    <input type="hidden"  size="5" name="HDNMEMBER_ADDRESS1" id="HDNMEMBER_ADDRESS1"  class="text ui-widget-content ui-corner-all" value="<%=strmem_add1%>"/>
                </td>
                <td>
                   <label  id="ADDRESS2_VAL" style="text-transform: uppercase;"> <%=strmem_add2%> </label>
                   <input type="hidden"  size="5" name="HDNMEMBER_ADDRESS2" id="HDNMEMBER_ADDRESS2"  class="text ui-widget-content ui-corner-all" value="<%=strmem_add2%>"/>
                </td>
                <td>
                   <label  id="CITY_VAL" style="text-transform: uppercase;"> <%=strmem_city%> </label>
                   <input type="hidden"  size="5" name="HDNMEMBER_CITY" id="HDNMEMBER_CITY"  class="text ui-widget-content ui-corner-all" value="<%=strmem_city%>"/>
                </td>
                <td>
                   <label  id="STATE_VAL" style="text-transform: uppercase;"> <%=strmem_state%> </label>
                   <input type="hidden"  size="5" name="HDNMEMBER_STATE" id="HDNMEMBER_STATE"  class="text ui-widget-content ui-corner-all" value="<%=strmem_state%>" />
                </td>
                <td>
                   <label  id="ZIP_VAL" style="text-transform: uppercase;"> <%=strmem_zip%> </label>
                   <input type="hidden"   size="5" name="HDNMEMBER_ZIP" id="HDNMEMBER_ZIP"  class="text ui-widget-content ui-corner-all" value="<%=strmem_zip%>"/>
                </td>
                <td>
                   <label  id="COUNTRY_VAL" style="text-transform: uppercase;"> <%=strmem_country%> </label>
                   <input type="hidden"  size="5" name="HDNMEMBER_COUNTRY" id="HDNMEMBER_COUNTRY"  class="text ui-widget-content ui-corner-all" value="<%=strmem_country%>"/>
                </td>
                <td>
                  <label  id="PHONE_VAL" style="text-transform: uppercase;"> <%=strmem_phone%> </label>
                  <input type="hidden"  size="5" name="HDNMEMBER_PHONE" id="HDNMEMBER_PHONE"  class="text ui-widget-content ui-corner-all" value="<%=strmem_phone%>"/>
                </td>
                <td>
                  <label  id="EMAIL_VAL" style="text-transform: uppercase;">  <%=strmem_email%></label>
                  <input type="hidden"  size="5" name="HDNMEMBER_EMAIL" id="HDNMEMBER_EMAIL"  class="text ui-widget-content ui-corner-all" value="<%=strmem_email%>"/>
                </td>
            </tr>
            <tr class="buttonstyle">
                <td  colspan=10>    
					<input type="button" id="PrintDraf" class="button" value="Print Draft" onclick="Certificate_Registration('Y')"
					<% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> /> 
                    <input type="button" id="IssueCertificate" class="button" value="Issue Certificate" onclick="Certificate_Registration('IC')"
					<% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> /> 	
                    <input type="button" id="New" class="button" onclick="NewRegistration()" value="New"
					<% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%>/>
                    <!--<input type="button" id="AddOwnerbtn" class="button" value="Owner Information"  onclick="AddOwnerbtn_Index()"/>-->
                    <input type="button" id="Save_Index" onclick="SaveRegistration_Index('index.jsp')" class="button" value="Save" <%=Button_Status%> 
					<% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%>/>
                    <%--<input type="button" id="Save_Continue" class="button" value="Save & Continue" />--%>
                    <input type="button" id="Reset" class="button" value="Reset"onclick="Reset_Index()" />
                    <!--<input type="button" id="CloseIndex" class="button" value="Close" onclick="Close_Paso('close.jsp')" />-->
                    <input type="button" id="Previous" onclick="CheckSave('frmObservations.jsp')" class="button" value="&laquo;" />
                    <input type="button" id="Next" onclick="CheckSave('Images.jsp')" class="button" value="&raquo;" />                                    
                                       
                </td>
            </tr>
        </table>  <input type="hidden" name="SavedYN" id="SavedYN" value="<%=SaveYN%>"/>
        
        </fieldset>
        
            </div>


    <div id="sidebar">
        <%@ include file="index_Side.jsp"%>
    </div>

    <div id="footer_Bot" align="bottom">
    <jsp:include page="/frmBottom_Registration.jsp"/>
    </div>

    </div>
    
    <div id="dialog-Breeder" title="SEARCH BREEDER" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="BreederPopup_Reg.jsp"  id="modalIFrame_BreederSearch" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
        </iframe>
    </div>
    <div id="dialog-Org" title="SEARCH ORGANIZATION" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="OrganisationPopup_Reg.jsp"  id="modalIFrame_OrgSearch" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
        </iframe>
    </div>
    <div id="dialog-Reg" title="SEARCH REGISTRATION" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="regsearchpopup.jsp"  id="modalIFrame_Show" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
        </iframe>
    </div>
    <div id="dialog-OwnerInformation" title="OWNER INFORMATION" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe   id="modalIFrame_OwnerInformation" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="no">
        </iframe>
    </div>   
    <div id="dialog-Age" title="AGE" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="frmAgeCalculator.jsp"  id="modalIFrame_Age" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="no">
        </iframe>        
    </div> 
    <div id="dialog-CmmnRef" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe id="modalIFrame_CmmnRef" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
        </iframe>
    </div>
    <div id="dialog-Calculator" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe src="frmCalculator.jsp" id="modalIFrame_Calculator" width="100%" height="100%" marginwidth="0" marginheight="0"  frameborder="0" >
        </iframe>
    </div>
    <div id="dialog-BreederAdd" title="BREEDER" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe id="modalIFrame_BreederAdd" width="100%"  height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
        </iframe>
    </div>        
    <div id="dialog-PlaceOfBirth" title="SEARCH PLACE" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe  id="modalIFrame_PlaceOfBirth" width="100%" height="100%" marginwidth="0" marginheight="0"  frameborder="0" scrolling="yes">
        </iframe>
    </div>
    <div id="dialog-Certificate" title="CERTIFICATE" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe id="modalIFrame_Certificate" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
        </iframe>
    </div>
    <div id="dialog-AddNewRegNo" title="OLD REG#'s" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe id="modalIFrame_AddNewRegNo" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
        </iframe>
    </div>


          <input type="hidden" value="" name="autoreg" id="autoreg">
          <input type="hidden" name="HdnCertificate" id="HdnCertificate"/>
          <input type="hidden" name="PAGEID" id="PAGEID" value="REGISTRATION">
          <input type="hidden" name="HdnEdit" id="HdnEdit" value="N">
          <input type="hidden" name="KeyValue" id="KeyValue" value="">
</form>
</body>
</html>