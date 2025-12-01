<%-- 
    Document   : Register
    Created on : Jul 31, 2017, 1:52:23 PM
    Author     : Erzath
--%>


<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@ page import="pasotracker.DbConnMngr" %>

<%
    

        
    
    
    Connection conn = null;
    ResultSet rs = null;
Statement stm1 = null;
    DbConnMngr dbcmt = new DbConnMngr();
    CallableStatement cst = null;
	
   


	
    String strEmail="";
	if(request.getParameter("emailID")!=null)
		strEmail=request.getParameter("emailID");


    String strPassword="";
	if(request.getParameter("password")!=null)
		strPassword=request.getParameter("password");

    try {
        conn = dbcmt.getCon();		
      conn.setAutoCommit(false);		 
        stm1 = conn.createStatement();

        JSONArray list = new JSONArray();
        
       
            cst=conn.prepareCall("{call App_ChangePassword(?,?)}");
            cst.setString(1,strEmail);
			cst.setString(2,strPassword);
           
        
        
            rs=cst.executeQuery();    
            JSONObject obj = new JSONObject();
            if (rs.next()) {



                obj.put("returnMsg", rs.getString("Message"));
				obj.put("email", strEmail);
				obj.put("userId", strEmail);
                list.add(obj);
            }
            conn.commit();
                
            String clientOrigin = request.getHeader("origin");
            response.setHeader("Access-Control-Allow-Origin", clientOrigin);
            response.setHeader("Access-Control-Allow-Methods", "POST");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type");
            response.setHeader("Access-Control-Max-Age", "86400");
            
        out.print(list);

    } catch (Exception ex) {
        out.println("<h1>" + ex + "</h1>");
    } finally {	
        if (cst != null) {
            cst.close();
        }		
        if (stm1 != null) {
            stm1.close();
        }
        if (rs != null) {
            rs.close();
        }
        if (conn != null) {
            conn.close();
        }

    }
%>