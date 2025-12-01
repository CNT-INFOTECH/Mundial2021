<%-- 
    Document   : frmAccessScreen
    Created on : Oct 17, 2011, 4:11:33 PM
    Author     : dp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>PASO TRACKER</title>

<link href="Registration.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="Style_Popup.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
        <script type="text/javascript" src="jquery-1.5.1.js"></script>
	<script type="text/javascript" src="external/jquery.bgiframe-2.1.2.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.core.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.mouse.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.button.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.draggable.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.position.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.resizable.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.dialog.js"></script>
	<script type="text/javascript" src="ui/jquery.effects.core.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>
        <script type="text/javascript" src="js/interface.js"></script>
        <script>



           function fninsupdscreen()
{


document.forms[0].method="post";
document.forms[0].action="frmAccessScreeninsupd";
document.forms[0].submit();
}

            function OpenUserSearch()
{

    $('#dialog-Roles').dialog({ autoOpen: false,height: 400,width: 800, modal: true });
    $('#dialog-Roles').dialog('open');
    return false;

}
            function validate(){
var roleid=document.frmscreensccess.role_Id.value;

if(roleid=="" ){
 alert("Select Role ID!");
  return false;
}
if(roleid!=""){
    return fninsupdscreen();

}
return true;
}

           function Reset()
{


document.forms[0].method="post";
document.forms[0].action="frmAccessScreen.jsp"
document.forms[0].submit();
}
function Check_Values(obVal1,obVal2)
{
    if(obVal1.checked==true)
		obVal2.checked=false;    
 
}
        </script>
    </head>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import= "javax.naming.*" %>
