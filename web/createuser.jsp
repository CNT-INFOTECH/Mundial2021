<%-- 
    Document   : createuser
    Created on : Jul 14, 2011, 2:28:58 PM
    Author     : dp
--%>

<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="login" class="login.SessionUserBean" scope="session"/>
<jsp:setProperty name="login" property="*"/>
<%@ page import = "java.util.*" %>
<html>
    <head>
<title>PASO TRACKER</title>

<link href="Registration.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="Style_Popup.css" rel="stylesheet" type="text/css" />

       <link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
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
        <script type="text/javascript" src="js/interface.js"></script>
		<script src="js/jquery.autocomplete.js"></script>
		<script type="text/javascript" src="jscReg_AutoComplete.js"></script>
        <script src="getevent.js"></script>
        <script src="addorg.js"></script>
        <script type="text/javascript" src="scripts/SRegistraion.js"></script>
        <script>



function createuser()
{

	var RolVal=document.forms[0].Role1.value.trim();
if(RolVal=="")
{
	var bok=confirm('Do you want to proceed without user role?');
	if(bok==true)
	{
		return Submit_UserDetails();
	}
	else
	{
		return false;
	}
}       
else
	Submit_UserDetails()

}
function Submit_UserDetails()
{
	document.forms[0].action="Registration";
	document.forms[0].method= "post";
	document.forms[0].submit();
}
/*
function Ajax_deleteRow_Roles()
{    
	var bok=confirm('Do you want to delete this Record?')
    
    if(bok==true)
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
      if(xmlhttp.responseText == 0)       
           return false;
      else 
      {  
        var Items=xmlhttp.responseText.split("#@#");                                     

        document.getElementById(varFocus).value="";
		document.getElementById(varFocus).value="";
        document.getElementById(varFocus).value="";

      }
    }
    }
    xmlhttp.open("GET","frmReg_SearchEntitySeq.jsp?enty="+Seq,true);
    xmlhttp.send(); 

		}
}*/
function deleteRow(r,TableID_Delete,Orgval,userid,objName){


    var i=r.parentNode.parentNode.rowIndex;

	if(Orgval.trim()=='')
	{
		//document.getElementById(TableID_Delete).deleteRow(i);
	if(i!=0)
		document.getElementById(TableID_Delete).deleteRow(i);

		return false;
	}

    var bok=confirm('Do you want to delete this Record?')
    
    if(bok==true)
        {
         			  var Type;
		  if(TableID_Delete=='PlanTab')
			{ 
			  var RwSize_Org=document.getElementById('hdnRowSize');
		  RwSize_Org.value=RwSize_Org.value-1;
			Type="Org";}
		  else if(TableID_Delete=='PlanTab_roles')
			{ var RwSize_role=document.getElementById('hdnRowSize_roles');
		  RwSize_role.value=RwSize_role.value-1;
 			Type="Role";
		  }

								
           if (Orgval==null ||Orgval=='' )
           {

        //document.forms[0].method="post";
        //document.forms[0].action='DeleteOrg.jsp?userid='+userid+'&Organization='+org;
        //document.forms[0].submit();
        document.getElementById(TableID_Delete).deleteRow(i);
          }

          if (Orgval!=null){


             document.getElementById(TableID_Delete).deleteRow(i);
             document.forms[0].method="post";
             document.forms[0].action='DeleteOrg.jsp?userid='+userid+'&Organization='+Orgval+'&Type='+Type;
             document.forms[0].submit();          
			 
              document.getElementById(objName).value='';
			  empty(objName)
          }
      	  

        //if(document.forms[0].Organization[i].value==null){
          //  alert('hello!!');
       //}else{
         //   document.getElementById(TableID_Delete).deleteRow(i);
        //}
        }
}
function empty(objName)
{

	document.getElementById(objName).value='';
}
function checkIt(evt) {
    evt = (evt) ? evt : window.event
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        //status = "This field accepts numbers only."
        alert("This field accepts only Numbers.")
        return false
    }

    return true
}

function OpenUserSearch(DgTitle,RetnID,RetnSeqID)
{

    $('#dialog-Roles').dialog({ autoOpen: false,height: 400,width: 800, modal: true });
    $('#dialog-Roles').dialog('open');
    $('#modalIFrame_Roles').attr('src','ModalPop_Roles.jsp?RetnID='+RetnID+'&RetnSeqID='+RetnSeqID);
    return false;

}

