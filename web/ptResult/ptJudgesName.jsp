<%-- 
    Document   : ptJudgesName
    Created on : Feb 22, 2018, 6:13:50 PM
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
    
    
        
    String dbAction="";
    if(request.getParameter("act")!=null)
        dbAction=request.getParameter("act");
    
    
    Connection conn = null;
    ResultSet rs = null;
    Statement stm1 = null;
    DbConnMngr dbcmt = new DbConnMngr();
    CallableStatement cst = null;
    String strCurrentClass=request.getParameter("pClassSeq");
	String strEnvName =request.getParameter("PEnvName");	
   System.out.println(strEnvName);
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
               

JSONArray list = new JSONArray(); 

	   //To Fetch Judges Name
			try {
				rs = null;
				//localConnection = dbcmt.getConnection();
				//localConnection.setAutoCommit(false);
				if (strCurrentClass != null && strCurrentClass.length() > 0) {
					
						cst = null;
						cst = conn.prepareCall("{call OnlineGet_Event_JudgeNamesMobile(?,?)}");
						cst.setString(1, strCurrentClass);
                                                 cst.setString(2,strEnvName);
                                                   
						rs = cst.executeQuery();
						if (rs.next()) {

							JSONObject obj = new JSONObject();
																					
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
                                

							obj.put("J1Name", sJ1Name);
							obj.put("J2Name", sJ2Name);
							obj.put("J3Name", sJ3Name);
							obj.put("J4Name", sJ4Name);
							obj.put("J5Name", sJ5Name);

							list.add(obj);
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
