<%-- 
    Document   : Admn_UserProfile
    Created on : Feb 1, 2013, 4:39:33 PM
    Author     : erzath
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
        <title>PASO TRACKER </title>
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
        <script src="js/jquery.autocomplete.js"></script>
        <script type="text/javascript" src="jscReg_AutoComplete.js"></script>
        
        <script>

$(document).ready(
    function()
    {
        $('#dock').Fisheye(
            {
                maxWidth: 50,
                items: 'a',
                itemsText: 'span',
                container: '.dock-container',
                itemWidth: 40,
                proximity: 90,
                halign : 'center'
            }
        )
    }
);
function CalculatorPopUp()
{
    $('#dialog-Calculator').dialog({autoOpen: false,height: 280,width: 350, modal: true});
    $('#dialog-Calculator').dialog('open');
    return false;
}
function OpenCommonRef1(userid,DgTitle)
{

    $('#dialog-CmmnRef').dialog({autoOpen: false,height: 220,width: 400, modal: true,title:DgTitle});
    $('#dialog-CmmnRef').dialog('open');
    $("#modalIFrame_CmmnRef").attr('src','Change_Password.jsp?userid='+userid);

    return false;
}
function validate()
{
    var lastname=document.userProfile.lastname.value;
    var lastname=document.userProfile.firstname.value;



    if(lastname==""){
        alert("Enter Last Name!");
        return false;
    }

    document.forms[0].action="Registration";
    document.forms[0].method= "post";
    document.forms[0].submit();
}
        </script>
    </head>
    <body>
        <form name="userProfile">
        <div id="container">

        <div id="header">
                   <%@ include file="frmHeader.jsp"%>
        </div>
        <div id="content">
<%
    Connection localConnection=null;
    DbConnMngr dbcmt=new DbConnMngr();
    localConnection=dbcmt.getConnection();
    localConnection.setAutoCommit(false);
     RowSetFactory factory45 = RowSetProvider.newFactory();
   CachedRowSet rs1= factory45.createCachedRowSet();
