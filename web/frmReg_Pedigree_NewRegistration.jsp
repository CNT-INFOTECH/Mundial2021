<%-- 
    Document   : frmReg_Pedigree_NewRegistration
    Created on : Aug 8, 2011, 12:20:35 PM
    Author     : Erzath
--%>

<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

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
        <link href="NewReg.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="jscIndex.js"></script>             
        <script type="text/javascript" src="scripts/SRegistration.js"></script>  
<script type="text/javascript">

function trim11 (str) {
	str = str.replace(/^\s+/, '');
	for (var i = str.length - 1; i >= 0; i--) {
		if (/\S/.test(str.charAt(i))) {
			str = str.substring(0, i + 1);
			break;
		}
	}
	return str;
}
function SaveRegistration_Ped(URL)
{              
    if(trim11(document.forms[0].HorseName_P.value) =='')
    {
        alert("Please Enter Horse Name");
        return false;
    }
    
    if(URL!='')
    {
    document.forms[0].method="post";
    document.forms[0].action="RegistrationServlet?URL="+URL;
    document.forms[0].target="_self";                                                                
    document.forms[0].submit();
    }
   //  return false;
  document.forms[0].SavedYN.value='Y';
}
function Close_NewReg_Ped(URL)
{   
    if(document.getElementById('SavedYN').value=='N')
    {
        var bConfirm= confirm("Do You Want To Save The Changes?");                                                        
        if (bConfirm)
        {
            SaveRegistration_Ped(URL);
        }
        else
        {
            window.parent.jQuery('#dialog-NewReg').dialog('close')
        }
    }
    window.parent.jQuery('#dialog-NewReg').dialog('close')
}
function Reset_NewReg_Ped()
{
    document.forms[0].method="post";
    document.forms[0].action="frmReg_Pedigree_NewRegistration.jsp?Mode=1";
    document.forms[0].target="_self";                                                                
    document.forms[0].submit();   
}
function CheckNewReg_save()
{
document.getElementById('SavedYN').value='N'; 
}

function GetHorseName_ByNum_RegPedigree(RegNum,Seq,RegSeq,Label,varGender)
{

   var CheckVal=trim11(RegNum)
    if(CheckVal=='')
        return false;

var xmlhttp;

if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {

  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {

        if(xmlhttp.responseText.length >0)
        {

              var Items=xmlhttp.responseText.split('#@#')
            if(Items[0]=='')
            {
                 alert("Registration number does not exist")
                 document.getElementById(RegSeq).value="";
            }

            else
            {
                document.getElementById(Seq).value=trim11(Items[0])
                document.getElementById(RegSeq).value=trim11(Items[1])
                document.getElementById(Label).innerHTML=trim11(Items[2])
            }              
        }
    }
  }
xmlhttp.open("GET","Ajax?PageID=GETHORSE_NAME&ChkValue="+CheckVal+"&Gender="+varGender,true);
xmlhttp.send();
}

function ClearFields_Shrt(var1,var2,lbl3)
{   
    if(document.getElementById(var1).value=='')
    {
       
        document.getElementById(var1).value=''
        document.getElementById(var2).value=''
        document.getElementById(lbl3).innerHTML=''
    }   
}
function SearchSireDam_RegPedigree(myname,w,h,scroll,varType,SireNum)
{
    var winPop = null;

    LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
    TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
    Details ='height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
    winPop = window.open('frmSearchSire.jsp?Type='+varType+"&Num="+SireNum,myname,Details)
}
function getAge_Months_RegPedigree(varDate,RetnObj,varEventSeq) {

    if( trim11(varDate)=='' )
    {
    return false
    }
var xmlhttp;

if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
        document.getElementById(RetnObj).innerHTML=xmlhttp.responseText
    }
  }
 
xmlhttp.open("GET","frmAjaxGetAge.jsp?Type=MD&Begin="+varDate+"&End="+varEventSeq,true);
xmlhttp.send();

  }
