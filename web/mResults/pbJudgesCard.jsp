<%-- 
    Document   : pbJudgesCard
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
	String sJ1Name="J1";
	String sJ2Name="J2";
	String sJ3Name="J3";
	String sJ4Name="J4";
	String sJ5Name="J5";	
	int noOfPos=5;

    try {
        conn = dbcmt.getCon();
        conn.setAutoCommit(false);	
               

	   //To Fetch Judges Name
			try {
				rs = null;
				//localConnection = dbcmt.getConnection();
				//localConnection.setAutoCommit(false);
				if (strCurrentClass != null && strCurrentClass.length() > 0) {
					
						cst = null;
						cst = conn.prepareCall("{call Get_Event_JudgeNames(?)}");
						cst.setString(1, strCurrentClass);

						rs = cst.executeQuery();
						if (rs.next()) {
																					
							if (rs.getString("J1") != null)
								sJ1Name = rs.getString("J1");
						
							if (rs.getString("J2") != null)
								sJ2Name = rs.getString("J2");
							
							if (rs.getString("J3") != null)
								sJ3Name = rs.getString("J3");
							
							if (rs.getString("J4") != null)
								sJ4Name = rs.getString("J4");
							
							if (rs.getString("J5") != null)
								sJ5Name = rs.getString("J5");

							if (rs.getString("Num_of_Positions") != null)
								noOfPos = Integer.parseInt(rs.getString("Num_of_Positions"));
                                
					}
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				if (rs != null) {
					rs.close();
				}
				if (cst != null) {
					cst.close();
				}
			}
			

			rs = null;
			cst = null;
		cst = conn.prepareCall("{call GET_EVENT_PARTICIPANTS_F1F2_Mobile(?)}");
            cst.setString(1,strCurrentClass);
			
        JSONArray list = new JSONArray();        
		rs=cst.executeQuery();
        
        
        
//        if(dbAction.equalsIgnoreCase("get")){
//            cst=conn.prepareCall("{call GET_EVENT_PARTICIPANTS(?,?)}");
//            cst.setString(1, "");//ShowSeq
//            cst.setString(2, "2255");//EventSeq
//        }

//        rs=cst.executeQuery();    
        while (rs.next()) {
            
            JSONObject obj = new JSONObject();
			
            obj.put("HorseName", rs.getString("HORSE_PRIMARYNAME").toUpperCase());                        
			obj.put("BackNum", rs.getString("AssignedNum"));		
			
            if(rs.getString("Placement")!=null && rs.getString("Placement").equalsIgnoreCase(""))
				obj.put("Placement", "99");	
			else
			obj.put("Placement", rs.getString("Placement"));
		
			if(rs.getString("J1Pos")!=null)
				obj.put("J1Pos", rs.getString("J1Pos"));	
			else
				obj.put("J1Pos", "");
		
			if(rs.getString("J2Pos")!=null)
				obj.put("J2Pos", rs.getString("J2Pos"));	
			else
				obj.put("J2Pos", "");
			
			if(rs.getString("J3Pos")!=null)
				obj.put("J3Pos", rs.getString("J3Pos"));	
			else
				obj.put("J3Pos", "");
			
			if(rs.getString("J4Pos")!=null)
				obj.put("J4Pos", rs.getString("J4Pos"));	
			else
				obj.put("J4Pos", "");
			
			if(rs.getString("J5Pos")!=null)
				obj.put("J5Pos", rs.getString("J5Pos"));	
			else
				obj.put("J5Pos", "");
			
			if(rs.getString("Total")!=null)
				obj.put("Total", rs.getString("Total"));	
			else
				obj.put("Total", "");
						
			obj.put("Rider", rs.getString("RiderName").toUpperCase());
			obj.put("RepCountry", rs.getString("RepCountry"));//.toUpperCase()
			obj.put("J1Name", sJ1Name);
			obj.put("J2Name", sJ2Name);
			obj.put("J3Name", sJ3Name);
			obj.put("J4Name", sJ4Name);
			obj.put("J5Name", sJ5Name);

			if(rs.getString("J1Pos")==null)
				break;
			
            list.add(obj);
        }
		
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
