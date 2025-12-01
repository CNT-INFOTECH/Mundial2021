<%-- 
    Document   : listHighpoints
    Created on : Dec 8, 2017, 4:37:58 PM
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
    String strCategory="Pasofino";
    String strShowSeq="61";
    String strslctid ="";
    String strdivtype="";
    String strslseq="";
    String strslname="";
    String StrEnvSeq="";
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
		
	
            if(request.getParameter("PEnvName")!=null)
			StrEnvSeq=request.getParameter("PEnvName");
            System.out.println(StrEnvSeq);

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
    
   
    try {
        conn = dbcmt.getCon();
        JSONArray list = new JSONArray();
        if(strdivtype.equals("view")){
            System.out.println("point view");
	cst = conn.prepareCall("{call OnlineGET_POINTS_MODALITY_WS(?,?,?,?,?)}");
             cst.setString(1,strShowSeq);
            cst.setString(2,strAire);
			cst.setString(3,strCategory);
	cst.setInt(4,Integer.parseInt(strslctid));
		  cst.setString(5,StrEnvSeq);

        
//        rs = stm1.executeQuery(sql);
rs = cst.executeQuery();

        int i=1;
        while (rs.next()) {
            JSONObject obj = new JSONObject();
            obj.put("Name", rs.getString("Name"));
            obj.put("AssignedNum", rs.getString("AssignedNum"));
             obj.put("PTS", rs.getString("pts"));
            obj.put("Points", rs.getString("Points"));
          obj.put("GC", rs.getString("PointsP"));
            obj.put("GCR", rs.getString("PointsS"));
            obj.put("Seq", rs.getString("Seq"));
           
            System.out.println("before:" +strslctid);
            obj.put("Slid", strslctid);
            obj.put("category", strCategory);
            if(rs.getString("Placement")!=null)		{
				if(Integer.parseInt(rs.getString("Placement"))==1)
				obj.put("Placement", "m");
				else if(Integer.parseInt(rs.getString("Placement"))>6)					
					obj.put("Placement","99");
				else
					obj.put("Placement", (Integer.parseInt(rs.getString("Placement"))-1));
			}else 
				obj.put("Placement","99");
            
            System.out.println("after" +strslctid);
            String clientOrigin = request.getHeader("origin");
            response.setHeader("Access-Control-Allow-Origin", clientOrigin);
            response.setHeader("Access-Control-Allow-Methods", "POST");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type");
            response.setHeader("Access-Control-Max-Age", "86400");

            list.add(obj);
            i++;
        }
        
        }
        else if(strdivtype.equals("details")){
             int TotalPoints=0;
            if(request.getParameter("slseq")!=null)
			strslseq=request.getParameter("slseq");
            if(request.getParameter("name")!=null)
			strslname=request.getParameter("name");
                 if(request.getParameter("PEnvName")!=null)
			StrEnvSeq=request.getParameter("PEnvName");
            System.out.println("Inside details"+strslseq+"---"+strslctid+"---"+strCategory);
           cst = conn.prepareCall("{call OnlineGET_POINTS_MODALITY_WS_DETAILS(?,?,?,?,?,?)}");
             cst.setString(1,strShowSeq);
            cst.setString(2,strAire);
			cst.setString(3,strCategory);
			cst.setInt(4,Integer.parseInt(strslctid));
                        cst.setString(5,strslseq);
                           cst.setString(6,StrEnvSeq);	
		

        
//        rs = stm1.executeQuery(sql);
rs = cst.executeQuery();

        int i=1;
        
        while (rs.next()) {
            JSONObject obj = new JSONObject();
            int points=rs.getInt("Points");
            TotalPoints=TotalPoints+points;
            obj.put("Name", rs.getString("Name"));
            obj.put("AssignedNum", rs.getString("AssignedNum"));
              obj.put("Event_Order", rs.getString("Event_Order"));
            obj.put("EventName", rs.getString("EventName"));
            obj.put("SireName", rs.getString("SireName"));
            obj.put("DamName", rs.getString("DamName"));
            obj.put("OwnerName", rs.getString("OwnerName"));
           obj.put("Points",points);
           obj.put("HRider", rs.getString("HRider"));
         //   System.out.println("before:" +strslctid);
            obj.put("Slid", strslctid);
            obj.put("category", strCategory);
            obj.put("slname",strslname);
             obj.put("Total",TotalPoints);
            
            
         //   System.out.println("after" +strslctid);
            String clientOrigin = request.getHeader("origin");
            response.setHeader("Access-Control-Allow-Origin", clientOrigin);
            response.setHeader("Access-Control-Allow-Methods", "POST");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type");
            response.setHeader("Access-Control-Max-Age", "86400");

            list.add(obj);
            i++;
        }
//        JSONObject obj = new JSONObject();
//        obj.put("Total",TotalPoints);
//        list.add(obj);
        }
        out.print(list);

    } catch (Exception ex) {
       System. out.println("<h1>" + ex + "</h1>");
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