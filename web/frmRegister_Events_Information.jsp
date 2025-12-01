<%-- 
    Document   : frmRegister_Events_Type
    Created on : Jul 7, 2011, 2:07:30 PM
    Author     : CNT
--%>

<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>


<%


String strEventSeqeunce=request.getParameter("EventSeq");
String strShowSeqeunce=request.getParameter("ShowSeq");

  GetInterface GUI=new GetInterface();
  ArrayList AlEventInfo=GUI.GET_EVENT_INFORMATION(strShowSeqeunce,strEventSeqeunce);

 String strEventOrder=""+AlEventInfo.get(1);
 String strEventDate=""+AlEventInfo.get(2);
 String strEventCategory=""+AlEventInfo.get(3);
 String strEventAire=""+AlEventInfo.get(4);
 String strEventGender=""+AlEventInfo.get(5);
 String strEventName=""+AlEventInfo.get(6);
 String strEventType=""+AlEventInfo.get(7);
 String strShowName=""+AlEventInfo.get(8);

 if(strEventCategory.equals("GRUPO DE YEGUAS PARA CRIA"))
     strEventCategory="2";
 else if(strEventCategory.equals("GRUPO DE YEGUAS CON CRIA"))
     strEventCategory="1";
 else if(strEventCategory.equals("MEJOR DESCENDENCIA DE UNA YEGUA"))
     strEventCategory="3";
 else if(strEventCategory.equals("JEFE DE RAZA"))
     strEventCategory="4";


if(strEventType.equals("Regular") && strEventCategory.equals("Equitation"))
     response.sendRedirect("frmRegister_Rider_Shows.jsp?EventSeq="+strEventSeqeunce+"&EventName="+strEventName+"&ShowSeq="+strShowSeqeunce);
else if(strEventType.equals("Regular"))
    response.sendRedirect("frmRegister_Horse_Shows.jsp?EventSeq="+strEventSeqeunce+"&EventName="+strEventName+"&ShowSeq="+strShowSeqeunce);
else if(strEventType.equals("Championship"))
    response.sendRedirect("frmRegister_Horse_Shows.jsp?EventSeq="+strEventSeqeunce+"&EventName="+strEventName+"&ShowSeq="+strShowSeqeunce);
    
else if (strEventType.equals("Group") && strEventCategory.equals("1")) // CON CRIA
    {
  
    response.sendRedirect("frmRegister_Horse_Shows_Group_OffSprings.jsp?EventSeq="+strEventSeqeunce+"&EventName="+strEventName+"&ShowSeq="+strShowSeqeunce);
    }
else if (strEventType.equals("Group") && strEventCategory.equals("2")) // PARA CRIA
    response.sendRedirect("frmRegister_Horse_Shows_Group.jsp?EventSeq="+strEventSeqeunce+"&EventName="+strEventName+"&ShowSeq="+strShowSeqeunce);

else if (strEventType.equals("Group") && strEventCategory.equals("3"))
    response.sendRedirect("frmRegister_Horse_Shows_Group_Descend.jsp?EventSeq="+strEventSeqeunce+"&EventName="+strEventName+"&ShowSeq="+strShowSeqeunce);
else if (strEventType.equals("Group") && strEventCategory.equals("4"))
    response.sendRedirect("frmRegister_Horse_Shows_Group_Raza.jsp?EventSeq="+strEventSeqeunce+"&EventName="+strEventName+"&ShowSeq="+strShowSeqeunce);
else
    response.sendRedirect("frmRegister_Horse_Shows.jsp?EventSeq="+strEventSeqeunce+"&EventName="+strEventName+"&ShowSeq="+strShowSeqeunce);

%>
