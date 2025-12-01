<%-- 
    Document   : pbGetBetSlip
    Created on : Jan 26, 2017, 11:49:06 AM
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
            
    String userId="1";
    if(request.getParameter("userId")!=null)
        userId=request.getParameter("userId");
    
    
    Connection conn = null;
    ResultSet rs = null;
    Statement stm1 = null;
    DbConnMngr dbcmt = new DbConnMngr();
    CallableStatement cst = null;
	
   
    String sql = "";    
	
    try {
        conn = dbcmt.getCon();
        conn.setAutoCommit(false);		 
        stm1 = conn.createStatement();

        JSONArray list = new JSONArray();
        //rs = stm1.executeQuery(sql);
        
        if(dbAction.equalsIgnoreCase("get")){
            cst=conn.prepareCall("{call PB_Get_BetSlip(?)}");
            cst.setString(1, "1");//ShowName,place,Date,@ShowSeq,@WorkOrderSeq
        }

        rs=cst.executeQuery();    
        while (rs.next()) {
            
            JSONObject obj = new JSONObject();
            obj.put("eventName", rs.getString("EventName"));            
            obj.put("showName", rs.getString("Show_Name"));
            obj.put("pbSeq", rs.getString("PlaceBetSeq"));
            obj.put("betType", rs.getString("BetType"));
            obj.put("betAmt", rs.getString("Bet_Amt"));
            obj.put("retnAmt", rs.getString("To_ReturnAmt"));
            obj.put("winAmt", rs.getString("WinningAmt"));
            obj.put("betDate", rs.getString("BettingDate"));
            obj.put("Date", rs.getString("BettingDate"));
//            obj.put("betTime", rs.getString("BettingTime"));
            
            list.add(obj);
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


