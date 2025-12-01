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
    ResultSet rs1 = null;
    CallableStatement cst = null;
    
    CallableStatement cst_Jud = null;
    ResultSet rs1_Jud = null;
    
    DbConnMngr dbcmt = new DbConnMngr();
    String strShowSeq = "";
    String strEventSeq = "";
    
    try {
        conn = dbcmt.getConnection();
//        cst = conn.prepareCall("{call SM_Get_Judge_Mobile_Current()}");
//        rs1 = cst.executeQuery();
//
//        if (rs1.next()) {
//            if (rs1.getString("ShowSeq") != null) {
//                strShowSeq = rs1.getString("ShowSeq");
//            }
//            if (rs1.getString("EventSeq") != null) {
//                strEventSeq = rs1.getString("EventSeq");
//            }
//           
//        }

        cst_Jud = conn.prepareCall("{call sm_rating_judges_list(?,?,?)}");
        cst_Jud.setString(1,null);
        cst_Jud.setString(2,null);
        cst_Jud.setString(3,null);
        rs1_Jud = cst_Jud.executeQuery();

        JSONArray list = new JSONArray();
       
        while (rs1_Jud.next()) {
            JSONObject obj = new JSONObject();
            obj.put("JudgeSeq", rs1_Jud.getString("JudgeSeq"));
            obj.put("JudgeName", rs1_Jud.getString("JudgeName"));
            
            
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
        if (rs1 != null) {
            rs1.close();
        }
        if (cst != null) {
            cst.close();
        }
        
        if (rs1_Jud != null) {
            rs1_Jud.close();
        }
        if (cst_Jud != null) {
            cst_Jud.close();
        }
         if (conn != null) {
            conn.close();
    }

    }
%>