function passwordchk(){
    var password=document.usercreate.password.value;
    var confpassword=document.usercreate.cnf_password.value;

    if(password != confpassword) {
        alert('Your passwords do not match. Please type more carefully.');
        return false;
        }
       
      else{   

          return createuser();
      }
    

}




function passwordhide(){

                    element = document.getElementById('Password_DIV');
                    element.style.display = 'none';
                    document.forms[0].ChkPwdFlg.value='N';
}

function chg_passwordhide(){

                     element1 = document.getElementById('chg_password_DIV');
                    element1.style.display = 'none';
                    
                    
}

function OpenCommonRef1(userid,DgTitle)
{

    $('#dialog-CmmnRef').dialog({autoOpen: false,height: 290,width: 400, modal: true,title:DgTitle});
    $('#dialog-CmmnRef').dialog('open');
    $("#modalIFrame_CmmnRef").attr('src','Change_Password.jsp?userid='+userid);

    return false;

}

function OpenPassword_Change(UserId)
{
 
    $('#dialog-ChgPassword').dialog({autoOpen: false,height: 400,width: 400, modal: true,title:DgTitle});
    $('#dialog-ChgPassword').dialog('open');
    $("#modalIFrame_User").attr('src','Change_Password.jsp?userid='+UserId);

    return false;

}


function OpenSearch_User()
    {

    $('#dialog-User').dialog({ autoOpen: false,height: 400,width: 800, modal: true });
    $('#dialog-User').dialog('open');
    return false;

}

function validate(){

var userid=document.usercreate.userId.value;
var password=document.usercreate.password.value;
var lastname=document.usercreate.lastname.value;
var confpassword=document.usercreate.cnf_password.value;


if(userid=="" ){
 alert("Enter User Name!");
  return false;
}

if(password=="" && document.forms[0].ChkPwdFlg.value=='Y'){
 alert("Enter Password!");
  return false;
}

if (confpassword==""  && document.forms[0].ChkPwdFlg.value=='Y'){
    alert("Enter Confirm Password!");
    return false;
}

if(lastname==""){
    alert("Enter Last Name!");
    return false;
}


if(password!="" & confpassword!="" && document.forms[0].ChkPwdFlg.value=='Y'){
    return passwordchk();
}

      return createuser();

}
function Reset()
{      
document.forms[0].method="post";
document.forms[0].action="resetuser.jsp"
document.forms[0].submit();
}

        </script>

    </head>

    <body>

<form name="usercreate" method=post >
    

  <div id="container">
    <div id="header">
               <%@ include file="frmHeader.jsp"%>
    </div>

		<%
		
		if(!bAdmin)
		response.sendRedirect("login.jsp");


    String strOrganiztion = "";
	String strOrganization_Seq="";
    int Number_Of_Rows=1;
    String delimiter="#@#";


    if(login.getOrganization()!=null)
	{   strOrganiztion=login.getOrganization();
	}
	else
	{   strOrganiztion=" #@#";
	}

    String[] strOrganiztion_=strOrganiztion.split(delimiter);	

	if(login.getOrgSeq()!=null)
	{   strOrganization_Seq=login.getOrgSeq();
	}
	else
	{   strOrganization_Seq=" #@#";
	}

    String[] strOrganization_Seq_=strOrganization_Seq.split(delimiter);	

    String strRoles = "";
	String strRole_Id="";
    int Number_Of_Rows_roles=1;
    String delimiter_roles="#@#";


    if(login.getRoles()!=null)
        strRoles=login.getRoles();
	else
        strRoles=" #@#";

    String[] strRoles_=strRoles.split(delimiter_roles);
	//out.println("_-strRoles--"+login.getRoles());
	
	if(login.getUser_RoleId()!=null)
        strRole_Id=login.getUser_RoleId();
	else
        strRole_Id=" #@#";

    String[] strRole_Id_=strRole_Id.split(delimiter_roles);
	
%>

      <div id="content">
    <fieldset><legend>Register User:</legend>

        

            

            <br>
            <table class="altRow" width="100%">
<tr>
    <td width="80">
        <font class="label">USER NAME<span style="color:red;">*</span></font></td>
    <td width="165"><input type="text" name="userId" id="userId" size="18" onBlur="getUserDetails(this)" value="<%if (login.getUserId()!=null){ out.println(login.getUserId());}%>" maxlength="35" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
        <img src="Images/Find12.jpg"  onclick="OpenSearch_User()" /></td>
        
	<td width="110">
