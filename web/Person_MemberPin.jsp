<%-- 
    Document   : Person_MemberPin
    Created on : Feb 23, 2016, 1:58:16 PM
    Author     : cntuser
--%>

<%@page import="pasotracker.GeneralServlet"%>
<%@page import="javax.sql.rowset.*"%>
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import= "javax.naming.*" %>
<%@ page import= "javax.sql.rowset.*" %>
<%@ page import= "pasotracker.DbConnMngr" %>
<%@ page import= "pasotracker.GeneralServlet" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MEMBER PASSWORD</title>

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
<script type="text/javascript" src="js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="js/interface.js"></script>
<script type="text/javascript" src="jscPerson.js"></script>     
<link href="buttons.css" rel="stylesheet" type="text/css" />
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="Style_Popup.css">
<link href="Registration.css" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
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
#BtnStyle {    
    text-align:center;    
}
</style>
</head>
<body>
<form name="Person_MemberPin_frm">
    <div id="container">
        <div id="header">
        <%@ include file="frmHeader.jsp"%>
        </div>
<%
    if(!bPersons)
    response.sendRedirect("login.jsp");

%>
        <div id="content">    
    <%@ include file="Person_CommonTopDemographics.jsp"%>
    
<%

    String strMemberPin="";
    ResultSet rs_SelectSet =null;
    CallableStatement pst = null;
    Connection con=null;
    DbConnMngr dbcnmgr=new DbConnMngr();
    
    if(EntitySeq!=null && EntitySeq.length()>0){
    try{                
        
      con=dbcnmgr.getCon();
      con.setAutoCommit(false);
      
      pst = con.prepareCall("{call GET_MEMBER_PIN(?)}");
      pst.setString(1, strASSIGNEDNUM);
      
      rs_SelectSet=pst.executeQuery();
      if(rs_SelectSet.next()){
      
         if(rs_SelectSet.getString("MEMBER_PIN")!=null)
            strMemberPin=rs_SelectSet.getString("MEMBER_PIN");
      }
    }
    catch(Exception e){
       System.err.println("Exception in Membner_Pin.jsp:"+e);
    }
    finally {
     if (rs_SelectSet != null) {
        rs_SelectSet.close();
    }
    if (pst != null) {
        pst.close();
    }
    dbcnmgr.releaseConnection(con);
    }
    }

%>    
    <table width="100%"> 
        <tr>
           <td width="10%"><b>MEMBER PIN:</b></td>
            <td>               
               <label id="memPin" ><h1><%=strMemberPin%></h1>
               </label>               
            </td>
        </tr>
      </table>
        </div>
        
        <div id="sidebar">                            
         <jsp:include page="Person_CommonSideMenu.jsp">
         <jsp:param name="cntPage" value="3" />
         <jsp:param name="Enty" value="<%=EntitySeq%>" />
         <jsp:param name="Id" value="<%=strASSIGNEDNUM%>" />
         </jsp:include>
        </div>

        <div id="footer_Bot" align="bottom">
        <jsp:include page="/frmBottom_Registration.jsp"/>
        </div>  
    </div>
</form>
<form name="form1" method="post" action="">
</form>
</body>
</html>

