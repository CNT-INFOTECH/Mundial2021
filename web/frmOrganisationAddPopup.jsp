<%-- 
    Document   : frmOrganisationAddPopup
    Created on : May 3, 2011, 5:41:16 PM
    Author     : Erzath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Organisation</title>
        <link rel="stylesheet" href="themes/base/jquery.ui.all.css">
<meta name="Description" content="How to Build a Basic CSS Layout" />
<meta name="Keywords" content="css layout" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
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

<style type="text/CSS">

div#wrapper1 {
width: 100%;
background:url("Images/trans-wood-1.png");

margin-top:10px;
margin-bottom: 10px;
margin-left: auto;
margin-right: auto;
padding: 0px;
/*border: thin solid #000000;*/
}
/*
#contents {

background:  url("Images/logo_apccpfa_oficial_no_back4.png") no-repeat center;
align : center;
top : 1px;
margin : 0px 0px 0 100px;
padding : 8 0px 8px 8px;
color : #000000;
width : 70%;
height:100%;
border : 1px solid #ccc;
}
*/
.altRow
{

}

.altRow td
{
	border-bottom:1px dotted #ffffff;
	font-size:9pt;
	color:#000000;
	padding:5px 0 5px 5px;
	vertical-align:top;
	text-align:center;
}


.altRow  th
{
	background:#4e738f;
	color:#fff;
	font-weight:bold;
	font-size:9pt;
	text-align:center;
}

</style>        
        
    </head>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.DBConnection" %>
<%@ page import="pasotracker.GeneralServlet" %>  
    <body>
        <form name="OrganisationAddPopup" method="post">
<%
    String SeqNo="";
    String strValue="";


    if(request.getParameter("SeqNo")!=null)
        SeqNo=request.getParameter("SeqNo");

RowSetFactory factory13 = RowSetProvider.newFactory();
   CachedRowSet crs= factory13.createCachedRowSet();
     //   CachedRowSetImpl crs = new CachedRowSetImpl();
        GeneralServlet GEN = new  GeneralServlet();
        crs = GEN.GetCommonDetails(SeqNo,"");                                        

        while(crs.next())
        {

            if(crs.getString("SEQNO")!=null)
                SeqNo=crs.getString("SEQNO"); 

            if(crs.getString("VALUE")!=null)
                strValue=crs.getString("VALUE").trim();                     
        }

%>
        <div id="wrapper1">
            <table width="100%" border="0" class="altRow">
                <tr>
                    <th colspan="2" >
                        ADD ORGANISATION
                    </th>
                </tr>
                <tr>
                    <td>
                        ORGANISATION
                    </td>
                    <td>
                    <input type="text" maxlength="20" name="txtOrganisation_add" value="<%=strValue%>" id="txtOrganisation_add" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button id="AddOrganisationBtn">Add</button>
                    </td>
                </tr>
            </table>
            <input type="hidden" name="HdnOrgSeq" id="HdnOrgSeq" value="<%=SeqNo%>">
        </div>
        </form>           
    </body>
</html>