<%
if(login.getUserId()!=null)
{
if(login.getUserId().equalsIgnoreCase(strUserName) || userRoleId.equals("1") )
{
%>
	<font class="label"><span style="color:blue;"><a id="chg_password_DIV" href="#" onclick="OpenCommonRef1('<%=login.getUserId()%>','Change Password')">CHANGE PASSWORD</a></span></font>
<%}}%>
	</td>
	<td colspan="2"> </td></tr>
        </table>

        <div id="Password_DIV" title="Search Roles">
    <table class="altRow" width="100%">
        <tr>
    <td width="80" >
            <font class="label">PASSWORD<span style="color:red;">*</span></font></td>
    <td width="160"><input type="password" name="password" size="18" value="" maxlength="20" style="background-color:  #FFF8DC; border:  1px solid #000000;"></td>

    <td width="50">
    <font class="label">CONFIRM&nbsp;PASSWORD<span style="color:red;">*</span></font></td>
    <td width="170"><input type="password" name="cnf_password" size="18" value="" maxlength="20" style="background-color:  #FFF8DC; border:  1px solid #000000;">
    </td>
    <td colspan="2"> </td>
    </tr>
    </table></div>

            <table class="altRow" >
<tr><td width="80">
        <font class="label">NAME(F,L)<span style="color:red;">*</span></font></td>
    <td width="165"><input type="text" name="firstname" value="<%if (login.getFirstname()!=null){ out.println(login.getFirstname());}%>" size="30" maxlength="100" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"></td>
    <%--<td width="130">
        <font class="label">MIDDLE NAME</font></td>
    <td width="165"><input type="text" name="middlename" value="<%if (login.getMiddlename()!=null){ out.println(login.getMiddlename());}%>" size="18" maxlength="20" style="border: 1px solid #000000;"></td>--%>

     <td width="165"><input type="text" name="lastname" value="<%if (login.getLastname()!=null){ out.println(login.getLastname());}%>" size="30" maxlength="100" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"></td>

    <td width="263"> </td>
</tr>
</table>

            
      <table class="altRow" width="100%">
     <tr>
    <td width="80">
        <font class="label">ADDRESS1</font></td>
     <td width="165"><input type="text" name="address" value="<%if (login.getAddress()!=null){ out.println(login.getAddress());}%>" size="67" maxlength="100" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"></td>
<td colspan="2"> </td>
     </tr>

<tr>
<td width="80">
        <font class="label">ADDRESS2</font></td>
     <td width="165"><input type="text" name="address2" value="<%if (login.getAddress2()!=null){ out.println(login.getAddress2());}%>" size="67" maxlength="100" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"></td>
<td colspan="2"> </td>
</tr>
      </table>
     <table class="altRow">
<tr>
<td width="80">
        <font class="label">CITY</font></td>
     <td width="146"><input type="text" class="input_city" name="city" id="CITY" value="<%if (login.getCity()!=null){ out.println(login.getCity());}%>" size="18" maxlength="50" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" ></td>
	 <!--onChange="CityStateZipDetails('CITY','STATE','ZIP','COUNTRY',city.value,'CITY')"></td>-->

        <td width="64"> <font class="label">STATE</font></td>
     <td width="78"><input type="text" name="state" id="STATE" value="<%if (login.getState()!=null){ out.println(login.getState());}%>" size="7" maxlength="30" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" ></td>

        <td width="57"> <font class="label">ZIP</font></td>
     <td width="70"><input type="text" name="zip" id="ZIP" value="<%if (login.getZip()!=null){ out.println(login.getZip());}%>" size="5" maxlength="30" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" onChange="CityStateZipDetails('CITY','STATE','ZIP','COUNTRY',zip.value,'ZIP')"></td>
       
       <td width="85"> <font class="label">COUNTRY</font></td>
     <td width="140"><input type="text" name="country" id="COUNTRY" value="<%if (login.getCountry()!=null){ out.println(login.getCountry());}%>" size="5" maxlength="30" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" ></td>
     <td width="15">
</tr>

      </table>


