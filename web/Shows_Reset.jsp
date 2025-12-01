<%-- 
    Document   : Shows_Reset
    Created on : May 17, 2011, 7:15:41 PM
    Author     : raju
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="beans.ShowBean" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        ShowBean showBean =   (ShowBean)session.getAttribute("showBean");
        ArrayList AlEvents =   (ArrayList)session.getAttribute("Events");
        if (showBean != null) {
             session.removeAttribute("showBean");
        }
        if (AlEvents != null) {
             session.removeAttribute("Events");
        }

         String address =request.getContextPath()+"/Shows.jsp";
        response.sendRedirect(response.encodeRedirectURL(address));
        %>
    </body>
</html>
