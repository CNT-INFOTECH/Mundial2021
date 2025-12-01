<%-- 
    Document   : frmAdmn_Others
    Created on : Mar 1, 2013, 1:04:44 PM
    Author     : Erzath
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="login" class="login.SessionUserBean" scope="session"/>
<jsp:setProperty name="login" property="*"/>
<%@ page import = "java.util.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OTHERS </title>
 <link href="Registration.css" rel="stylesheet" type="text/css" />
 <link href="style.css" rel="stylesheet" type="text/css" />
 <link href="buttons.css" rel="stylesheet" type="text/css" />

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
        

        <script>


function submitOthers(obj1,obj2)
{
    val1 =obj1.value;
    val2= obj2.value;
    if(obj1.value=='')
    {
        alert("please enter Secretario Name")
        return false;
    }
    if(obj2.value=='')
    {
        alert("please enter Presidente Name")
        return false;
    }


    document.forms[0].action="Registration"
    document.forms[0].method="post";        
    document.forms[0].submit();

}
function Reset()
{
    document.forms[0].action="frmAdmn_Others.jsp?mode=2"
    document.forms[0].method="post";        
    document.forms[0].submit();
}
    </script>

    </head>
    <body>
    <form name="admn_Others" method=post >


        <div id="container">
            <div id="header">
                   <%@ include file="frmHeader.jsp"%>
            </div>

            <div id="content">
    <fieldset><legend>Others:</legend>
    <table class="altRow" width="100%">

    <br>
    <%

    if(!bAdmin)
        response.sendRedirect("login.jsp");
    
    String seceratoryName="";
    String presidentName="";
    
    String strMode="";

    if(request.getParameter("mode")!=null)
        strMode=request.getParameter("mode");
    
    Connection localConnection=null;
    DbConnMngr dbcmt=new DbConnMngr();
    localConnection=dbcmt.getConnection();
    localConnection.setAutoCommit(false);

    //if(strMode.equals("1"))
    //{
    try{
        CallableStatement cst = localConnection.prepareCall("{call GET_REGISTRADOR_PRESIDENT_NAME()}");

        ResultSet rs = cst.executeQuery();

        while(rs.next())
        {
        login.setSecretaryName(rs.getString("REGISTRADOR"));
        login.setPresidentName(rs.getString("PRESIDENTE"));
        }
        rs.close();
        cst.close();
        localConnection.commit();
        dbcmt.releaseConnection(localConnection);
        }

        catch(Exception ex)
        {
            ex.printStackTrace();
            try
            {
                localConnection.rollback();
                dbcmt.releaseConnection(localConnection);
            }
            catch(SQLException exc)
            {
            exc.printStackTrace();
            }

        }
    //}
    if(strMode.equals("2"))
    {
        login.setSecretaryName("");
        login.setPresidentName("");
    }
    %>
    <tr>
        <td nowrap width="180">
        <font class="label">SECRETARIO/REGISTRADOR : <span style="color:red;">*</span></font>
        </td>

        <td width="150"> 
            <input type="text" name="secName" id="secName" size="60"  maxlength=35
                style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;"
				 value='<%if(login.getSecretaryName()!=null)
                                                    out.println(login.getSecretaryName().trim());%>'>

        </td>
        <td colspan="2"> </td>
    </tr>
    <tr>
        <td >
            <font class="label">PRESIDENTE : <span style="color:red;">*</span></font>
        </td>
        <td width="140">
            <input type="text" name="presName" id="presName" size="60" maxlength ="35"
                   style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"
                   value="<%if(login.getPresidentName()!=null)
                            out.println(login.getPresidentName().trim());%>" >
        </td>
        <td colspan="2"> </td>
    </tr>
    <input type="hidden" name="PAGEID" value="Admn_Others">
    </table>
    </fieldset>
    <div align="center">
        <table >
            <tr>
                <td>
                    <input type="button" class="button" value="Submit" onclick="submitOthers(secName,presName)" >
                </td>
                <td>
                    <input type="button" class="button" value="Reset" onClick="return Reset();" >
                </td>
            </tr>
        </table>
    </div>
    </div>
            
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
                padding: 4px;" >Others&raquo;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                    </td>
                  </tr>
                </table>
            </div>
        </div>
    </form>
    </body>
</html>
