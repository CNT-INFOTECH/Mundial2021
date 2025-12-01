<%-- 
    Document   : frmReg_NewOwner_Pop
    Created on : Nov 3, 2011, 7:41:53 PM
    Author     : Erzath
--%>

<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.DBConnection" %>
<%@ page import="pasotracker.GeneralServlet" %>   
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Style_Popup.css">
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
        <script src="js/jquery.autocomplete.js"></script>
     	<script type="text/javascript" src="jscReg_AutoComplete.js"></script>
    </head>
<style type="text/css">
.altRow
{

}

.altRow td
{
	border-bottom:1px dotted #ffffff;
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

body {  background:url("Images/trans-wood-1.png"); font: .89em "Trebuchet MS", Arial, Sans-Serif;}
    
</style>
<script type="text/javascript">
function trimRegister(str){
	str = str.replace(/^\s+/, '');
	for (var i = str.length - 1; i >= 0; i--) {
		if (/\S/.test(str.charAt(i))) {
			str = str.substring(0, i + 1);
			break;
		}
	}
	return str;
}
function CityStateZipDetails(varCity,varState,varZip,varCountry,varFocus)
{
    var Zip=document.getElementById(varZip).value    
    var City="";
    var State="";    
    if(Zip.trim()=='')
    {   
        return false;
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
      if(xmlhttp.responseText==0)
      {   
          document.getElementById(varCity).value="";
          document.getElementById(varState).value="";
          document.getElementById(varZip).value="";
          document.getElementById(varCountry).value="";
          alert("Please Enter Correct Zip Code");          
          return false;
      }    
      else if (xmlhttp.responseText==2)
          CityStateZipDetailsSearch1(City,State,Zip,"")
      else
          {
          var Items=xmlhttp.responseText.split('#@#');              
          document.getElementById(varCity).value=trimRegister(Items[0])
          document.getElementById(varState).value=trimRegister(Items[1])              
          document.getElementById(varZip).value=trimRegister(Items[2])              
          document.getElementById(varCountry).value=trimRegister(Items[3])      
          document.getElementById(varFocus).focus();
          }
    }
  }
xmlhttp.open("GET","frmReg_CheckCityState.jsp?City="+City+"&State="+State+"&Zip="+Zip,true);
xmlhttp.send();
}
function CityStateZipDetailsSearch1(city,state,zip,Country)
{
    var w=500;
    var h=400;
    var scroll='yes'

     var winPopZip = null;

    LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
    TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
    Details ='height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
    winPopZip = window.open('frmReg_CityStateZipDetails.jsp?City='+city+'&State='+state+'&Zip='+zip,'CityStateZip',Details)

}

