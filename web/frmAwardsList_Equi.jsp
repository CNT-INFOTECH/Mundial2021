<%--
    Document   : frmAwardsList
    Created on : Jul 6, 2011, 11:29:10 AM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PASO TRACKER</title>

<link href="Shows_Pop.css" rel="stylesheet" type="text/css" />
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />

    </head>
    <body>
        <form name="frmAwardsList">

     <table class="grid" width="100%" style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
     <%
       boolean bColor=true;
        ArrayList AlList = new ArrayList();
        AlList.add("Amazonas 4-5 Años");
        AlList.add("Jinetes 4-5 Años");

        AlList.add("Amazonas 6-8 Años");
        AlList.add("Jinetes 6-8 Años");

        AlList.add("Amazonas 9-11 Años");
        AlList.add("Jinetes 9-11 Años");

        AlList.add("Amazonas 12-14 Años");
        AlList.add("Jinetes 12-14 Años");

        AlList.add("Amazonas 15-17 Años");
        AlList.add("Jinetes 15-17 Años");

        AlList.add("Amazonas 18-20 Años");
        AlList.add("Jinetes 18-20 Años");

        AlList.add("Amazonas 21-24 Años");
        AlList.add("Jinetes 21-24 Años");

    for (int i=0; i <AlList.size(); i++)
        {
        if(bColor){  bColor=false;%>
        <tr class="odd">
        <%} else {  bColor=true; %>
        <tr class="even">
        <%}%>
         <td>
             <%=AlList.get(i)%>;
         </td>

         <td>
             <input type="checkbox" name="ChkAwards" value="<%=AlList.get(i)%>">
         </td>

         <td>
            &nbsp;
         </td>
     </tr>

     <%}%>
 </table>
</form>
    </body>
</html>
