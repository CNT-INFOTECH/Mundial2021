<%-- 
    Document   : pbPlaceBet
    Created on : Jan 5, 2017, 4:44:59 PM
    Author     : Erzath
--%>
<%@page import="org.json.simple.JSONValue"%>
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
    
    
    System.out.println("*******************PlaceBet BET*****PlaceBet************"+request.getParameter("models"));
    System.out.println("*******************PlaceBet BET*****betType************"+request.getParameter("betType"));
    System.out.println("*******************PlaceBet BET*****betAmt************"+request.getParameter("betAmt"));
    System.out.println("*******************PlaceBet BET*****betWin************"+request.getParameter("betWin"));
    System.out.println("*******************PlaceBet BET*****eventSq************"+request.getParameter("eventSq"));

    String JSON_DATA="";
    if(request.getParameter("models")!=null)
        JSON_DATA=request.getParameter("models");
    
                    
     JSONObject inp = (JSONObject) JSONValue.parse("{\"models\":"+request.getParameter("models")+"}");
    
     JSONArray msg1 = (JSONArray) inp.get("models");
    for(int i = 0; i < msg1.size(); i++){
        System.out.println("*******************PASO BET*************msg1****"+msg1.get(i));
        JSONObject item = (JSONObject)msg1.get(i);
        System.out.println("*******************PASO BET*************msg1****"+item.get("RegSeq"));
        System.out.println("*******************PASO BET*************msg1****"+item.get("HorseName"));
        System.out.println("*******************PASO BET*************msg1****"+item.get("BackNum"));
        System.out.println("*******************PASO BET*************msg1****"+item.get("Placement"));
                
        
//      String name = msg1.get("name");
//      int age     = msg1.getInt("age");
    }

//       String myInputField = request.getSession().getAttribute("jsonObj").toString();

          
                                    
                                      
      

    String dbAction="";
    if(request.getParameter("act")!=null)
        dbAction=request.getParameter("act");
                
    
    
    System.out.println("*******************PASO BET*************BackNum****"+inp.get("models"));
    /*
    Connection conn = null;
    ResultSet rs = null;
    Statement stm1 = null;
    DbConnMngr dbcmt = new DbConnMngr();
    CallableStatement cst = null;
	
   
    String sql = "";
    String strPbRegSeq="0";         
    String strINSERTED_USERID="admin";
    try {
        conn = dbcmt.getConnection();		
		conn.setAutoCommit(false);		 
        stm1 = conn.createStatement();

        JSONArray list = new JSONArray();
        //rs = stm1.executeQuery(sql);
        
        if(dbAction.equalsIgnoreCase("Insert")){
            cst=conn.prepareCall("{call PB_Ins_PlaceBet(?,?,?,?,? ,?,?,?,?,?)}");
            cst.setString(1, "0");
            cst.setString(2, strFirstName);
            cst.setString(3, strLastName);
            cst.setString(4, strDob);
            cst.setString(5, strPhone);
            cst.setString(6, strGender);
            cst.setString(7, strEmail);
            cst.setString(8, strCOUNTRY);
            cst.setString(9, strINSERTED_USERID);
            cst.setString(10, strPassword);
        }

            rs=cst.executeQuery();    
        if (rs.next()) {
            
            System.out.println(rs.getString("FirstName")+":::::::::::::::::");
            JSONObject obj = new JSONObject();
            obj.put("QstNum", rs.getString("pbRegSeq"));
            
            obj.put("firstName", rs.getString("FirstName"));
            obj.put("lastName", rs.getString("LastName"));
           
          
            
            obj.put("Email", rs.getString("Email"));
            
            if(rs.getString("Dob")!=null)
                obj.put("Dob", rs.getString("Dob"));
            else
                obj.put("Dob","01/01/1900");
            
            obj.put("status", rs.getString("Status"));
            obj.put("country", rs.getString("Country"));
            obj.put("gender", rs.getString("Gender"));
            obj.put("tel", rs.getString("phone"));
//            obj.put("message", rs.getString("message"));
            
            list.add(obj);
        }

            String clientOrigin = request.getHeader("origin");
            response.setHeader("Access-Control-Allow-Origin", clientOrigin);
            response.setHeader("Access-Control-Allow-Methods", "POST");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type");
            response.setHeader("Access-Control-Max-Age", "86400");
            
        out.print(list);

    } catch (Exception ex) {
        out.println("<h1>" + ex + "</h1>");
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

    }*/
%>