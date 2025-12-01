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
    //DBConnection dbcmt = new DBConnection("dev_raju", "PasoTracker_P");
   String strCurrentClass="0";
    String strJudgeSeq =request.getParameter("pJudgeSeq");
   if(request.getParameter("pClassNum")!=null && request.getParameter("pClassNum").trim().length()>0)
   {
      strCurrentClass= request.getParameter("pClassNum");
   }
    
    try {
        conn = dbcmt.getConnection();
              
        pstm = conn.prepareCall("{call sm_rating_get_Results_Compare(?,?,?)}");
        pstm.setString(1, strCurrentClass);
        pstm.setString(2, strCurrentClass);
        pstm.setString(3, strJudgeSeq);
        
       

        JSONArray list = new JSONArray();
        rs = pstm.executeQuery();
        while (rs.next()) {
            JSONObject obj = new JSONObject();
            obj.put("BackNum", rs.getString("HRS_ASSIGNED_NUM"));
            obj.put("F1F2Score", rs.getString("Placement"));
            obj.put("MyScore", rs.getString("Rank"));
            obj.put("Deviation", rs.getString("Deviation"));
            obj.put("TotalScore", rs.getString("Scored"));
            

           

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

        if (pstm != null) {
            pstm.close();
        }
        if (rs != null) {
            rs.close();
        }
        if (conn != null) {
            conn.close();
        }

    }
%>