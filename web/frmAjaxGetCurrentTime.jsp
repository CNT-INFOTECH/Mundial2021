<%@ page import = "model.GetInterface" %>
<%@ page import = "java.util.*" %>
 <%
          String strExpType=request.getParameter("Type");
          String strEventSeq=request.getParameter("EventSeq");

          int expType=Integer.parseInt(strExpType);
          GetInterface GUI=new GetInterface();
          String strTime= GUI.GetCurrentDateTime(expType,strEventSeq);

          String strOutput=strTime;



            out.print(strOutput);


%>