function AjaxRegNumCheck_NewPed(Obj)
{     
    var txtregno_value = Obj.value;    
        
    if(txtregno_value=='')//This part if the user uses the same Reg# while updating
    {
        return false;
    }
    else//This part if the user changes the Reg# in the updation
    {
        var xmlhttp;

        if (window.XMLHttpRequest)
        {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
        }
        else
        {// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange=function()
        {
            if (xmlhttp.readyState==4 && xmlhttp.status==200)
            {
              if(xmlhttp.responseText==0)
              {                     
                  return false             
              }
              else
              {
                  var Items=xmlhttp.responseText; 
                  alert("Registration Number Already Exist.");
                  Obj.value="";                               
                  Obj.focus();
              }
            }
        }
        xmlhttp.open("GET","RegistrationServlet?PAGEID=REGISTRATION_NUM_CHECK&RegNo="+txtregno_value,true);
        xmlhttp.send(); 
    }
}
</script>
<style type="text/CSS">
body {  font: .89em "Trebuchet MS", Arial, Sans-Serif;}

fieldset { padding:20px;  }
input, textarea, select {font:12px/12px Arial, Helvetica, sans-serif; padding:0;}
fieldset.action {background:#9da2a6; border-color:#e5e5e5 #797c80 #797c80 #e5e5e5; margin-top:-20px;}
#footer_Bot {
	clear:both;
	text-align:center;	
	height:25px;
	padding:5px;
        bottom: auto;
}
		
.ui-datepicker
{
    font-family:TimesNewRoman;
    font-size: 10px;
    margin-left:0px;
    margin-top: 0px;
    line-height: 1.0em;
}

</style>
    </head>
    <body>
        <form name="Reg_Pedigree_NewRegistration">
            <%@ include file="frmReg_Pedigree_NewRegInclude.jsp"%>
        <table width="100%" border="0" cellspacing="1" cellpadding="2">
            <th colspan="11" class="Grid_Header" > HORSE INFORMATION&nbsp;&nbsp;           
            </th>
            <tr>&nbsp;</tr>
            <tr>
              <td width="96"><font class="label">NAME</font></td>
              <td nowrap colspan="11" >
                <input type="hidden" name="RegSeq_P" id="RegSeq_P"
                    value="<%=strHdnRegSeq%>">                
                <input type="text"  name="HorseName_P" id="HorseName_P" size="80" onchange="CheckNewReg_save()"
                class="allcaps"
                 value="<%=strhor_name%>">
              </td>
            </tr>
            <tr>
              <td width="96"><font class="label">REG#</font></td>
              <td colspan="3">
                <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
                       name="RegNum_P" id="RegNum_P" size="15" onChange="AjaxRegNumCheck_NewPed(this)" 
                       value="<%=strreg_num%>">
                       <input type="hidden" name="regno" id="regno" />
              </td>
              <!--<td width="46" colspan="2"><font class="label">GENDER</font></td>-->
              <!--<td colspan="2">-->
                <Select  style="background-color:  #FFF8DC; border:  1px solid #000000;visibility:hidden;" name="HGender" ONCHANGE="CheckNewReg_save()">
                  <option value="">Select</option>
                  <% String[] strGendOption={"MALE","FEMALE","GELDING"};
                   for(int gen=0;gen <strGendOption.length;gen++)
                    {
                        if(strGendOption[gen].equalsIgnoreCase(strhor_gender))
                        { 
                       %>
                  <option selected><%=strhor_gender%></option>
                  <% }
                        else{%>
                  <option><%=strGendOption[gen]%></option>
                  <%}
                    }%>
                </Select>
              <!--</td>-->
              <td width="123">
              <font class="label">PLACE&nbsp;OF&nbsp;BIRTH</font>
              </td>
              <td>
              <img alt="" src="Images/dropdown_icon4.gif"  onClick="PlaceOfBirthSearch()"/>
              </td>
              <td colspan="5" width="696">                            
                <input type="hidden"  name="place" size="18" id="place" value="<%=strreg_place%>"
                style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"   
                readonly />
                <label id="place_Lbl"  style="color:blue;text-transform: uppercase;"><%=strreg_place%></label>                       
              </td>
                                    <!--onClick="OpenCommonRef('Place','Place','PlaceVal')"/></td>-->
            </tr>
            <tr>
              <td width="96"><font class="label">BIRTH DATE</font></td>
              <td width="57">
                <input type="text"  class="allcaps" placeholder="MM/DD/YYYY"
                       name="Preg_HDOB" id="Preg_HDOB" size="15"
                       value="<%=strhor_dob%>"
                       onChange="agecal('Preg_HDOB','Preg_HDeath')">					   
               <input type="hidden"  class="allcaps"
                       name="Preg_HDeath" id="Preg_HDeath" size="7"
                       value="<%=strhor_dob%>"
                       onChange="agecal('Preg_HDOB','Preg_HDeath')">	
                </td>
              <td width="43" colspan="3" nowrap>
                <!--<input type="text"  class="allcaps" ReadOnly name="Preg_HAGE"  size="1" value="<%=strhor_age%>" >-->
              <input type="hidden" name="Horseage" id="Horseage" size="2" value="<%=strhor_age%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" ReadOnly>
              <label  id="Horseage_Lbl"  style="color: blue;text-transform: uppercase;"><%=strhor_age%></label>       
              <label  id="Hor_daysDiff"   style="color: blue;text-transform: uppercase;"></label> 				
                </td>
              <!--<td width="67"><font class="dateStyleBody">MONTHS</font></td>-->
              <td width="46"><font class="label">COLOR</font></td>
              <td width="60"><font class="label">
                <input type="hidden"   class="allcaps"
                    name="ColorSeq" id="ColorSeq" size="10"   value="<%=strreg_colorSeq%>">
                <input type="text"  id="ColorValue"  class="allcaps"
                    name="ColorValue" size="10"   value="<%=strhor_color%>" >             
                </font>
                <input type="hidden" id="ColorLValue" >
                
                </td>
              <td width="33"><img alt="" src="Images/dropdown_icon4.gif"
                                    onClick="OpenCommonRef1('Color','ColorSeq','ColorLValue','ColorValue')"/></td>
              <td width="123" colspan="2"><font class="label">MODALITY</font></td>
              <td colspan="2" width="696">
                <select  style="background-color:  #FFF8DC; border:  1px solid #000000;"
                         name="modality" >
                  <option value="">Select</option>
                  <% String[] strModOption={"PASOFINO","TROCHA","TROCHA Y GALOPE","TROTE Y GALOPE"};
                   for(int mod=0;mod <strModOption.length;mod++)
                    {
                               if( strModOption[mod].equalsIgnoreCase(strhor_aire))
                                { %>
                  <option selected><%=strhor_aire%></option>
                  <%}
                             else{%>
                  <option><%=strModOption[mod]%></option>
                  <% }
                    }%>
                </select>
              </td>
            </tr>
            <tr>
              <td width="96"><font class="label">MICROCHIP#</font></td>
              <td >
                <input type="text" style="background-color:  #FFF8DC; border:  1px solid #000000;" name="Mchip" id="Mchip" size="15"
                 class="allcaps"   value="<%=strmicro_num%>">
              </td>
              <td width="46" colspan="3"><font class="label">ASSOCIATION</font></td>
              <td colspan="6">
                <input type="hidden"  class="allcaps"
                        name="AssoNum" id="AssoNum" size="40"
                        value="<%=strorgSeq%>">
                <input type="text"  class="allcaps"
                        name="AssoNum_Value" id="AssoNum_Value"  size="40"
                        value="<%=strorg%>">
                <input type="hidden" id="AssoLValue" >                       
                <img alt="" src="Images/dropdown_icon4.gif"
                                    onClick="OpenCommonRef1('ORGANIZATION','AssoNum','AssoLValue','AssoNum_Value')"/>
              </td>
            </tr>
            <tr> </tr>
            <tr>
              <td width="96"><font class="label">SIRE</font></td>
              <td colspan="10">
                <input type="hidden" name="sire" id="sire" size="10"
                            value="<%=strSireSeq%>" >                
                <input type="text"  class="allcaps"  name="sireName" id="sireName"  size="10"  
                    onChange="GetHorseName_ByNum_RegPedigree(this.value, 'sire','sireName','Name_Label','2')"
                    onBlur="ClearFields_Shrt('sireName','sire','Name_Label')" value="<%=strSire_RegNum%>"/>
                <img src="Images/Find.gif" onClick="SearchSireDam_RegPedigree('PopPed',600,600,'yes','2','1')"/>
                <!--onClick="SearchSireDam('sireName','sire','sireSeq','MALE','Aso_Sire','Aso_Sire_Seq')"-->
                <span id="Name_Label" style="color :blue;text-transform: uppercase;"><%=strSireName%></span>
              </td>
            </tr>
            <tr>
              <td width="96"><font class="label">DAM</font></td>
              <td colspan="10">
                <input type="hidden" name="dam" id="dam" size="10"
                    value="<%=strDamSeq%>" >               
                <input type="text"  class="allcaps"  name="damName" id="damName"  size="10" 
                    onChange="GetHorseName_ByNum_RegPedigree(this.value, 'dam','damName','Dam_Label','3')" 
                    onBlur="ClearFields_Shrt('damName','dam','Dam_Label')" value="<%=strDam_RegNum%>"/>                    
                <img src="Images/Find.gif" onClick="SearchSireDam_RegPedigree('PopPed',600,600,'yes','3','1')">
                <span id="Dam_Label" style="color :blue;text-transform: uppercase;"><%=strDamName%></span>
              </td>
            </tr>
            <tr>
              <td width="96"><font class="label">OWNER</font></td>
              <td colspan="10">
                <input type="hidden" name="OwnerSeq" id="OwnerSeq"  size="10"
                            value="<%=strEntitySeq%>">
                <input type="hidden"  class="allcaps" name="owner" id="owner" size="40"
                    value="<%=strmem_name%>">
                <input type="hidden"  class="allcaps" name="Mowner" id="Mowner" size="2"
                    value="<%=strmem_mname%>">
                <input type="hidden"  class="allcaps" name="Lowner" id="Lowner" size="40"
                    value="<%=strmem_lname%>">
                    <input type="text"  class="allcaps" name="OwnerNo" id="OwnerNo" size="10"
                    value="<%=strOwnerNo%>"
                    onchange="Ajax_Owner(this.value,'OwnerSeq','OwnerNo','OWNER_NAME_VAL')"
                    onBlur="ClearFields_Shrt('OwnerNo','OwnerSeq','OWNER_NAME_VAL')">
                <img src="Images/Find.gif" onClick="OwnerSearch('','pop','1','O')">
                <!--onClick="SearchOwner('Owner',600,600,'yes','1')">-->
                    
                <label  id="OWNER_NAME_VAL" style="color :blue;text-transform: uppercase;"><%=strOwnerName%></label>                    
              </td>
            </tr>
            <td width="96"><font class="label">BREEDER</font></td>
            <td colspan="10">
              <input type="hidden" name="BreederSeq" id="BreederSeq" size="10"
                            value="<%=strhor_breederSeq%>" >
              <input type="hidden"   class="allcaps"
                        name="breeder" size="40"
                        value="<%=strhor_breeder%>">
              <input type="hidden"   class="allcaps"
                        name="Mbreeder" size="2"
                        value="">
              <input type="hidden"   class="allcaps"
                        name="Lbreeder" size="40"
                        value="<%=strhor_breeder%>">
            <input type="text"   class="allcaps" value="<%=BreederNo%>"
                        name="BreederNo" id="BreederNo" size="10"                        
                        onchange="Ajax_Owner(this.value,'BreederSeq','BreederNo','BreederName_Lbl')"
                    onBlur="ClearFields_Shrt('BreederNo','BreederSeq','BreederName_Lbl')">
              <img src="Images/Find.gif" onClick="OwnerSearch('','pop','1','B')">
                <!--onClick="SearchOwner('Owner',600,600,'yes','2')">-->
            <label id="BreederName_Lbl" style="color :blue;text-transform: uppercase;"><%=strhor_breeder%></label>                                      
            </td>

            <%--
            <tr>
              <td width="96"><font class="label">RIDER</font></td>
              <td colspan="9">
                <input type="hidden" name="RiderSeq" size="10"
                            value="<%%>" >
                <input type="text"   class="allcaps"
                        name="Rider_FN" size="40"
                        value="<%%>">
                <input type="text"   class="allcaps"
                        name="Rider_MN" size="2"
                        value="<%%>">
                <input type="text"   class="allcaps"
                        name="Rider_lN" size="40"
                        value="<%%>">
                <img alt="" src="Images/Find.gif" onClick='GetRiderInfo("frmListRider.jsp",event.screenX,event.screenY)' >
              </td>
            </tr>
            --%>
            <tr>
                <td align="right" colspan="10" style="padding:10px;">
                    <input type="button" class="button" value="Save" name="SavePed" id="SavePed" onclick="SaveRegistration_Ped('frmReg_Pedigree_NewRegistration.jsp')" />
                    <input type="button" class="button" value="Reset" onclick="Reset_NewReg_Ped()" />
                    <input type="button" class="button" value="Close" onclick="Close_NewReg_Ped('frmReg_Pedigree_NewRegistration.jsp')" />
                </td>
                    <input type="hidden" name="PAGEID" id="PAGEID" size="10" value="NEWREG_PEDIGREE" >
                    <input type="hidden" name="SavedYN" id="SavedYN" size="10" value="" >
            </tr>            
        </table>

        <div id="footer_Bot" align="bottom">        
        <jsp:include page="/frmBottom_Registration.jsp"/>
        </div>
        <div id="dialog-CmmnRef" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe id="modalIFrame_CmmnRef" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
        </iframe>
        </div>
        <div id="dialog-PlaceOfBirth" title="SEARCH PLACE" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe src="frmReg_CommonRef_Place.jsp" id="modalIFrame_PlaceOfBirth" width="100%" height="100%" marginwidth="0" marginheight="0"  frameborder="0" scrolling="yes">
        </iframe>
        </div>
        </form>
    </body>
</html>
