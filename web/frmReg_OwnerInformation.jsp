<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.DBConnection" %>
<%@ page import="pasotracker.GeneralServlet" %>   

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
     	
        
<script type="text/javascript">        

function cancelOwner()
{
    window.parent.jQuery('#dialog-OwnerInformation').dialog('close')
    
}
function OwnerSearch(state,type,objVal)
{
    /*$('#dialog-OwnerSearch').dialog({ autoOpen: false,height: 560,width: 640, modal: true });
    $('#dialog-OwnerSearch').dialog('open');

    $("#modalIFrame_OwnerSearch").attr('src','frmReg_OwnerSearchPopup.jsp');
    return false;*/
        
    if(state!='')
        return false;
        
    var details = 'titlebar=no,status=no,menubar=no,resizable=no,width=600,height=500,scrollbars=no,left=230,top=150';

    if(type=='pop')
    childWindow=open("frmReg_NewOwnerInformationSearch.jsp","Cal",details);
    
    if(type=='partial')
    {        
    if(objVal.name=='ORG_NAME')
        varName='Org_Name';
    if(objVal.name=='MEMBER_NAME')
        varName='FName';
    if(objVal.name=='MEMBER_LNAME')
        varName='LName'; 
    
    if(objVal.value=='' )
        return false;
    childWindow=open("frmReg_NewOwnerInformationSearch.jsp?srch=1&typ=1&"+varName+"="+objVal.value,"Cal",details);
    }
    if (childWindow.opener == null)
        childWindow.opener = self;
    childWindow.focus();    
}

$(function() {
  $( "#EFFECTIVEDATE" ).datepicker({
changeMonth: true,
changeYear: true
});
  $("#CITY").autocomplete("frmReg_CityList.jsp");
  $("#STATE").autocomplete("frmReg_StateList.jsp");
  $("#ZIP").autocomplete("frmReg_ZipList.jsp");
});


 function checkOwnerType(obVal)
 {
     if(obVal.value=='INDIVIDUAL')
     {            
         document.forms[0].ORG_NAME.disabled=true;   
         //document.forms[0].orgSearch.disabled=true;
         document.forms[0].ORG_NAME.value="";
     }
    if(obVal.value=='ORGANIZATION')
    {
        document.forms[0].ORG_NAME.disabled=false;       
    }         
 }
 function NewOwnerInformation()
 {    
    document.forms[0].method="post";
    document.forms[0].action="frmReg_OwnerInformation.jsp?Mode=6";
    document.forms[0].target="_self";                                                                
    document.forms[0].submit();               
 }
</script>
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
    
</style>
    
    </head>
<body >    
<form name="Reg_OwnerInformation">
<%
String STATUS="";
if(request.getParameter("status")!=null && request.getParameter("status").equals("disabled"))    
    STATUS=request.getParameter("status").trim();    
else
    STATUS="";

%>
    <%@ include file="frmPassoInclude.jsp"%>
<%
    GeneralServlet gen=new GeneralServlet();            
    CachedRowSetImpl crs= new CachedRowSetImpl();
    strOwnerNo="";
    
    if(request.getParameter("se")!=null )    
        strEntitySeq=request.getParameter("se").trim();

    if(strEntitySeq.length()!=0)
    {
        crs = gen.Get_IndividualsEntityDetails(strEntitySeq);
        while(crs.next())
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
                
            strOwnerName=strmem_name+" "+strmem_mname+" "+strmem_lname;
        }
    }
    
