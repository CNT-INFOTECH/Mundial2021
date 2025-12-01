<html>
<head></head>
<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BREEDER</title>
<link rel="stylesheet" href="Style_Popup.css">
<link rel="stylesheet" href="themes/base/jquery.ui.all.css">
<meta name="Description" content="How to Build a Basic CSS Layout" />
<meta name="Keywords" content="css layout" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="Buttons_Style.css" rel="stylesheet" type="text/css" />
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
<script type="text/javascript" src="jscIndex.js"></script>
<link href="buttons.css" rel="stylesheet" type="text/css" />  
<script src="js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="js/interface.js"></script>
<script type="text/javascript" src="jscReg_AutoComplete.js"></script>

<script type="text/javascript">        

function AddBreederInformation() {   
     
     
    if(document.getElementById("BREEDER_TYPE").value =='')
    {
    alert("Please Select Breeder Type");
    return false;
    }
    if(document.getElementById("BREEDER_TYPE").value =='ORGANIZATION'&& document.getElementById("Org_Name").value =='')
    {
    alert("Please Enter Organization Name");
    return false;
    }
    
    if(document.getElementById("BREEDER_TYPE").value =='INDIVIDUAL' && document.getElementById("FName").value =='' && document.getElementById("LName").value =='')
    {
    alert("Please Enter FName and LName");
    return false;
    }
    
    GetBreederSeq();            
    if(document.getElementById("BREEDER_TYPE").value =='ORGANIZATION')
    {   
        varOrgName=document.getElementById("Org_Name").value;
        window.parent.document.getElementById("Org_Name").value=varOrgName;               
        window.parent.document.forms[0].method="post";
        window.parent.document.forms[0].action="BreederPopup_Reg.jsp?srch=1&Type=1&Org_Name="+varOrgName;
        //document.forms[0].target="_blank";                                                                
        window.parent.document.forms[0].submit();
    }
    if(document.getElementById("BREEDER_TYPE").value =='INDIVIDUAL')
    {
        var bredfname=document.getElementById("FName").value;        
        var bredlname=document.getElementById("LName").value;
        window.parent.document.getElementById("Org_Name").value=bredfname+"  "+bredlname        
        window.parent.document.forms[0].method="post";
        window.parent.document.forms[0].action="BreederPopup_Reg.jsp?srch=1&Type=1&Org_Name="+bredfname+"  "+bredlname;
        //document.forms[0].target="_blank";                                                                
        window.parent.document.forms[0].submit();
    }      
    window.parent.jQuery('#dialog-BreederAdd').dialog('close');    
}// this is the add function raju

function GetBreederSeq()
{   var varBREEDER_TYPE =document.getElementById("BREEDER_TYPE").value;
    var varOrg_Name =document.getElementById("Org_Name").value;
    var varFName =document.getElementById("FName").value;
    var varMName =document.getElementById("MName").value;
    var varLName =document.getElementById("LName").value;
    var varAddress1 =document.getElementById("Address1").value;
        
    var strADDRESS2 = document.getElementById("Address2").value;  
    var varAddress2 = escape(strADDRESS2).replace(/\#/g,'%23');   
    
    var varCity =document.getElementById("CITY").value;
    var varState =document.getElementById("STATE").value;
    var varZip =document.getElementById("ZIP").value;
    var varCountry =document.getElementById("COUNTRY").value;
    var varPhone =document.getElementById("Phone").value;
    var varEmail =document.getElementById("Email").value;
    var ENTITYSEQ =document.getElementById("ENTITYSEQ").value;    
       
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
            EntitySeq=xmlhttp.responseText;         
            //window.parent.document.getElementById("breederSeq_POP").value=EntitySeq;            
        }         
    }
    }    
    xmlhttp.open("GET","IndividualEntityDetailsServlet?PAGEID=REG_BREEDERADDPOPUP&Org_Name="+varOrg_Name+"&FName="+varFName+"&MName="+varMName+"&LName="+varLName+"&Address1="+varAddress1+"&Address2="+varAddress2+"&City="+varCity+"&State="+varState+"&Zip="+varZip+"&Country="+varCountry+"&Phone="+varPhone+"&ENTITYSEQ="+ENTITYSEQ+"&Email="+varEmail+"&BREEDER_TYPE="+varBREEDER_TYPE,true);
    xmlhttp.send();

}
function CancelBreeder()
{
    
    window.parent.jQuery('#dialog-BreederAdd').dialog('close')
}
 function checkBreederType(obVal)
 {
     if(obVal.value=='INDIVIDUAL')
         {            
             document.forms[0].Org_Name.disabled=true;   
             //document.forms[0].orgSearch.disabled=true;
             document.forms[0].Org_Name.value="";
             document.forms[0].FName.focus();
         }
       if(obVal.value=='ORGANIZATION')
         {
             document.forms[0].Org_Name.disabled=false;   
             document.forms[0].Org_Name.focus();
         }         
 }
