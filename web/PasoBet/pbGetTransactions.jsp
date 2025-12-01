<%-- 
    Document   : pbGetTransactions
    Created on : Jan 26, 2017, 11:49:21 AM
    Author     : Erzath
--%>
<%@page import="PasoBet.DbConnMngr"%>
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
        conn = dbcmt.getCon_PasoTrackerProd();
        conn.setAutoCommit(false);		 
        stm1 = conn.createStatement();

        JSONArray list = new JSONArray();
        //rs = stm1.executeQuery(sql);
        
        if(dbAction.equalsIgnoreCase("get")){
            cst=conn.prepareCall("{call PB_Get_TransactionDetails(?)}");
            cst.setString(1, userId);//ShowName,place,Date,@ShowSeq,@WorkOrderSeq
        }

        rs=cst.executeQuery();    
        while (rs.next()) {
            
            JSONObject obj = new JSONObject();
            obj.put("CreditDebitSq", rs.getString("CreditDebitSq"));            
            obj.put("TransactionDesc", rs.getString("TransactionDesc"));
            obj.put("CreditAmount", rs.getString("CreditAmount"));
            obj.put("DebitAmount", rs.getString("DebitAmount"));
            obj.put("Total", rs.getString("Total"));
            obj.put("TransactionDate", rs.getString("TransactionDate"));
            obj.put("Show_Name", rs.getString("Show_Name"));
            obj.put("EventName", rs.getString("EventName"));
            
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