%>   
    <table class="altRow">
        <tr>
            <td nowrap>OWNER TYPE</td>
            
            <td >
                <select name="OWNER_TYPE" id="OWNER_TYPE" onchange="checkOwnerType(this)"  style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;width:153px;" <%=STATUS%> >                                    
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
            <td>OWNER#</td>
            <td colspan="2">
                <label id="Owner_No" style="text-transform: uppercase;font-size:11pt;font-weight:bold;" disabled><%=strOwnerNo%></label>
            </td>            
        </tr>
        <tr>
            <td nowrap>EFFECTIVE DATE</td>
            <td >
                <input type="text"  value="<%=strEffectivedate%>" size="20" name="EFFECTIVEDATE" id="EFFECTIVEDATE"   style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" <%=STATUS%>/>
            </td>
            <td>MEMBER#</td>
            <td colspan="2">
                <input type="text"  maxlength="10" size="37" name="MEMBER_NUM" id="MEMBER_NUM"    value="<%=strmem_num%>"   style="text-transform: uppercase; background-color:  #FFF8DC; border:  1px solid #000000;" <%=STATUS%>/>
            </td>
            
        </tr>
        <tr>                
            <td >ORG NAME</td>
            <td colspan="4">               
                <input type="text" size="78"  name="ORG_NAME" id="ORG_NAME"  onchange="OwnerSearch('<%=STATUS%>','partial',this)" value="<%=strOrg_Name%>" 
                style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" <%=STATUS%> />                                 
                <img src="Images/Find12.jpg" onClick="OwnerSearch('<%=STATUS%>','pop','1')" />
            </td>
        </tr>
        <tr>      
            <td>NAME(F,M,L)</td>
            <td >
                <input type="text" size="20"  name="MEMBER_NAME" onchange="OwnerSearch('<%=STATUS%>','partial',this)" id="MEMBER_NAME" value="<%=strmem_name%>"  style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" <%=STATUS%>/>                
            </td>          
            <td>
                <input type="text" size="7"   name="MEMBER_MNAME" id="MEMBER_MNAME" value="<%=strmem_mname%>"  style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" <%=STATUS%>/>
         </td>
            <td colspan="2">
                <input type="text" size="37"   name="MEMBER_LNAME" onchange="OwnerSearch('<%=STATUS%>','partial',this)" id="MEMBER_LNAME" value="<%=strmem_lname%>"  style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" <%=STATUS%>/>                
            </td>
        </tr>
        <tr>
            <td>ADDRESS1</td>
            <td  colspan="4">
                <input type="text" maxlength="50"  size="81" name="ADDRESS1" id="ADDRESS1" value="<%=strmem_add1%>"  style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" <%=STATUS%>/>
            </td>            
        </tr>
        <tr>
            <td  >ADDRESS2</td>
            <td colspan="4">
                <input type="text" maxlength="50"  size="81" name="ADDRESS2" id="ADDRESS2" value="<%=strmem_add2%>"  style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" <%=STATUS%>/>
            </td>
        </tr>
        <tr align="left">
            <td  width="20px" align="left" >CITY</td>
            <td>
                <input type="text" class="input_city"   name="CITY" onblur="CityStateZipDetails('CITY','STATE','ZIP','COUNTRY',CITY.value,'PHONE')"    id="CITY" size="12" value="<%=strmem_city%>"  style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" <%=STATUS%>/>
                STATE
            </td>
            <td>
                <input type="text" name="STATE" class="input_state" onblur="CityStateZipDetails('CITY','STATE','ZIP','COUNTRY',STATE.value,'PHONE')"  maxlength="10" id="STATE" size="5"  value="<%=strmem_state%>"   style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" <%=STATUS%>/>
            </td>
            <td   width="188px" >ZIP
                <input type="text" maxlength="6" class="input_zip" onblur="CityStateZipDetails('CITY','STATE','ZIP','COUNTRY',ZIP.value,'PHONE')"  name="ZIP" id="ZIP" size="5" value="<%=strmem_zip%>"   style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" <%=STATUS%>/>
            COUNTRY</td>
            <td>
                <input type="text" name="COUNTRY"  size="5" value="<%=strmem_country%>" id="COUNTRY"    style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" <%=STATUS%> />
            </td>
        </tr>
        <tr>
            <td>PHONE</td>
            <td>
                <input type="text" maxlength="15"  value="<%=strmem_phone%>" size="20" name="PHONE" id="PHONE"   style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" <%=STATUS%> />
            </td>
            <td>EMAIL</td>
            <td colspan="2">
                <input type="text"  value="<%=strmem_email%>"  size="37" name="EMAIL" id="EMAIL"   style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" <%=STATUS%> />
            </td>
        </tr> 
        
        <tr>
            <td colspan="5" align="center">
                <input type="button" id="NewOwner" class="button" value="New" onclick="NewOwnerInformation()" />
                <input type="button" id="EditOwner" class="button" value="Edit" onclick="Edit_OwnerInformation()" />
                <input type="button" id="SaveOwner" class="button" value="Save" onclick="SaveOwnerInformation()" />
                <input type="button" id="CancelOwner" class="button" value="Cancel" onclick="cancelOwner()"/>
            </td>
                <input type="hidden" name="HdnEntitySeq" id="HdnEntitySeq" value="<%=strEntitySeq%>">
                <input type="hidden" name="PAGEID" id="PAGEID" value="OWNERREGISTRATION">
        </tr>
            
    </table>
   <div id="dialog-OwnerSearch" style="display:none; background:url('Images/trans-wood-1.png')" >
<iframe id="modalIFrame_OwnerSearch" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes" >
</iframe>
</div>
  
   <div id="dialog-AllCitySearch" style="display:none; background:url('Images/trans-wood-1.png')" >
    <iframe src="frmReg_SearchCityStateZip.jsp" id="AllCitySearch" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
</iframe>
</div>
 <div id="dialog-StateSearch" style="display:none; background:url('Images/trans-wood-1.png')" >
    <iframe src="frmReg_SearchCityStateZip.jsp" id="StateSearch" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
</iframe>
</div>
		

</form>
</body>
</html>
            
            
            
            