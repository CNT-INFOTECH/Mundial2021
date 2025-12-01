<%-- 
    Document   : pbShows
    Created on : Nov 3, 2016, 4:58:59 PM
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
    
	
	String strShowIdent ="";
	if(request.getParameter("pShowSeq")!=null)
        strShowIdent=request.getParameter("pShowSeq");
    
	
	String strCategory="Pasofino";
    String strShowSeq="61";
    String strslctid ="";
    String strdivtype="";
    String strslseq="";
    String strslname="";
	if(request.getParameter("act")!=null)
	strdivtype=request.getParameter("act");

	if(request.getParameter("show")!=null)
	{
	strShowSeq=request.getParameter("show");
	strShowSeq=strShowSeq.substring(0,2);
	}
	if(request.getParameter("slid")!=null)
	strslctid=request.getParameter("slid");

	String strAire="";


	if(request.getParameter("chkCategory")!=null)
	strCategory=request.getParameter("chkCategory");

	if(strCategory.equals(""))
	strAire="Pasofino";
	else if (strCategory.equals("Pasofino"))
	strAire="Pasofino";
	else if (strCategory.equals("Pleasure"))
	strAire="Pasofino";
	else if (strCategory.equals("Performance"))
	strAire="Pasofino";
	else if (strCategory.equals("Trocha"))
	strAire="Trocha";
	else if (strCategory.equals("Trocha y galope"))
	strAire="Trocha y galope";
	else if (strCategory.equals("Trote y galope"))
	strAire="Trote y galope";
	else if(strCategory.equals("T"))
	strAire="";


    Connection conn = null;
    ResultSet rs = null;
    Statement stm1 = null;
    DbConnMngr dbcmt = new DbConnMngr();
    CallableStatement cst = null;
	
   
    String sql = "";    
	
    try {
        conn = dbcmt.getCon();//getCon_PasoTrackerProd();
        conn.setAutoCommit(false);		 
        stm1 = conn.createStatement();

        JSONArray list = new JSONArray();
        //rs = stm1.executeQuery(sql);
        
        if(dbAction.equalsIgnoreCase("get")){
            cst=conn.prepareCall("{call GET_POINTS_MODALITY_WS(?,?,?,?)}");            
            cst.setString(1,strShowSeq);
            cst.setString(2,strAire);
			cst.setString(3,strCategory);
			cst.setInt(4,Integer.parseInt(strslctid));
        }

        rs=cst.executeQuery();    
		int i=0;
        while (rs.next()) {
            
            JSONObject obj = new JSONObject();
            obj.put("Name", rs.getString("Name"));
            obj.put("AssignedNum", rs.getString("AssignedNum"));
			obj.put("PTS", rs.getString("pts"));
            obj.put("Points", rs.getString("Points"));
            obj.put("GC", rs.getString("PointsP"));
            obj.put("GCR", rs.getString("PointsS"));
            obj.put("Seq", rs.getString("Seq"));
            obj.put("Slid", strslctid);
            obj.put("category", strCategory);
            
            list.add(obj);
			i=1;
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
