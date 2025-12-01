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
    //DBConnection dbcmt = new DBConnection("dev_raju", "PasoTracker_P");
   String strEventIdent =request.getParameter("pClassNum");
   String strJudgeIdent =request.getParameter("pJudgeSeq");
   String strCurrentParticipant="0";
   if(request.getParameter("pBckNum")!=null && request.getParameter("pBckNum").trim().length()>0)
   {
      strCurrentParticipant= request.getParameter("pBckNum");
   }
    String sql = "SELECT question_sortOrder,Event_Seq,back_Num,qst.question_Seq,question_desc,question_desc_span,question_Header,"
                        + "question_Header_span,question_score,question_ans_score,"
			+ " dbo.fn_sm_rating_question_answers_score("+strEventIdent+",'"+strJudgeIdent+"','"+strCurrentParticipant+"',qst.question_Seq,NULL) As weighted_score,"
			+ " (Select Sum(cast (question_score as int)) from sm_rating_questions A "
			+ " Where A.Question_Header_Group =qst.Question_Header_Group And A.question_Category=qst.question_Category group by Question_Header_Group,question_Category) As Total_Score_Group,"
			+ " dbo.fn_sm_rating_question_answers_score("+strEventIdent+",'"+strJudgeIdent+"','"+strCurrentParticipant+"',null,Question_Header_Group) As Total_Score_Answers,"
                        + "dbo.fn_sm_rating_question_answers_score("+strEventIdent+","+strJudgeIdent+",'"+strCurrentParticipant+"',NULL,NULL) As Scored"
			+ " FROM sm_rating_questions qst "
            + " left outer join sm_rating_questions_answers qst_ans on qst.question_seq=qst_ans.question_seq and back_num='"+strCurrentParticipant+"' and event_seq="+strEventIdent +" and JudgeSeq="+strJudgeIdent 
            + " Where question_status='A' and question_Category=(Select Category from Events Where Event_Seq="+strEventIdent+") order by qst.question_sortOrder" ;

    try {
        conn = dbcmt.getConnection();

        stm1 = conn.createStatement();

        JSONArray list = new JSONArray();
        rs = stm1.executeQuery(sql);
        while (rs.next()) {
            JSONObject obj = new JSONObject();
            obj.put("QstNum", rs.getString("question_seq"));
            
            obj.put("QstDesc", rs.getString("question_desc_span"));
            obj.put("Header", rs.getString("question_Header_span"));
           
          
            
            obj.put("Qstscore", rs.getString("question_score"));
            
            if(rs.getString("question_ans_score")!=null)
                obj.put("score", rs.getString("question_ans_score"));
            else
                obj.put("score","N/E");
            
            obj.put("QstSort", rs.getInt("question_sortOrder"));
	    obj.put("Total_Score_Actual", rs.getInt("Total_Score_Group"));
            obj.put("Ttl_s_weighted_ans", rs.getString("Total_Score_Answers"));
             obj.put("Ttl_scored", rs.getString("Scored"));
            

           

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