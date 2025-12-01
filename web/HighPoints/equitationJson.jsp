<%-- 
    Document   : equitationJson
    Created on : Dec 8, 2017, 4:37:58 PM
    Author     : Maheswari
--%>
<%@page import="pasotracker.DbConnMngr"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%
    Connection conn = null;
    ResultSet rs = null;
    Statement stm1 = null;

    DbConnMngr dbcmt = new DbConnMngr();    
	CallableStatement cst=null;
    String strCategory="Pasofino";
    String strAwardType="";
    String strEnvironment ="";
    String strCountry="";
    String strslseq="";
    String strYr="";
	
    if(request.getParameter("AwardType")!=null)
		strAwardType=request.getParameter("AwardType");	
	
    if(request.getParameter("eSq")!=null)
		strEnvironment=request.getParameter("eSq");
	
    if(request.getParameter("yr")!=null)
		strYr=request.getParameter("yr");
	
    if(request.getParameter("ctry")!=null)
		strCountry=request.getParameter("ctry");	
    
   
    try {
        conn = dbcmt.getCon();
        JSONArray list = new JSONArray();
        
		cst = conn.prepareCall("{call OnlineGET_POINTS(?,?,?,?)}");
		cst.setString(1,strAwardType);
        cst.setString(2,strYr);
		cst.setString(3,strEnvironment);
		cst.setString(4,strCountry);
		
		rs = cst.executeQuery();

        int i=1;
        while (rs.next()) {
            JSONObject obj = new JSONObject();
						
			if(rs.getString("Name")!=null)
            obj.put("Name", rs.getString("Name"));
			else
				obj.put("Name", "");
			
			if(rs.getString("AssignedNum")!=null)
            obj.put("AssignedNum", rs.getString("AssignedNum"));
			else
            obj.put("AssignedNum", "");
		  
		  if(rs.getString("Points")!=null)
            obj.put("Points", rs.getString("Points"));
			else
            obj.put("Points", "");
		
		 if(rs.getString("Position")!=null)
            obj.put("Placement", rs.getString("Position"));
			else
            obj.put("Placement", "");
		

            list.add(obj);
            i++;
        }
		
		String clientOrigin = request.getHeader("origin");
		response.setHeader("Access-Control-Allow-Origin", clientOrigin);
		response.setHeader("Access-Control-Allow-Methods", "POST");
		response.setHeader("Access-Control-Allow-Headers", "Content-Type");
		response.setHeader("Access-Control-Max-Age", "86400");

        out.print(list);

    } catch (Exception ex) {
       System.out.println("<h1>" + ex + "</h1>");
    } finally {

        if (stm1 != null) {
            stm1.close();
        }
		if (cst != null) {
            cst.close();
        }
        if (rs != null) {
            rs.close();
        }
        if (conn != null) {
            conn.close();
        }

    }
%>