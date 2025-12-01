<%-- 
    Document   : frmValidate_Seq_RegNum
    Created on : Jun 22, 2011, 7:24:08 PM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String strREventSeq="";
            if(request.getParameter("EventSeq")!=null)
                strREventSeq=request.getParameter("EventSeq");
            

             String strRegSeq="";
            if(request.getParameter("RegNum")!=null)
                strRegSeq=request.getParameter("RegNum");




            GetInterface GUI=new GetInterface();
            List LtResult= GUI.CheckEligibility_Horse(strRegSeq,strREventSeq);
            String strEligibility="";
            String strHGender="";
            String strHAire="";
            String strHAge="";
            String strRHGender="";
            String strRHAire="";
            String strRAgeFrom="";
            String strRAgeTo="";
            String strCategory="";
           if(LtResult.size()>0)
           {
                  if(LtResult.get(0)!=null)
                          strEligibility=LtResult.get(0).toString();

                   if(LtResult.get(1)!=null)
                          strHGender=LtResult.get(1).toString();
                   if(LtResult.get(2)!=null)
                          strHAire=LtResult.get(2).toString();
                   if(LtResult.get(3)!=null)
                          strHAge=LtResult.get(3).toString();
                   if(LtResult.get(4)!=null)
                          strRHGender=LtResult.get(4).toString();
                   if(LtResult.get(5)!=null)
                          strRHAire=LtResult.get(5).toString();
                   if(LtResult.get(6)!=null)
                          strRAgeFrom=LtResult.get(6).toString();
                   if(LtResult.get(7)!=null)
                          strRAgeTo=LtResult.get(7).toString();
                   if(LtResult.get(8)!=null)
                          strCategory=LtResult.get(8).toString();
              

            }



      
        if(strEligibility.equals("Eligible")){  %>
        <jsp:forward page="frmRegister_Horse_Shows.jsp?mode=4">
        <jsp:param name="EventSeq"  value="<%=strREventSeq%>" />
        <jsp:param name="RegNum"  value="<%=strRegNum%>" />
        <jsp:param name="RegSeq"  value="<%=strRegSeq%>" />
        </jsp:forward>
        <%}
         else
          {

            int HAge=0;
            int RAgeTo=0;
            if(strHAge!=null && strHAge.trim().length() >0)
                HAge=Integer.parseInt(strHAge);
            if(strRAgeTo!=null && strRAgeTo.trim().length() >0)
                RAgeTo=Integer.parseInt(strRAgeTo);

            out.println("<h2>Horse Not Eligible</h2><br>");
            out.println("<h2>Horse details are "+strHGender+" "+strHAire+ " "+strHAge+"<br></h2>");
            out.println("<h2>The Event requires horse to be "+strRHGender+" "+strRHAire+ " "+strRAgeFrom+"- "+strRAgeTo +" months</h2>");
                if((HAge < RAgeTo) &&  strHGender.equalsIgnoreCase(strRHGender) &&  strHAire.equalsIgnoreCase(strRHAire))
                {%>
                <input type="Button" class="button" value="Over Ride" onClick="OverRide_Horse('<%=strREventSeq%>','<%=strRegNum%>','<%=strRegSeq%>')">
                <% }
                
        }%>

         <div >
         <%@ include file="frmBottom_Registration.jsp"%>
        </div>
    </body>
</html>
