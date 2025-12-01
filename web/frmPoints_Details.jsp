<%--
    Document   : frmRegister
    Created on : May 26, 2011, 11:11:45 PM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>

<html>
        <head>

        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />
 <link href="Shows_Pop.css" rel="stylesheet" type="text/css" />






    </head>
    <%

                String strAwardType=request.getParameter("Type");
                String strSeq=request.getParameter("Seq");
                String strShowSeq=request.getParameter("ShowSeq");
				String strYear=request.getParameter("Year");
                String strFrmDate=request.getParameter("frmDate");
                String strToDate=request.getParameter("ToDate");
                

                Connection localConnection=null;
                DbConnMngr dbcmt=new DbConnMngr();
                localConnection=dbcmt.getConnection();
                CallableStatement cst = localConnection.prepareCall("{call GET_POINTS_DETAILS(?,?,?,?,?,?)}");
                cst.setString(1, strSeq);
                cst.setString(2, strAwardType);
                cst.setString(3, strShowSeq);
				cst.setString(4, strYear);
				cst.setString(5, strFrmDate);
				cst.setString(6, strToDate);
                 ResultSet rs1 = cst.executeQuery();

               
    %>
	<body>
	<form name="frmRider">
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
while (rs1.next())
{
    int points=Integer.parseInt(rs1.getString("Points"));
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
<td><%=rs1.getString("Name")%> ( <%=rs1.getString("Event_Order")%> )</td>
<td><% if (rs1.getString("Placement")!=null && rs1.getString("Placement").equals("-1") )
	{%>B<%} else { %><%=rs1.getString("Placement")%> <%}%></td>
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