<table class="altRow">
     <tr>
    <td width="88">
        <font class="label">PHONE#</font></td>
     <td width="165"><input type="text" name="phone" id="PHONE" onpaste="return false;"  value="<%if (login.getPhone()!=null){ out.println(login.getPhone());}%>" size="18" maxlength="20" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"></td>

    <td width="140">
        <font class="label">EMAIL</font></td>
     <td width="165"><input type="text" name="email" value="<%if (login.getEmail()!=null){ out.println(login.getEmail());}%>" size="18" maxlength="100" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"></td>

  <td width="80">
        <font class="label">STATUS</font></td>
    <td width="165"><select name="status" id="option" style="width:145px;background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
            <%  String strSelectedActive="selected";
        String strSelectedInActive="";
        if ((login.getStatus()!=null) && (login.getStatus().equals("ACTIVE")))
        {
            
            strSelectedActive="selected";
        }
       else if ((login.getStatus()!=null) && (login.getStatus().equals("INACTIVE")))
       {
           strSelectedInActive="selected";
}%>
    <option value="select">Select </option>
    <option <%=strSelectedActive%>  value="ACTIVE">Active</option>
    <option <%=strSelectedInActive%>  value="INACTIVE">Inactive</option>
</select>
</td>
</tr>


    </table>

 <table ><!--style="visibility:<%=Btn_OrgRole%>;" -->
 <tr>
 <td width="550">
 <table id="PlanTab">
   
    <%	
	int Org_Size=1;
	if(login.getOrgCount()!=null && !login.getOrgCount().equals("0"))
            Org_Size=Integer.parseInt(login.getOrgCount());
	else
            Org_Size=1;

	for (int i=0; i<Org_Size; i++)
    {

        String strOrgSeq="OrgSeq"+(i+1);
        String strOrganization1="Organization"+(i+1);
        String strRowID="Row"+i;

   %>     
       <tr id="<%=strRowID%>">

      

            <%if(i==0 ) { %>
	        <td width="10">
            <img src="Images/add.png"  name="PlanTab" width="16" height="16" alt="add" onClick="addPlan(this)">
			</td>
        <%}
         else  {
Number_Of_Rows+=1;%> <td width="10"><img src="Images/delete.png"  onClick="deleteRow(this,this.name,'<%=strOrganiztion_[i]%>','<%=login.getUserId()%>')" name="PlanTab" width="16" height="16" alt="add" onClick="addPlan(this)">
        </td><%}%>

        <td width="70"><font class="label">ORGANIZATION</font></td>
        <td width="30">
            <img alt="" src="Images/dropdown_icon4.gif"  onClick="OpenCommonRef('Organization','<%=strOrgSeq%>','<%=strOrganization1%>')">
		</td>
        <td width="69" >
            <!--Not using Org Seq-->
        <input type="hidden" id="<%=strOrgSeq%>"   name="<%=strOrgSeq%>"  value="<%--=strOrganization_Seq_[i]--%>" size="1"/>
        <input type="text" id="<%=strOrganization1%>"   name="<%=strOrganization1%>"  value="<%=strOrganiztion_[i]%>" class="allcaps" style="width:143px;background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" Readonly/>       
        
                  </td>
        <%
        if(i==0){
        %>
        <td width="10">
            <img src="Images/delete.png"  onClick="deleteRow(this,this.name,'<%=strOrganiztion_[i]%>','<%=login.getUserId()%>')" name="PlanTab" width="16" height="16" alt="add" onClick="addPlan(this)">
        </td>
        <%
            }
        }	 %>

</table>
</td>
 <td width="300">
 <table id="PlanTab_roles">
        <% 
		int Role_Size=1;
		if(login.getRoleCount()!=null && !login.getRoleCount().equals("0"))
			Role_Size=Integer.parseInt(login.getRoleCount());
		else
			Role_Size=1;

		for (int j=0; j<Role_Size; j++)
    {

        String strRoleSeq="RoleSeq"+(j+1);
        String strRole1="Role"+(j+1);
        String strRowID_role="Row_role"+j;
            %>
			<tr>
             <div id="<%=strRowID_role%>">                         

            <%if(j==0 ) { %>
			<td width="10">
            <img src="Images/add.png"  name="PlanTab_roles" width="16" height="16" alt="add" 
			onClick="addPlan_roles(this)">
			</td>
     <%}
         else  {
Number_Of_Rows_roles+=1;%>
<td width="10">
            <img src="Images/delete.png"  onClick="deleteRow(this,this.name,'<%=strRole_Id_[j]%>','<%=login.getUserId()%>')" name="PlanTab_roles" width="16" height="16" alt="add" onClick="addPlan(this)">
     </td><%}%>

        <td width="70"><font class="label">USER ROLE</font></td>
        <td width="30">
            <img alt="" src="Images/Find12.jpg"  onClick="OpenUserSearch('Role','<%=strRoleSeq%>','<%=strRole1%>')"></td>
        <td width="100" nowrap >
        <input type="hidden" id="<%=strRoleSeq%>"   name="<%=strRoleSeq%>"  value="<%=strRole_Id_[j]%>" size="1"/>
        <input type="text" id="<%=strRole1%>"   name="<%=strRole1%>"  value="<%=strRoles_[j]%>" class="allcaps" style="text-transform: uppercase;width:135px;background-color:  #FFF8DC; border:  1px solid #000000;" Readonly/>
<%if(j==0 ) { %>
</td><td>
        <img src="Images/delete.png"
onClick="deleteRow(this,this.name,'<%=strRole_Id_[j]%>','<%=login.getUserId()%>','<%=strRole1%>')" 
             name="PlanTab_roles" width="16" height="16" alt="add" onClick="addPlan(this)">
       </td> <%}%>

        </td>
             </div></tr>
        <%}%>
