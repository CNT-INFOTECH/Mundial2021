<%-- 
    Document   : LoginWelcome
    Created on : Sep 17, 2014, 3:16:11 PM
    Author     : cntuser
--%>

<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <%@ page import = "java.io.*" %>
    <%@ page import = "java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.naming.*" %>
    <%@ page import="javax.sql.rowset.*" %>
    <%@ page import="pasotracker.GeneralServlet" %>
    <%@ page import="pasotracker.DbConnMngr" %>

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Welcome To PasoTracker</title>

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
        
    </head>
     
    <body  onload="display_ct()" >
    <form name="LoginWelcome">
    
    
<div id="container">
    
    <div id="header">
        <%@ include file="frmHeader.jsp"%>
        
        


    </div>
     <table width="100%" style="text-align:center;border:1px solid white;">
        <tr>
           <td><br><br><br><br><br><br><br><br></td>
        </tr>
          <tr>
             <td width="100%" ><h1>WELCOME TO PASOTRACKER</h1></td>
          </tr>
          <tr>
             <td><%--img src="Images/BgImage_Certificate.JPG"    --%></td>
          </tr>
          <tr>
           <td><br><br><br><br><br><br><br><br></td>
        </tr>
        <tr>
           <tD>
              <jsp:include page="/frmBottom_Registration.jsp"/><br><br><br>
           </tD>
        </tr>
       </table>     
    <div id="content">
        
       
          
                        
            <input type="hidden" name="PAGEID" id="PAGEID" value="WelcomeScreen" />   
            <input type="hidden" name="SavedYN" id="SavedYN" value="Y" />  
    
    </div><!--content-->



</div><!--container-->

</form>
    
    </body>
</html>
