<%-- 
    Document   : frmReg_ScreenAttributes
    Created on : Feb 25, 2013, 1:33:57 PM
    Author     : Erzath
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="pasotracker.DbConnMngr"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SCREEN ATTRIBUTES</title>
    </head>
        <%@ page import="java.sql.*" %>
        <%@ page import="java.util.*" %>
        <%@ page import="java.io.*" %>
    <body>
<%

/*Properties paso_CaptionDesc = new Properties();

paso_CaptionDesc.put("Male", "Stallion/Macho");
paso_CaptionDesc.put("Female", "Mare/Hembra");
paso_CaptionDesc.put("Gelding", "Gelding/Castrado");

session.setAttribute("paso_Caption", paso_CaptionDesc);*/

    String male ="";
    String female ="";
    String gelding ="";

    try{
    ResourceBundle resources = ResourceBundle.getBundle("pasoCommonProperties");

    male = resources.getString("HMale");
    female = resources.getString("HFemale");
    gelding = resources.getString("HGelding");
    }
    catch(Exception Ex)
    {
    System.out.println("Cannot find the file Specified"+Ex);
    }
%>
    </body>
</html>
