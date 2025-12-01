<%-- 
    Document   : get
    Created on : Mar 27, 2018, 6:00:42 PM
    Author     : sridhar
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="pasotracker.DbConnMngr" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONArray"%>
<% 
   
    
    
     
     
  
     Connection conn = null;
    ResultSet rs = null;
  Statement stmt1 = null;
    DbConnMngr dbcmt = new DbConnMngr();
    CallableStatement cst = null;
    PreparedStatement preparedStatement = null;   
    String strEmail="";
	if(request.getParameter("emailID")!=null)
		strEmail=request.getParameter("emailID");
try {
    
        conn = dbcmt.getCon();		 
       

        JSONArray list = new JSONArray();
        //rs = stm1.executeQuery(sql);
        
    
            String selectSQL="select case when (select top 1 EmailID from ConfePasoMobileApp..AppPaso_Users where EmailID='"+strEmail+"')='"+strEmail+"'then 'User already exists' else '' end as message";
          
          preparedStatement = conn.prepareStatement(selectSQL);
         
        rs = preparedStatement.executeQuery();
        while (rs.next()) {
            
            JSONObject obj = new JSONObject();
            
          obj.put("returnMsg", rs.getString("message"));
				obj.put("email", strEmail);
            
            list.add(obj);
//			i=1;
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
        if (stmt1  != null) {
           stmt1 .close();
        }
         if (preparedStatement  != null) {
           preparedStatement .close();
        }
        if (rs != null) {
            rs.close();
        }
        if (conn != null) {
            conn.close();
        }
        }

    
%>
