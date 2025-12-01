<%-- 
    Document   : pbShows
    Created on : Nov 3, 2016, 4:58:59 PM
    Author     : Erzath
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
    
    System.out.println("*******************PASO BET******Shows***********");

    System.out.println("*******************PASO BET*****************"+request.getParameter("name")+":::::"+request.getParameter("description"));
        
    String dbAction="";
    if(request.getParameter("act")!=null)
        dbAction=request.getParameter("act");
    
	
	String strShowIdent ="";
	if(request.getParameter("pShowSeq")!=null)
        strShowIdent=request.getParameter("pShowSeq");
    
    Connection conn = null;
    ResultSet rs = null;
    Statement stm1 = null;
    DbConnMngr dbcmt = new DbConnMngr();
    CallableStatement cst = null;
	
   
    String sql = "";    
	
    try {
        conn = dbcmt.getCon();//getCon_PasoTrackerProd();
        conn.setAutoCommit(false);		 
        stm1 = conn.createStatement();

        JSONArray list = new JSONArray();
        //rs = stm1.executeQuery(sql);
        
        if(dbAction.equalsIgnoreCase("get")){
            cst=conn.prepareCall("{call GET_SHOW_INFORMATION(?,?,?,?)}");
            cst.setString(1, "");//ShowName,place,Date,@ShowSeq,@WorkOrderSeq
			cst.setString(2, "");
			cst.setString(3, "");
			cst.setString(4, strShowIdent);
        }

        rs=cst.executeQuery();    
		int i=0;
        while (rs.next()) {
            
            JSONObject obj = new JSONObject();
            obj.put("showSeq", rs.getString("Show_Seq"));            
            obj.put("showName", rs.getString("Show_Name"));
            obj.put("showPlace", rs.getString("Show_Place"));
            obj.put("showFromDate", rs.getString("Show_From_Date"));
            obj.put("showToDate", rs.getString("Show_To_Date"));
            obj.put("showDay", rs.getString("ShowDay"));
            obj.put("showMonth", rs.getString("ShowMonth"));
            obj.put("className", rs.getString("Show_Name"));
            obj.put("stake","10.00");
            obj.put("toReturn","20.00");
			if(i==0)
			obj.put("zerothRow","true");
		else
			obj.put("zerothRow","false");
            
            list.add(obj);
			i=1;
        }

            String clientOrigin = request.getHeader("origin");
            response.setHeader("Access-Control-Allow-Origin", clientOrigin);
            response.setHeader("Access-Control-Allow-Methods", "POST");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type");
            response.setHeader("Access-Control-Max-Age", "86400");
            
//        out.print("{\"show\":"+list+"}");
out.println(list);

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
