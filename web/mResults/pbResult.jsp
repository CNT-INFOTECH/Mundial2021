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
        
        /*sql="Select e.regseq,a.AssignedNum As HRS_ASSIGNED_NUM,e.HORSE_PRIMARYNAME,isnull(a.Placement,'99') as Placement ,isnull(dbo.GetEntityCompleteName_Org_FL(b.RIDER),'') as rider,isnull(dbo.GetEntityCompleteName_Org_FL(IED.EntitySeq),'') as Owner,dbo.GetEntityCompleteName_Org_FL(b.BreederSeq) as Breeder"                
            + " ,dbo.fnGetHorseName(e.sire) as Sire,dbo.fnGetHorseName(e.dam) as Dam from EventRegistration A "
            + " left outer Join EventRegistraion_Group B on A.Group_Seq=B.GROUP_SEQ  "
            + " Join Events C on C.Event_Seq=A.EventSeq "
            + " Join Shows D on D.Show_Seq=C.Show_Seq "
            + " join REGISTRATION e on e.REGSEQ=b.REG_SEQ " 
			+ " left outer Join OWNERINFORMATION Owf on e.REGSEQ=Owf.REGSEQ and CurrentOwner='Y'  " 
			+ " left outer join INDIVIDUALS_ENTITY_DETAILS IED on IED.ENTITYSEQ=COALESCE(B.OwnerSeq,Owf.EntitySeq)   " 
			
            + " Where C.Event_Seq="+strCurrentClass+" and A.Registration_Status='A' order by C.Event_Seq,isnull(Placement,'99'),HRS_ASSIGNED_NUM ";
        stm1 = conn.createStatement();*/

		cst = conn.prepareCall("{call GET_EVENT_PARTICIPANTS_WS(?,?)}");
            cst.setString(1,"");
            cst.setString(2,strCurrentClass);
			
        JSONArray list = new JSONArray();

		rs=cst.executeQuery();
        
        
  
        while (rs.next()) {
            
            JSONObject obj = new JSONObject();
            obj.put("HorseName", rs.getString("HORSE_PRIMARYNAME").toUpperCase());            
            /*obj.put("BackNum", rs.getString("HRS_ASSIGNED_NUM"));
            obj.put("RegSeq", rs.getString("regseq"));
			obj.put("Rider", rs.getString("Rider"));
			obj.put("Owner", rs.getString("Owner"));
			obj.put("Breeder", rs.getString("Breeder"));*/			
            if(rs.getString("Placement")!=null && rs.getString("Placement").equalsIgnoreCase(""))
				obj.put("Placement", "99");	
			else
			obj.put("Placement", rs.getString("Placement"));			
			obj.put("Sire", rs.getString("SireName")!=null ?  rs.getString("SireName").toUpperCase() :"");
			obj.put("Dam",  rs.getString("DamName")!=null ?  rs.getString("DamName").toUpperCase() :"");
			obj.put("GrandSire",  rs.getString("Dam_SireName")!=null ?  rs.getString("Dam_SireName").toUpperCase() :"");
			obj.put("Owner", rs.getString("OwnerName")!=null ?  rs.getString("OwnerName").toUpperCase() :"" );
			obj.put("Breeder",  rs.getString("BreederName")!=null ?  rs.getString("BreederName").toUpperCase() :"");
			obj.put("Rider",  rs.getString("HRider")!=null ?  rs.getString("HRider").toUpperCase() :"");
			obj.put("RepCountry",  rs.getString("RepCountry")!=null ?  rs.getString("RepCountry").toUpperCase() :"");
			           
			
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
