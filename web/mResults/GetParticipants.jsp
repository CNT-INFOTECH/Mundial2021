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
    
    String dbAction="";
    if(request.getParameter("act")!=null)
        dbAction=request.getParameter("act");
    
	
	String strShowIdent ="";
	if(request.getParameter("pShowSeq")!=null)
        strShowIdent=request.getParameter("pShowSeq");
	String strClsSeq ="";
	if(request.getParameter("clsSq")!=null)
        strClsSeq=request.getParameter("clsSq");
    
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
		ArrayList lst = new ArrayList();
    boolean excused=false;
    boolean scratch=false;
    boolean noShow=false;
    boolean disClass=false;
    boolean disShow=false;
    String showFlag="";
    String f1Result="";
    String backNum="";
        //rs = stm1.executeQuery(sql);
        
        if(dbAction.equalsIgnoreCase("get")){

			cst=conn.prepareCall("{call WS_SM_GetEventParticipants_Screen(?,?,?,?,?)}");
			cst.setString(1, strClsSeq);                     
			cst.setString(2, "");//20=Miami,3=pam
			cst.setString(3, strShowIdent);//19=show seq
			cst.setString(4, "1");//1=All participants
			cst.setString(5, "");
        }

        rs=cst.executeQuery();   
		int i=0;
		
        JSONObject obj = new JSONObject();
       while (rs.next()) {           
            obj = new JSONObject();
            excused=false;
            scratch=false;
            noShow=false;
            disClass=false;
            disShow=false;
            showFlag="";     
            f1Result="";
            backNum="";
            
            if(rs.getString("Show_Flags")!=null)
                showFlag=rs.getString("Show_Flags");
            
            if(rs.getString("F1_AssignedNum")!=null)
                f1Result=rs.getString("F1_AssignedNum");
            
            if(rs.getString("AssignedNum")!=null)
                backNum=rs.getString("AssignedNum");
            
            if(backNum.equalsIgnoreCase(f1Result))
                obj.put("f1Highlight", "Yes"); 
            else
                obj.put("f1Highlight", "No"); 
            
            if(!showFlag.equals("")){
                if(showFlag.equalsIgnoreCase("ex"))
                    excused=true;
                else if(showFlag.equalsIgnoreCase("s"))
                    scratch=true;
                else if(showFlag.equalsIgnoreCase("ns"))
                    noShow=true;
                else if(showFlag.equalsIgnoreCase("dc"))
                    disClass=true;
                else if(showFlag.equalsIgnoreCase("ds"))
                    disShow=true;
            }
            
            //Uses the below object for index.html
            obj.put("Event_Seq", rs.getString("Event_Seq"));            
            obj.put("REGSEQ", rs.getString("REGSEQ"));            
            obj.put("HorseName", rs.getString("HORSE_PRIMARYNAME"));
            obj.put("Registration_Num", rs.getString("Registration_Num"));
            obj.put("BackNum", rs.getString("AssignedNum"));            
            obj.put("Sire", rs.getString("SireName"));
            obj.put("Dam", rs.getString("DamName"));
            obj.put("Owner", rs.getString("OwnerName"));
            obj.put("Rider", rs.getString("HRider"));                       
            obj.put("age", rs.getString("HAge"));                       
            obj.put("trainerId", rs.getString("trainerID"));                       
            obj.put("trainerName", rs.getString("trainerName"));                       
            obj.put("J1Position", rs.getString("J1Postion"));                       
            obj.put("J2Position", rs.getString("J2Postion"));                       
            obj.put("J3Position", rs.getString("J3Postion"));                       
            obj.put("J4Position", rs.getString("J4Postion"));                       
            obj.put("J5Position", rs.getString("J5Postion"));                       
            obj.put("error","" );//rs.getString("error"));                       
            obj.put("notes", rs.getString("notes"));                       
            obj.put("ShowFlag", rs.getString("Show_Flags"));        
            
			
            //Uses the below object for index_New.html
            obj.put("hrsName", rs.getString("HORSE_PRIMARYNAME"));
            obj.put("backNum", rs.getString("AssignedNum"));            
            obj.put("sireName", rs.getString("SireName"));
            obj.put("damName", rs.getString("DamName"));
            obj.put("owner", rs.getString("OwnerName"));
            obj.put("rider", rs.getString("HRider"));                                                               
            obj.put("trainer", rs.getString("trainerName"));                       
            obj.put("j1", rs.getString("Placement"));                       
            obj.put("j2", rs.getString("J2Postion"));                       
            obj.put("j3", rs.getString("J3Postion"));                       
            obj.put("j4", rs.getString("J4Postion"));                       
            obj.put("j5", rs.getString("J5Postion"));  
            obj.put("ns", noShow);   
            obj.put("s", scratch);   
            obj.put("ex", excused);   
            obj.put("dc", disClass);   
            obj.put("ds", disShow);   
            obj.put("noOfPlacement", rs.getString("Num_Of_Positions"));   
            obj.put("f1AssigedNum", rs.getString("F1_AssignedNum"));   			  
            obj.put("repCountry", rs.getString("RepCountry")); 
            
			obj.put("breeder", rs.getString("breederName"));
			obj.put("association", rs.getString("organisation_val"));
			obj.put("regNum", rs.getString("Registration_Num"));
			obj.put("color", rs.getString("horse_color_val"));
			obj.put("sex", rs.getString("gender"));
			obj.put("grandSire", rs.getString("Dam_SireName"));
			obj.put("sireRegNum", rs.getString("Sire_RegNum"));
			obj.put("damRegNum", rs.getString("Dam_RegNum"));
			obj.put("ownerID", rs.getString("ownerID"));
			obj.put("breederID", rs.getString("breederID"));
			obj.put("grandSireRegNum", rs.getString("Dam_SireRegNum"));
			obj.put("microchip", rs.getString("microchip_Num"));
			obj.put("riderID", rs.getString("riderID"));


            if(backNum.equalsIgnoreCase(rs.getString("F1_AssignedNum")))
            obj.put("f1CutStyle", "fa fa-check");   
            else
            obj.put("f1CutStyle", "fa fa-close");   
            
             
        
//            lst.add(obj);
            list.add(obj);
            
        }
        
                
        String clientOrigin = request.getHeader("origin");
        response.setHeader("Access-Control-Allow-Origin", clientOrigin);
        response.setHeader("Access-Control-Allow-Methods", "POST");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        response.setHeader("Access-Control-Max-Age", "86400");

        out.print("{\"horses\":"+list+"}");


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
<%--
    Connection conn = null;
    ResultSet rs = null;
    Statement stm1 = null;
    DBConnMngr dbcmt = new DBConnMngr();

    CallableStatement cst = null;
    // String strShowIdent =request.getParameter("pShowSeq");
    String strCurrentClass =request.getParameter("clsSq");
    String strRegSeq ="";
    if(request.getParameter("rSq")!=null)
        strRegSeq=request.getParameter("rSq");
	String strShow = request.getParameter("showSq");
    String strDbSq = request.getParameter("cId");
    
    String sql = "";
    
    System.out.print("Cassls Seq:"+strCurrentClass);
    JSONArray list = new JSONArray();
    ArrayList lst = new ArrayList();
    boolean excused=false;
    boolean scratch=false;
    boolean noShow=false;
    boolean disClass=false;
    boolean disShow=false;
    String showFlag="";
    String f1Result="";
    String backNum="";
    try {
        conn = dbcmt.getCon();
        conn.setAutoCommit(false);

        cst=conn.prepareCall("{call WS_SM_GetEventParticipants_Screen(?,?,?,?,?)}");
        cst.setString(1, strCurrentClass);                     
        cst.setString(2, strDbSq);//20=Miami,3=pam
        cst.setString(3, strShow);//19=show seq
        cst.setString(4, "1");//1=All participants
        cst.setString(5, strRegSeq);
        
        rs = cst.executeQuery();
        JSONObject obj = new JSONObject();
        while (rs.next()) {           
            obj = new JSONObject();
            excused=false;
            scratch=false;
            noShow=false;
            disClass=false;
            disShow=false;
            showFlag="";     
            f1Result="";
            backNum="";
            
            if(rs.getString("Show_Flags")!=null)
                showFlag=rs.getString("Show_Flags");
            
            if(rs.getString("F1_AssignedNum")!=null)
                f1Result=rs.getString("F1_AssignedNum");
            
            if(rs.getString("AssignedNum")!=null)
                backNum=rs.getString("AssignedNum");
            
            if(backNum.equalsIgnoreCase(f1Result))
                obj.put("f1Highlight", "Yes"); 
            else
                obj.put("f1Highlight", "No"); 
            
            if(!showFlag.equals("")){
                if(showFlag.equalsIgnoreCase("ex"))
                    excused=true;
                else if(showFlag.equalsIgnoreCase("s"))
                    scratch=true;
                else if(showFlag.equalsIgnoreCase("ns"))
                    noShow=true;
                else if(showFlag.equalsIgnoreCase("dc"))
                    disClass=true;
                else if(showFlag.equalsIgnoreCase("ds"))
                    disShow=true;
            }
            
            //Uses the below object for index.html
            obj.put("Event_Seq", rs.getString("Event_Seq"));            
            obj.put("REGSEQ", rs.getString("REGSEQ"));            
            obj.put("HorseName", rs.getString("HORSE_PRIMARYNAME"));
            obj.put("Registration_Num", rs.getString("Registration_Num"));
            obj.put("BackNum", rs.getString("AssignedNum"));            
            obj.put("Sire", rs.getString("SireName"));
            obj.put("Dam", rs.getString("DamName"));
            obj.put("Owner", rs.getString("OwnerName"));
            obj.put("Rider", rs.getString("HRider"));                       
            obj.put("age", rs.getString("HAge"));                       
            obj.put("trainerId", rs.getString("trainerID"));                       
            obj.put("trainerName", rs.getString("trainerName"));                       
            obj.put("J1Position", rs.getString("J1Postion"));                       
            obj.put("J2Position", rs.getString("J2Postion"));                       
            obj.put("J3Position", rs.getString("J3Postion"));                       
            obj.put("J4Position", rs.getString("J4Postion"));                       
            obj.put("J5Position", rs.getString("J5Postion"));                       
            obj.put("error","" );//rs.getString("error"));                       
            obj.put("notes", rs.getString("notes"));                       
            obj.put("ShowFlag", rs.getString("Show_Flags"));        
            
            //Uses the below object for index_New.html
            obj.put("hrsName", rs.getString("HORSE_PRIMARYNAME"));
            obj.put("backNum", rs.getString("AssignedNum"));            
            obj.put("sireName", rs.getString("SireName"));
            obj.put("damName", rs.getString("DamName"));
            obj.put("owner", rs.getString("OwnerName"));
            obj.put("rider", rs.getString("HRider"));                                                               
            obj.put("trainer", rs.getString("trainerName"));                       
            obj.put("j1", rs.getString("J1Postion"));                       
            obj.put("j2", rs.getString("J2Postion"));                       
            obj.put("j3", rs.getString("J3Postion"));                       
            obj.put("j4", rs.getString("J4Postion"));                       
            obj.put("j5", rs.getString("J5Postion"));  
            obj.put("ns", noShow);   
            obj.put("s", scratch);   
            obj.put("ex", excused);   
            obj.put("dc", disClass);   
            obj.put("ds", disShow);   
            obj.put("noOfPlacement", rs.getString("Num_Of_Positions"));   
            obj.put("f1AssigedNum", rs.getString("F1_AssignedNum"));   
            
            if(backNum.equalsIgnoreCase(rs.getString("F1_AssignedNum")))
            obj.put("f1CutStyle", "fa fa-check");   
            else
            obj.put("f1CutStyle", "fa fa-close");   
            
             
        
//            lst.add(obj);
            list.add(obj);
            
        }
        
                
        String clientOrigin = request.getHeader("origin");
        response.setHeader("Access-Control-Allow-Origin", clientOrigin);
        response.setHeader("Access-Control-Allow-Methods", "POST");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        response.setHeader("Access-Control-Max-Age", "86400");

        out.print("{\"horses\":"+list+"}");

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
--%>
