<%-- 
    Document   : Adm_DeleteRoles
    Created on : May 14, 2012, 3:11:08 PM
    Author     : Erzath
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>

<%

String userid=request.getParameter("userid");
String Organization=request.getParameter("Organization");
session.setAttribute( "theName", Organization );
if(!userid.equals("null"))
    {
 Connection localConnection=null;
 DbConnMngr dbcmt=new DbConnMngr();



try {
        localConnection=dbcmt.getConnection();
	localConnection.setAutoCommit(false);
        Statement st=localConnection.createStatement();
           ResultSet rs=st.executeQuery("delete User_Organization where userid='"+userid+"' and user_org='"+Organization+"'");
        
       
        rs.close();
      
        
    }

catch (Exception e) {
                      e.printStackTrace();
                    }

 finally
         {
           localConnection.commit();
         dbcmt.releaseConnection(localConnection);
         session.removeAttribute("theName");
         response.sendRedirect("createuser.jsp?mode=3");
         
     }
 
}
%>

  