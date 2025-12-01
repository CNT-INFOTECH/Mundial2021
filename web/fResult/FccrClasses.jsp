<%-- 
    Document   : FccrClasses
    Created on : Feb 16, 2018, 1:55:52 PM
    Author     : Maheswari
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
    Connection conn = null;
    ResultSet rs = null;
    Statement stm1 = null;

    DbConnMngr dbcmt = new DbConnMngr();    
	CallableStatement cst=null;
    
    //System.out.print("-----------pbClasses---------------::sSq::::::::::"+request.getParameter("sSq"));
    //System.out.print("-----------pbClasses---------------::::::::::::"+request.getParameter("pShowSeq"));
    
    String strShowIdent =request.getParameter("pShowSeq");
	
	String strClassSeq ="";
	if(request.getParameter("pClassSeq")!=null)
	strClassSeq=request.getParameter("pClassSeq");
        System.out.println(strClassSeq);
	
    if(strShowIdent!=null && strShowIdent.trim().length()==0)
        strShowIdent="0";
    
    //strShowIdent="30";
    String sql = "SELECT  a.Show_Seq, Event_Order,Event_Seq,dbo.InitCap(name) As name,Rider,b.show_Name FROM Events a join shows b on a.Show_Seq=b.Show_Seq "
            + " Where a.Show_Seq="+strShowIdent+" and a.EventStatus='A' order by a.Event_Order";
			
	if(strClassSeq!=null && strClassSeq.length()>0)		
		sql = "SELECT  a.Show_Seq,Event_Order,Event_Seq,dbo.InitCap(name) As name,Rider,b.show_Name FROM Events a join shows b on a.Show_Seq=b.Show_Seq "
            + " Where a.Show_Seq="+strShowIdent+"  and a.Event_Seq="+strClassSeq+"  and a.EventStatus='A' order by a.Event_Order";

    try {
        conn = dbcmt.getCon();//getCon_PasoTrackerProd();

        //stm1 = conn.createStatement();
		cst = conn.prepareCall("{call OnlineGET_EVENT_INFORMATION(?,?)}");
            cst.setString(1,strShowIdent);
            cst.setString(2, strClassSeq);
          
		

        JSONArray list = new JSONArray();
//        rs = stm1.executeQuery(sql);
rs = cst.executeQuery();

        int i=1;
        while (rs.next()) {
            JSONObject obj = new JSONObject();
            obj.put("no", rs.getString("Event_Order"));
            obj.put("Seq", rs.getInt("Event_Seq"));
            obj.put("name",rs.getString("name"));
            obj.put("className", rs.getString("name"));
            obj.put("showSeq", rs.getString("Show_Seq"));            
            obj.put("showName", rs.getString("show_Name"));
			obj.put("Event_Date", rs.getString("Event_Date"));
			obj.put("Cnt", rs.getString("Cnt"));
			if(rs.getString("Cnt")!=null && rs.getString("Cnt").equalsIgnoreCase("0"))
				obj.put("EventStat", "No Entries / Sin Participantes");
			else
				obj.put("EventStat", rs.getString("EventStat"));
			//obj.put("ConfepasoCategory", rs.getString("Category"));

            

            String clientOrigin = request.getHeader("origin");
            response.setHeader("Access-Control-Allow-Origin", clientOrigin);
            response.setHeader("Access-Control-Allow-Methods", "POST");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type");
            response.setHeader("Access-Control-Max-Age", "86400");

            list.add(obj);
            i++;
        }

        out.print(list);

    } catch (Exception ex) {
        out.println("<h1>" + ex + "</g1>");
    } finally {

        if (stm1 != null) {
            stm1.close();
        }
		if (cst != null) {
            cst.close();
        }
        if (rs != null) {
            rs.close();
        }
        if (conn != null) {
            conn.close();
        }

    }
%>