function cancel_NewOwnerPop(seqVal)
{
    if(trimRegister(seqVal)!='')        
    {
    if(opener.document.forms[0].name=="Registrationform")
    {        
        opener.document.getElementById("HDNENTITYSEQ").value=trimRegister(document.getElementById('EntitySeq').value);              
        opener.document.getElementById("HDNOWNER_NO").value=trimRegister(document.getElementById('Owner_No').innerHTML);              
        opener.document.getElementById("HDNOWNER_TYPE").value=trimRegister(document.getElementById('OWNER_TYPE').value);                        
        opener.document.getElementById("HdnSeqNo_Mem").value=trimRegister(document.getElementById('MEMBER').value);
        opener.document.getElementById("ADDRESS1_VAL").innerHTML=trimRegister(document.getElementById('ADDRESS1').value);     
        opener.document.getElementById("ADDRESS2_VAL").innerHTML=trimRegister(document.getElementById('ADDRESS2').value);      
        opener.document.getElementById("CITY_VAL").innerHTML=trimRegister(document.getElementById('CITY').value);      
        opener.document.getElementById("STATE_VAL").innerHTML=trimRegister(document.getElementById('STATE').value);     
        opener.document.getElementById("ZIP_VAL").innerHTML=trimRegister(document.getElementById('ZIP').value);      
        opener.document.getElementById("COUNTRY_VAL").innerHTML=trimRegister(document.getElementById('COUNTRY').value);      
        opener.document.getElementById("PHONE_VAL").innerHTML=trimRegister(document.getElementById('PHONE').value);      
        opener.document.getElementById("EMAIL_VAL").innerHTML=trimRegister(document.getElementById('EMAIL').value);
        opener.document.getElementById('SavedYN').value='N';

        var bredSeq = opener.document.getElementById("breederSeq").value;
        
        if(bredSeq==trimRegister(document.getElementById('EntitySeq').value))
            opener.document.getElementById("breeder_Lbl").innerHTML=trimRegister(document.getElementById('OwnerName').value);

        opener.document.getElementById("OWNER_NAME_VAL").innerHTML='<a onclick="EditOwner('+trimRegister(document.getElementById('EntitySeq').value)+')">'+trimRegister(document.getElementById('OwnerName').value)+'</a>';
    }    
    else if(opener.document.forms[0].name=="Reg_Ped_EditHorseInformation")
    {        
        var ownSeq = opener.document.getElementById("HDNENTITYSEQ").value;
        var bredSeq = opener.document.getElementById("breederSeq").value

        if(opener.document.getElementById("HDNENTITYSEQ").value==trimRegister(document.getElementById('EntitySeq').value))
        {
        opener.document.getElementById("OWNER_NAME_VAL").innerHTML='<a onclick="EditOwner('+trimRegister(document.getElementById('EntitySeq').value)+')">'+trimRegister(document.getElementById('OwnerName').value)+'</a>';
        opener.document.getElementById("OWNER_NO").value=trimRegister(document.getElementById('Owner_No').innerHTML);
        opener.document.getElementById("HDNENTITYSEQ").value=trimRegister(document.getElementById('EntitySeq').value);

        if(ownSeq==bredSeq)
            opener.document.getElementById("BreederName_Lbl").innerHTML='<a onclick="EditOwner('+trimRegister(document.getElementById('EntitySeq').value)+')">'+trimRegister(document.getElementById('OwnerName').value)+'</a>';

        }
        else if(opener.document.getElementById("breederSeq").value==trimRegister(document.getElementById('EntitySeq').value))
        {
        opener.document.getElementById("BreederName_Lbl").innerHTML='<a onclick="EditOwner('+trimRegister(document.getElementById('EntitySeq').value)+')">'+trimRegister(document.getElementById('OwnerName').value)+'</a>';
        opener.document.getElementById("BREEDER_NO").value=trimRegister(document.getElementById('Owner_No').innerHTML);
        opener.document.getElementById("breederSeq").value=trimRegister(document.getElementById('EntitySeq').value);

        if(ownSeq==bredSeq)
            opener.document.getElementById("OWNER_NAME_VAL").innerHTML='<a onclick="EditOwner('+trimRegister(document.getElementById('EntitySeq').value)+')">'+trimRegister(document.getElementById('OwnerName').value)+'</a>';
        }        
    }
    else if(opener.document.forms[0].name=="Reg_Pedigree_NewRegistration")
    {
        var ownSeq =opener.document.getElementById("OwnerSeq").value;
        var bredSeq = opener.document.getElementById("BreederSeq").value

        if(opener.document.getElementById("OwnerSeq").value==trimRegister(document.getElementById('EntitySeq').value))
        {
        opener.document.getElementById("OWNER_NAME_VAL").innerHTML='<a onclick="EditOwner('+trimRegister(document.getElementById('EntitySeq').value)+')">'+trimRegister(document.getElementById('OwnerName').value)+'</a>';
        opener.document.getElementById("OwnerNo").value=trimRegister(document.getElementById('Owner_No').innerHTML);
        opener.document.getElementById("OwnerSeq").value=trimRegister(document.getElementById('EntitySeq').value);

        if(ownSeq==bredSeq)
            opener.document.getElementById("BreederName_Lbl").innerHTML='<a onclick="EditOwner('+trimRegister(document.getElementById('EntitySeq').value)+')">'+trimRegister(document.getElementById('OwnerName').value)+'</a>';
    
        }
        else if(opener.document.getElementById("BreederSeq").value==trimRegister(document.getElementById('EntitySeq').value))
        {
        opener.document.getElementById("BreederName_Lbl").innerHTML='<a onclick="EditOwner('+trimRegister(document.getElementById('EntitySeq').value)+')">'+trimRegister(document.getElementById('OwnerName').value)+'</a>';
        opener.document.getElementById("BreederNo").value=trimRegister(document.getElementById('Owner_No').innerHTML);
        opener.document.getElementById("BreederSeq").value=trimRegister(document.getElementById('EntitySeq').value);

        if(ownSeq==bredSeq)
            opener.document.getElementById("OWNER_NAME_VAL").innerHTML='<a onclick="EditOwner('+trimRegister(document.getElementById('EntitySeq').value)+')">'+trimRegister(document.getElementById('OwnerName').value)+'</a>';
        
        }        
    }
    }
    window.close();
}
function Save_NewOwner_Pop()
{
    if(document.getElementById('OWNER_TYPE').value =='')
    {
    alert("Please Select The Owner Type");
    return false;
    }
    if(document.getElementById('OWNER_TYPE').value =='INDIVIDUAL')
    {
       if(trimRegister(document.getElementById('MEMBER_NAME').value).length==0) 
       {
       alert("Please Enter Name");
       return false;
       }
    }
    if(document.getElementById('OWNER_TYPE').value =='ORGANIZATION')        
    { 
       if(trimRegister(document.getElementById('ORG_NAME').value).length==0) 
       {
       alert("Please Enter Organization Name");
       return false;
       }
    }    
    document.forms[0].target="_self";
    document.forms[0].method="post";    
    document.forms[0].action="RegistrationServlet";      
    document.forms[0].submit();
}
function checkOwnerType(obVal)
{
    if(obVal.value=='INDIVIDUAL')
    {            
    document.forms[0].ORG_NAME.disabled=true;            
    document.forms[0].ORG_NAME.value="";
    }
    if(obVal.value=='ORGANIZATION')
    {
    document.forms[0].ORG_NAME.disabled=false;       
    }         
}
</script>
    <body>
