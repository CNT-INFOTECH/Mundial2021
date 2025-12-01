


<%@page language="java" import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.parser.ParseException"%>
<%@ page import =  "model.*" %>

<%
    Connection conn = null;
    ResultSet rs = null;
    CallableStatement pstm = null;
    DbConnMngr dbcmt = new DbConnMngr();
    //DBConnection dbcmt = new DBConnection("devraju", "PasoTracker_P");

    String strQuestion = request.getParameter("Qst");
    String strAnswer = request.getParameter("AnsVal");
    String strEventIdent =request.getParameter("pClassNum");
    String strBackNum =request.getParameter("pBackNum");
     String strJudgeSeq =request.getParameter("pJudgeSeq");
 

    try {
        conn = dbcmt.getConnection();

        pstm = conn.prepareCall("{call sm_rating_InsUpd_Answers(?,?,?,?,?)}");
        pstm.setString(1, strEventIdent);
        pstm.setString(2, strBackNum);
        pstm.setString(3, strQuestion);
        pstm.setString(4, strAnswer);
        pstm.setString(5, strJudgeSeq);
        int UpdRows = pstm.executeUpdate();

        JSONArray list = new JSONArray();
        JSONObject obj = new JSONObject();
        obj.put("Resp", "Success");
        String clientOrigin = request.getHeader("origin");
        response.setHeader("Access-Control-Allow-Origin", clientOrigin);
        response.setHeader("Access-Control-Allow-Methods", "POST");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        response.setHeader("Access-Control-Max-Age", "86400");

        list.add(obj);
        out.print(list);

    } catch (Exception ex) {
        out.println("<h1>" + ex + "</g1>");
    } finally {

        if (pstm != null) {
            pstm.close();
        }
        if (rs != null) {
            rs.close();
        }
        if (conn != null) {
            conn.commit();
            conn.close();
        }

    }
%>