<%@ page import= "javax.sql.rowset.*" %>
<%@ page import =  "model.*" %>
<%@ page import =  "pasotracker.*" %>
<%@ page import =  "login.AcessScreen_GetDetails" %>
<body>
        <div id="container">
    <div id="header">
            <%@ include file="frmHeader.jsp" %>
        </div>
		<%
		if(!bAdmin)
		response.sendRedirect("login.jsp");

		
        int cnt=1;
        try
        {
/*Connection localConnection=null;
DbConnMngr dbcmt=new DbConnMngr();
ResultSet rs;
//Call your DB

        localConnection=dbcmt.getConnection();
		localConnection.setAutoCommit(false);
        String Roleid="";
        
        if(request.getParameter("RLD")!=null)
            Roleid=request.getParameter("RLD");

        String RoleName="";
       
       CallableStatement cst = localConnection.prepareCall("{call [GET_SCREEN_DETAILS](?)}",ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        cst.setString(1, Roleid);
        rs = cst.executeQuery();
        
            if(rs.next())
            {
                if(rs.getString("RoleName")!=null)
                    RoleName= rs.getString("RoleName");
            }
         
*/
           //Statement st=localConnection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
           //rs=st.executeQuery("select * from Master_Screen_Name");

/****	added by erzath ********************/
	AcessScreen_GetDetails gen=new AcessScreen_GetDetails(); 
         RowSetFactory factory25 = RowSetProvider.newFactory();
   CachedRowSet rs_RoleName= factory25.createCachedRowSet();
    RowSetFactory factory26 = RowSetProvider.newFactory();
   CachedRowSet rs= factory26.createCachedRowSet();
    //CachedRowSetImpl rs = new CachedRowSetImpl(); 
	//CachedRowSetImpl rs_RoleName = new CachedRowSetImpl(); 
	//ResultSet rs;
	String Roleid="";
        
	if(request.getParameter("RLD")!=null)
		Roleid=request.getParameter("RLD");


	String RoleName="";
	
	rs_RoleName = gen.Get_AccessScreenDetails(Roleid);
	rs = gen.Get_AccessScreenDetails(Roleid);

	if(rs_RoleName.next())
	{		
		if(rs_RoleName.getString("RoleName")!=null)
			RoleName= rs_RoleName.getString("RoleName");
		else
			RoleName="";
	}

/****	end of erzath	********************/	
        %>

<div id="sidebar">
        <table style="border-collapse:collapse;">
  <tr>
    <td>
      <div onclick="location.href='createuser.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >User SetUp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
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
padding: 4px;" >Screen Access&raquo;&nbsp;&nbsp;</div>
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
        
      <form name="frmscreensccess">
	  <input type="hidden" name="userName" id="userName" value="<%=strUserName%>">
      <div id="content">
    <fieldset><legend>Role Access Screen:</legend>
       
        <table class="screen" width="100%">

<br>



<tr><td width="80" >
        <font class="label">ROLE NAME<span style="color:red;">*</span></font></td>

    <td > <input type="text" name="role_name" size="60" maxlength="60"
                            style="text-transform:uppercase;background-color:  #FFF8DC;border: 1px solid #000000;"
                            value='<%=RoleName%>' >
<img src="Images/Find12.jpg" onclick="OpenUserSearch()"/></td>
    <td><input type="hidden" name="role_Id" size="60"  maxlength=60
                            style="border: 1px solid #000000;"
                            value='<%=Roleid%>' ></td>
<td colspan="2"> </td>
</tr>
        </table>      

    </fieldset>


          <table class="grid" align="center"  border="0" cellpadding="0" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th width="100px" align="center">ID#</th>
                <th width="350px" align="center">SCREEN NAME</th>               
				<th title="View" align="center">VIEW</th>
                <th title="Insert/Update" align="center">INSERT/UPDATE</th>                
            </tr>            
        </thead>
        <%
//rs.absolute(0);
while (rs.next()) {

       String strScreeName="screen_name"+cnt;
       String strView="View"+cnt;
       String strInsUpd="InsUpd"+cnt;
       String strmodule_name="module_name"+cnt;
       String strscreen_id="screen_id"+cnt;
	   String oddEven="";
	   if(cnt%2==0)
			oddEven="odd_Admin";
	   else
			oddEven="even_Admin";
        %>
        <tr ><td STYLE="border-bottom: 1px DOTTED #fff;"
		class='<%=oddEven%>' align="center" ><%=rs.getInt(3)%>.</td>
        <td align="left" STYLE="border-bottom: 1px DOTTED #fff;" class='<%=oddEven%>'><input type="hidden" name="<%=strScreeName%>" size="45" value="<%=rs.getString(4)%>"
                             Readonly>
		<label ><%=rs.getString(4)%></label>					 
		</td>
     
        <td align="center" class='<%=oddEven%>' STYLE="border-bottom: 1px DOTTED #fff;"><input type="checkbox" name="<%=strView%>" value="View"
		onclick="Check_Values(<%=strView%>,<%=strInsUpd%>)" 
		<% if ("View".trim().equals(rs.getString(6))) {%> checked <%}%>></td>
        
        <td align="center" class='<%=oddEven%>' STYLE="border-bottom: 1px DOTTED #fff;"><input type="checkbox" name="<%=strInsUpd%>" value="InsUpd" 
		onclick="Check_Values(<%=strInsUpd%>,<%=strView%>)"
		<% if ("InsUpd".trim().equals(rs.getString(7))) {%> checked <%}%>></td>
        <input type="hidden" name="<%=strmodule_name%>" size="10" value="<%=rs.getString(5)%>">
        <input type="hidden" name="<%=strscreen_id%>" size="10" value="<%=rs.getInt(3)%>">


       <%  cnt+=1;
        }
       %> 
       <%
// close all the connections.
/*rs.close();
cst.close();
localConnection.close();*/
} catch (Exception ex) {
    out.println("Unable to connect to database.");
    }
      %>

     
        </table>

<div align="center">
    <table><tr>

<td>

   <input type="button" class="button" value="Submit" onclick="return validate();" 
      style="visibility:<%=Adm_BtnStatus%>;" >
 <input type="hidden" name="hdnSize" value="<%=cnt%>"></td>
<td><input type="button" class="button" value="Reset" onClick="return Reset();" ></td> </tr></table></div>


<div id="dialog-Roles" title="Search Roles" style="display:none; background:url('Images/trans-wood-1.png'); " >
    <iframe  src="ModalPop_Roles.jsp"  id="modalIFrame_Roles" height="100%" width="100%" marginheight="0" marginwidth="0" frameborder="0" >
</iframe>
</div>


      </div>
</form>
        </div>
    </body>
</html>
