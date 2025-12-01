<%-- 
    Document   : pbBetSlip
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
    
    System.out.print("-----------pbClasses---------------::::::::::::"+request.getParameter("pShowSeq"));
    
    String strShowIdent =request.getParameter("pShowSeq");
    if(strShowIdent!=null && strShowIdent.trim().length()==0)
        strShowIdent="0";
    
    strShowIdent="30";
    String sql = "SELECT top 3 Event_Order,Event_Seq,dbo.InitCap(name) As name,Rider FROM Events "
            + " Where Show_Seq="+strShowIdent+" and EventStatus='A' order by Event_Order";

    try {
        conn = dbcmt.getCon();//getCon_PasoTrackerProd();

        stm1 = conn.createStatement();

        JSONArray list = new JSONArray();
        rs = stm1.executeQuery(sql);
        while (rs.next()) {
            JSONObject obj = new JSONObject();
            obj.put("no", rs.getString("Event_Order"));
            obj.put("Seq", rs.getInt("Event_Seq"));
            obj.put("name", rs.getString("Event_Order") +"-"+rs.getString("name"));
            obj.put("stake","10.00");
            obj.put("toReturn","20.00");
            obj.put("showName","PONCE INTERNACIONAL");
            //obj.put("showName", rs.getInt("Event_Seq"));
            

            String clientOrigin = request.getHeader("origin");
            response.setHeader("Access-Control-Allow-Origin", clientOrigin);
            response.setHeader("Access-Control-Allow-Methods", "POST");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type");
            response.setHeader("Access-Control-Max-Age", "86400");

            list.add(obj);
        }

        out.print(list);

    } catch (Exception ex) {
        out.println("<h1>" + ex + "</g1>");
    } finally {

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
