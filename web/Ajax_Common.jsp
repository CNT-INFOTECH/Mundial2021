<%-- 
    Document   : Ajax_Common
    Created on : Mar 14, 2016, 9:40:07 AM
    Author     : cntuser
--%>

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
    Statement st=null;
    
    String keyVal="";
    String strResult="";
    String regSeq = "";
    String entySeq = "";
    String regNo = "";
    String startDt="";
    
    if(request.getParameter("Key")!=null)
        keyVal=request.getParameter("Key");
    if(request.getParameter("param1")!=null)
        regSeq=request.getParameter("param1");
    if(request.getParameter("param2")!=null)
        entySeq=request.getParameter("param2");
    if(request.getParameter("param3")!=null)
        regNo=request.getParameter("param3");
    if(request.getParameter("param4")!=null)
        startDt=request.getParameter("param4");
    
    
    
    try{
         con=dbmgr.getConnection();
         con.setAutoCommit(false);
         
         if(keyVal.equalsIgnoreCase("TransOwner")){
            
            
            if(regSeq !=null && regSeq.length()>0 && entySeq!=null && entySeq.length()>0 ){

                 cst=con.prepareCall("{call INS_UPD_OWNERINFORMATION(?,?,?,?,?, ?,?)}");
                 cst.setString(1, regSeq);
                 cst.setString(2, regNo);
                 cst.setString(3, "Y");
                 cst.setString(4, entySeq);
                 cst.setString(5, startDt);//InsertedDate
                 cst.setString(6, "");//InactiveDate
                 cst.setString(7, userName);

                 rs=cst.executeQuery();
               
                if(rs.next()){
                    if(rs.getString("regSeq")!=null)
                       strResult=rs.getString("regSeq");
                }

               con.commit();
            }
         }   
         else if(keyVal.equalsIgnoreCase("CheckPerson")){//Onchange function from person module demographics part
            
            
            if(regSeq !=null && regSeq.length()>0){//regSeq is assigned#

                st = con.createStatement();
                rs=st.executeQuery("select entityseq from individuals_entity_details where assignednum='"+regSeq+"' ");
               
                if(rs.next()){
                    if(rs.getString("entityseq")!=null)
                       strResult=rs.getString("entityseq");
                }
            }
         }
         else if(keyVal.equalsIgnoreCase("judgesCard")){//Onchange function from person module demographics part
            
            
            if(regSeq !=null && regSeq.length()>0){//regSeq is assigned#

                st = con.createStatement();
                rs=st.executeQuery("select event_seq from Events where Show_Seq='"+regSeq+"' and EventStatus='A' and Event_Order='"+entySeq+"' ");//regseq=showseq && entyseq=event_order
               
                if(rs.next()){
                    if(rs.getString("event_seq")!=null)
                       strResult=rs.getString("event_seq");
                }
            }
         }    
         
         else if(keyVal.equalsIgnoreCase("EventHrsRegCheck")){//Onchange function from show module , youth rider registration for events
            
            
            if(regSeq !=null && regSeq.length()>0 && entySeq!=null && entySeq.length()>0 ){//regSeq is reg# && entySeq is eventSeq,

                cst=con.prepareCall("{call Get_Shw_HrsRegCountChk(?,?)}");
                cst.setString(1, regSeq);
                cst.setString(2, entySeq);
                rs=cst.executeQuery();
                               
                if(rs.next()){
                    if(rs.getString("Msg")!=null)
                       strResult=rs.getString("Msg");
                }
            }
         }                    
    }
    catch(Exception e){        
        System.err.println("Exception in Ajax_Common jsp:"+e);    
        strResult="0";
    }
    finally{
       if(rs!=null)
          rs.close();
       if(cst!=null)
          cst.close();
       if(st!=null)
          st.close();
       dbmgr.releaseConnection(con);
    }
    
    out.println(strResult);
    
%>