function PopulateCityDetails(varCity,varState,varZip,varCountry,varFocus)
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
          CityStateZipDetailsSearchBreeder(City,State,Zip,"")
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
function CityStateZipDetailsSearchBreeder(city,state,zip,Country)
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
</script>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.GeneralServlet" %>  
<body>
   
    <form name="frmReg_BreederAddPopup" method="post" >
<%
String strsearch="";
String strOrg_Name="";
String strENTITYSEQ="";
String strFName="";
String strMName="";
String strLName="";
String strAddress1="";
String strAddress2="";
String strCity="";
String strState="";
String strZip="";
String strCountry="";
String strPhone="";
String status="";
String ACTION="";
String strEmail="";
String strBreeder_Type="";
String strmem_num="";

if(request.getParameter("Action")!=null)
    ACTION=request.getParameter("Action");

if(request.getParameter("STATUS")!=null)
    status=request.getParameter("STATUS");

if(request.getParameter("srch")!=null)
    strsearch=request.getParameter("srch");

if(request.getParameter("ENTITYSEQ")!=null)
    strENTITYSEQ=request.getParameter("ENTITYSEQ");

GeneralServlet gen=new GeneralServlet();
RowSetFactory factory = RowSetProvider.newFactory();
   CachedRowSet crsGetBreederDetails= factory.createCachedRowSet();
//CachedRowSetImpl crsGetBreederDetails = new CachedRowSetImpl();

if(strsearch.length()>0)
    crsGetBreederDetails = gen.Get_IndividualsEntityDetails(strENTITYSEQ);
    
while (crsGetBreederDetails.next())
{   
    strBreeder_Type="";
    strOrg_Name="";
    strFName="";
    strMName="";
    strLName="";
    strAddress1="";
    strAddress2="";
    strCity="";
    strState="";
    strZip="";
    strCountry="";
    strPhone="";
    strEmail="";
    strmem_num="";
    
    
    if(crsGetBreederDetails.getString("OWNER_TYPE")!=null)
        strBreeder_Type= crsGetBreederDetails.getString("OWNER_TYPE").trim();    
    
    if(crsGetBreederDetails.getString("ORGANIZATION_NAME")!=null)
        strOrg_Name= crsGetBreederDetails.getString("ORGANIZATION_NAME").trim();
    
    if(crsGetBreederDetails.getString("FIRSTNAME")!=null)
        strFName= crsGetBreederDetails.getString("FIRSTNAME").trim();
    
    if(crsGetBreederDetails.getString("SUFFIX")!=null)   // SUFFIX IS USED AS THE MNAME IN THE TABLE
        strMName= crsGetBreederDetails.getString("SUFFIX").trim();
    
    if(crsGetBreederDetails.getString("LASTNAME")!=null)
        strLName= crsGetBreederDetails.getString("LASTNAME").trim();
    
    if(crsGetBreederDetails.getString("ADDRESS1")!=null)
        strAddress1= crsGetBreederDetails.getString("ADDRESS1").trim();
    
    if(crsGetBreederDetails.getString("ADDRESS2")!=null)
        strAddress2= crsGetBreederDetails.getString("ADDRESS2").trim();
    
    if(crsGetBreederDetails.getString("CITY")!=null)
        strCity= crsGetBreederDetails.getString("CITY").trim();

    if(crsGetBreederDetails.getString("STATE")!=null)
        strState= crsGetBreederDetails.getString("STATE").trim();

    if(crsGetBreederDetails.getString("ZIP")!=null)
        strZip= crsGetBreederDetails.getString("ZIP").trim();

    if(crsGetBreederDetails.getString("COUNTRY")!=null)
        strCountry= crsGetBreederDetails.getString("COUNTRY").trim();
    
    if(crsGetBreederDetails.getString("PHONE")!=null)
        strPhone= crsGetBreederDetails.getString("PHONE").trim();
    
    if(crsGetBreederDetails.getString("EMAIL")!=null)
        strEmail= crsGetBreederDetails.getString("EMAIL").trim();
    
    if(crsGetBreederDetails.getString("MEMBER_NUM")!=null)                              
        strmem_num= crsGetBreederDetails.getString("MEMBER_NUM").trim(); 
    
}
    
