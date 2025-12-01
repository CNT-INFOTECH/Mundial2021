<%-- 
    Document   : FccrResult
    Created on : Feb 16, 2018, 3:59:08 PM
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
    
    
    String dbAction="";
    if(request.getParameter("act")!=null)
        dbAction=request.getParameter("act");
    
    
    Connection conn = null;
    ResultSet rs = null;
    Statement stm1 = null;
    DbConnMngr dbcmt = new DbConnMngr();
    CallableStatement cst = null;
    String strCurrentClass=request.getParameter("pClassSeq");
	
   
    String sql = "";    
	
    try {
        conn = dbcmt.getCon();//getCon_PasoTrackerProd();
        conn.setAutoCommit(false);	
        
    

		cst = conn.prepareCall("{call OnlineGET_EVENT_PARTICIPANTS(?,?)}");
            cst.setString(1,"");
            cst.setString(2,strCurrentClass);
			
        JSONArray list = new JSONArray();
      
		rs=cst.executeQuery();
    
        while (rs.next()) {
            
            JSONObject obj = new JSONObject();
            obj.put("HorseName", rs.getString("HORSE_PRIMARYNAME").toUpperCase());            
            	

			obj.put("BackNum", rs.getString("AssignedNum"));			
            if(rs.getString("Placement")!=null && rs.getString("Placement").equalsIgnoreCase(""))
				obj.put("Placement", "99");	
			else
			obj.put("Placement", rs.getString("Placement"));			
			obj.put("Sire", rs.getString("SireName").toUpperCase());
			obj.put("Dam", rs.getString("DamName").toUpperCase());
			obj.put("GrandSire", rs.getString("Dam_SireName").toUpperCase());
			obj.put("Owner", rs.getString("OwnerName").toUpperCase());
			obj.put("Breeder", rs.getString("BreederName").toUpperCase());
			obj.put("Rider", rs.getString("HRider").toUpperCase());
			obj.put("RepCountry", rs.getString("RepCountry").toUpperCase());
			//obj.put("RepresentingCountry", rs.getString("RepresentingCountry").toUpperCase());
			obj.put("EventType", rs.getString("EventType").toUpperCase());
			//obj.put("Group_Relation", rs.getString("Group_Relation").toUpperCase());
			           
			
            list.add(obj);
        }

            String clientOrigin = request.getHeader("origin");
            response.setHeader("Access-Control-Allow-Origin", clientOrigin);
            response.setHeader("Access-Control-Allow-Methods", "POST");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type");
            response.setHeader("Access-Control-Max-Age", "86400");
            
        out.print(list);

    } catch (Exception ex) {
        out.println("<h1>" + ex + "</g1>");
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