//    CachedRowSetImpl rs1 = new CachedRowSetImpl();

    if(request.getParameter("userid")!=null)
        strUserName=request.getParameter("userid");

    String strFrom="";

    if(request.getParameter("ty")!=null)
        strFrom=request.getParameter("ty");
    
    try{
        CallableStatement cst = localConnection.prepareCall("{call GET_USER_DETAIL(?,?,?,?)}");
        cst.setString(1, strUserName);
        cst.setString(2, "");
        cst.setString(3, "");
        cst.setString(4, "");

        ResultSet rs = cst.executeQuery();
        rs1.populate(rs);
        String strOrganization="";
        String strRoleName="";
        String strRoleId="";
        while(rs1.next())
        {
            login.setUserId(rs1.getString("userid").trim());
            login.setFirstname(rs1.getString("user_firstname").trim());
            login.setLastname(rs1.getString("user_lastname").trim());
            
            login.setAddress(rs1.getString("user_address1").trim());
            login.setAddress2(rs1.getString("user_address2").trim());
            login.setCity(rs1.getString("user_city").trim());
            login.setState(rs1.getString("user_state").trim());
            login.setZip(rs1.getString("user_zip").trim());
            login.setCountry(rs1.getString("user_country").trim());
            login.setPhone(rs1.getString("user_phone").trim());
            login.setEmail(rs1.getString("user_email").trim());
            
        }
    rs1.close();
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
    session.setAttribute("userBean", login);


%>
            <fieldset>
                <legend>User Profile:</legend>

                <br>
            <table class="altRow" width="100%">
                
            <tr>
                <td width="80">
                    <font class="label">USER NAME<span style="color:red;">*</span></font>
                </td>
                <td width="165">
                    <input type="text" name="userId" id="userId" size="30" onBlur="getUserDetails(this)"
                           value="<%if (login.getUserId()!=null){ out.println(login.getUserId());}%>"
                           maxlength="35" readonly
                           style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
                </td>
                <td>
                    <font>
                        <span style="color:blue;">
                            <a id="chg_password_DIV" href="#"
                               onclick="OpenCommonRef1('<%=login.getUserId()%>','Change Password')">CHANGE PASSWORD</a>
                        </span>
                    </font>
                </td>
                <td colspan="2"> </td>
            </tr>
                    
            <tr>
                <td width="80">
                    <font class="label">NAME(F,L)<span style="color:red;">*</span></font>
                </td>
                <td width="165">
                    <input type="text" name="firstname" value="<%if (login.getFirstname()!=null){ out.println(login.getFirstname());}%>"
                           size="30" maxlength="100" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
                </td>
                 <td width="165">
                     <input type="text" name="lastname" value="<%if (login.getLastname()!=null){ out.println(login.getLastname());}%>"
                            size="30" maxlength="100" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
                 </td>
                <td width="261"> </td>
            </tr>

            <tr>
                <td width="80">
                    <font class="label">ADDRESS1</font>
                </td>
                <td colspan="2">
                    <input type="text" name="address" value="<%if (login.getAddress()!=null){ out.println(login.getAddress());}%>" size="67" maxlength="100" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
                </td>
                <td width="261"> </td>
            </tr>
            
            <tr>
                <td width="80">
                        <font class="label">ADDRESS2</font>
                </td>
                <td colspan="2">
                    <input type="text" name="address2" value="<%if (login.getAddress2()!=null){ out.println(login.getAddress2());}%>" size="67" maxlength="100" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
                </td>
                <td width="261"> </td>
            </tr>
            </table>
            <table class="altRow">
            <tr>
                <td width="80">
                    <font class="label">CITY</font>
                </td>
                <td width="146">
                    <input type="text" class="input_city" name="city" id="CITY"
                           value="<%if (login.getCity()!=null){ out.println(login.getCity());}%>" size="18" maxlength="50"
                           style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" >
                </td>
                <td width="64"><font class="label">STATE</font></td>
                <td width="78">
                    <input type="text" name="state" id="STATE"
                           value="<%if (login.getState()!=null){ out.println(login.getState());}%>" size="7" maxlength="30"
                           style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" >
                </td>

                <td width="57"> <font class="label">ZIP</font></td>
                <td width="70"><input type="text" name="zip" id="ZIP" value="<%if (login.getZip()!=null){ out.println(login.getZip());}%>" size="5" maxlength="30" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" onChange="CityStateZipDetails('CITY','STATE','ZIP','COUNTRY',zip.value,'ZIP')"></td>

                <td width="85"> <font class="label">COUNTRY</font></td>
                <td width="140"><input type="text" name="country" id="COUNTRY" value="<%if (login.getCountry()!=null){ out.println(login.getCountry());}%>" size="5" maxlength="30" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" ></td>
                <td width="15">
            </tr>

      </table>


<table class="altRow">
     <tr>
    <td width="80">
        <font class="label">PHONE#</font></td>
     <td width="165">
         <input type="text" name="phone" id="PHONE" onpaste="return false;"
                value="<%if (login.getPhone()!=null){ out.println(login.getPhone());}%>" size="20" maxlength="20"
                style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
     </td>

     <td width="48">
        <font class="label">EMAIL</font>
     </td>
     <td colspan="4">
         <input type="text" name="email" value="<%if (login.getEmail()!=null){ out.println(login.getEmail());}%>" size="58" maxlength="100"
                style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
     </td>
     <td width="90"> </td>
</tr>


    </table>
                
            </fieldset>

                <br/>

                <div align="center">
                <table>
                    <tr>
                        <td>
                            <input type="SUBMIT" class="button" value="Submit" onclick="return validate();" >
                        </td>
                        <td>
                            <input type="button" class="button" value="Reset" onclick="Reset();">
                        </td>
                    </tr>
                </table>
                    <input type="hidden" name="PAGEID" value="UpdateUserProfile">
                </div>

        </div>
        <div id="sidebar">
            
            <%if(strFrom.equalsIgnoreCase("R")){%>
            <%@ include file="UserProfile_RegSide.jsp"%>
            <%}else if(strFrom.equalsIgnoreCase("S")){%>
            <%@ include file="UserProfile_ShowSide.jsp"%>
            <%}else if(strFrom.equalsIgnoreCase("P")){%>
            <%@ include file="UserProfile_PersonSide.jsp"%>
            <%}%>
        </div>

        <div id="dialog-CmmnRef" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe id="modalIFrame_CmmnRef" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
        </iframe>
        </div>
		
        <div id="dialog-Calculator" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe src="frmCalculator.jsp" id="modalIFrame_Calculator" width="99.7%" height="100%" marginwidth="0" marginheight="0"  frameborder="0" >
        </iframe>
        </div>
        </div>

        </form>
    </body>
</html>