<form name="Pop_NewOwner">
<%
String strOwnerNo="";
String strEntitySeq="";
String strmem_num="";
String strOrg_Name="";
String strmem_name="";
String strmem_lname="";
String strmem_mname="";
String strmem_add1="";
String strmem_add2="";
String strmem_city="";
String strmem_state="";
String strmem_zip="";
String strmem_country="";
String strmem_phone="";
String strmem_email="";
String strOwn_Type="";
String strOwnerName="";

    GeneralServlet gen=new GeneralServlet();
     RowSetFactory factory56 = RowSetProvider.newFactory();
   CachedRowSet crs= factory56.createCachedRowSet();
    //rs= new CachedRowSetImpl();
    strOwnerNo="";
        
    if(request.getParameter("entyseq")!=null )    
        strEntitySeq=request.getParameter("entyseq").trim();
            
    if(strEntitySeq.length()!=0)
    {
        crs = gen.Get_IndividualsEntityDetails(strEntitySeq);
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
            strOwn_Type="";
            strOwnerName="";            
            
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
                            
            strOwnerName=strmem_name+" "+strmem_lname;
        }
    }
%>
        <table class="altRow">
        <tr>
            <td>ID# </td>
            <td colspan="4">
                <label id="Owner_No" style="color:blue;text-transform: uppercase;font-size:9pt;font-weight:bold;" disabled><%=strOwnerNo%></label>
                <input  type="hidden" id="OwnerName" name="OwnerName" 
                value="<% if(strOwn_Type.equals("ORGANIZATION"))
                              out.println(strOrg_Name);
                          else
                              out.println(strOwnerName);%>" />
                <input  type="hidden" id="EntitySeq" name="EntitySeq" value="<%=strEntitySeq%>" />                
            </td> 
        </tr>    
        <tr>
            <td nowrap>OWNER TYPE</td>
            
            <td colspan="4">
                <select name="OWNER_TYPE" id="OWNER_TYPE" onchange="checkOwnerType(this)"  style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;width:153px;"  >                                    
                <option value=''>Select</option>              
                <%
                    String strSelected_Ind="";
                    String strSelected_Org="";                    
              if(strOwn_Type.equals("INDIVIDUAL"))
                  strSelected_Ind="SELECTED";
              else  if(strOwn_Type.equals("ORGANIZATION"))
                  strSelected_Org="SELECTED";            
              %>
                <option value='INDIVIDUAL' <%=strSelected_Ind%> >INDIVIDUAL</option>
                <option value='ORGANIZATION'<%=strSelected_Org%> >ORGANIZATION</option>                                                   
                </select>                                                                                                                                 
            </td>                       
        </tr>
        <tr><!--
            <td nowrap>EFFECTIVE DATE</td>
            <td >
                <input type="text"  value="" size="23" name="EFFECTIVEDATE" id="EFFECTIVEDATE"   style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" />
            </td>-->
            <td>MEMBER</td>
            <td colspan="4">
                <select name="MEMBER" id="MEMBER"  style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;width:153px;"  >                                    
                <option value=''>Select</option>              
                <%
                String strMem_Y="";
                String strMem_N="";                             
                if(strmem_num.length()>0 && !strmem_num.equals("0"))
                  strMem_Y="SELECTED";
                else  if(strmem_num.equals("0"))
                  strMem_N="SELECTED";            
              %>
                <option value='YES' <%=strMem_Y%> >YES</option>
                <option value='NO'  <%=strMem_N%> >NO</option>                                                  
                </select>                 
            </td>            
        </tr>
        <tr>                
            <td >ORG NAME</td>
            <td colspan="4">               
                <input type="text" size="77"  name="ORG_NAME" id="ORG_NAME"   value="<%=strOrg_Name%>"  
                style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" />                                                 
            </td>
        </tr>
        <tr>      
            <td>NAME(F,L)</td>
            <td >
                <input type="text" size="23"  name="MEMBER_NAME"  id="MEMBER_NAME" value="<%=strmem_name%>" 
                style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" />                
            
                <input type="hidden" size="7"   name="MEMBER_MNAME" id="MEMBER_MNAME" value="<%=strmem_mname%>"
                style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" />
            </td>
            <td colspan="3">
                <input type="text" size="45"   name="MEMBER_LNAME"  value="<%=strmem_lname%>"
                style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" />                
            </td>
        </tr>
        <tr>
            <td>ADDRESS1</td>
            <td  colspan="4">
                <input type="text" maxlength="50"  size="77" name="ADDRESS1" id="ADDRESS1"  value="<%=strmem_add1%>"
                style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" />
            </td>            
        </tr>
        <tr>
            <td  >ADDRESS2</td>
            <td colspan="4">
                <input type="text" maxlength="50"  size="77" name="ADDRESS2" id="ADDRESS2" value="<%=strmem_add2%>"
                style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" />
            </td>
        </tr>
        <tr align="left">
            <td  width="20px" align="left" >CITY</td>
            <td>
                <input type="text" class="input_city" name="CITY"   id="CITY" size="12" value="<%=strmem_city%>" 
                style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" 
                onkeyup="Empty_CityDetails(this.value,'CITY','STATE','ZIP','COUNTRY')" />
                <label>STATE</label>
            </td>
            <td>
                <input type="text" name="STATE"   maxlength="10" id="STATE" size="5"  value="<%=strmem_state%>"
                style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" />
            </td>
            <td   width="158px" >ZIP
                <input type="text" maxlength="6"  name="ZIP" id="ZIP" size="5" value="<%=strmem_zip%>" 
                onchange="CityStateZipDetails('CITY','STATE','ZIP','COUNTRY','PHONE')"
                onkeyup="Empty_CityDetails(this.value,'CITY','STATE','ZIP','COUNTRY')"
                style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" />
            COUNTRY</td>
            <td>
                <input type="text" name="COUNTRY"  size="6" id="COUNTRY" value="<%=strmem_country%>"
                style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;"  />
            </td>
        </tr>
        <tr>
            <td>PHONE</td>
            <td>
                <input type="text" maxlength="20"   size="23" name="PHONE" id="PHONE" value="<%=strmem_phone%>"                
                style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;"  />
            </td>
            <td>EMAIL</td>
            <td colspan="2">
                <input type="text"   size="33" name="EMAIL" id="EMAIL" value="<%=strmem_email%>"
                style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;"  />
            </td>
        </tr> 
        
        <tr>
            <td colspan="5" align="center">
                <!--<input type="button" id="NewOwner" class="button" value="New" onclick="NewOwnerInformation()" />
                <input type="button" id="EditOwner" class="button" value="Edit" onclick="Edit_OwnerInformation()" />-->
                <input type="button" id="SaveOwner_NewPop" class="button" value="Save" onclick="Save_NewOwner_Pop()" />
                <input type="button" id="CloseOwner" class="button" value="Close" onclick="cancel_NewOwnerPop('<%=strEntitySeq%>')"/>
            </td>                
                <input type="hidden" name="PAGEID" id="PAGEID" value="Pop_NEWOWNERREGISTRATION">
        </tr>            
    </table>
</form>
    </body>
</html>