%>
        <table class="altRow">
            <tr>
                <td  nowrap>BREEDER TYPE</td>
                <td colspan="9">
                    <select name="BREEDER_TYPE" id="BREEDER_TYPE" onchange="checkBreederType(this)"  style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;width:153px;" <%=status%> >                                    
                    <option value=''>Select</option>
                    <%
                    String strSelected_Ind="";
                    String strSelected_Org="";                    
                    if(strBreeder_Type.equals("INDIVIDUAL"))
                    strSelected_Ind="SELECTED";
                    else  if(strBreeder_Type.equals("ORGANIZATION"))
                    strSelected_Org="SELECTED";            
                    %>
                    <option value='INDIVIDUAL' <%=strSelected_Ind%> >INDIVIDUAL</option>
                    <option value='ORGANIZATION'<%=strSelected_Org%> >ORGANIZATION</option>                                                   
                    </select>
                </td>
                <!--<td>MEMBER</td>-->
                <!--<td colspan="4">-->
                    <select name="MEMBER" id="MEMBER"  style="visibility:hidden;text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;width:153px;"  >                                    
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
                <!--</td>-->
            </tr>
            <tr><input type="hidden" name="ENTITYSEQ" id="ENTITYSEQ" value="<%=strENTITYSEQ%>"/>
                <td nowrap>ORG NAME</td>
                <td colspan="9">
                    <input type="text" name="Org_Name" id="Org_Name" value="<%=strOrg_Name%>"  size="93"  style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" <%=status%> >
                </td>
            </tr>
            <tr>
                <td>NAME(F,L)</td>
                <td colspan="3">
                    <input type="text" name="FName" id="FName" value="<%=strFName%>" size="44"  style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" <%=status%> >
                </td>
                <!--<td>-->
                    <input type="hidden" name="MName" id="MName" value="<%=strMName%>" size="8"  style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" <%=status%> >
                <!--</td>-->
                <td colspan="4">
                    <input type="text" name="LName" id="LName" value="<%=strLName%>" size="40"  style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" <%=status%> >
                </td>                             
            </tr>    
            <tr>
                <td>ADDRESS1</td>
                <td colspan="2">
                    <input type="text" name="Address1" id="Address1" value="<%=strAddress1%>" size="28"  style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" <%=status%> >
                </td>
                <td>ADDRESS2</td>
                <td colspan="4">
                    <input type="text" name="Address2" id="Address2" value="<%=strAddress2%>" size="40"  style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" <%=status%> >
                </td>                             
            </tr>
            <tr>                  
                <td>CITY</td>
                <td >
                    <input type="text" class="input_city" name="City" id="CITY" value="<%=strCity%>" size="8" 
                    onkeyup="Empty_CityDetails(this.value,'CITY','STATE','ZIP','COUNTRY')"
                    style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" <%=status%>>
                </td><!--onblur="CityStateZipDetails('City','State','Zip','Country',City.value,'Phone')"   -->
                <td>
                STATE 
                </td>
                <td>
                <input type="text" name="State" id="STATE" value="<%=strState%>" size="5"  style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" <%=status%> >
                </td>
                <td>ZIP</td>
                <td>
                    <input type="text" name="Zip" id="ZIP" value="<%=strZip%>" size="5" style=" background-color:  #FFF8DC; 
                    border:  1px solid #000000;text-transform: uppercase;" 
                    onkeyup="Empty_CityDetails(this.value,'CITY','STATE','ZIP','COUNTRY')"
                    onchange="PopulateCityDetails('CITY','STATE','ZIP','COUNTRY','Phone')"  <%=status%> >
                </td>
                <td>
                COUNTRY
                </td>
                <td>
                <input type="text" name="Country" id="COUNTRY" value="<%=strCountry%>" size="5"  style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" <%=status%> >
                </td>
            </tr>
            <tr>
                <td>PHONE</td>
                <td colspan="2" width="200px">
                    <input type="text" name="Phone" id="Phone" value="<%=strPhone%>" size="28"  style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" <%=status%> >
                </td> 
                <td >EMAIL</td>
                <td colspan="4">
                     <input type="text" name="Email" id="Email" value="<%=strEmail%>" size="40"  style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" <%=status%> >
                </td>
            </tr>            
            <tr>
                <td colspan="8" align="center">
                    <br>
                    <br>
                    <br>
                    <input type="button" value="<%=ACTION%>" class="button" onclick="AddBreederInformation()"/>
                    <input type="button" value="Cancel" class="button" onclick="CancelBreeder()"/>
                </td>                    
            </tr><input type="hidden" name="PAGEID" id="PAGEID" value="REG_BREEDERADDPOPUP">
        </table>        
      
    </form>        
</body>
</html>



