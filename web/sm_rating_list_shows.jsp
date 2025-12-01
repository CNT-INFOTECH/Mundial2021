<%@page import="model.DbConnMngr"%>
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

    String sql = "SELECT  dbo.InitCap(Show_Name) As Show_Name,Show_Seq,cast(Show_From_Date As datetime) as Show_From_Date FROM Shows Where Show_Status='A' order by cast(Show_From_Date As datetime) Desc";

    try {
        conn = dbcmt.getConnection();

        stm1 = conn.createStatement();

        JSONArray list = new JSONArray();
        rs = stm1.executeQuery(sql);
        while (rs.next()) {
            JSONObject obj = new JSONObject();
            
            obj.put("Seq", rs.getInt("Show_Seq"));
            obj.put("name", rs.getString("Show_Name"));

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