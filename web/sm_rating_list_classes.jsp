<%@page language="java" import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.parser.ParseException"%>
<%--<%@page import="Shows.DBConnection"%>--%>
<%@ page import =  "model.*" %>
<%
    Connection conn = null;
    ResultSet rs = null;
    Statement stm1 = null;
//    DBConnection dbcmt = new DBConnection("41431", "SM_Module_Miami");
    DbConnMngr dbcmt = new DbConnMngr();
    String strShowIdent =request.getParameter("pShowSeq");
    if(strShowIdent!=null && strShowIdent.trim().length()==0)
        strShowIdent="0";
    String sql = "SELECT  Event_Order,Event_Seq,dbo.InitCap(name) As name,Rider FROM Events "
            + " Where Show_Seq="+strShowIdent+" and EventStatus='A' order by Event_Order";

    try {
        conn = dbcmt.getConnection();

        stm1 = conn.createStatement();

        JSONArray list = new JSONArray();
        rs = stm1.executeQuery(sql);
        while (rs.next()) {
            JSONObject obj = new JSONObject();
            obj.put("no", rs.getString("Event_Order"));
            obj.put("Seq", rs.getInt("Event_Seq"));
            obj.put("name", rs.getString("Event_Order") +"-"+rs.getString("name"));
            

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