</table>
	 </td>            
          </tr>        
</tr>
       
        
        
         
        </table>
<input type="hidden" name="hdnRowSize" id="hdnRowSize" value="<%=Number_Of_Rows%>" />
<input type="hidden" name="hdnRowSize_roles" id="hdnRowSize_roles" value="<%=Number_Of_Rows_roles%>" />
        <%--<input type=hidden name="hdnColSize" value="<%=strNumberofJudges%>">
        <input type=hidden name="hdnShowSeq" value="<%=strShowSeq%>">
        <input type="hidden" name="PageID" value="SHOWS_JUDGES">  --%>
        <input type="hidden" name="PAGEID" value="CREATEUSER">


 </fieldset>
        <br/>
        <div align="center">
    <table ><tr>

<td>
   <input type="SUBMIT" class="button" value="Submit" onclick="return validate();" ></td>
   <!--style="visibility:<%=Adm_BtnStatus%>;" ></td>-->
   <td>

   <input type="button" class="button" value="Reset" onclick="Reset();"></td>
   
 </tr></table></div>


<input type="hidden" name="ChkPwdFlg" id="ChkPwdFlg" value="Y">
   


</div>
<div id="sidebar">
        <table style="border-collapse:collapse;">
  <tr>
    <td>
      <div onclick="location.href='createuser.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >User SetUp&raquo;&nbsp;&nbsp;&nbsp;&nbsp;</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="location.href='user_role.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >Role SetUp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
    </td>
  </tr>
  <tr>
    <td>
      <div  onclick="location.href='frmAccessScreen.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >Screen Access&nbsp;&nbsp;&nbsp;&nbsp;</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="location.href='frmPointSystem.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >Point System&nbsp;&nbsp;&nbsp;&nbsp;</div>
    </td>
  </tr>
  <tr>
    <td>
      <div  onclick="location.href='frmWho_Gets_Point.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >Who Gets Points&nbsp;&nbsp;</div>
    </td>
  </tr>
  <tr>
    <td>
      <div  onclick="location.href='frmAdmn_Others.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >Others&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
    </td>
  </tr>
</table>
    </div>
<div id="dialog-User" title="Search User" style="display:none; background:url('Images/trans-wood-1.png'); " >
    <iframe  src="ModalPop_User.jsp"  id="modalIFrame_User" height="100%" width="100%" marginheight="0" marginwidth="0" frameborder="0" >
</iframe>


  </div>
        
<div id="dialog-Roles" title="Search Roles" style="display:none; background:url('Images/trans-wood-1.png'); " >
    <iframe   id="modalIFrame_Roles" height="100%" width="100%" marginheight="0" marginwidth="0" frameborder="0" >
</iframe>
</div>

<div id="dialog-CmmnRef" style="display:none; background:url('Images/trans-wood-1.png')" >
<iframe id="modalIFrame_CmmnRef" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
</iframe>
</div>


<%
String strMode=request.getParameter("mode");
if (strMode!=null)
       {
         if(strMode.equals("1"))
             {
             %>
             <script>				 
                 alert("Saved Successfully.");
				 document.forms[0].method="post"
				 document.forms[0].action="Admin_GetUserDetails.jsp?userid="+document.getElementById('userId').value;
				 document.forms[0].submit();
                 passwordhide();
             </script>
             <%
                     }
         else if(strMode.equals("2"))
          { %>
                    <script>
                        
                 passwordhide();
                 </script>  
             <%
                     }
         else if(strMode.equals("3"))
          { %>
                    <script>

                 passwordhide();
                 </script>
             <%
                     }
        
         }
 else { %>
 <script>
     
     chg_passwordhide();
     
 </script>
 <%}

%>

</div>
</form>
</body>
</html>