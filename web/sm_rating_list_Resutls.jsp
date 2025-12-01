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
    Statement stm1 = null;
    DbConnMngr dbcmt = new DbConnMngr();
    String strCurrentClass="0";
    String strJudgeSeq =request.getParameter("pJudgeSeq");
     if(request.getParameter("pClassNum")!=null && request.getParameter("pClassNum").trim().length()>0)
   {
      strCurrentClass= request.getParameter("pClassNum");
   }
   
            String sql="Select AssignedNum As HRS_ASSIGNED_NUM ,"
                 + " RANK() OVER (ORDER BY cast(dbo.fn_sm_rating_question_answers_score("+strCurrentClass+","+strJudgeSeq+",AssignedNum,NULL,NULL) As decimal) desc) As Rank,"
                 + " dbo.fn_sm_rating_question_answers_score("+strCurrentClass+","+strJudgeSeq+",AssignedNum,NULL,NULL) As Score"
                 + " from EventRegistration A "
                 + " left outer Join EventRegistraion_Group B on A.Group_Seq=B.GROUP_SEQ  "
                 + " Join Events C on C.Event_Seq=A.EventSeq "
                 + " Join Shows D on D.Show_Seq=C.Show_Seq "
                 + " Where C.Event_Seq="+strCurrentClass+" and A.Registration_Status='A' Order by Rank";
    try {
        conn = dbcmt.getConnection();

        stm1 = conn.createStatement();

        JSONArray list = new JSONArray();
        rs = stm1.executeQuery(sql);
        while (rs.next()) {
            JSONObject obj = new JSONObject();
            obj.put("BackNum", rs.getString("HRS_ASSIGNED_NUM"));
            obj.put("Rank", rs.getString("Rank"));
            obj.put("Score", rs.getString("Score"));
            

           

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