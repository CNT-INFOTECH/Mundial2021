<%-- 
    Document   : frmHdnRegistrationSearch
    Created on : Jun 30, 2011, 4:46:45 PM
    Author     : veera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@ page import="java.util.*" %>
        <%@ page import="java.io.*" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="javax.sql.rowset.*" %>
        <%@ page import="pasotracker.DBConnection" %>
        <%@ page import="pasotracker.GeneralServlet" %>
        
        <%

        String strHdnMode="";

        if(request.getParameter("Mode")!=null)
        strHdnMode=request.getParameter("Mode");

        String strHdnRegNo="";

        String strHdnRegName="";

        if(request.getParameter("RegNo")!=null)
        strHdnRegNo=request.getParameter("RegNo");

        if(request.getParameter("RegName")!=null)
        strHdnRegName=request.getParameter("RegName");


        String strRegSeq="";
            String strRegNo="";
            String strRegName="";

        GeneralServlet gen=new GeneralServlet();
 RowSetFactory factory2 = RowSetProvider.newFactory();
   CachedRowSet crsGetHorseDetails= factory2.createCachedRowSet();
           // CachedRowSetImpl crsGetHorseDetails = new CachedRowSetImpl();

            if(strHdnMode.equals("1"))
            {
            crsGetHorseDetails = gen.GetHorseDetails_Partial(strHdnRegNo,strHdnRegName);

            while (crsGetHorseDetails.next())
            {
                strRegSeq="";
                strRegNo="";
                strRegName="";

                if(crsGetHorseDetails.getString("REGSEQ")!=null)
                strRegSeq=crsGetHorseDetails.getString("REGSEQ").trim();

                if(crsGetHorseDetails.getString("Registration_Num")!=null)
                strRegNo=crsGetHorseDetails.getString("Registration_Num").trim();

                if(crsGetHorseDetails.getString("Horse_PrimaryName")!=null)
                strRegName=crsGetHorseDetails.getString("Horse_PrimaryName").trim();

                System.out.println(strRegNo);

            }
    }
        %>
        
        <script language="javascript">
            window.parent.document.getElementById("HdnRegSeq").value= <%=strRegSeq%>;
            window.parent.document.getElementById("regno").value= <%=strRegNo%>;
            window.parent.document.getElementById("HorseName").value  = <%=strRegName%>;
        </script>
    </body>
</html>
