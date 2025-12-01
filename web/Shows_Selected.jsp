<%--
    Document   : Shows_Reset
    Created on : May 17, 2011, 7:15:41 PM
    Author     : raju
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="beans.ShowBean" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        


<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>
<%

 Connection localConnection=null;
 DbConnMngr dbcmt=new DbConnMngr();
 String strShowName="";
 String strShowPlace="";
 String strDate="";
 String strShowSeq=request.getParameter("Seq");


 ShowBean showBean = new ShowBean();



try {
        localConnection=dbcmt.getConnection();
	localConnection.setAutoCommit(false);
        CallableStatement cst = localConnection.prepareCall("{call GET_SHOW_INFORMATION(?,?,?,?)}");
        cst.setString(1, strShowName);
        cst.setString(2, strShowPlace);
        cst.setString(3, strDate);
        cst.setString(4, strShowSeq);


        ResultSet rs1 = cst.executeQuery();

        while(rs1.next())
        {
            showBean.setShowSeq(rs1.getString("Show_Seq"));
            showBean.setShowName(rs1.getString("Show_Name"));
            showBean.setPlace(rs1.getString("Show_Place"));
            showBean.setFromDate(rs1.getString("Show_From_Date"));
            showBean.setToDate(rs1.getString("Show_To_Date"));
            showBean.setTechnicalDirector(rs1.getString("Show_Technical_Director"));
            showBean.setShowDirector(rs1.getString("Show_Director"));
            showBean.setShowType(rs1.getString("Show_Type"));
            showBean.setJudges(rs1.getString("Judges"));
          

      }


        rs1.close();
        cst.close();


        cst = localConnection.prepareCall("{call GET_EVENT_INFORMATION(?)}");
        cst.setString(1, strShowSeq);
        ResultSet rs2 = cst.executeQuery();

        ArrayList AlEvents=new ArrayList();
        ArrayList AlRows=new ArrayList();

        while(rs2.next())
        {
            AlRows=new ArrayList();

           if(rs2.getString("Event_Seq")!=null)
            AlRows.add(rs2.getString("Event_Seq"));
           else
             AlRows.add("");
            
             if(rs2.getString("Event_Order")!=null)
            AlRows.add(rs2.getString("Event_Order"));
           else
             AlRows.add("");
            


             if(rs2.getString("Event_Date")!=null)
                AlRows.add(rs2.getString("Event_Date"));
              else
             AlRows.add("");

              if(rs2.getString("Name")!=null)
                    AlRows.add(rs2.getString("Name"));
            else
             AlRows.add("");

            if(rs2.getString("Category")!=null)
                AlRows.add(rs2.getString("Category"));
            else
             AlRows.add("");


            if(rs2.getString("Air")!=null)
                AlRows.add(rs2.getString("Air"));
            else
             AlRows.add("");


            if(rs2.getString("Gender")!=null)
                AlRows.add(rs2.getString("Gender"));
            else
             AlRows.add("");


            if(rs2.getString("AgeFrom")!=null)
                AlRows.add(rs2.getString("AgeFrom"));
            else
             AlRows.add("");


            if(rs2.getString("AgeTo")!=null)
                AlRows.add(rs2.getString("AgeTo"));
            else
             AlRows.add("");


             if(rs2.getString("EventType")!=null)
                AlRows.add(rs2.getString("EventType"));
            else
             AlRows.add("");

            if(rs2.getString("Rider")!=null)
                AlRows.add(rs2.getString("Rider"));
            else
             AlRows.add("");

            AlEvents.add(AlRows);

         }

        session.setAttribute("Events",AlEvents);
        
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

        session.setAttribute("showBean", showBean);

         String address =request.getContextPath()+"/Shows.jsp";
        response.sendRedirect(response.encodeRedirectURL(address));
        %>
    </body>
</html>
