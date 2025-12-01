<%-- 
    Document   : Register
    Created on : Jul 31, 2017, 1:52:23 PM
    Author     : Erzath
--%>


<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@ page import="pasotracker.DbConnMngr" %>

<%
    
    System.out.println("*******************PasoKey MemberApp*****************"+request.getParameter("firstName"));
        
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
    String strFirstName="";
	if(request.getParameter("firstName")!=null && !request.getParameter("firstName").equalsIgnoreCase("firstname"))
		strFirstName=request.getParameter("firstName"); 
		
    String strLastName="";
	if(request.getParameter("lastName")!=null && !request.getParameter("lastName").equalsIgnoreCase("lastname"))
		strLastName=request.getParameter("lastName");

    String strDob="";
	if(request.getParameter("dateOfBirth")!=null && !request.getParameter("dateOfBirth").equalsIgnoreCase("date of birth"))
		strDob=request.getParameter("dateOfBirth");

    String strPhone="";
	if(request.getParameter("phoneNum")!=null && !request.getParameter("phoneNum").equalsIgnoreCase("phone"))
		strPhone=request.getParameter("phoneNum");

    String strCity="";
	if(request.getParameter("city")!=null && !request.getParameter("firstName").equalsIgnoreCase("firstname"))
		strCity=request.getParameter("city");

    String strEmail="";
	if(request.getParameter("emailID")!=null && !request.getParameter("emailID").equalsIgnoreCase("email address"))
		strEmail=request.getParameter("emailID");

    String strCountry="";
	if(request.getParameter("country")!=null && !request.getParameter("country").equalsIgnoreCase("country"))
		strCountry=request.getParameter("country");

    String strUserID="";
	if(request.getParameter("userId")!=null)
		strUserID=request.getParameter("userId");

    String strPassword="";
	if(request.getParameter("password")!=null && !request.getParameter("password").equalsIgnoreCase("password"))
		strPassword=request.getParameter("password");

	String strState="";
	if(request.getParameter("state")!=null && !request.getParameter("state").equalsIgnoreCase("state"))
		strState=request.getParameter("state");

	String strSocial="";
	String userSeq="";
	
    try {
        conn = dbcmt.getCon();		
      conn.setAutoCommit(false);		 
        stm1 = conn.createStatement();

        JSONArray list = new JSONArray();
        
        if(dbAction.equalsIgnoreCase("Insert")){
            cst=conn.prepareCall("{call App_InsUpd_UserInformation(?,?,?,?,? ,?,?,?,?,? ,?,?,?)}");
            cst.setString(1, "0");
            cst.setString(2, strEmail);
            cst.setString(3, strLastName);
            cst.setString(4, strFirstName);
            cst.setString(5, strPassword);
            cst.setString(6, strDob);
            cst.setString(7, strPhone);
            cst.setString(8, strCountry);
            cst.setString(9, strSocial);
            cst.setString(10, userSeq);
			cst.setString(11, strUserID);
			cst.setString(12, strCity);
			cst.setString(13, strState);
        }
        else if(dbAction.equalsIgnoreCase("get")){
            cst=conn.prepareCall("{call App_GetUserInformation(?,?)}");
            cst.setString(1, strUserID);
			cst.setString(2, strEmail);
        }

            rs=cst.executeQuery();    
            JSONObject obj = new JSONObject();
            if (rs.next()) {



                obj.put("returnMsg", rs.getString("Message"));
				obj.put("email", strEmail);
				obj.put("userId", strEmail);
                list.add(obj);
            }
            conn.commit();
                
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