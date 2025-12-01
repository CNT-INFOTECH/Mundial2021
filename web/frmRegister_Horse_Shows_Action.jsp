<%--
    Document   : ModalPop_ShowList
    Created on : May 18, 2011, 4:00:04 PM
    Author     : raju
--%>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>


<%

 
 String strEventSeq="";
 strEventSeq=request.getParameter("eventSeq");
 String strRegSeq="";
  strRegSeq=request.getParameter("RegNum");

  String strSuccess="There is a problem with the Registration";

    GetInterface GUI=new GetInterface();
    List LtResult= GUI.ValidateHorse(strRegSeq,strEventSeq);
    ArrayList AlRows=new ArrayList();
     for(int i=0; i <LtResult.size(); i++)
      {
        AlRows=(ArrayList)LtResult.get(i);
        String StrType=(String)AlRows.get(0);
        String StrRegNum=(String)AlRows.get(1);
        String StrEventSeq=(String)AlRows.get(2);
        String StrGender=(String)AlRows.get(3);
        String StrAir=(String)AlRows.get(4);
        String StrCategory=(String)AlRows.get(5);
        String StrAgeFrom=(String)AlRows.get(6);
        String StrAgeAgeTo=(String)AlRows.get(7);

        if(StrType.equals("Registered"))
        {
            out.println("Successfully Registered");
        }
        else
        {
            out.println("Could not Register");
        }

      }
 

%>


   