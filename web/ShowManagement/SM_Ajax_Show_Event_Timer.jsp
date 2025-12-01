<%-- 
    Document   : SM_Ajax_Show_Event_Timer
    Created on : May 13, 2016, 5:02:48 PM
    Author     : CNT
--%>

<%@ page import = "java.util.Iterator"%>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.sql.*" %>
<%@page import="Shows.ShowUtil"%>
<%@ page import =  "Shows.*" %>
<%
    Cookie[] cookies = request.getCookies();
        String strCurrentShowSelected = "";
        String strUserID = "Admin";
        String strDBName = "Confepaso";
        for (int i = 0; i < cookies.length; i++) {
            Cookie c = cookies[i];
            if (c.getName().equals("CurrentShowNumber")) {
                strCurrentShowSelected = c.getValue();
            }
            if (c.getName().equals("username")) {
                strUserID = c.getValue();
            }
            if (c.getName().equals("DBName")) {
                strDBName = c.getValue();
            }
        }
           
        
    Connection localConnection = null;
    DBConnection dbcmt = new DBConnection(strUserID,strDBName);
    ShowUtil shUtil=new ShowUtil();
     String strTime = "";
     
     CallableStatement cst=null;
     ResultSet rs1=null;
    
         String strExpType = request.getParameter("Type");
         String strEventSeq = request.getParameter("EventSeq");

         int expType = Integer.parseInt(strExpType);
         localConnection = dbcmt.getConnection();
         
         try{
         localConnection.setAutoCommit(false);
         
         cst = localConnection.prepareCall("{call SM_Show_events_Timer(?,?)}");
         cst.setInt(1, expType);
         cst.setString(2, strEventSeq);
         rs1 = cst.executeQuery();

         while(rs1.next())
         {
            strTime = rs1.getString("Hours");
            strTime = strTime + ":" + rs1.getString("Minutes");
            strTime = strTime + ":" + rs1.getString("Seconds");
          
         }

         }
         catch(Exception ex)
         {
             out.print(ex);
         }
         finally{
             
         if(localConnection!=null)  {   
             localConnection.commit();
             localConnection.close();
         }
         if(rs1!=null)
             rs1.close();
         if(cst!=null)
             cst.close();
         
             
         String strOutput=strTime;
         out.print(strOutput);
         }


%>

