<%-- 
    Document   : Shows_Points_Results
    Created on : Jun 16, 2011, 8:41:18 PM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Shows_Pop.css" rel="stylesheet" type="text/css" />
 <link href="Tables_style.css" rel="stylesheet" type="text/css" />
 <link href="buttons.css" rel="stylesheet" type="text/css" />
 <link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
 <link href="style.css" rel="stylesheet" type="text/css" />

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
         <script type="text/javascript" src="ui/jquery.ui.autocomplete.js"></script>
         <script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>

         <script type="text/javascript" src="js/jquery.js"></script>
         <script type="text/javascript" src="js/interface.js"></script>
        <script type="text/javascript" src="scripts/jscShows_Points.js"></script>



<!-- <script type="text/javascript" src="AutoComplete/jquery.js"></script> -->
<script type='text/javascript' src='AutoComplete/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="AutoComplete/jquery.autocomplete.css" />
<%@ page import = "model.GetInterface" %>
<%@ page import = "java.util.*" %>

    </head>
    <body>
        <%
         String strMode="";
         strMode =request.getParameter("mode");

         String strShowSeq="";
         strShowSeq =request.getParameter("ShowSeq");

         String strEventSeq="";
         strEventSeq =request.getParameter("EventSeq");

         String strCategory="";
         strCategory =request.getParameter("Category");

         String strFromDate="";
         strFromDate =request.getParameter("strFromDate");

         String strToDate="";
         strToDate =request.getParameter("strToDate");


         if(strMode!=null)
             {
             
            GetInterface GUI=new GetInterface();
            List LiValues= GUI.GET_SHOWS_POINTS(strShowSeq,strEventSeq,"","","");
            request.setAttribute("LiValues", LiValues);

     %>


   <display:table  id="Details" name="requestScope.LiValues"
                           class="grid"
                           style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
    <display:column style="width:18%" title="Name" property="HName" headerClass="Grid_Header" />
    <display:column style="width:18%" property="Placement" headerClass="Grid_Header" />
    <display:column style="width:18%" property="Points" headerClass="Grid_Header" />
    </display:table>
    <%}%>
    </body>
</html>
