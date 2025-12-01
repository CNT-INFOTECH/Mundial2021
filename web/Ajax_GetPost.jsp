<%--     Document   : Ajax_GetPost    Created on : Sep 29, 2015, 8:39:35 PM    Author     : ruban --%>
<%@page import="pasotracker.*"%>
<%@ page import = "java.util.*" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Calendar"%>

<%
    Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());      
    Date currentTime = localCalendar.getTime();
    int currentDay= localCalendar.get(Calendar.DATE);
    int currentMonth = localCalendar.get(Calendar.MONTH) + 1;
    int currentYear = localCalendar.get(Calendar.YEAR);

    String curDate=currentMonth+"/"+currentDay+"/"+currentYear;
    String userName=session.getAttribute("user").toString();
    
    DbConnMngr dbmgr=new DbConnMngr();    
    Connection con =null; 
    CallableStatement cst = null;
    ResultSet rs =null;
    
    String keyVal="";
    String frmName="";
    String strAllVal="";
    String strSplit[]=null;
    String strSplit1[]=null;
    String sqlQuery="";
    String strType="";
    String strStat="";
    
    String strSeq="";
    String strResult="";
    
    if(request.getParameter("Key")!=null)
        keyVal=request.getParameter("Key");
    if(request.getParameter("AllVal")!=null)
        strAllVal=request.getParameter("AllVal");
    if(request.getParameter("Type")!=null)
        strType=request.getParameter("Type");
    
//    strSplit = strAllVal.split("@@@");
    strSplit = strAllVal.split(",");
    
    if(strSplit.length >= 1)
        strSeq = strSplit[0];
    if(strSplit.length >= 2)
        strStat = strSplit[1];
    
    try{
         con=dbmgr.getConnection();
         con.setAutoCommit(false);
         
        if(keyVal.equals("IssueCertificate")){
            strResult="";
            cst=null; 
            cst=con.prepareCall("{call InsUpdTrack_print(?,?,?,?)}");
            cst.setString(1, strAllVal);
            cst.setString(2, "R");
            cst.setString(3, "CERTIFICATE ISSUED");
            cst.setString(4, userName);
            
            rs=cst.executeQuery();
            if(rs.next()){
                if(rs.getString("MSG")!=null)
                   strResult=rs.getString("MSG");
            }
            con.commit();
        }
        else if(keyVal.equalsIgnoreCase("PrintRecordCount")){
            try{
                PreparedStatement preparedStatement = null;
                if(strStat.equalsIgnoreCase("Y"))
                    preparedStatement = con.prepareStatement("UPDATE TRACK_PRINT SET STATUS='Y' WHERE SEQ="+strSeq);
                else
                    preparedStatement = con.prepareStatement("UPDATE TRACK_PRINT SET STATUS='N' WHERE SEQ="+strAllVal);
                    
                preparedStatement.executeUpdate();
                strResult="Updated successfully";
            }
            catch(Exception e){
                strResult="There is problem in updation ";
            }
            con.commit();
        }
    }
    catch(Exception e){
        System.err.println("Exception in Ajax_GetPost jsp:"+e);    
    }
    finally{
       if(rs!=null)
          rs.close();
       if(cst!=null)
          cst.close();
       dbmgr.releaseConnection(con);
    }
    
    out.println(strResult);
    
%>