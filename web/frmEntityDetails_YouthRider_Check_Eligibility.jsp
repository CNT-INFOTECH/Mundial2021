<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>PASO TRACKER</title>
    </head>
    <body>
       <%
      
            String strEligible="";
            String strRegGen="";
            String strReq_From="";
            String strReq_T="0";
            String strRider_Gen="";
            String strRider_Age="0";

        String strChk_EntitySeq="";
        String strChk_EventSeq="";
        if (request.getParameter("EntitySeq")!=null)
            strChk_EntitySeq=request.getParameter("EntitySeq");
          if (request.getParameter("EventSeq")!=null)
            strChk_EventSeq=request.getParameter("EventSeq");


        try
        {
            localConnection=dbcmt.getConnection();
            localConnection.setAutoCommit(false);
            CallableStatement cst = localConnection.prepareCall("{call Check_Eligibility_Rider(?,?)}");
            cst.setString(1,strChk_EntitySeq);
            cst.setString(2,strChk_EventSeq);
            


        ResultSet rs1 = cst.executeQuery();
         while (rs1.next())
        {
             strEligible=rs1.getString("Eligibility");
             strRegGen=rs1.getString("ReqGen");
             strReq_From=rs1.getString("Req_From");
			 if(rs1.getString("Req_To")!=null)
             strReq_T=rs1.getString("Req_To");
             strRider_Gen=rs1.getString("Rider_Gen");
             if(rs1.getString("Rider_Age")!=null)
			 strRider_Age=rs1.getString("Rider_Age");
        }

                    rs1.close();
                    cst.close();


                    dbcmt.releaseConnection(localConnection);

		}
                catch(Exception ex)
		{
			ex.printStackTrace();
			try
				{
                                       System.out.println("release:" +ex);
					localConnection.rollback();
					dbcmt.releaseConnection(localConnection);
				}
                                catch(SQLException exc)
				{
					exc.printStackTrace();
				}

		}


         if(strEligible.equals("Eligible")){  %>
        <jsp:forward page="frmRegister_Rider_Shows.jsp?mode=2">
        <jsp:param name="EventSeq"  value="<%=strChk_EventSeq%>" />
        <jsp:param name="EntitySeq"  value="<%=strChk_EntitySeq%>" />
        </jsp:forward>
        <%}
         else
          {
                  out.println("<h2>Rider Not Eligible</h2><br>");
                  out.println("<h2>The Event requires rider to be "+strRegGen+ " "+strReq_From+"- "+strReq_T +" Years<br></h2>");
                  out.println("<h2>Rider details :  "+strRider_Gen+ ","+strRider_Age+" Year(s) old</h2>");
                   if( Integer.parseInt(strRider_Age) < Integer.parseInt (strReq_T) &&  strRegGen.equalsIgnoreCase(strRider_Gen))
                      {%>
                      <input type="Button" class="button" value="Over Ride" onClick="OverRide('<%=strChk_EventSeq%>','<%=strChk_EntitySeq%>')">
                      <% }

                

        }%>
        <div >
         <%@ include file="frmBottom_Registration.jsp"%>
        </div>
    </body>
</html>
