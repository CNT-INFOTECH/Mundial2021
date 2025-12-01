<%-- 
    Document   : pbClasses
    Created on : Nov 7, 2016, 1:23:28 PM
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
    Connection conn = null;
    ResultSet rs = null;
    Statement stm1 = null;

    DbConnMngr dbcmt = new DbConnMngr();    
	CallableStatement cst=null;
    
    System.out.print("-----------pbClasses---------------::sSq::::::::::"+request.getParameter("sSq"));
    System.out.print("-----------pbClasses---------------::::::::::::"+request.getParameter("pShowSeq"));
    
    String strShowIdent =request.getParameter("pShowSeq");
	
	String strClassSeq ="";
	if(request.getParameter("pClassSeq")!=null)
	strClassSeq=request.getParameter("pClassSeq");
	
    if(strShowIdent!=null && strShowIdent.trim().length()==0)
        strShowIdent="0";
    
   

    try {
        conn = dbcmt.getCon();//getCon_PasoTrackerProd();

        //stm1 = conn.createStatement();
		cst = conn.prepareCall("{call GET_EVENT_INFORMATION_WS(?,?,?,?,?, ?,?,?)}");
            cst.setString(1,strShowIdent);
            cst.setString(2, strClassSeq);
            cst.setString(3,"");
            cst.setString(4, "");
            cst.setString(5, "");
            cst.setString(6, "");
            cst.setString(7,"");
            cst.setString(8, "");
		

        JSONArray list = new JSONArray();

rs = cst.executeQuery();

        int i=1;
        while (rs.next()) {
            JSONObject obj = new JSONObject();
            obj.put("no", rs.getString("Event_Order"));
            obj.put("Seq", rs.getInt("Event_Seq"));
            obj.put("name", rs.getString("Event_Order") +"-"+rs.getString("name"));
            obj.put("className", rs.getString("name"));
            obj.put("showSeq", rs.getString("Show_Seq"));            
            //obj.put("showName", rs.getString("show_Name"));
			obj.put("Event_Date", rs.getString("Event_Date"));
			obj.put("Cnt", rs.getString("Cnt"));
			if(rs.getString("Cnt")!=null && rs.getString("Cnt").equalsIgnoreCase("0"))
				obj.put("EventStat", "No Entries / Sin Participantes");
			else
				obj.put("EventStat", rs.getString("EventStat"));
//            obj.put("showPlace", "");
//            obj.put("showFromDate", "");
//            obj.put("showToDate", "");
//            obj.put("showDay", "");
//            obj.put("showMonth", "");
//            obj.put("stake","10.00");
//            obj.put("toReturn","20.00");
            //obj.put("showName", rs.getInt("Event_Seq"));
            

            String clientOrigin = request.getHeader("origin");
            response.setHeader("Access-Control-Allow-Origin", clientOrigin);
            response.setHeader("Access-Control-Allow-Methods", "POST");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type");
            response.setHeader("Access-Control-Max-Age", "86400");

            list.add(obj);
            i++;
        }

        out.print(list);

    } catch (Exception ex) {
        out.println("<h1>" + ex + "</g1>");
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
