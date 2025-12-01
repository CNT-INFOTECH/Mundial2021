<%--
    Document   : resetuser
    Created on : Aug 12, 2011, 2:36:29 PM
    Author     : dp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="login.SessionRoleBean" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        SessionRoleBean sessionRoleBean =   (SessionRoleBean)session.getAttribute("role");

        /*System.out.println("resetuser.jsp------+"+sessionUserBean);*/
        if (sessionRoleBean != null ) {
             session.removeAttribute("role");


        }

        String address =request.getContextPath()+"/user_role.jsp";
        response.sendRedirect(response.encodeRedirectURL(address));


        %>

    </body>
</html>
