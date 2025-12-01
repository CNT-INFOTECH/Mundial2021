<%-- 
    Document   : Shows_EquitationCountryDetails
    Created on : Jul 2, 2012, 5:02:11 PM
    Author     : Erzath
--%>
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>COUNTRY DETAILS</title>
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />
        <link href="Shows_Pop.css" rel="stylesheet" type="text/css" />
    </head>    
        <%@ page import="java.util.*" %>
        <%@ page import="java.io.*" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="javax.sql.rowset.*" %>
        <%@ page import = "java.util.*" %>
        <%@ page import = "java.net.*" %>
        <%@ page import = "java.sql.*" %>
        <%@ page import =  "model.*" %>

<%
    String strValue="";
    String SrchType="";
    String strCountry="";
    String strSchool="";
	String strShowSeq="";
    String strEventSeq="";
    String strEventFromDate="";
    String strEventToDate="";
    
    if(request.getParameter("Cntry")!=null)
        strValue=request.getParameter("Cntry");
    else
        strValue="";
         
    if(request.getParameter("Srch")!=null)
        SrchType=request.getParameter("Srch");
    else
        SrchType="";
    
    if(SrchType.equals("Country"))
        strCountry=strValue;
    else if(SrchType.equals("School"))
        strSchool=strValue;
	
	if(request.getParameter("ShwSeq")!=null)
        strShowSeq=request.getParameter("ShwSeq");
    else
        strShowSeq="";
    
    if(request.getParameter("EvSeq")!=null)
        strEventSeq=request.getParameter("EvSeq");
    else
        strEventSeq="";
    
    if(request.getParameter("EvFrm")!=null)
        strEventFromDate=request.getParameter("EvFrm");
    else
        strEventFromDate="";
    
    if(request.getParameter("EvTo")!=null)
        strEventToDate=request.getParameter("EvTo");
    else
        strEventToDate="";
    
    
    
    
    Connection localConnection=null;
    DbConnMngr dbcmt=new DbConnMngr();
    localConnection=dbcmt.getConnection();
    CallableStatement cst = localConnection.prepareCall("{call GET_POINTS_COUNTRYDETAILS(?,?,?,?,?,?)}");
    cst.setString(1, strShowSeq);
    cst.setString(2, strEventSeq);
    cst.setString(3, strEventFromDate);
    cst.setString(4, strEventToDate);                 
    cst.setString(5, strCountry);
    cst.setString(6, strSchool);
    ResultSet rs1 = cst.executeQuery();

%>
	<body>
        <form name="Shows_EquitationCountryDetails">
<table class="grid" width="100%" border="0" cellspacing="1" cellpadding="2">
<tr>

<th class="Grid_Header" width="20%">Show</th>
<th class="Grid_Header" width="10%">Place</th>
<th class="Grid_Header" width="10%">Date </th>
<th class="Grid_Header" width="30%">Horse</th>
<th class="Grid_Header" width="30%">Event</th>
<th class="Grid_Header" width="5%">Standing</th>
<th class="Grid_Header" width="5%">Points</th>

</tr>
<%
 boolean bColor=true;
 int TotalPoints=0;
int points=0;
while (rs1.next())
{
	if(rs1.getString("Points")!=null)
	points=Integer.parseInt(rs1.getString("Points"));

    TotalPoints+=points;
    if(bColor){  bColor=false;%>
<tr class="odd">
<%} else {  bColor=true; %>
<tr class="even">
<%}%>
    

<td><%=rs1.getString("Show_Name")%></td>
<td><%=rs1.getString("Show_Place")%></td>
<td><%=rs1.getString("EventDate")%></td>
<td><%=rs1.getString("Horse_PrimaryName")%></td>
<td><%=rs1.getString("Name")%> ( <%--=rs1.getString("Event_Order")--%> )</td>
<td><%=rs1.getString("Placement")%></td>
<td style="text-align: center;"><%=rs1.getString("Points")%></td>

</tr>

<%}
        rs1.close();
        cst.close();
        localConnection.commit();
        dbcmt.releaseConnection(localConnection);
        %>

<tr  style="border: thin solid black;
    text-align: center;
    font-weight: bold">
    <td colspan="6"><font size="4" >TOTAL</font></td>
    <td><font size="4"><%=TotalPoints%></font></td>
</tr>
</table>

        </form>
    </body>
</html>
