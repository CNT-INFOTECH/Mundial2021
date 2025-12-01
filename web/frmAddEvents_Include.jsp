<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>

<%
  String strShowSeq="0";
  if(request.getParameter("ShowSeq")!=null)
      strShowSeq=request.getParameter("ShowSeq");
  String strEventSeq="0";
   if(request.getParameter("EventSeq")!=null)
      strEventSeq=request.getParameter("EventSeq");
  String strMode="0";
  if(request.getParameter("mode")!=null)
      strMode=request.getParameter("mode");

    String strOrder="";
    String strDate="";
    String strFromAge="";
    String strToAge="";
    String strEventName="";

    if(strMode.equals("1"))
      {
          
            eventBean.setShowSeqNo(strShowSeq);
            eventBean.setSeqNo("0");
            eventBean.setDate("");
            eventBean.setAir("");
            eventBean.setCategory("");
            eventBean.setGender("");
            eventBean.setAgeFrom("");
            eventBean.setAgeTo("");
            eventBean.setRider("");
            eventBean.setEventName("");
            eventBean.setEventOrder("");
            eventBean.setType("");
      }



 if(!strShowSeq.equals("0") && !(strEventSeq.equals("0")))
 {
    
 Connection localConnection=null;
 DbConnMngr dbcmt=new DbConnMngr();

try {
        localConnection=dbcmt.getConnection();
	localConnection.setAutoCommit(false);
        CallableStatement cst = localConnection.prepareCall("{call [GET_EVENT_INFORMATION](?,?)}");
        cst.setString(1, strShowSeq);
        cst.setString(2, strEventSeq);
        ResultSet rs2 = cst.executeQuery();
     


        while(rs2.next())
        {
            eventBean.setShowSeqNo(strShowSeq);
            eventBean.setSeqNo(strEventSeq);
            eventBean.setDate(rs2.getString("Event_Date"));
            eventBean.setAir(rs2.getString("Air"));
            eventBean.setCategory(rs2.getString("Category"));
            eventBean.setGender(rs2.getString("Gender"));
            eventBean.setAgeFrom(rs2.getString("AgeFrom"));
            eventBean.setAgeTo(rs2.getString("AgeTo"));
            eventBean.setRider(rs2.getString("Rider"));
            eventBean.setEventName(rs2.getString("Name"));
            eventBean.setEventOrder(rs2.getString("Event_Order"));
            eventBean.setType(rs2.getString("EventType"));


            
        }

         rs2.close();
         cst.close();

        localConnection.commit();
        dbcmt.releaseConnection(localConnection);
        }

        catch(Exception ex)
        {
            ex.printStackTrace();
            try
            {
                localConnection.rollback();
                dbcmt.releaseConnection(localConnection);
            }
            catch(SQLException exc)
            {
            exc.printStackTrace();
            }

        }

 }

    if(eventBean.getEventOrder()!=null)
        strOrder=eventBean.getEventOrder();
     
     if(eventBean.getDate()!=null)
        strDate=eventBean.getDate();
     
     if(eventBean.getAgeFrom()!=null)
        strFromAge=eventBean.getAgeFrom();
     
     if(eventBean.getAgeTo()!=null)
        strToAge=eventBean.getAgeTo();
    
      if(eventBean.getEventName()!=null)
        strEventName=eventBean.getEventName();



%>
