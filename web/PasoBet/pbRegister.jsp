<%-- 
    Document   : pbRegister
    Created on : Oct 27, 2016, 2:14:49 PM
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
    
    System.out.println("*******************PASO BET*****************");

    System.out.println("*******************PASO BET*****************"+request.getParameter("name")+":::::"+request.getParameter("description"));
        
    String dbAction="";
    if(request.getParameter("act")!=null)
        dbAction=request.getParameter("act");
    
    
    Connection conn = null;
    ResultSet rs = null;
    Statement stm1 = null;
    DbConnMngr dbcmt = new DbConnMngr();
    CallableStatement cst = null;
	
   
    String sql = "";
    String strPbRegSeq="0";         
    String strFirstName=request.getParameter("firstName");          
    String strLastName=request.getParameter("lastName");
    String strDob=request.getParameter("dob");
    String strPhone=request.getParameter("tel");
    String strGender=request.getParameter("gender");
    String strEmail=request.getParameter("Email");
    String strCOUNTRY=request.getParameter("country");
    String strINSERTED_USERID="admin";
    String strPassword=request.getParameter("pwd");

	System.out.println("*******************PASO BET *****************"+dbAction);
	System.out.println("*******************strFirstName*****************"+strFirstName);
	System.out.println("*******************strDob*****************"+strDob);
	
    try {
        conn = dbcmt.getConnection();		
		conn.setAutoCommit(false);		 
        stm1 = conn.createStatement();

        JSONArray list = new JSONArray();
        //rs = stm1.executeQuery(sql);
        
        if(dbAction.equalsIgnoreCase("Insert")){
            cst=conn.prepareCall("{call PB_InsUpd_Register(?,?,?,?,? ,?,?,?,?,?)}");
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
        else if(dbAction.equalsIgnoreCase("get")){
            cst=conn.prepareCall("{call PB_Get_RegisteredUserDetail(?)}");
            cst.setString(1, "1");
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

    }
%>