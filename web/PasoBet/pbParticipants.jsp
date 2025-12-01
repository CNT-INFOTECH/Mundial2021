<%-- 
    Document   : pbParticipants
    Created on : Nov 9, 2016, 4:20:31 PM
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
    
    System.out.println("*********pbParticipants**********PASO BET*****************");

    System.out.println("*******************PASO BET*****************"+request.getParameter("act")+":::::"+request.getParameter("pClassSeq"));
        
    String dbAction="";
    if(request.getParameter("act")!=null)
        dbAction=request.getParameter("act");
    
    
    Connection conn = null;
    ResultSet rs = null;
    Statement stm1 = null;
    DbConnMngr dbcmt = new DbConnMngr();
    CallableStatement cst = null;
    String strCurrentClass=request.getParameter("pClassSeq");
	
   
    String sql = "";    
	
    try {
        conn = dbcmt.getCon();//getCon_PasoTrackerProd();
        conn.setAutoCommit(false);	
        
        sql="Select e.regseq,AssignedNum As HRS_ASSIGNED_NUM,e.HORSE_PRIMARYNAME"                
            + " from EventRegistration A "
            + " left outer Join EventRegistraion_Group B on A.Group_Seq=B.GROUP_SEQ  "
            + " Join Events C on C.Event_Seq=A.EventSeq "
            + " Join Shows D on D.Show_Seq=C.Show_Seq "
            + " join REGISTRATION e on e.REGSEQ=b.REG_SEQ "                
            + " Where C.Event_Seq="+strCurrentClass+" and A.Registration_Status='A' ";
        stm1 = conn.createStatement();

        JSONArray list = new JSONArray();
        rs = stm1.executeQuery(sql);
        
        
        
//        if(dbAction.equalsIgnoreCase("get")){
//            cst=conn.prepareCall("{call GET_EVENT_PARTICIPANTS(?,?)}");
//            cst.setString(1, "");//ShowSeq
//            cst.setString(2, "2255");//EventSeq
//        }

//        rs=cst.executeQuery();    
        while (rs.next()) {
            
            JSONObject obj = new JSONObject();
            obj.put("HorseName", rs.getString("horse_primaryname"));            
            obj.put("BackNum", rs.getString("HRS_ASSIGNED_NUM"));
            obj.put("RegSeq", rs.getString("regseq"));
            obj.put("Placement", "");
            
            list.add(obj);
        }
//JSONObject obj = new JSONObject();
//        obj.put("HorseName", "");            
//            obj.put("BackNum", "");
//            obj.put("RegSeq","");
//            obj.put("Placement", "");
//            
//            list.add(obj);
            String clientOrigin = request.getHeader("origin");
            response.setHeader("Access-Control-Allow-Origin", clientOrigin);
            response.setHeader("Access-Control-Allow-Methods", "POST");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type");
            response.setHeader("Access-Control-Max-Age", "86400");
            
        out.print(list);

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
