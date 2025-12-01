<%-- 
    Document   : check
    Created on : Jun 23, 2011, 6:07:19 PM
    Author     : administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.*"%>

<%
String user=request.getParameter("user");
            out.println("welcome to the world of "+user);
          
%>