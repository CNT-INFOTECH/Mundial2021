<%-- 
    Document   : frmDeviationInclude
    Created on : Jun 20, 2011, 1:49:17 AM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "model.GetInterface" %>
<%@ page import = "java.util.*" %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           String strEventSeq="";
          strEventSeq=request.getParameter("EventSeq");
          HashMap HmDetails=new HashMap();
          List LiValues=new ArrayList();


            GetInterface GUI=new GetInterface();
            if(strEventSeq.length() > 0)
             LiValues= GUI.GetDeviation1(strEventSeq);


            ArrayList AlEventInfo=GUI.GET_EVENT_INFORMATION(null,strEventSeq);
            String strEventOrder=""+AlEventInfo.get(1);
            String strEventDate=""+AlEventInfo.get(2);
            String strEvnName=""+AlEventInfo.get(6);
            String strShowName=""+AlEventInfo.get(8);



            HmDetails.put("EventName","");
            HmDetails.put("1","");
            HmDetails.put("2","");
            HmDetails.put("3","");
            HmDetails.put("4","");
            HmDetails.put("5","");
            
            for (int i=0;i < LiValues.size(); i++)
            {
                ArrayList ArRow=new ArrayList();
                ArRow=(ArrayList)LiValues.get(i);
                HmDetails.put("EventName",ArRow.get(0));
                HmDetails.put(ArRow.get(1),ArRow.get(2));
            }


            List LiValues2= GUI.GetDeviation2(strEventSeq);
           

        %>
    </body>
</html>
